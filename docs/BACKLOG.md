# Edufy Backlog

Format je Eintrag:
`- [ ] <ID> | <Bereich: S/F/U/G> | <Prio: P0–P3> | <Titel> — Akzeptanz: <…> — Quelle: <Marcus/feedback-Pfad>`

Bereiche: S = Schüler & Content, F = Förderverein, U = Unternehmen, G = Gemeinsam (PM entscheidet)

## Aktueller Sprint
Sprint 1 (2026-11-25) — Ziel: Förderverein-Onboarding Ende-zu-Ende + Landingpage launchfähig (technisch/a11y)
Status: abgeschlossen 2026-11-25 – siehe Erledigt.

Sprint 2 (2026-11-25) — Ziel: Website-Texte rechtlich entschärft und auf Edufy umgestellt, Förderverein-Seiten an Entscheidungen angepasst
- G-007 + G-003 → edufy-dev-landing (Freigabe: index.html, impressum.html, datenschutz.html)
- F-008 → edufy-dev-foerderverein (Freigabe: eigene Seiten + supabase_schulen_foerdervereine.sql)
- G-006 → PM (erledigt, Datenschutz-Absatz streicht edufy-dev-landing)
- danach: Review edufy-legal, Testrunde edufy-test-foerderverein
Status: abgeschlossen 2026-11-25. Website-Texte rechtlich vorgeprüft und umgesetzt; Livegang blockiert nur noch durch Punkte bei Marcus (Impressum, Datenschutz-Platzhalter, AV-Verträge, Postfach, Zahlenprüfung docs/ZAHLEN-PRUEFEN.md).

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
- [ ] Anwalt beauftragen: Vorprüfung docs/legal/2026-11-25-… bestätigen lassen (A1–A13), vorrangig A1 (§ 331 StGB Schulleitung/Förderverein) und A2 (zulässige Bundesländer, Bayern Art. 84 BayEUG, NRW § 99 SchulG)
- [ ] Rechtsträger und Sitz von Edufy festlegen (Voraussetzung Impressum, Verträge)
- [ ] Nachwirkung der Förderverein-Beteiligung nach Vertragsende
- [ ] Stimmt „Erste Pilotschulen registrieren sich gerade“? Sonst streichen
- [ ] Datenschutzbeauftragten benennen (DSFA für Daten Minderjähriger voraussichtlich Pflicht → § 38 BDSG)
- [ ] Auftragsverarbeitungsverträge mit Vercel und Supabase abschließen
- [ ] Anwalt: zusätzlich Fragen A14–A18 aus docs/legal/2026-11-25-review-sprint2.md
- [ ] Obergrenze Pilotunternehmen intern festlegen (sonst bleibt „begrenzte Zahl“ von der Website)
- [ ] Hinweisblatt Steuern für Fördervereine (nach Steuerberater)
- [ ] Steuerberater beauftragen: Vorprüfung docs/steuer/2026-11-25-vorpruefung-foerdervereinsmodell.md bestätigen lassen (20 Fragen)
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
- [ ] F-003 | F | P1 | Mehrere Ansprechpersonen pro Förderverein (Einladung in bestehenden Verein statt Fehlermeldung bei zweiter Registrierung) — Quelle: Bericht edufy-dev-foerderverein 2026-11-25
- [ ] F-004 | F | P2 | Aufräumen unbestätigter/verwaister Konten und Metadaten (Edge-/Cron-Function mit Service-Role, Frist laut Datenschutz) — Quelle: Bericht F-001b
- [ ] F-005 | F | P2 | Schulauswahl über amtliche Schulnummer statt Freitext (robuste Dublettenerkennung) + Rate-Limit für check_school_registered — Quelle: Bericht F-001b
- [ ] F-006 | F | P1 | Formale Zustimmung der Schulleitung (Einladungslink an Schulleitung, Status „wartet auf Schulleitung“, Verein erst danach aktiv) — Quelle: Entscheidung Marcus
- [ ] F-007 | F | P1 | Förderverein-Jahresvertrag bei Aktivierung (Vertragstext von edufy-legal, Annahme im Dashboard, Laufzeit/Kündigung im Schema) — blockiert durch L-001/T-001
- [ ] S-002 | S | P1 | Eltern-Freigabe für Schüler unter 16 per E-Mail-Link, eingeschränktes Konto bis zur Freigabe — Quelle: Entscheidung Marcus
- [ ] U-003 | U | P2 | Stripe-Integration (Billing/SEPA/Rechnung) nach Pilotphase, Gutschriften an Fördervereine — Quelle: Entscheidung Marcus



- [ ] F-009 | F | P3 | Trust-Liste: „Bankverbindung brauchen wir jetzt noch nicht“ — Quelle: feedback/foerderverein/2026-11-25-onboarding-runde2.md
- [ ] F-010 | F | P1 | Infoschreiben für die Schulleitung (länderspezifisch nach Anwaltsantwort A1/A2) — Quelle: Legal-Review Sprint 2

