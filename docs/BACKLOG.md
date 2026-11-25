# Edufy Backlog

Format je Eintrag:
`- [ ] <ID> | <Bereich: S/F/U/G> | <Prio: P0–P3> | <Titel> — Akzeptanz: <…> — Quelle: <Marcus/feedback-Pfad>`

Bereiche: S = Schüler & Content, F = Förderverein, U = Unternehmen, G = Gemeinsam (PM entscheidet)

## Aktueller Sprint
Sprint 1 (2026-11-25) — Ziel: Förderverein-Onboarding Ende-zu-Ende + Landingpage launchfähig (technisch/a11y)
Status: abgeschlossen 2026-11-25 – siehe Erledigt. Nächster Sprint: vom PM nach Entscheidungen von Marcus zu planen.

## Entschiedene Punkte (Marcus, 2026-11-25)
- Marke: **Edufy** (edufy.world) überall; Kontakt künftig hallo@edufy.world.
- Förderverein-Beteiligung: **30 % fix** auf Unternehmensverträge über ihre Schule.
- Kommunikation: öffentlich nur „Beteiligung an den Einnahmen“, **kein Prozentsatz** auf Website/Registrierung; Details im persönlichen Gespräch.
- Steuer/Gemeinnützigkeit: Vorprüfung durch Agent **edufy-steuer**, Ergebnis zur Bestätigung an echten Steuerberater.
- Werbeaussagen Landingpage: **erst Prüfung durch Agent edufy-legal**, dann Umsetzung (G-003).
- Schülerdaten: Unternehmen sehen **nur Statistiken je Schule**; Details zu Schülern erst, wenn der Schüler **aktiv Kontakt** zum Unternehmen aufnimmt.
- Schulleitung: **formale Zustimmung** der Schulleitung, bevor ein Förderverein aktiv wird.
- Förderverein-Laufzeit: **Jahresvertrag** (Registrierung selbst bleibt kostenlos/unverbindlich; Vertrag bei Aktivierung).
- Schüler unter 16: **Eltern-Freigabe per E-Mail-Link**; bis dahin eingeschränktes Konto (keine Unternehmenskontakte).
- Preise Unternehmen: **Pilotphase kostenlos**, Preise danach anhand Feedback.
- Zahlung: **Stripe** (Billing, SEPA, Rechnung); Auszahlung an Fördervereine per Gutschrift.

## Offene Entscheidungen für Marcus
- [ ] Impressumsangaben ausfüllen, Datenschutzerklärung finalisieren (nach Legal-Vorprüfung, mit Anwalt)
- [ ] Supabase-Projekt-URL + Anon-Key für `js/supabase-config.js`
- [ ] Postfach hallo@edufy.world einrichten
- [ ] Dauer der kostenlosen Pilotphase und Zahl der Pilotunternehmen

## Backlog
- [ ] S-001 | S | P1 | Bestandsaufnahme Schüler-Wizard und Bibliotheken gegen Supabase-Schema — Akzeptanz: Liste funktionierender/defekter Schritte — Quelle: Marcus
- [ ] F-002 | F | P1 | Einladungslink/QR-Code für Schüler im Förderverein-Dashboard — Quelle: Marcus
- [ ] U-001 | U | P1 | Unternehmens-Registrierung + Firmenprofil (inkl. Supabase-Schema `companies` mit RLS) — Quelle: Marcus
- [ ] U-002 | U | P2 | Angebot anlegen (Praktikum/Ausbildung) und Sichtbarkeit für Schüler einer Schule — Quelle: Marcus
- [ ] G-001 | G | P1 | Gemeinsame Navigation mit Rollen-Login (Schüler/Förderverein/Unternehmen) — Quelle: Marcus

