-- =====================================================================
-- Edufy – Warteliste der Landingpage (index.html, Abschnitt #waitlist)
-- Aufgabe: G-002 · Owner: edufy-dev-landing
-- Einspielen: Supabase → SQL Editor → komplett ausführen (idempotent).
--
-- Sicherheitsmodell:
--   * RLS ist aktiv.
--   * anon/authenticated dürfen NUR einfügen (und nur mit Datenschutz-Einwilligung).
--   * KEIN select/update/delete für anon/authenticated – Einträge sind nur
--     im Supabase-Dashboard bzw. mit service_role lesbar.
--   * Das Frontend ruft insert OHNE .select() auf (sonst bräuchte es select-Recht).
--   * Doppelte Anmeldung (gleiche E-Mail + gleicher Typ) → Fehler 23505,
--     das Frontend zeigt dann „Sie sind bereits eingetragen“.
-- =====================================================================

create table if not exists public.waitlist (
  id               uuid primary key default gen_random_uuid(),
  created_at       timestamptz not null default now(),

  -- Welcher Tab im Formular: Schule/Förderverein, Unternehmen, Eltern/Schüler
  typ              text not null
                   check (typ in ('schule', 'unternehmen', 'eltern')),

  name             text not null check (char_length(name) between 1 and 200),
  email            text not null check (char_length(email) between 3 and 320 and position('@' in email) > 1),
  organisation     text          check (organisation is null or char_length(organisation) <= 200),
  funktion         text          check (funktion is null or char_length(funktion) <= 200),

  -- Typ "schule": Bundesland (optional)
  bundesland       text          check (bundesland is null or char_length(bundesland) <= 60),
  -- Typ "unternehmen": Anzahl Ausbildungsplätze pro Jahr (optional)
  ausbildungsplaetze integer     check (ausbildungsplaetze is null or ausbildungsplaetze between 0 and 100000),
  -- Typ "eltern": Rolle (Elternteil / Schüler / Lehrkraft)
  rolle            text          check (rolle is null or rolle in ('elternteil', 'schueler', 'lehrkraft')),

  -- Einwilligungen
  consent_privacy  boolean not null default false,
  consent_age      boolean,      -- nur Typ "eltern": 16+ bzw. Eltern einverstanden
  consent_at       timestamptz not null default now()
);

comment on table public.waitlist is
  'Vorregistrierungen von der Landingpage. Nur INSERT für anon; Lesen nur per Dashboard/service_role.';

-- Duplikate pro E-Mail (case-insensitive) und Typ verhindern
create unique index if not exists waitlist_email_typ_uniq
  on public.waitlist (lower(email), typ);

-- RLS explizit aktivieren
alter table public.waitlist enable row level security;

-- Alte Policies entfernen (idempotentes Einspielen)
drop policy if exists "waitlist_insert_public" on public.waitlist;

-- Nur INSERT, nur mit Datenschutz-Einwilligung
-- (bei Schüler/Eltern zusätzlich Alters-/Eltern-Bestätigung)
create policy "waitlist_insert_public"
  on public.waitlist
  for insert
  to anon, authenticated
  with check (
    consent_privacy = true
    and (typ <> 'eltern' or consent_age = true)
  );

-- Bewusst KEINE select/update/delete-Policy für anon/authenticated.

-- Tabellenrechte minimal halten (Supabase vergibt standardmäßig breite Grants)
revoke all on table public.waitlist from anon, authenticated;
grant insert on table public.waitlist to anon, authenticated;
