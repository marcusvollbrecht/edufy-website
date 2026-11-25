-- =====================================================================
-- Edufy – Schema Schülerkonto, Eltern-Freigabe (unter 16), Merkliste
-- Datei: supabase_setup.sql   (Aufgabe S-002)
--
-- Einspielen: Supabase → SQL Editor → kompletten Inhalt einfügen → „Run“.
-- Die Datei ist idempotent (mehrfach ausführbar, ohne Daten zu löschen).
-- Reihenfolge zu supabase_schulen_foerdervereine.sql ist egal. Läuft diese
-- Datei VOR dem Förderverein-Schema, fehlt nur der Fremdschlüssel
-- student_profiles.school_id → schools.id. Dann diese Datei nach dem
-- Förderverein-Schema einfach noch einmal ausführen (Hinweis im Log).
--
-- Zusätzlich nötig: Edge Function supabase/functions/schueler-eltern-freigabe
-- (verschickt die E-Mail an die Eltern, siehe Kopf der index.ts).
--
-- Entscheidungen, die hier umgesetzt sind
-- ---------------------------------------
-- * Schülerinnen und Schüler nutzen Edufy kostenlos.
-- * Unter 16: Konto startet mit status = 'wartet_auf_eltern' (eingeschränkt).
--   Ein Elternteil gibt per E-Mail-Link frei → status = 'aktiv'.
-- * Ab 16 (bei Registrierung): status = 'aktiv'. Die Eltern-E-Mail wird dann
--   gar nicht gespeichert (Datensparsamkeit).
-- * Funktionen mit Außenwirkung (z. B. spätere Kontaktaufnahme zu Unternehmen)
--   nur bei status = 'aktiv' → Hilfsfunktion current_student_is_active().
--   Die Merkliste ist unkritisch und auch für wartende Konten erlaubt.
-- * Datensparsamkeit: nur Vorname, Geburtsmonat + -jahr (kein Tag), Klasse,
--   Schulform, freiwillig Schule (Freitext) und PLZ. Die E-Mail-Adresse steht
--   nur im Auth-Konto (auth.users), nicht doppelt im Profil.
-- * Kein Klartext-Token in der Datenbank: gespeichert wird nur der SHA-256-
--   Hash des Freigabe-Links. IP-Adresse und Browserkennung werden NICHT
--   gespeichert. Als Nachweis (Art. 7 Abs. 1 DSGVO) dienen Zeitpunkt,
--   Eltern-E-Mail, Name des Elternteils, Bestätigung der Sorgeberechtigung
--   und Versionsstand des Freigabetexts.
--
-- Alter (nur Monat + Jahr bekannt)
-- --------------------------------
-- * „Sicher 16“ erst ab dem Monat NACH dem Geburtsmonat (vorsichtig gerechnet,
--   weil der Geburtstag im Geburtsmonat noch ausstehen kann).
-- * Mindestalter 13 wird großzügig gerechnet (ab dem Geburtsmonat).
-- * Gerechnet wird immer serverseitig mit dem Datum in Europe/Berlin.
--
-- Sicherheitskonzept
-- ------------------
-- * Jede Tabelle hat RLS aktiviert und ausdrücklich definierte Policies.
-- * anon hat KEINE Tabellenrechte. anon darf nur diese Funktionen aufrufen:
--   get_parental_consent_info, confirm_parental_consent,
--   revoke_parental_consent (alle nur mit gültigem Link-Token).
-- * authenticated (Schüler) liest nur das eigene Profil, die eigenen
--   Freigabe-Anfragen (ohne Token-Hash) und die eigene Merkliste. Ändern darf
--   er nur unkritische Profilfelder; status, Geburtsdaten, school_id und alle
--   Freigabe-Felder ändern ausschließlich security-definer-Funktionen.
-- * Den Token-Hash speichert nur die Edge Function mit Service-Role über
--   schueler_eltern_mail_vorbereiten(...). Diese Funktion ist für Schüler
--   NICHT aufrufbar – sonst könnte ein Kind einen selbst gewählten Token
--   hinterlegen und sich selbst freigeben.
-- * Fehler werden als 'EDUFY:<CODE>' gemeldet, die Seiten übersetzen sie.
--
-- Registrierungsablauf (Frontend: registrierung-schueler.html)
-- ------------------------------------------------------------
-- 1. supabase.auth.signUp({ email, password, options: { data: {
--      rolle: 'schueler', registrierung: { vorname, geburtsjahr, geburtsmonat,
--      klassenstufe, schulform, schule_name, plz, eltern_email } },
--      emailRedirectTo: '<Domain>/dashboard-schueler.html' } })
-- 2a. Session vorhanden: sofort rpc('register_student', {...}); bei unter 16
--     danach functions.invoke('schueler-eltern-freigabe').
-- 2b. Keine Session (E-Mail-Bestätigung an): dashboard-schueler.html holt
--     register_student nach der Bestätigung mit user_metadata.registrierung
--     nach, leert die Metadaten und stößt die Eltern-Mail an.
-- =====================================================================

begin;

-- ---------------------------------------------------------------------
-- Hilfsfunktion: updated_at automatisch setzen
-- (identisch zu supabase_schulen_foerdervereine.sql – doppelt ist unschädlich)
-- ---------------------------------------------------------------------
create or replace function public.edufy_set_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- ---------------------------------------------------------------------
-- Interne Hilfsfunktionen (nicht für Nutzer aufrufbar, siehe revoke unten)
-- ---------------------------------------------------------------------
-- Volle Monate seit dem Ersten des Geburtsmonats (Datum Europe/Berlin)
create or replace function public.edufy_schueler_monate_seit_geburt(p_jahr int, p_monat int)
returns int
language sql
stable
set search_path = ''
as $$
  select (extract(year from (now() at time zone 'Europe/Berlin'))::int * 12
          + extract(month from (now() at time zone 'Europe/Berlin'))::int)
       - (p_jahr * 12 + p_monat);
$$;

-- Alter, das sicher erreicht ist (vorsichtig: Geburtstag im Geburtsmonat
-- gilt erst im Folgemonat als erreicht). Grundlage für die 16-Jahres-Grenze.
create or replace function public.edufy_schueler_alter_sicher(p_jahr int, p_monat int)
returns int
language sql
stable
set search_path = ''
as $$
  select floor((public.edufy_schueler_monate_seit_geburt(p_jahr, p_monat) - 1) / 12.0)::int;
