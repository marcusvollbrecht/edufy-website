# Edufy Backlog

Format je Eintrag:
`- [ ] <ID> | <Bereich: S/F/U/G> | <Prio: P0–P3> | <Titel> — Akzeptanz: <…> — Quelle: <Marcus/feedback-Pfad>`

Bereiche: S = Schüler & Content, F = Förderverein, U = Unternehmen, G = Gemeinsam (PM entscheidet)

## Aktueller Sprint
Sprint 1 (2026-11-25) — Ziel: Förderverein-Onboarding Ende-zu-Ende + Landingpage launchfähig (technisch/a11y)
- [ ] F-001 | F | P0 | Förderverein-Onboarding Ende-zu-Ende lauffähig inkl. Bestätigungsseite — Akzeptanz: Registrierung legt Profil in Supabase an, Nutzer sieht nächste Schritte — Quelle: Marcus — Owner: edufy-dev-foerderverein (+ Freigabe `js/supabase-config.js`, `js/supabase-client.js`)
- [ ] G-002 | G | P0 | Landingpage: Wartelisten-Formular funktionsfähig, Impressum/Datenschutz-Seiten (Gerüst), mobile Navigation, Kontraste/Labels/Fokus (WCAG AA), Google Fonts lokal statt Google-Server, reduced-motion, SEO-Basis (OG, Canonical, Favicon) — Akzeptanz: keine leeren `href="#"`-Pflichtlinks, Formular speichert in Supabase-Tabelle `waitlist` (RLS: nur insert für anon), validate.sh grün, kein Request an Google beim Laden — Quelle: Audits 2026-11-25 — Owner: edufy-dev-landing (Sprint-Freigabe für `index.html`, `impressum.html`, `datenschutz.html`, `fonts/`, `sql/landing_waitlist.sql`)

## Offene Entscheidungen für Marcus
- [ ] Preise und Pakete für Unternehmen
- [ ] Provisionssatz Förderverein (25 % oder 30 %, fix oder gestaffelt)
- [ ] Zahlungsanbieter / Rechnungsstellung
- [ ] Einwilligungsprozess für Schüler unter 16 (Eltern)
- [ ] Markenname: Landingpage heißt „EduConnect“ (Kontakt hallo@edu-connect.com), CLAUDE.md/Domain „Edufy“ (edufy.world) — was gilt?
- [ ] Impressumsangaben (Rechtsträger, Anschrift, Vertretung, Register, USt-IdNr.) und Inhalt der Datenschutzerklärung (ggf. Anwalt/Generator)
- [ ] Werbeaussagen mit Rechtsrisiko auf der Landingpage: „Rechtssicher in allen 16 Bundesländern“, „Meister verdient mehr als Bachelor“, unbelegte Statistiken, Förderbeträge (Kindergeld 250 € veraltet), „SAP“ im Mockup, „Spendennennung“ vs. Sponsoring (Gemeinnützigkeit Förderverein!)
- [ ] Supabase-Projekt-URL + Anon-Key für `js/supabase-config.js`

## Backlog
- [ ] S-001 | S | P1 | Bestandsaufnahme Schüler-Wizard und Bibliotheken gegen Supabase-Schema — Akzeptanz: Liste funktionierender/defekter Schritte — Quelle: Marcus
- [ ] F-001 | F | P0 | Förderverein-Onboarding Ende-zu-Ende lauffähig inkl. Bestätigungsseite — Akzeptanz: Registrierung legt Profil in Supabase an, Nutzer sieht nächste Schritte — Quelle: Marcus
- [ ] F-002 | F | P1 | Einladungslink/QR-Code für Schüler im Förderverein-Dashboard — Quelle: Marcus
- [ ] U-001 | U | P1 | Unternehmens-Registrierung + Firmenprofil (inkl. Supabase-Schema `companies` mit RLS) — Quelle: Marcus
- [ ] U-002 | U | P2 | Angebot anlegen (Praktikum/Ausbildung) und Sichtbarkeit für Schüler einer Schule — Quelle: Marcus
- [ ] G-001 | G | P1 | Gemeinsame Navigation mit Rollen-Login (Schüler/Förderverein/Unternehmen) — Quelle: Marcus

- [ ] G-003 | G | P1 | Landingpage-Texte überarbeiten: Rechtschreibung/Typografie, Pitch-Deck-Ton raus, einheitliche CTAs/Begriffe, „Sechs Zielgruppen“ vs. 4 Karten — Quelle: Lektorats-Audit 2026-11-25 (blockiert durch Marcus-Entscheidungen zu Werbeaussagen)
- [ ] G-004 | G | P2 | SEO: JSON-LD, robots.txt, sitemap.xml, og-image.jpg, Title/Description mit Suchbegriffen — Quelle: SEO-Audit 2026-11-25
- [ ] G-005 | G | P2 | Datenschutz Warteliste: Double-Opt-In und Abmeldeweg — Quelle: SEO-Audit 2026-11-25

## Erledigt
