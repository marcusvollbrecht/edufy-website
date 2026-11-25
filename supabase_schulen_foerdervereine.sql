-- =====================================================================
-- Edufy – Schema Schulen, Fördervereine, Förderverein-Profile, Provisionen
-- Datei: supabase_schulen_foerdervereine.sql   (Aufgabe F-001)
--
-- Einspielen: Supabase → SQL Editor → kompletten Inhalt einfügen → „Run“.
-- Die Datei ist idempotent (mehrfach ausführbar, ohne Daten zu löschen).
-- Voraussetzung: keine. Reihenfolge zu anderen Schemas egal
-- (supabase_setup.sql für Schüler kann vorher oder nachher laufen).
--
-- Sicherheitskonzept
-- ------------------
-- * Jede Tabelle hat RLS aktiviert und ausdrücklich definierte Policies.
-- * Für „anon“ (nicht angemeldet) gibt es KEINE Tabellenrechte.
-- * Angemeldete Förderverein-Nutzer sehen/ändern nur ihr eigenes Profil
--   und ihren eigenen Verein; Provisionen nur lesend für den eigenen Verein.
-- * Angelegt werden Schule + Verein + Profil ausschließlich über die
--   Funktion public.register_foerderverein(...) (security definer). Sie läuft
--   mit auth.uid() des angemeldeten Nutzers, prüft alle Eingaben und fängt
--   Duplikate ab. Direkte INSERTs durch Nutzer sind nicht erlaubt.
--
-- Registrierungsablauf (Frontend: registrierung-foerderverein.html)
-- -----------------------------------------------------------------
-- 1. supabase.auth.signUp({ email, password, options: { data: {
--      rolle: 'foerderverein', registrierung: { …alle Formularfelder… } },
--      emailRedirectTo: '<Domain>/foerderverein-bestaetigung.html' } })
-- 2a. E-Mail-Bestätigung AUS (signUp liefert Session):
--     sofort rpc('register_foerderverein', {...}) aufrufen.
-- 2b. E-Mail-Bestätigung AN (keine Session): Daten liegen in user_metadata.
--     Nach Klick auf den Bestätigungslink landet der Nutzer angemeldet auf
--     foerderverein-bestaetigung.html. Die Seite prüft: Profil vorhanden?
--     Wenn nein → rpc('register_foerderverein', …) mit den Werten aus
--     user_metadata.registrierung nachholen und die Metadaten danach leeren
--     (Datensparsamkeit). Die Funktion ist idempotent: ein zweiter Aufruf
--     liefert nur den bestehenden Verein zurück.
-- =====================================================================

begin;