$$;

-- Höchstmögliches Alter (Geburtstag am 1. des Monats). Grundlage für das Mindestalter.
create or replace function public.edufy_schueler_alter_max(p_jahr int, p_monat int)
returns int
language sql
stable
set search_path = ''
as $$
  select floor(public.edufy_schueler_monate_seit_geburt(p_jahr, p_monat) / 12.0)::int;
$$;

-- SHA-256 (hex) eines Link-Tokens. Dieselbe Berechnung macht die Edge Function.
create or replace function public.edufy_token_hash(p_token text)
returns text
language sql
immutable
set search_path = ''
as $$
  select encode(sha256(convert_to(coalesce(p_token, ''), 'UTF8')), 'hex');
$$;

-- Grobe E-Mail-Prüfung (die echte Prüfung ist der Versand)
create or replace function public.edufy_email_gueltig(p_email text)
returns boolean
language sql
immutable
set search_path = ''
as $$
  select p_email is not null
     and char_length(p_email) between 6 and 254
     and p_email ~ '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]{2,}$';
$$;

-- E-Mail teilweise verdecken (für die Eltern-Seite): l***@beispiel.de
create or replace function public.edufy_email_maskieren(p_email text)
returns text
language sql
immutable
set search_path = ''
as $$
  select case
           when p_email is null or position('@' in p_email) < 2 then null
           else left(p_email, 1) || '***' || substring(p_email from position('@' in p_email))
         end;
$$;

-- ---------------------------------------------------------------------
-- Tabelle: student_profiles – Schülerkonto (1:1 zu auth.users)
-- ---------------------------------------------------------------------
create table if not exists public.student_profiles (
  id                     uuid primary key references auth.users (id) on delete cascade,
  vorname                text not null check (char_length(vorname) between 1 and 50),
  geburtsjahr            smallint not null check (geburtsjahr between 1990 and 2100),
  geburtsmonat           smallint not null check (geburtsmonat between 1 and 12),
  klassenstufe           smallint not null check (klassenstufe between 5 and 13),
  schulform              text not null check (schulform in (
                           'hauptschule', 'realschule', 'gymnasium', 'gesamtschule',
                           'oberschule', 'gemeinschaftsschule', 'foerderschule',
                           'berufsbildende_schule', 'sonstige')),
  -- Zuordnung zu einer registrierten Schule: nur serverseitig (z. B. später über
  -- Einladungslink des Fördervereins, F-002). Fremdschlüssel siehe unten.
  school_id              uuid null,
  schule_name            text null check (schule_name is null or char_length(schule_name) between 2 and 200),
  plz                    text null check (plz is null or plz ~ '^[0-9]{5}$'),
  status                 text not null default 'wartet_auf_eltern'
                           constraint student_profiles_status_check
                           check (status in ('wartet_auf_eltern', 'aktiv', 'gesperrt')),
  freigabe_art           text null check (freigabe_art is null or freigabe_art in (
                           'ab_16_bei_registrierung', 'eltern', 'selbst_ab_16')),
  aktiviert_am           timestamptz null,
  datenschutzhinweis_am  timestamptz not null default now(),
  created_at             timestamptz not null default now(),
  updated_at             timestamptz not null default now()
);
comment on table public.student_profiles is
  'Schülerkonten; id = auth.users.id. Nur Vorname, Geburtsmonat/-jahr, Klasse, Schulform, freiwillig Schule und PLZ.';
comment on column public.student_profiles.status is
  'wartet_auf_eltern = unter 16, Eltern-Freigabe steht aus (eingeschränkt: keine Unternehmenskontakte); '
  'aktiv = ab 16 oder Eltern haben freigegeben; gesperrt = durch Support gesperrt. Nur serverseitig änderbar.';
comment on column public.student_profiles.freigabe_art is
  'Wie das Konto aktiv wurde: ab_16_bei_registrierung, eltern (E-Mail-Link) oder selbst_ab_16 (später 16 geworden).';
comment on column public.student_profiles.schule_name is 'Freiwillige Freitext-Angabe der Schule (keine Prüfung, keine Zuordnung).';
comment on column public.student_profiles.datenschutzhinweis_am is
  'Zeitpunkt, zu dem die Registrierung mit angezeigtem Datenschutzhinweis abgeschickt wurde.';

drop trigger if exists student_profiles_set_updated_at on public.student_profiles;
create trigger student_profiles_set_updated_at
  before update on public.student_profiles
  for each row execute function public.edufy_set_updated_at();

-- Fremdschlüssel zu schools nur, wenn das Förderverein-Schema schon existiert
do $$
begin
  if to_regclass('public.schools') is null then
    raise notice 'student_profiles.school_id: Tabelle public.schools fehlt noch – Fremdschlüssel nicht angelegt. Nach supabase_schulen_foerdervereine.sql diese Datei erneut ausführen.';
  elsif not exists (select 1 from pg_constraint
                    where conname = 'student_profiles_school_id_fkey'
                      and conrelid = 'public.student_profiles'::regclass) then
    alter table public.student_profiles
      add constraint student_profiles_school_id_fkey
      foreign key (school_id) references public.schools (id) on delete set null;
  end if;
end;
$$;

create index if not exists student_profiles_school_idx on public.student_profiles (school_id);

