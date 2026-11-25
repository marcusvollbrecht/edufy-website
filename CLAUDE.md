# Edufy – Projektkontext für alle Agenten

Edufy (edufy.world) ist eine deutsche EdTech-Plattform, die Schüler, Eltern, Schulen,
Fördervereine und Unternehmen verbindet.

## Geschäftsmodell (für Produktentscheidungen relevant)
- Schüler nutzen Edufy kostenlos.
- Unternehmen zahlen für den Zugang zu Schülern und Schulen.
- Fördervereine erhalten ca. 25–30 % Provision auf Unternehmensverträge, die über ihre Schule laufen.
- Fördervereine sind der primäre Go-to-Market-Kanal → ihr Onboarding muss reibungslos sein.

## Stack
- Frontend: Multi-Page-HTML (Vanilla HTML/CSS/JS), keine Build-Pipeline.
- Backend/Auth: Supabase (Postgres + RLS). Schemas: `supabase_setup.sql` (Schüler),
  `supabase_schulen_foerdervereine.sql` (Schulen, Fördervereine, Profile, Provisionen).
- Deployment: GitHub → Vercel → edufy.world.
- Inhalte: Berufsbibliothek (BIBB 2025 Ausbildungsvergütungen), Studiumsbibliothek.

## Verbindliche technische Regeln
1. **RLS immer explizit.** Jede neue Tabelle bekommt im SQL `enable row level security` UND
   passende Policies. Nie auf "Automatic RLS" verlassen.
2. **Auth-Muster:** `auth.signUp` mit Metadata → Profil-Insert mit expliziter Feldzuordnung
   (kein Spread-Operator) → optionale Folgeaufrufe als separate REST-Calls.
3. **Keine Regex in Template-Literals.** Muster wie `\d` in Hilfsfunktionen außerhalb des
   Template-Literals auslagern – sonst bricht die ganze Seite still.
4. **JS-Validierung vor Übergabe:** `<script>`-Blöcke extrahieren und mit `node --check`
   prüfen (siehe `docs/validate.sh`).
5. Keine Secrets im Code außer dem öffentlichen Supabase-Anon-Key.
6. DSGVO: Schüler sind oft minderjährig → Datensparsamkeit, keine Kontaktdaten von Schülern
   an Unternehmen ohne explizite Einwilligung (bei U16 Einwilligung der Eltern).

## Agentensystem
Siehe `docs/AGENTEN.md`. Zusammenarbeit läuft über Dateien:
- `docs/BACKLOG.md` – einzige Quelle für Aufgaben (gepflegt vom Project Manager)
- `docs/OWNERSHIP.md` – wer welche Dateien ändern darf
- `feedback/<rolle>/` – Testberichte der Test-User
- `docs/CHANGELOG.md` – jeder Entwickler trägt seine Änderungen ein