-- ---------------------------------------------------------------------
-- Hilfsfunktion: updated_at automatisch setzen
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
-- Tabelle: schools – Schulen
-- ---------------------------------------------------------------------
create table if not exists public.schools (
  id          uuid primary key default gen_random_uuid(),
  name        text not null check (char_length(name) between 2 and 200),
  schulform   text not null check (schulform in (
                'grundschule', 'hauptschule', 'realschule', 'gymnasium',
                'gesamtschule', 'oberschule', 'gemeinschaftsschule',
                'foerderschule', 'berufsbildende_schule', 'sonstige')),
  strasse     text not null check (char_length(strasse) between 2 and 200),
  plz         text not null check (plz ~ '^[0-9]{5}$'),
  ort         text not null check (char_length(ort) between 2 and 100),
  bundesland  text not null check (bundesland in (
                'BW', 'BY', 'BE', 'BB', 'HB', 'HH', 'HE', 'MV',
                'NI', 'NW', 'RP', 'SL', 'SN', 'ST', 'SH', 'TH')),
  created_by  uuid references auth.users (id) on delete set null,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
comment on table public.schools is 'Schulen. Wird von Förderverein-, Schüler- und Unternehmensbereich referenziert.';
comment on column public.schools.bundesland is 'Kürzel nach ISO 3166-2:DE ohne Präfix (z. B. NW, BY).';

-- Dublettenschutz: gleiche Schule (Name ohne Groß/Klein & Leerzeichen am Rand) + gleiche PLZ
create unique index if not exists schools_name_plz_uniq
  on public.schools (lower(btrim(name)), plz);

drop trigger if exists schools_set_updated_at on public.schools;
create trigger schools_set_updated_at
  before update on public.schools
  for each row execute function public.edufy_set_updated_at();

-- ---------------------------------------------------------------------
-- Tabelle: foerdervereine – ein Förderverein je Schule
-- ---------------------------------------------------------------------
create table if not exists public.foerdervereine (
  id                  uuid primary key default gen_random_uuid(),
  school_id           uuid not null unique references public.schools (id) on delete restrict,
  vereinsname         text not null check (char_length(vereinsname) between 2 and 200),
  vereinsregister_nr  text check (vereinsregister_nr is null or char_length(vereinsregister_nr) <= 50),
  registergericht     text check (registergericht is null or char_length(registergericht) <= 100),
  gemeinnuetzig       boolean not null,
  -- IBAN wird bewusst NICHT bei der Registrierung abgefragt (erst für Auszahlungen, späteres Ticket).
  iban                text check (iban is null or char_length(iban) between 15 and 34),
  status              text not null default 'neu' check (status in ('neu', 'aktiv', 'pausiert')),
  created_by          uuid references auth.users (id) on delete set null,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
comment on table public.foerdervereine is 'Fördervereine. Genau ein Verein pro Schule (school_id unique).';
comment on column public.foerdervereine.iban is 'Später für Auszahlungen; wird im Onboarding (F-001) nicht abgefragt.';
comment on column public.foerdervereine.status is 'neu = registriert, noch kein Gespräch; aktiv = freigeschaltet; pausiert.';

drop trigger if exists foerdervereine_set_updated_at on public.foerdervereine;
create trigger foerdervereine_set_updated_at
  before update on public.foerdervereine
  for each row execute function public.edufy_set_updated_at();

-- ---------------------------------------------------------------------
-- Tabelle: foerderverein_profiles – Ansprechpersonen (1:1 zu auth.users)
-- ---------------------------------------------------------------------
create table if not exists public.foerderverein_profiles (
  id                          uuid primary key references auth.users (id) on delete cascade,
  foerderverein_id            uuid not null references public.foerdervereine (id) on delete cascade,
  vorname                     text not null check (char_length(vorname) between 1 and 100),
  nachname                    text not null check (char_length(nachname) between 1 and 100),
  funktion                    text not null check (funktion in (
                                'vorsitz', 'stellv_vorsitz', 'kassenwart',
                                'schriftfuehrung', 'beisitz', 'sonstiges')),
  email                       text not null check (char_length(email) between 3 and 254),
  telefon                     text check (telefon is null or char_length(telefon) <= 40),
  vertretung_bestaetigt       boolean not null default false,
  datenschutz_akzeptiert      boolean not null check (datenschutz_akzeptiert = true),
  datenschutz_akzeptiert_am   timestamptz not null,
  created_at                  timestamptz not null default now(),
  updated_at                  timestamptz not null default now()
);
comment on table public.foerderverein_profiles is 'Ansprechpersonen eines Fördervereins; id = auth.users.id.';
comment on column public.foerderverein_profiles.vertretung_bestaetigt is 'Person hat bestätigt, Vorstandsmitglied oder vom Vorstand beauftragt zu sein.';
comment on column public.foerderverein_profiles.datenschutz_akzeptiert_am is 'Zeitpunkt der Zustimmung zur Datenschutzerklärung (Nachweis nach Art. 7 Abs. 1 DSGVO).';

create index if not exists foerderverein_profiles_verein_idx
  on public.foerderverein_profiles (foerderverein_id);

drop trigger if exists foerderverein_profiles_set_updated_at on public.foerderverein_profiles;
create trigger foerderverein_profiles_set_updated_at
  before update on public.foerderverein_profiles
  for each row execute function public.edufy_set_updated_at();

-- ---------------------------------------------------------------------
-- Tabelle: provisions – Gerüst für Provisionen aus Unternehmensverträgen
-- (contract_id verweist später auf contracts aus dem Unternehmensbereich;
--  Fremdschlüssel wird nach Abstimmung über den PM ergänzt.)
-- ---------------------------------------------------------------------
create table if not exists public.provisions (
  id                uuid primary key default gen_random_uuid(),
  foerderverein_id  uuid not null references public.foerdervereine (id) on delete restrict,
  contract_id       uuid null,
  betrag            numeric(12, 2) not null check (betrag >= 0),
  status            text not null default 'offen' check (status in ('offen', 'freigegeben', 'ausgezahlt', 'storniert')),
  created_at        timestamptz not null default now(),
  updated_at        timestamptz not null default now()
);
comment on table public.provisions is 'Provisionen je Förderverein. Schreiben nur durch Backend/Service-Role, Nutzer lesen nur.';

create index if not exists provisions_verein_idx on public.provisions (foerderverein_id);

drop trigger if exists provisions_set_updated_at on public.provisions;
create trigger provisions_set_updated_at
  before update on public.provisions
  for each row execute function public.edufy_set_updated_at();

-- ---------------------------------------------------------------------
-- Hilfsfunktion für Policies: Verein des angemeldeten Nutzers
-- (security definer, damit Policies sich nicht gegenseitig rekursiv prüfen)
-- ---------------------------------------------------------------------
create or replace function public.current_foerderverein_id()
returns uuid
language sql
stable
security definer
set search_path = ''
as $$
  select p.foerderverein_id
  from public.foerderverein_profiles p
  where p.id = auth.uid();
$$;

revoke execute on function public.current_foerderverein_id() from public, anon;
grant execute on function public.current_foerderverein_id() to authenticated;

-- ---------------------------------------------------------------------
-- Row Level Security aktivieren
-- ---------------------------------------------------------------------
alter table public.schools                enable row level security;
alter table public.foerdervereine         enable row level security;
alter table public.foerderverein_profiles enable row level security;
alter table public.provisions             enable row level security;

-- ---------------------------------------------------------------------
-- Tabellenrechte (zusätzlich zu RLS): anon bekommt nichts,
-- authenticated nur Lesen + Ändern ausgewählter Spalten.
-- ---------------------------------------------------------------------
revoke all on public.schools, public.foerdervereine,
              public.foerderverein_profiles, public.provisions
  from anon, authenticated;

grant select on public.schools, public.foerdervereine,
                public.foerderverein_profiles, public.provisions
  to authenticated;

-- Verein: Stammdaten änderbar; school_id, iban, status nicht (Support/Backend)
grant update (vereinsname, vereinsregister_nr, registergericht, gemeinnuetzig)
  on public.foerdervereine to authenticated;

-- Profil: persönliche Angaben änderbar; Vereinszuordnung/E-Mail/Einwilligung nicht
grant update (vorname, nachname, funktion, telefon)
  on public.foerderverein_profiles to authenticated;

-- ---------------------------------------------------------------------
-- Policies
-- ---------------------------------------------------------------------
-- schools: nur die Schule des eigenen Vereins lesen (Änderungen über Support)
drop policy if exists "schools_select_eigene" on public.schools;
create policy "schools_select_eigene" on public.schools
  for select to authenticated
  using (id = (select f.school_id from public.foerdervereine f
               where f.id = public.current_foerderverein_id()));

-- foerdervereine: eigenen Verein lesen und ändern
drop policy if exists "foerdervereine_select_eigener" on public.foerdervereine;
create policy "foerdervereine_select_eigener" on public.foerdervereine
  for select to authenticated
  using (id = public.current_foerderverein_id());

drop policy if exists "foerdervereine_update_eigener" on public.foerdervereine;
create policy "foerdervereine_update_eigener" on public.foerdervereine
  for update to authenticated
  using (id = public.current_foerderverein_id())
  with check (id = public.current_foerderverein_id());

-- foerderverein_profiles: nur eigenes Profil lesen und ändern
-- (kein INSERT – Anlage nur über register_foerderverein; kein DELETE – über Support/Kontolöschung)
drop policy if exists "fv_profiles_select_eigenes" on public.foerderverein_profiles;
create policy "fv_profiles_select_eigenes" on public.foerderverein_profiles
  for select to authenticated
  using (id = auth.uid());

drop policy if exists "fv_profiles_update_eigenes" on public.foerderverein_profiles;
create policy "fv_profiles_update_eigenes" on public.foerderverein_profiles
  for update to authenticated
  using (id = auth.uid())
  with check (id = auth.uid());

-- provisions: nur lesen, nur eigener Verein
drop policy if exists "provisions_select_eigener_verein" on public.provisions;
create policy "provisions_select_eigener_verein" on public.provisions
  for select to authenticated
  using (foerderverein_id = public.current_foerderverein_id());

-- ---------------------------------------------------------------------
-- RPC: register_foerderverein – legt Schule (falls neu), Verein und Profil an
-- Fehler werden als 'EDUFY:<CODE>' gemeldet, das Frontend übersetzt sie.
--   NICHT_ANGEMELDET, PFLICHTFELD, UNGUELTIGE_PLZ, UNGUELTIGE_SCHULFORM,
--   UNGUELTIGES_BUNDESLAND, UNGUELTIGE_FUNKTION, DATENSCHUTZ_FEHLT,
--   VERTRETUNG_FEHLT, SCHULE_BEREITS_REGISTRIERT
-- Rückgabe: jsonb { status: 'angelegt' | 'bereits_registriert', foerderverein_id, school_id }
-- ---------------------------------------------------------------------
create or replace function public.register_foerderverein(
  p_schulname              text,
  p_schulform              text,
  p_strasse                text,
  p_plz                    text,
  p_ort                    text,
  p_bundesland             text,
  p_vereinsname            text,
  p_vereinsregister_nr     text,
  p_registergericht        text,
  p_gemeinnuetzig          boolean,
  p_vorname                text,
  p_nachname               text,
  p_funktion               text,
  p_telefon                text,
  p_vertretung_bestaetigt  boolean,
  p_datenschutz_akzeptiert boolean
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid        uuid := auth.uid();
  v_email      text;
  v_school_id  uuid;
  v_verein_id  uuid;
  v_schulname  text := btrim(coalesce(p_schulname, ''));
  v_strasse    text := btrim(coalesce(p_strasse, ''));
  v_plz        text := btrim(coalesce(p_plz, ''));
  v_ort        text := btrim(coalesce(p_ort, ''));
  v_verein     text := btrim(coalesce(p_vereinsname, ''));
  v_vr_nr      text := nullif(btrim(coalesce(p_vereinsregister_nr, '')), '');
  v_gericht    text := nullif(btrim(coalesce(p_registergericht, '')), '');
  v_vorname    text := btrim(coalesce(p_vorname, ''));
  v_nachname   text := btrim(coalesce(p_nachname, ''));
  v_telefon    text := nullif(btrim(coalesce(p_telefon, '')), '');
begin
  if v_uid is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;

  -- Idempotenz: bereits registriert → bestehenden Verein zurückgeben
  select p.foerderverein_id into v_verein_id
  from public.foerderverein_profiles p where p.id = v_uid;
  if v_verein_id is not null then
    select f.school_id into v_school_id from public.foerdervereine f where f.id = v_verein_id;
    return jsonb_build_object('status', 'bereits_registriert',
                              'foerderverein_id', v_verein_id,
                              'school_id', v_school_id);
  end if;

  -- Eingaben prüfen
  if char_length(v_schulname) < 2 or char_length(v_strasse) < 2 or char_length(v_ort) < 2
     or char_length(v_verein) < 2 or char_length(v_vorname) < 1 or char_length(v_nachname) < 1
     or p_gemeinnuetzig is null then
    raise exception 'EDUFY:PFLICHTFELD';
  end if;
  if v_plz !~ '^[0-9]{5}$' then
    raise exception 'EDUFY:UNGUELTIGE_PLZ';
  end if;
  if p_schulform is null or p_schulform not in ('grundschule', 'hauptschule', 'realschule', 'gymnasium',
       'gesamtschule', 'oberschule', 'gemeinschaftsschule', 'foerderschule',
       'berufsbildende_schule', 'sonstige') then
    raise exception 'EDUFY:UNGUELTIGE_SCHULFORM';
  end if;
  if p_bundesland is null or p_bundesland not in ('BW', 'BY', 'BE', 'BB', 'HB', 'HH', 'HE', 'MV',
       'NI', 'NW', 'RP', 'SL', 'SN', 'ST', 'SH', 'TH') then
    raise exception 'EDUFY:UNGUELTIGES_BUNDESLAND';
  end if;
  if p_funktion is null or p_funktion not in ('vorsitz', 'stellv_vorsitz', 'kassenwart',
       'schriftfuehrung', 'beisitz', 'sonstiges') then
    raise exception 'EDUFY:UNGUELTIGE_FUNKTION';
  end if;
  if p_datenschutz_akzeptiert is distinct from true then
    raise exception 'EDUFY:DATENSCHUTZ_FEHLT';
  end if;
  if p_vertretung_bestaetigt is distinct from true then
    raise exception 'EDUFY:VERTRETUNG_FEHLT';
  end if;
  if char_length(v_schulname) > 200 or char_length(v_strasse) > 200 or char_length(v_ort) > 100
     or char_length(v_verein) > 200 or char_length(v_vorname) > 100 or char_length(v_nachname) > 100
     or char_length(coalesce(v_vr_nr, '')) > 50 or char_length(coalesce(v_gericht, '')) > 100
     or char_length(coalesce(v_telefon, '')) > 40 then
    raise exception 'EDUFY:PFLICHTFELD';
  end if;

  -- E-Mail aus dem Auth-Konto übernehmen (nicht aus Nutzereingabe)
  select u.email into v_email from auth.users u where u.id = v_uid;
  if v_email is null then
    raise exception 'EDUFY:NICHT_ANGEMELDET';
  end if;

  -- Schule suchen bzw. anlegen; Duplikat (gleicher Name + PLZ) mit Verein → Fehler
  select s.id into v_school_id
  from public.schools s
  where lower(btrim(s.name)) = lower(v_schulname) and s.plz = v_plz;

  if v_school_id is not null then
    if exists (select 1 from public.foerdervereine f where f.school_id = v_school_id) then
      raise exception 'EDUFY:SCHULE_BEREITS_REGISTRIERT';
    end if;
  else
    begin
      insert into public.schools (name, schulform, strasse, plz, ort, bundesland, created_by)
      values (v_schulname, p_schulform, v_strasse, v_plz, v_ort, p_bundesland, v_uid)
      returning id into v_school_id;
    exception when unique_violation then
      -- paralleler Aufruf hat die Schule gerade angelegt
      raise exception 'EDUFY:SCHULE_BEREITS_REGISTRIERT';
    end;
  end if;

  begin
    insert into public.foerdervereine (school_id, vereinsname, vereinsregister_nr,
                                       registergericht, gemeinnuetzig, created_by)
    values (v_school_id, v_verein, v_vr_nr, v_gericht, p_gemeinnuetzig, v_uid)
    returning id into v_verein_id;
  exception when unique_violation then
    raise exception 'EDUFY:SCHULE_BEREITS_REGISTRIERT';
  end;

  insert into public.foerderverein_profiles (id, foerderverein_id, vorname, nachname, funktion,
                                             email, telefon, vertretung_bestaetigt,
                                             datenschutz_akzeptiert, datenschutz_akzeptiert_am)
  values (v_uid, v_verein_id, v_vorname, v_nachname, p_funktion,
          v_email, v_telefon, true, true, now());

  return jsonb_build_object('status', 'angelegt',
                            'foerderverein_id', v_verein_id,
                            'school_id', v_school_id);
end;
$$;

revoke execute on function public.register_foerderverein(
  text, text, text, text, text, text, text, text, text, boolean,
  text, text, text, text, boolean, boolean) from public, anon;
grant execute on function public.register_foerderverein(
  text, text, text, text, text, text, text, text, text, boolean,
  text, text, text, text, boolean, boolean) to authenticated;

revoke execute on function public.edufy_set_updated_at() from public, anon, authenticated;

commit;