-- ---------------------------------------------------------------------
-- Tabelle: parental_consents – Eltern-Freigaben (eine Zeile je verschickten Link)
-- ---------------------------------------------------------------------
create table if not exists public.parental_consents (
  id                          uuid primary key default gen_random_uuid(),
  student_id                  uuid not null references public.student_profiles (id) on delete cascade,
  eltern_email                text not null check (char_length(eltern_email) between 3 and 254),
  -- SHA-256 (hex) des Link-Tokens. NIE den Klartext-Token speichern.
  -- null = Anfrage angelegt, E-Mail noch nicht verschickt.
  token_hash                  text null check (token_hash is null or token_hash ~ '^[0-9a-f]{64}$'),
  angefragt_am                timestamptz not null default now(),
  versand_versuch_am          timestamptz null,
  mail_gesendet_am            timestamptz null,
  versand_fehlgeschlagen_am   timestamptz null,
  ablauf_am                   timestamptz null,
  -- Nachweis der Freigabe (Art. 7 Abs. 1, Art. 8 Abs. 2 DSGVO)
  bestaetigt_am               timestamptz null,
  eltern_name                 text null check (eltern_name is null or char_length(eltern_name) between 2 and 100),
  sorgeberechtigt_bestaetigt  boolean null,
  text_version                text null check (text_version is null or char_length(text_version) <= 40),
  abgelehnt_am                timestamptz null,
  widerrufen_am               timestamptz null,
  -- Link ungültig, weil ein neuerer verschickt wurde bzw. das Konto anders aktiv wurde
  ersetzt_am                  timestamptz null,
  constraint parental_consents_nachweis_check
    check (bestaetigt_am is null or (eltern_name is not null and sorgeberechtigt_bestaetigt is true))
);
comment on table public.parental_consents is
  'Eltern-Freigaben für Schülerkonten unter 16. Eine Zeile je Link. Nur Token-Hash, keine IP/Browserkennung.';
comment on column public.parental_consents.token_hash is 'SHA-256 (hex) des Tokens aus dem E-Mail-Link. Der Klartext existiert nur in der E-Mail.';
comment on column public.parental_consents.ablauf_am is 'Bis dahin kann über den Link freigegeben werden (14 Tage). Ablehnen/Widerrufen geht immer.';
comment on column public.parental_consents.text_version is 'Versionsstand des Freigabetexts auf eltern-freigabe.html (Nachweis).';

create unique index if not exists parental_consents_token_hash_uniq
  on public.parental_consents (token_hash) where token_hash is not null;
create index if not exists parental_consents_student_idx
  on public.parental_consents (student_id, angefragt_am desc);
create index if not exists parental_consents_eltern_email_idx
  on public.parental_consents (lower(eltern_email), versand_versuch_am);

-- ---------------------------------------------------------------------
-- Tabelle: student_favorites – Merkliste (Berufe, Studiengänge, Förderungen)
-- ---------------------------------------------------------------------
create table if not exists public.student_favorites (
  id          uuid primary key default gen_random_uuid(),
  student_id  uuid not null default auth.uid() references public.student_profiles (id) on delete cascade,
  typ         text not null check (typ in ('beruf', 'studium', 'foerderung')),
  -- id aus data/berufe.json, data/studium.json bzw. data/foerderungen.json (kebab-case)
  ref_id      text not null check (ref_id ~ '^[a-z0-9][a-z0-9-]{0,99}$'),
  created_at  timestamptz not null default now(),
  constraint student_favorites_uniq unique (student_id, typ, ref_id)
);
comment on table public.student_favorites is 'Merkliste eines Schülerkontos. ref_id verweist auf die id in data/*.json.';

-- ---------------------------------------------------------------------
-- Hilfsfunktionen für Policies und spätere Funktionen
-- ---------------------------------------------------------------------
-- Darf der angemeldete Nutzer etwas auf die Merkliste setzen?
-- (Schülerkonto vorhanden, nicht gesperrt, höchstens 200 Einträge)
create or replace function public.edufy_schueler_darf_merken()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (select 1 from public.student_profiles p
                 where p.id = auth.uid() and p.status in ('wartet_auf_eltern', 'aktiv'))
     and (select count(*) from public.student_favorites f where f.student_id = auth.uid()) < 200;
$$;

-- Für alles mit Außenwirkung (z. B. spätere Kontaktaufnahme zu Unternehmen):
-- true nur bei status = 'aktiv'. Neue Funktionen/Policies MÜSSEN das prüfen.
create or replace function public.current_student_is_active()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (select 1 from public.student_profiles p
                 where p.id = auth.uid() and p.status = 'aktiv');
$$;

-- ---------------------------------------------------------------------
-- Row Level Security aktivieren
-- ---------------------------------------------------------------------
alter table public.student_profiles   enable row level security;
alter table public.parental_consents  enable row level security;
alter table public.student_favorites  enable row level security;

-- ---------------------------------------------------------------------
-- Tabellenrechte (zusätzlich zu RLS). Supabase vergibt standardmäßig alle
-- Rechte an anon/authenticated – deshalb erst alles entziehen.
-- ---------------------------------------------------------------------
revoke all on public.student_profiles, public.parental_consents, public.student_favorites
  from anon, authenticated;

-- Profil: lesen; ändern nur unkritische Felder (nicht status, Geburtsdaten, school_id, Zeitstempel)
grant select on public.student_profiles to authenticated;
grant update (vorname, klassenstufe, schulform, schule_name, plz)
  on public.student_profiles to authenticated;

-- Freigabe-Anfragen: nur lesen, ohne Token-Hash und ohne Namen des Elternteils
grant select (id, student_id, eltern_email, angefragt_am, mail_gesendet_am,
              versand_fehlgeschlagen_am, ablauf_am, bestaetigt_am, abgelehnt_am,
              widerrufen_am, ersetzt_am)
  on public.parental_consents to authenticated;

-- Merkliste: lesen, hinzufügen (student_id kommt aus dem Default auth.uid()), löschen
grant select, delete on public.student_favorites to authenticated;
grant insert (typ, ref_id) on public.student_favorites to authenticated;

-- ---------------------------------------------------------------------
-- Policies
-- ---------------------------------------------------------------------
-- student_profiles: nur eigenes Profil (kein INSERT – nur über register_student;
-- kein DELETE – nur über delete_my_student_account)
drop policy if exists "student_profiles_select_eigenes" on public.student_profiles;
create policy "student_profiles_select_eigenes" on public.student_profiles
  for select to authenticated
  using (id = auth.uid());

drop policy if exists "student_profiles_update_eigenes" on public.student_profiles;
create policy "student_profiles_update_eigenes" on public.student_profiles
  for update to authenticated
  using (id = auth.uid())
  with check (id = auth.uid());

-- parental_consents: nur eigene Anfragen lesen (Schreiben nur über Funktionen)
drop policy if exists "parental_consents_select_eigene" on public.parental_consents;
create policy "parental_consents_select_eigene" on public.parental_consents
  for select to authenticated
  using (student_id = auth.uid());