## Erledigt
- [x] F-001 | F | P0 | Förderverein-Onboarding Ende-zu-Ende lauffähig inkl. Bestätigungsseite — Akzeptanz: Registrierung legt Profil in Supabase an, Nutzer sieht nächste Schritte — Quelle: Marcus — Owner: edufy-dev-foerderverein (+ Freigabe `js/supabase-config.js`, `js/supabase-client.js`) — erledigt 2026-11-25 (live ungetestet: Supabase noch nicht konfiguriert)
- [x] F-001b | F | P1 | Nachbesserung F-001 aus Testrunde: Bestätigungsseite im Fehlerfall konsistent, Dubletten-Prüfung schon in Schritt 1 (unscharf), Metadaten bei Fehler aufräumen, Erneut-senden/Anmelden geräteübergreifend, Passwort vergessen, Datenschutz Abschnitt Registrierung (Entwurf) — Quelle: feedback/foerderverein/2026-11-25-onboarding.md — Owner: edufy-dev-foerderverein (+ Freigabe Abschnitt Förderverein-Registrierung in `datenschutz.html`) — erledigt 2026-11-25 (live ungetestet: Supabase noch nicht konfiguriert)
- [x] G-002 | G | P0 | Landingpage: Wartelisten-Formular funktionsfähig, Impressum/Datenschutz-Seiten (Gerüst), mobile Navigation, Kontraste/Labels/Fokus (WCAG AA), Google Fonts lokal statt Google-Server, reduced-motion, SEO-Basis (OG, Canonical, Favicon) — Akzeptanz: keine leeren `href="#"`-Pflichtlinks, Formular speichert in Supabase-Tabelle `waitlist` (RLS: nur insert für anon), validate.sh grün, kein Request an Google beim Laden — Quelle: Audits 2026-11-25 — Owner: edufy-dev-landing (Sprint-Freigabe für `index.html`, `impressum.html`, `datenschutz.html`, `fonts/`, `sql/landing_waitlist.sql`) — erledigt 2026-11-25 (live ungetestet: Supabase noch nicht konfiguriert)
- [x] G-006 | G | P1 | supabase-js lokal ausliefern statt über jsDelivr-CDN (IP-Übertragung an Dritte, wie Google Fonts) — Quelle: Bericht edufy-dev-landing 2026-11-25 — erledigt 2026-11-25 (js/vendor/supabase-js-2.45.4.js, kein externer Request mehr)
- [x] L-001 | G | P0 | Rechtliche Vorprüfung Landingpage (Werbeaussagen, Statistiken, Förderbeträge, Marken, Schulrecht), Datenschutz-Entwurf, Förderverein-Seiten — Owner: edufy-legal → docs/legal/2026-11-25-vorpruefung-landingpage-und-onboarding.md — Vorprüfung erledigt 2026-11-25; Ersetzungstexte E-1..E-18, E-F1..E-F6, E-DS-1..E-DS-8; Fragen A1–A13 an Anwalt
- [x] T-001 | G | P0 | Steuerliche Vorprüfung Fördervereinsmodell (30 % Beteiligung, Sponsoring, wirtschaftl. Geschäftsbetrieb, USt, Gutschriften) inkl. Fragenkatalog Steuerberater — Owner: edufy-steuer → docs/steuer/2026-11-25-vorpruefung-foerdervereinsmodell.md — Vorprüfung erledigt 2026-11-25; Ergebnis: wirtschaftl. Geschäftsbetrieb beim Verein wahrscheinlich, 19 % USt bzw. Kleinunternehmer, Gutschriften mit USt-Status; 20 Fragen an Steuerberater
- [x] G-007 | G | P0 | Rebranding Landingpage, Impressum, Datenschutz auf „Edufy“, Kontakt hallo@edufy.world; Prozentsatz der Beteiligung von der Landingpage entfernen; Preis-Tiers durch „Pilotphase kostenlos“ ersetzen — Ersetzungstexte aus docs/legal/2026-11-25-… (E-1..E-18, E-DS-1..8) und docs/steuer/2026-11-25-…; gemeinsam mit G-003 umsetzen
- [x] F-008 | F | P1 | Förderverein-Seiten nach Legal E-F1..E-F6: Jahresvertrag + Schulleitungszustimmung vor Absenden nennen, Datenschutz-Checkbox → Hinweis (Art. 6 Abs. 1 lit. b), Pilotphase ohne Vergütung, Kontakt hallo@edufy.world; RPC anpassen — Quelle: docs/legal/2026-11-25-…
- [x] K-001 | G | P0 | Korrekturen aus Legal-Review Sprint 2: K-1 (index Vollzeit/Fußnote, „begrenzte Zahl“ neutral, „nach der für Unternehmen kostenlosen Pilotphase“, TODO-Kommentare raus) + K-5..K-8 (Datenschutz: lit. f für freiwillige Angaben, localStorage-Token, Empfängerliste, Eltern-Verfahren als „geplant“) → edufy-dev-landing; K-2..K-4 (+K-12) (Förderverein-Seiten: Schülerdaten präzise, Schulleitungstext § 331, Steuerhinweis ohne Hinweisblatt-Satz) → edufy-dev-foerderverein — Quelle: docs/legal/2026-11-25-review-sprint2.md
