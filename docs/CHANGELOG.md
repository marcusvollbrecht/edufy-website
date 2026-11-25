# Changelog

Format: `JJJJ-MM-TT | Bereich | Aufgaben-ID | Kurzbeschreibung | Dateien | SQL einspielen? (ja/nein)`

2026-11-25 | F | F-001 | Förderverein-Onboarding: Schema (schools, foerdervereine, foerderverein_profiles, provisions; RLS + RPC register_foerderverein), 4-Schritte-Registrierungs-Wizard, Bestätigungsseite mit nächsten Schritten und Nachholen der Registrierung nach E-Mail-Bestätigung | supabase_schulen_foerdervereine.sql, registrierung-foerderverein.html, foerderverein-bestaetigung.html | ja
2026-11-25 | G | G-002 | Landingpage launchfähig: Warteliste als echte Formulare mit Supabase-Insert (Tabelle waitlist, RLS nur insert), Impressum/Datenschutz-Gerüste, Fonts lokal statt Google, mobile Navigation, Kontraste/Fokus/ARIA-Tabs/Skip-Link, reduced-motion, SEO-Basis (canonical, OG, Favicon) | index.html, impressum.html, datenschutz.html, favicon.svg, fonts/*, sql/landing_waitlist.sql | SQL einspielen? ja (sql/landing_waitlist.sql)