-- student_favorites: nur eigene Einträge
drop policy if exists "student_favorites_select_eigene" on public.student_favorites;
create policy "student_favorites_select_eigene" on public.student_favorites
  for select to authenticated
  using (student_id = auth.uid());

drop policy if exists "student_favorites_insert_eigene" on public.student_favorites;
create policy "student_favorites_insert_eigene" on public.student_favorites
  for insert to authenticated
  with check (student_id = auth.uid() and public.edufy_schueler_darf_merken());

drop policy if exists "student_favorites_delete_eigene" on public.student_favorites;
create policy "student_favorites_delete_eigene" on public.student_favorites
  for delete to authenticated
  using (student_id = auth.uid());

-- ---------------------------------------------------------------------
-- RPC: register_student – legt das Schülerkonto an (security definer)
-- Fehler: NICHT_ANGEMELDET, ANDERE_ROLLE, PFLICHTFELD, UNGUELTIGES_GEBURTSDATUM,
--   ZU_JUNG, UNGUELTIGE_KLASSE, UNGUELTIGE_SCHULFORM, UNGUELTIGE_PLZ,
--   ELTERN_EMAIL_FEHLT, ELTERN_EMAIL_UNGUELTIG, ELTERN_EMAIL_GLEICH
-- Rückgabe (nichts Geheimes!): jsonb { status: 'angelegt' | 'bereits_registriert',
--   konto_status, eltern_freigabe_noetig, eltern_mail_ausstehend }
-- Bei unter 16 wird eine Freigabe-Anfrage OHNE Token angelegt; den Link
-- erzeugt und verschickt danach die Edge Function schueler-eltern-freigabe.
-- ---------------------------------------------------------------------
create or replace function public.register_student(
  p_vorname       text,
  p_geburtsjahr   int,
  p_geburtsmonat  int,
  p_klassenstufe  int,
  p_schulform     text,
  p_schule_name   text,
  p_plz           text,
  p_eltern_email  text
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid          uuid := auth.uid();
  v_email        text;
  v_status       text;
  v_vorname      text := btrim(coalesce(p_vorname, ''));
  v_schule       text := nullif(btrim(coalesce(p_schule_name, '')), '');
  v_plz          text := nullif(btrim(coalesce(p_plz, '')), '');
  v_eltern       text := lower(nullif(btrim(coalesce(p_eltern_email, '')), ''));
  v_monate       int;
  v_unter_16     boolean;
  v_fv_konto     boolean := false;
begin
  if v_uid is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;

  -- Idempotenz: Profil gibt es schon → nur Stand zurückgeben
  select p.status into v_status from public.student_profiles p where p.id = v_uid;
  if v_status is not null then
    return jsonb_build_object(
      'status', 'bereits_registriert',
      'konto_status', v_status,
      'eltern_freigabe_noetig', v_status = 'wartet_auf_eltern',
      'eltern_mail_ausstehend', exists (
        select 1 from public.parental_consents c
        where c.student_id = v_uid and c.token_hash is null
          and c.abgelehnt_am is null and c.widerrufen_am is null and c.ersetzt_am is null));
  end if;

  -- Ein Förderverein-Konto ist kein Schülerkonto
  if to_regclass('public.foerderverein_profiles') is not null then
    execute 'select exists (select 1 from public.foerderverein_profiles where id = $1)'
      into v_fv_konto using v_uid;
    if v_fv_konto then
      raise exception 'EDUFY:ANDERE_ROLLE';
    end if;
  end if;

  -- Eingaben prüfen
  if char_length(v_vorname) < 1 or char_length(v_vorname) > 50
     or p_geburtsjahr is null or p_geburtsmonat is null
     or p_klassenstufe is null or p_schulform is null then
    raise exception 'EDUFY:PFLICHTFELD';
  end if;
  if p_geburtsmonat not between 1 and 12 or p_geburtsjahr not between 1990 and 2100 then
    raise exception 'EDUFY:UNGUELTIGES_GEBURTSDATUM';
  end if;
  v_monate := public.edufy_schueler_monate_seit_geburt(p_geburtsjahr, p_geburtsmonat);
  if v_monate < 0 or public.edufy_schueler_alter_max(p_geburtsjahr, p_geburtsmonat) > 30 then
    raise exception 'EDUFY:UNGUELTIGES_GEBURTSDATUM';
  end if;
  if public.edufy_schueler_alter_max(p_geburtsjahr, p_geburtsmonat) < 13 then
    raise exception 'EDUFY:ZU_JUNG';
  end if;
  if p_klassenstufe not between 5 and 13 then
    raise exception 'EDUFY:UNGUELTIGE_KLASSE';
  end if;
  if p_schulform not in ('hauptschule', 'realschule', 'gymnasium', 'gesamtschule',
       'oberschule', 'gemeinschaftsschule', 'foerderschule',
       'berufsbildende_schule', 'sonstige') then
    raise exception 'EDUFY:UNGUELTIGE_SCHULFORM';
  end if;
  if v_schule is not null and (char_length(v_schule) < 2 or char_length(v_schule) > 200) then
    raise exception 'EDUFY:PFLICHTFELD';
  end if;
  if v_plz is not null and v_plz !~ '^[0-9]{5}$' then
    raise exception 'EDUFY:UNGUELTIGE_PLZ';
  end if;

  select lower(u.email) into v_email from auth.users u where u.id = v_uid;
  if v_email is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;

  v_unter_16 := public.edufy_schueler_alter_sicher(p_geburtsjahr, p_geburtsmonat) < 16;
  if v_unter_16 then
    if v_eltern is null then
      raise exception 'EDUFY:ELTERN_EMAIL_FEHLT';
    end if;
    if not public.edufy_email_gueltig(v_eltern) then
      raise exception 'EDUFY:ELTERN_EMAIL_UNGUELTIG';
    end if;
    if v_eltern = v_email then
      raise exception 'EDUFY:ELTERN_EMAIL_GLEICH';
    end if;
  end if;

  begin
    insert into public.student_profiles (id, vorname, geburtsjahr, geburtsmonat, klassenstufe,
                                         schulform, schule_name, plz, status, freigabe_art,
                                         aktiviert_am, datenschutzhinweis_am)
    values (v_uid, v_vorname, p_geburtsjahr, p_geburtsmonat, p_klassenstufe,
            p_schulform, v_schule, v_plz,
            case when v_unter_16 then 'wartet_auf_eltern' else 'aktiv' end,
            case when v_unter_16 then null else 'ab_16_bei_registrierung' end,
            case when v_unter_16 then null else now() end,
            now());
  exception when unique_violation then
    -- paralleler Aufruf hat das Profil gerade angelegt
    select p.status into v_status from public.student_profiles p where p.id = v_uid;
    return jsonb_build_object('status', 'bereits_registriert', 'konto_status', v_status,
                              'eltern_freigabe_noetig', v_status = 'wartet_auf_eltern',
                              'eltern_mail_ausstehend', v_status = 'wartet_auf_eltern');
  end;

  -- Ab 16 wird die Eltern-Adresse bewusst nicht gespeichert
  if v_unter_16 then
    insert into public.parental_consents (student_id, eltern_email)
    values (v_uid, v_eltern);
  end if;

  return jsonb_build_object(
    'status', 'angelegt',
    'konto_status', case when v_unter_16 then 'wartet_auf_eltern' else 'aktiv' end,
    'eltern_freigabe_noetig', v_unter_16,
    'eltern_mail_ausstehend', v_unter_16);
end;
$$;

-- ---------------------------------------------------------------------
-- RPC: get_my_student_account – eigener Stand für das Dashboard
-- Rückgabe: null (noch kein Profil) oder jsonb mit Profil und Freigabe-Stand
-- ---------------------------------------------------------------------
create or replace function public.get_my_student_account()
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_uid   uuid := auth.uid();
  v_p     public.student_profiles%rowtype;
  v_c     public.parental_consents%rowtype;
  v_n24   int := 0;
  v_zust  text;
  v_elt   jsonb := null;
begin
  if v_uid is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;
  select * into v_p from public.student_profiles p where p.id = v_uid;
  if not found then
    return null;
  end if;

  select * into v_c from public.parental_consents c
  where c.student_id = v_uid order by c.angefragt_am desc limit 1;
  if found then
    select count(*) into v_n24 from public.parental_consents c
    where c.student_id = v_uid and c.versand_versuch_am > now() - interval '24 hours';
    v_zust := case
      when v_c.widerrufen_am is not null then 'widerrufen'
      when v_c.bestaetigt_am is not null then 'bestaetigt'
      when v_c.abgelehnt_am is not null then 'abgelehnt'
      when v_c.mail_gesendet_am is null and v_c.versand_fehlgeschlagen_am is not null then 'fehlgeschlagen'
      when v_c.ersetzt_am is not null then 'ersetzt'
      when v_c.token_hash is null then 'nicht_gesendet'
      when v_c.mail_gesendet_am is null then 'wird_gesendet'
      when v_c.ablauf_am < now() then 'abgelaufen'
      else 'gesendet' end;
    v_elt := jsonb_build_object(
      'eltern_email', v_c.eltern_email,
      'zustand', v_zust,
      'angefragt_am', v_c.angefragt_am,
      'mail_gesendet_am', v_c.mail_gesendet_am,
      'ablauf_am', v_c.ablauf_am,
      'bestaetigt_am', v_c.bestaetigt_am,
      'anfragen_24h', v_n24,
      'anfragen_moeglich', greatest(0, 3 - v_n24));
  end if;

  return jsonb_build_object(
    'vorname', v_p.vorname,
    'geburtsjahr', v_p.geburtsjahr,
    'geburtsmonat', v_p.geburtsmonat,
    'klassenstufe', v_p.klassenstufe,
    'schulform', v_p.schulform,
    'schule_name', v_p.schule_name,
    'plz', v_p.plz,
    'status', v_p.status,
    'freigabe_art', v_p.freigabe_art,
    'aktiviert_am', v_p.aktiviert_am,
    'created_at', v_p.created_at,
    'eltern', v_elt,
    'kann_selbst_freigeben', v_p.status = 'wartet_auf_eltern'
      and public.edufy_schueler_alter_sicher(v_p.geburtsjahr, v_p.geburtsmonat) >= 16);
end;
$$;

-- ---------------------------------------------------------------------
-- NUR Edge Function (Service-Role): Link-Token-Hash hinterlegen, Rate-Limit
-- prüfen und die Daten für die Eltern-Mail liefern.
-- Fehler: KEIN_SCHUELERKONTO, GESPERRT, KEINE_FREIGABE_NOETIG,
--   ELTERN_EMAIL_FEHLT, ELTERN_EMAIL_UNGUELTIG, ELTERN_EMAIL_GLEICH,
--   UNGUELTIGER_HASH, LIMIT_ERREICHT
-- Rate-Limit: höchstens 3 Versandversuche je Schülerkonto und höchstens
-- 5 je Eltern-Adresse (über alle Konten) in 24 Stunden.
-- Ältere, noch offene Links werden nach erfolgreichem Versand ungültig (ersetzt_am).
-- ---------------------------------------------------------------------
create or replace function public.schueler_eltern_mail_vorbereiten(
  p_student_id    uuid,
  p_token_hash    text,
  p_eltern_email  text
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_p        public.student_profiles%rowtype;
  v_c        public.parental_consents%rowtype;
  v_email    text;
  v_eltern   text := lower(nullif(btrim(coalesce(p_eltern_email, '')), ''));
  v_id       uuid;
  v_ablauf   timestamptz := now() + interval '14 days';
begin
  -- Zeile sperren: parallele Aufrufe laufen nacheinander (Rate-Limit sicher)
  select * into v_p from public.student_profiles p where p.id = p_student_id for update;
  if not found then
    raise exception 'EDUFY:KEIN_SCHUELERKONTO';
  end if;
  if v_p.status = 'gesperrt' then
    raise exception 'EDUFY:GESPERRT';
  end if;
  if v_p.status <> 'wartet_auf_eltern' then
    raise exception 'EDUFY:KEINE_FREIGABE_NOETIG';
  end if;
  if p_token_hash is null or p_token_hash !~ '^[0-9a-f]{64}$' then
    raise exception 'EDUFY:UNGUELTIGER_HASH';
  end if;

  select * into v_c from public.parental_consents c
  where c.student_id = p_student_id order by c.angefragt_am desc limit 1;

  if v_eltern is null then
    v_eltern := lower(v_c.eltern_email);
  end if;
  if v_eltern is null then
    raise exception 'EDUFY:ELTERN_EMAIL_FEHLT';
  end if;
  if not public.edufy_email_gueltig(v_eltern) then
    raise exception 'EDUFY:ELTERN_EMAIL_UNGUELTIG';
  end if;
  select lower(u.email) into v_email from auth.users u where u.id = p_student_id;
  if v_eltern = v_email then
    raise exception 'EDUFY:ELTERN_EMAIL_GLEICH';
  end if;

  if (select count(*) from public.parental_consents c
      where c.student_id = p_student_id
        and c.versand_versuch_am > now() - interval '24 hours') >= 3
     or (select count(*) from public.parental_consents c
         where lower(c.eltern_email) = v_eltern
           and c.versand_versuch_am > now() - interval '24 hours') >= 5 then
    raise exception 'EDUFY:LIMIT_ERREICHT';
  end if;

  if v_c.id is not null and v_c.token_hash is null and v_c.abgelehnt_am is null
     and v_c.widerrufen_am is null and v_c.ersetzt_am is null and v_c.bestaetigt_am is null then
    -- Anfrage aus der Registrierung: erster Versand
    update public.parental_consents
       set token_hash = p_token_hash, eltern_email = v_eltern, versand_versuch_am = now(),
           ablauf_am = v_ablauf, mail_gesendet_am = null, versand_fehlgeschlagen_am = null
     where id = v_c.id
    returning id into v_id;
  else
    -- Erneut senden: neuen Link anlegen. Ältere offene Links werden erst nach
    -- erfolgreichem Versand ungültig (schueler_eltern_mail_ergebnis), damit ein
    -- fehlgeschlagener Versand keinen gültigen Link zerstört.
    insert into public.parental_consents (student_id, eltern_email, token_hash,
                                          versand_versuch_am, ablauf_am)
    values (p_student_id, v_eltern, p_token_hash, now(), v_ablauf)
    returning id into v_id;
  end if;

  return jsonb_build_object(
    'consent_id', v_id,
    'eltern_email', v_eltern,
    'vorname', v_p.vorname,
    'geburtsmonat', v_p.geburtsmonat,
    'geburtsjahr', v_p.geburtsjahr,
    'klassenstufe', v_p.klassenstufe,
    'schulform', v_p.schulform,
    'schule_name', v_p.schule_name,
    'ablauf_am', v_ablauf);
end;
$$;

-- NUR Edge Function: Versandergebnis festhalten. Erfolg → ältere offene Links
-- ungültig; Fehler → nur dieser (nie zugestellte) Link wird ungültig.
create or replace function public.schueler_eltern_mail_ergebnis(p_consent_id uuid, p_erfolg boolean)
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  if p_erfolg then
    update public.parental_consents set mail_gesendet_am = now(), versand_fehlgeschlagen_am = null
     where id = p_consent_id;
    -- Ältere offene Links desselben Kontos ungültig machen
    update public.parental_consents o
       set ersetzt_am = now()
      from public.parental_consents n
     where n.id = p_consent_id and o.student_id = n.student_id and o.id <> n.id
       and o.ersetzt_am is null and o.bestaetigt_am is null
       and o.abgelehnt_am is null and o.widerrufen_am is null;
  else
    update public.parental_consents set versand_fehlgeschlagen_am = now(), token_hash = null,
                                        ersetzt_am = now()
     where id = p_consent_id and bestaetigt_am is null;
  end if;
end;
$$;

-- ---------------------------------------------------------------------
-- Interne Hilfe: Freigabe-Zeile zu einem Link-Token finden
-- ---------------------------------------------------------------------
create or replace function public.edufy_consent_zum_token(p_token text)
returns uuid
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_id uuid;
begin
  -- Token: 43 Zeichen base64url (32 Byte); großzügig prüfen, nur Länge
  if p_token is null or char_length(p_token) < 20 or char_length(p_token) > 200 then
    raise exception 'EDUFY:TOKEN_UNGUELTIG';
  end if;
  select c.id into v_id from public.parental_consents c
  where c.token_hash = public.edufy_token_hash(p_token);
  if v_id is null then
    raise exception 'EDUFY:TOKEN_UNGUELTIG';
  end if;
  return v_id;
end;
$$;

-- ---------------------------------------------------------------------
-- RPC (anon): get_parental_consent_info – was wird freigegeben? Stand des Links
-- Rückgabe: { zustand: offen | bestaetigt | abgelehnt | widerrufen | abgelaufen | ersetzt,
--             kind: {...} (bei ersetzt: null; bei abgelaufen nur Vorname), ... }
-- ---------------------------------------------------------------------
create or replace function public.get_parental_consent_info(p_token text)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_id    uuid;
  v_c     public.parental_consents%rowtype;
  v_p     public.student_profiles%rowtype;
  v_email text;
  v_zust  text;
  v_kind  jsonb;
begin
  v_id := public.edufy_consent_zum_token(p_token);
  select * into v_c from public.parental_consents c where c.id = v_id;
  select * into v_p from public.student_profiles p where p.id = v_c.student_id;
  select u.email into v_email from auth.users u where u.id = v_c.student_id;

  v_zust := case
    when v_c.widerrufen_am is not null then 'widerrufen'
    when v_c.bestaetigt_am is not null then 'bestaetigt'
    when v_c.abgelehnt_am is not null then 'abgelehnt'
    when v_c.ersetzt_am is not null then 'ersetzt'
    when v_c.ablauf_am is null or v_c.ablauf_am < now() then 'abgelaufen'
    else 'offen' end;

  if v_zust = 'ersetzt' then
    -- Link ging evtl. an eine falsche Adresse → keine Angaben zum Kind
    v_kind := null;
  elsif v_zust = 'abgelaufen' then
    v_kind := jsonb_build_object('vorname', v_p.vorname);
  else
    v_kind := jsonb_build_object(
      'vorname', v_p.vorname,
      'geburtsmonat', v_p.geburtsmonat,
      'geburtsjahr', v_p.geburtsjahr,
      'klassenstufe', v_p.klassenstufe,
      'schulform', v_p.schulform,
      'schule_name', v_p.schule_name,
      'plz', v_p.plz,
      'email_maskiert', public.edufy_email_maskieren(v_email),
      'konto_seit', v_p.created_at,
      'konto_status', v_p.status);
  end if;

  return jsonb_build_object(
    'zustand', v_zust,
    'kind', v_kind,
    'ablauf_am', v_c.ablauf_am,
    'bestaetigt_am', v_c.bestaetigt_am,
    'abgelehnt_am', v_c.abgelehnt_am,
    'widerrufen_am', v_c.widerrufen_am);
end;
$$;

-- ---------------------------------------------------------------------
-- RPC (anon): confirm_parental_consent – Elternteil gibt frei (idempotent)
-- Fehler: TOKEN_UNGUELTIG, TOKEN_ERSETZT, TOKEN_ABGELAUFEN, LINK_GESCHLOSSEN,
--   NAME_FEHLT, SORGEBERECHTIGUNG_FEHLT, GESPERRT
-- Rückgabe: { zustand: 'bestaetigt', bereits: true|false, vorname }
-- ---------------------------------------------------------------------
create or replace function public.confirm_parental_consent(
  p_token            text,
  p_eltern_name      text,
  p_sorgeberechtigt  boolean,
  p_text_version     text
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_id    uuid;
  v_c     public.parental_consents%rowtype;
  v_p     public.student_profiles%rowtype;
  v_name  text := btrim(coalesce(p_eltern_name, ''));
  v_vers  text := left(nullif(btrim(coalesce(p_text_version, '')), ''), 40);
begin
  v_id := public.edufy_consent_zum_token(p_token);
  select * into v_c from public.parental_consents c where c.id = v_id for update;
  select * into v_p from public.student_profiles p where p.id = v_c.student_id for update;

  -- Idempotenz: schon freigegeben → Erfolg melden, nichts ändern
  if v_c.bestaetigt_am is not null and v_c.widerrufen_am is null then
    return jsonb_build_object('zustand', 'bestaetigt', 'bereits', true, 'vorname', v_p.vorname);
  end if;
  if v_c.abgelehnt_am is not null or v_c.widerrufen_am is not null then
    raise exception 'EDUFY:LINK_GESCHLOSSEN';
  end if;
  if v_c.ersetzt_am is not null then
    raise exception 'EDUFY:TOKEN_ERSETZT';
  end if;
  if v_c.ablauf_am is null or v_c.ablauf_am < now() then
    raise exception 'EDUFY:TOKEN_ABGELAUFEN';
  end if;
  if char_length(v_name) < 2 or char_length(v_name) > 100 then
    raise exception 'EDUFY:NAME_FEHLT';
  end if;
  if p_sorgeberechtigt is distinct from true then
    raise exception 'EDUFY:SORGEBERECHTIGUNG_FEHLT';
  end if;
  if v_p.status = 'gesperrt' then
    raise exception 'EDUFY:GESPERRT';
  end if;

  update public.parental_consents
     set bestaetigt_am = now(), eltern_name = v_name, sorgeberechtigt_bestaetigt = true,
         text_version = v_vers
   where id = v_c.id;

  -- Andere offene Links desselben Kontos werden überflüssig
  update public.parental_consents
     set ersetzt_am = now()
   where student_id = v_c.student_id and id <> v_c.id and ersetzt_am is null
     and bestaetigt_am is null and abgelehnt_am is null and widerrufen_am is null;

  if v_p.status = 'wartet_auf_eltern' then
    update public.student_profiles
       set status = 'aktiv', freigabe_art = 'eltern', aktiviert_am = now()
     where id = v_p.id;
  end if;

  return jsonb_build_object('zustand', 'bestaetigt', 'bereits', false, 'vorname', v_p.vorname);
end;
$$;

-- ---------------------------------------------------------------------
-- RPC (anon): revoke_parental_consent – Elternteil lehnt ab bzw. widerruft
-- Geht immer, auch bei abgelaufenem oder ersetztem Link (schützt das Kind).
--   * noch nicht freigegeben → abgelehnt
--   * freigegeben → widerrufen; Konto wieder eingeschränkt (wenn es durch die
--     Eltern aktiv wurde)
--   * p_konto_loeschen = true → Schülerkonto komplett löschen (Kaskade)
-- Rückgabe: { zustand: 'abgelehnt' | 'widerrufen' | 'bereits_abgelehnt'
--             | 'bereits_widerrufen' | 'konto_geloescht' }
-- ---------------------------------------------------------------------
create or replace function public.revoke_parental_consent(
  p_token           text,
  p_konto_loeschen  boolean default false
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_id    uuid;
  v_c     public.parental_consents%rowtype;
  v_p     public.student_profiles%rowtype;
  v_zust  text;
begin
  v_id := public.edufy_consent_zum_token(p_token);
  select * into v_c from public.parental_consents c where c.id = v_id for update;
  select * into v_p from public.student_profiles p where p.id = v_c.student_id for update;

  if p_konto_loeschen is true then
    -- Löscht auth.users → Kaskade auf student_profiles, parental_consents, student_favorites
    delete from auth.users u where u.id = v_c.student_id;
    return jsonb_build_object('zustand', 'konto_geloescht');
  end if;

  if v_c.widerrufen_am is not null then
    v_zust := 'bereits_widerrufen';
  elsif v_c.abgelehnt_am is not null then
    v_zust := 'bereits_abgelehnt';
  elsif v_c.bestaetigt_am is not null then
    update public.parental_consents set widerrufen_am = now() where id = v_c.id;
    v_zust := 'widerrufen';
  else
    update public.parental_consents set abgelehnt_am = now() where id = v_c.id;
    v_zust := 'abgelehnt';
  end if;

  -- Alle anderen offenen Links des Kontos schließen
  update public.parental_consents
     set ersetzt_am = now()
   where student_id = v_c.student_id and id <> v_c.id and ersetzt_am is null
     and bestaetigt_am is null and abgelehnt_am is null and widerrufen_am is null;

  if v_zust = 'widerrufen' and v_p.status = 'aktiv' and v_p.freigabe_art = 'eltern' then
    update public.student_profiles
       set status = 'wartet_auf_eltern', freigabe_art = null, aktiviert_am = null
     where id = v_p.id;
  end if;

  return jsonb_build_object('zustand', v_zust, 'vorname', v_p.vorname);
end;
$$;

-- ---------------------------------------------------------------------
-- RPC: self_activate_student_at_16 – wer inzwischen sicher 16 ist, kann das
-- eingeschränkte Konto selbst freischalten (Art. 8 Abs. 1 DSGVO: ab 16 keine
-- Eltern-Einwilligung nötig). Rechtlich durch edufy-legal zu bestätigen.
-- Fehler: NICHT_ANGEMELDET, KEIN_SCHUELERKONTO, NICHT_WARTEND, NOCH_NICHT_16
-- ---------------------------------------------------------------------
create or replace function public.self_activate_student_at_16()
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid uuid := auth.uid();
  v_p   public.student_profiles%rowtype;
begin
  if v_uid is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;
  select * into v_p from public.student_profiles p where p.id = v_uid for update;
  if not found then
    raise exception 'EDUFY:KEIN_SCHUELERKONTO';
  end if;
  if v_p.status <> 'wartet_auf_eltern' then
    raise exception 'EDUFY:NICHT_WARTEND';
  end if;
  if public.edufy_schueler_alter_sicher(v_p.geburtsjahr, v_p.geburtsmonat) < 16 then
    raise exception 'EDUFY:NOCH_NICHT_16';
  end if;
  update public.student_profiles
     set status = 'aktiv', freigabe_art = 'selbst_ab_16', aktiviert_am = now()
   where id = v_uid;
  update public.parental_consents
     set ersetzt_am = now()
   where student_id = v_uid and ersetzt_am is null and bestaetigt_am is null
     and abgelehnt_am is null and widerrufen_am is null;
  return jsonb_build_object('konto_status', 'aktiv');
end;
$$;

-- ---------------------------------------------------------------------
-- RPC: delete_my_student_account – eigenes Schülerkonto komplett löschen
-- Löscht auth.users; Kaskade auf Profil, Freigaben, Merkliste.
-- Nur für Schülerkonten (Profil vorhanden oder Rolle 'schueler' in den
-- Metadaten bei noch nicht abgeschlossener Registrierung).
-- Fehler: NICHT_ANGEMELDET, KEIN_SCHUELERKONTO
-- ---------------------------------------------------------------------
create or replace function public.delete_my_student_account()
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid    uuid := auth.uid();
  v_fv     boolean := false;
begin
  if v_uid is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;
  if to_regclass('public.foerderverein_profiles') is not null then
    execute 'select exists (select 1 from public.foerderverein_profiles where id = $1)'
      into v_fv using v_uid;
  end if;
  if v_fv or not (
       exists (select 1 from public.student_profiles p where p.id = v_uid)
       or exists (select 1 from auth.users u
                  where u.id = v_uid and u.raw_user_meta_data ->> 'rolle' = 'schueler')) then
    raise exception 'EDUFY:KEIN_SCHUELERKONTO';
  end if;
  delete from auth.users u where u.id = v_uid;
  return jsonb_build_object('status', 'geloescht');
end;
$$;

-- ---------------------------------------------------------------------
-- Ausführungsrechte. Supabase gibt neuen Funktionen standardmäßig
-- EXECUTE für anon/authenticated – deshalb überall ausdrücklich setzen.
-- ---------------------------------------------------------------------
revoke execute on function public.edufy_set_updated_at() from public, anon, authenticated;
revoke execute on function public.edufy_schueler_monate_seit_geburt(int, int) from public, anon, authenticated;
revoke execute on function public.edufy_schueler_alter_sicher(int, int) from public, anon, authenticated;
revoke execute on function public.edufy_schueler_alter_max(int, int) from public, anon, authenticated;
revoke execute on function public.edufy_token_hash(text) from public, anon, authenticated;
revoke execute on function public.edufy_email_gueltig(text) from public, anon, authenticated;
revoke execute on function public.edufy_email_maskieren(text) from public, anon, authenticated;
revoke execute on function public.edufy_consent_zum_token(text) from public, anon, authenticated;

-- Policy-Hilfen: nur für angemeldete Nutzer
revoke execute on function public.edufy_schueler_darf_merken() from public, anon;
grant  execute on function public.edufy_schueler_darf_merken() to authenticated;
revoke execute on function public.current_student_is_active() from public, anon;
grant  execute on function public.current_student_is_active() to authenticated;

-- Schüler (angemeldet)
revoke execute on function public.register_student(text, int, int, int, text, text, text, text) from public, anon;
grant  execute on function public.register_student(text, int, int, int, text, text, text, text) to authenticated;
revoke execute on function public.get_my_student_account() from public, anon;
grant  execute on function public.get_my_student_account() to authenticated;
revoke execute on function public.self_activate_student_at_16() from public, anon;
grant  execute on function public.self_activate_student_at_16() to authenticated;
revoke execute on function public.delete_my_student_account() from public, anon;
grant  execute on function public.delete_my_student_account() to authenticated;

-- Eltern (ohne Konto, nur mit Link-Token)
revoke execute on function public.get_parental_consent_info(text) from public;
grant  execute on function public.get_parental_consent_info(text) to anon, authenticated;
revoke execute on function public.confirm_parental_consent(text, text, boolean, text) from public;
grant  execute on function public.confirm_parental_consent(text, text, boolean, text) to anon, authenticated;
revoke execute on function public.revoke_parental_consent(text, boolean) from public;
grant  execute on function public.revoke_parental_consent(text, boolean) to anon, authenticated;

-- Nur Edge Function (Service-Role) – ausdrücklich NICHT für Schüler oder anon
revoke execute on function public.schueler_eltern_mail_vorbereiten(uuid, text, text) from public, anon, authenticated;
grant  execute on function public.schueler_eltern_mail_vorbereiten(uuid, text, text) to service_role;
revoke execute on function public.schueler_eltern_mail_ergebnis(uuid, boolean) from public, anon, authenticated;
grant  execute on function public.schueler_eltern_mail_ergebnis(uuid, boolean) to service_role;

commit;
