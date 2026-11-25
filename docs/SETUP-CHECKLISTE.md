# Setup-Checkliste für Marcus

Stand: 2026-11-25. Rahmen laut Entscheidung: **bis zur GmbH-Gründung nur interne Tests**, also keine echten Nutzer,
keine echten personenbezogenen Daten Dritter und kein öffentlicher Livegang unter edufy.world.
Abhaken mit `[x]`.

---

## Phase A – Interner Test (jetzt)

### A1. Supabase-Testprojekt
- [ ] Unter supabase.com ein **neues Projekt** anlegen, Name z. B. `edufy-test`, **Region: Frankfurt (eu-central-1)**.
- [ ] Ein starkes Datenbank-Passwort im Passwortmanager ablegen. Es kommt nie ins Repo.
- [ ] **SQL Editor → New query**: den Inhalt von `supabase_schulen_foerdervereine.sql` einfügen und ausführen.
  - Das Skript lässt sich mehrfach ausführen.
  - Erscheint ein NOTICE zu `schools_key_plz_uniq`, ähnliche Testschulen löschen und das Skript noch einmal ausführen.
- [ ] Danach `sql/landing_waitlist.sql` ausführen.
- [ ] **Table Editor**: Bei allen Tabellen (`schools`, `foerdervereine`, `foerderverein_profiles`, `provisions`,
      `waitlist`) muss „RLS enabled“ angezeigt werden.
- [ ] **Project Settings → API**: die Project URL und den `anon`-Key (öffentlich) in `js/supabase-config.js` eintragen.
      Den `service_role`-Key **niemals** eintragen.

### A2. Supabase-Auth-Einstellungen
- [ ] **Authentication → Providers → Email**: „Confirm email“ **an**.
- [ ] **Authentication → Policies/Passwords**: Mindestlänge des Passworts **8**.
- [ ] **Authentication → URL Configuration**:
  - Site URL für den lokalen Test: `http://localhost:8080`
  - Redirect URLs: `http://localhost:8080/**`. Für eine spätere Vercel-Preview `https://*.vercel.app/**` ergänzen.
- [ ] **Authentication → Email Templates**: „Confirm signup“ und „Reset password“ auf Deutsch umstellen.
      Für den internen Test reicht der eingebaute Mailversand. Er schafft nur wenige Mails pro Stunde, das genügt.

### A3. Lokal starten und testen
- [ ] Im Repo-Ordner `python3 -m http.server 8080` starten und `http://localhost:8080` öffnen.
- [ ] Mit eigenen Test-E-Mail-Adressen durchspielen (z. B. `marcus+petra@…`, `marcus+thomas@…`):
  - [ ] Warteliste: Eintrag pro Tab. Er erscheint in der Tabelle `waitlist`. Ein zweiter Eintrag mit derselben Adresse
        zeigt „bereits eingetragen“.
  - [ ] Förderverein-Registrierung komplett, dann die Bestätigungsmail anklicken. Danach müssen Schule, Verein und
        Profil in den Tabellen stehen.
  - [ ] Zweite Registrierung für dieselbe Schule mit anderer Schreibweise. Sie wird nach Schritt 1 blockiert.
  - [ ] „Bestätigungs-E-Mail erneut senden“ und „Passwort vergessen“ ausprobieren, auch auf dem Handy.
- [ ] Gefundene Fehler an den PM melden. Er trägt sie ins Backlog ein.

### A4. Optional: Vercel-Preview für den internen Test
Nur wenn du auf echten Geräten testen willst. Die Preview bleibt passwortgeschützt und nur für das eigene Team sichtbar.
- [ ] Vercel → Projekt mit dem GitHub-Repo verbinden und als Branch `claude/friendly-hamilton-rqw23h` wählen.
      Die Domain edufy.world **nicht** verbinden.
- [ ] **Settings → Deployment Protection**: „Vercel Authentication“ bzw. Passwortschutz für Previews **an**.
- [ ] Die Preview-URL in Supabase unter Redirect URLs eintragen (siehe A2).

### A5. Berater beauftragen (parallel zu A1 bis A4)
- [ ] Anwalt: `docs/legal/2026-11-25-anwalts-briefing.md` an eine Kanzlei für Schul-, Datenschutz- und Wettbewerbsrecht
      senden und eine Kostenschätzung anfordern.
- [ ] Steuerberater: `docs/steuer/2026-11-25-steuerberater-briefing.md` senden, am besten an jemanden mit
      Gemeinnützigkeits-Erfahrung.
- [ ] Interne Person als Datenschutzbeauftragte/n auswählen (nicht die Geschäftsführung) und für eine
      Fachkunde-Schulung anmelden.

---

## Phase B – Vor dem öffentlichen Start (nach GmbH-Gründung)

### B1. Gesellschaft und Pflichtangaben
- [ ] GmbH gründen, Handelsregister-Eintrag und USt-IdNr. beantragen.
- [ ] `impressum.html` ausfüllen: alle `[BITTE AUSFÜLLEN]`-Stellen.
- [ ] `datenschutz.html` mit dem Anwalt finalisieren: Platzhalter füllen, DSB eintragen, Region und AV-Verträge nennen.
- [ ] Bei beiden Seiten das Entwurfs-Banner und `noindex` entfernen.

### B2. Verträge mit Dienstleistern
- [ ] **Supabase**: DPA (Data Processing Addendum) im Dashboard unter Organization → Legal abschließen.
      Die Region bleibt EU.
- [ ] **Vercel**: DPA abschließen (Team Settings → Legal/Compliance). Bei Bedarf einen Plan mit EU-Datenregion wählen.
- [ ] **E-Mail-Versand**: einen eigenen SMTP-Anbieter mit Sitz in der EU wählen, AV-Vertrag abschließen und den Anbieter
      in Supabase unter Auth → SMTP eintragen.
- [ ] Verzeichnis der Verarbeitungstätigkeiten (Art. 30 DSGVO) anlegen; der DSB unterstützt dabei.
- [ ] Die Datenschutz-Folgenabschätzung für Schülerdaten erstellen, bevor das Schülermodul startet.

### B3. Produktiv-Infrastruktur
- [ ] Ein **neues** Supabase-Projekt `edufy-prod` (EU) anlegen und das Testprojekt nicht weiterverwenden. Die SQL-Dateien
      neu ausführen und A2 mit `https://edufy.world` wiederholen.
- [ ] Postfach **hallo@edufy.world** einrichten und testen. Es ist der Widerrufs- und Löschweg auf allen Seiten.
- [ ] Die Zahlen in `docs/ZAHLEN-PRUEFEN.md` an amtlichen Quellen prüfen und dokumentieren.
- [ ] Double-Opt-In für die Warteliste umsetzen (Backlog G-005), bevor die erste Mail an die Warteliste rausgeht.
- [ ] Pull Request `claude/friendly-hamilton-rqw23h` → `main` mergen und in Vercel die Domain edufy.world verbinden.
- [ ] Nach dem Deploy je einen echten Testeintrag in der Warteliste und in der Förderverein-Registrierung machen.

### B4. Vor dem ersten aktiven Förderverein
- [ ] Antworten des Anwalts zu Strafrecht (§ 331 StGB) und Schulrecht der Länder liegen vor.
- [ ] Infoschreiben für die Schulleitung, Pilotvereinbarung und Jahresvereinbarung sind fertig und vom Anwalt geprüft.
- [ ] Hinweisblatt Steuern liegt vor, vom Steuerberater geprüft.