- [ ] G-003 | G | P1 | Landingpage-Texte überarbeiten: Rechtschreibung/Typografie, Pitch-Deck-Ton raus, einheitliche CTAs/Begriffe, „Sechs Zielgruppen“ vs. 4 Karten — Quelle: Lektorats-Audit 2026-11-25 (blockiert durch Marcus-Entscheidungen zu Werbeaussagen)
- [ ] G-004 | G | P2 | SEO: JSON-LD, robots.txt, sitemap.xml, og-image.jpg, Title/Description mit Suchbegriffen — Quelle: SEO-Audit 2026-11-25
- [ ] G-005 | G | P2 | Datenschutz Warteliste: Double-Opt-In und Abmeldeweg — Quelle: SEO-Audit 2026-11-25
- [ ] G-006 | G | P1 | supabase-js lokal ausliefern statt über jsDelivr-CDN (IP-Übertragung an Dritte, wie Google Fonts) — Quelle: Bericht edufy-dev-landing 2026-11-25
- [ ] F-003 | F | P1 | Mehrere Ansprechpersonen pro Förderverein (Einladung in bestehenden Verein statt Fehlermeldung bei zweiter Registrierung) — Quelle: Bericht edufy-dev-foerderverein 2026-11-25
- [ ] F-004 | F | P2 | Aufräumen unbestätigter/verwaister Konten und Metadaten (Edge-/Cron-Function mit Service-Role, Frist laut Datenschutz) — Quelle: Bericht F-001b
- [ ] F-005 | F | P2 | Schulauswahl über amtliche Schulnummer statt Freitext (robuste Dublettenerkennung) + Rate-Limit für check_school_registered — Quelle: Bericht F-001b
- [ ] L-001 | G | P0 | Rechtliche Vorprüfung Landingpage (Werbeaussagen, Statistiken, Förderbeträge, Marken, Schulrecht), Datenschutz-Entwurf, Förderverein-Seiten — Owner: edufy-legal → docs/legal/
- [ ] T-001 | G | P0 | Steuerliche Vorprüfung Fördervereinsmodell (30 % Beteiligung, Sponsoring, wirtschaftl. Geschäftsbetrieb, USt, Gutschriften) inkl. Fragenkatalog Steuerberater — Owner: edufy-steuer → docs/steuer/
- [ ] G-007 | G | P1 | Rebranding Landingpage, Impressum, Datenschutz auf „Edufy“, Kontakt hallo@edufy.world; Prozentsatz der Beteiligung von der Landingpage entfernen; Preis-Tiers durch „Pilotphase kostenlos“ ersetzen — blockiert durch L-001 (gemeinsam mit G-003 umsetzen)
- [ ] F-006 | F | P1 | Formale Zustimmung der Schulleitung (Einladungslink an Schulleitung, Status „wartet auf Schulleitung“, Verein erst danach aktiv) — Quelle: Entscheidung Marcus
- [ ] F-007 | F | P1 | Förderverein-Jahresvertrag bei Aktivierung (Vertragstext von edufy-legal, Annahme im Dashboard, Laufzeit/Kündigung im Schema) — blockiert durch L-001/T-001
- [ ] S-002 | S | P1 | Eltern-Freigabe für Schüler unter 16 per E-Mail-Link, eingeschränktes Konto bis zur Freigabe — Quelle: Entscheidung Marcus
- [ ] U-003 | U | P2 | Stripe-Integration (Billing/SEPA/Rechnung) nach Pilotphase, Gutschriften an Fördervereine — Quelle: Entscheidung Marcus

## Erledigt
- [x] F-001 | F | P0 | Förderverein-Onboarding Ende-zu-Ende lauffähig inkl. Bestätigungsseite — Akzeptanz: Registrierung legt Profil in Supabase an, Nutzer sieht nächste Schritte — Quelle: Marcus — Owner: edufy-dev-foerderverein (+ Freigabe `js/supabase-config.js`, `js/supabase-client.js`) — erledigt 2026-11-25 (live ungetestet: Supabase noch nicht konfiguriert)
- [x] F-001b | F | P1 | Nachbesserung F-001 aus Testrunde: Bestätigungsseite im Fehlerfall konsistent, Dubletten-Prüfung schon in Schritt 1 (unscharf), Metadaten bei Fehler aufräumen, Erneut-senden/Anmelden geräteübergreifend, Passwort vergessen, Datenschutz Abschnitt Registrierung (Entwurf) — Quelle: feedback/foerderverein/2026-11-25-onboarding.md — Owner: edufy-dev-foerderverein (+ Freigabe Abschnitt Förderverein-Registrierung in `datenschutz.html`) — erledigt 2026-11-25 (live ungetestet: Supabase noch nicht konfiguriert)
- [x] G-002 | G | P0 | Landingpage: Wartelisten-Formular funktionsfähig, Impressum/Datenschutz-Seiten (Gerüst), mobile Navigation, Kontraste/Labels/Fokus (WCAG AA), Google Fonts lokal statt Google-Server, reduced-motion, SEO-Basis (OG, Canonical, Favicon) — Akzeptanz: keine leeren `href="#"`-Pflichtlinks, Formular speichert in Supabase-Tabelle `waitlist` (RLS: nur insert für anon), validate.sh grün, kein Request an Google beim Laden — Quelle: Audits 2026-11-25 — Owner: edufy-dev-landing (Sprint-Freigabe für `index.html`, `impressum.html`, `datenschutz.html`, `fonts/`, `sql/landing_waitlist.sql`) — erledigt 2026-11-25 (live ungetestet: Supabase noch nicht konfiguriert)
