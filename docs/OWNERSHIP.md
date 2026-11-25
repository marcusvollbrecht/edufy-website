# Datei-Zuständigkeiten

Ziel: Die drei Entwickler arbeiten parallel, ohne sich gegenseitig Dateien zu überschreiben.
Dateinamen sind Muster. Stand Sprint 1: Repo-Root enthält die HTML-Seiten, SQL liegt in `sql/` bzw. als `supabase_*.sql` im Root, gemeinsames JS in `js/`.

| Bereich | Owner | Dateien/Muster |
|---|---|---|
| Schüler & Content | edufy-dev-schueler | `schueler*.html`, `registrierung-schueler*.html`, `berufe*.html`, `studium*.html`, `dashboard-schueler*.html`, `eltern-freigabe*.html`, `foerderungen*.html`, `navigator*.html`, `data/foerderungen*`, `data/bildungswege*`, `docs/content/*`, `supabase/functions/schueler*`, `data/berufe*`, `data/studium*`, `sql/schueler*.sql`, `supabase_setup.sql` |
| Förderverein & Schule | edufy-dev-foerderverein | `foerderverein*.html`, `schule*.html`, `registrierung-foerderverein*.html`, `dashboard-foerderverein*.html`, `sql/foerderverein*.sql`, `supabase_schulen_foerdervereine.sql` |
| Unternehmen | edufy-dev-unternehmen | `unternehmen*.html`, `registrierung-unternehmen*.html`, `dashboard-unternehmen*.html`, `angebote*.html`, `sql/unternehmen*.sql` |
| **Gemeinsam** | **nur nach Freigabe durch edufy-pm** | `index.html`, Navigation/Header/Footer, `css/*` (global), `js/supabase*.js`, `js/auth*.js`, `vercel.json`, Impressum/Datenschutz/AGB |
| Landingpage (Sprint-Rolle) | edufy-dev-landing | nur per Sprint-Freigabe: `index.html`, `impressum.html`, `datenschutz.html`, `fonts/*`, `sql/landing*.sql` |
| Steuerung | edufy-pm | `docs/BACKLOG.md`, `docs/OWNERSHIP.md` |
| Recht | edufy-legal | `docs/legal/*` (nur Berichte, kein Code) |
| Steuer | edufy-steuer | `docs/steuer/*` (nur Berichte, kein Code) |
| Feedback | jeweiliger Test-User | `feedback/<rolle>/*` |

## Schnittstellen zwischen Bereichen
- `contracts` (Unternehmen) → löst `provisions` (Förderverein) aus. Schema-Änderung nur mit
  Abstimmung über den PM.
- `offers` (Unternehmen) werden im Schüler-Bereich lesend angezeigt.
- `schools` (Förderverein) wird bei Schüler- und Unternehmensregistrierung referenziert.
