# L-002 – Review der Umsetzung Sprint 2 (G-007/G-003, F-008)

> **Vorprüfung durch KI – keine Rechtsberatung, Bestätigung durch Rechtsanwalt erforderlich.**
> Erstellt von edufy-legal am 2026-11-25. Das ist keine Rechtsdienstleistung im Sinne des RDG, sondern eine strukturierte Vorarbeit für die anwaltliche Prüfung.
> Geprüfter Stand: Arbeitsverzeichnis vom 2026-11-25 nach den CHANGELOG-Einträgen G-006, F-008, G-007 + G-003. Geprüft wurden `index.html`, `impressum.html`, `datenschutz.html`, `registrierung-foerderverein.html`, `foerderverein-bestaetigung.html` und `supabase_schulen_foerdervereine.sql` (nur Datenschutzspalten und RPC). Grundlage sind die Vorprüfung `docs/legal/2026-11-25-vorpruefung-landingpage-und-onboarding.md` (im Folgenden „L-001“), `docs/steuer/2026-11-25-vorpruefung-foerdervereinsmodell.md` („T-001“) und `feedback/foerderverein/2026-11-25-onboarding-runde2.md` („Testrunde 2“).
> Zeilenangaben beziehen sich auf den geprüften Stand.

---

## 1. Kurzfazit

1. **Die Ersetzungstexte sind fast vollständig und überwiegend wörtlich umgesetzt.** Die schweren Befunde H1–H12 aus L-001 sind auf der Website beseitigt: kein Prozentsatz, keine Werbeflächen, keine „Spendennennung“, kein „Rechtssicher“, keine Preis-Tiers, kein SAP, keine Altmarke. Eine Suche über alle HTML-Dateien nach diesen Begriffen ergab keinen Treffer. Externe Requests gibt es nicht mehr, außer `canonical`-Links (die lösen keinen Abruf aus).
2. **Die vier dokumentierten Abweichungen sind vertretbar**, zwei davon nur unter Bedingungen (Abschnitt 3).
3. **Neu gefunden habe ich vier Korrekturen, die vor dem Livegang nötig sind:**
   - (a) **Die Verdienst-Fußnote ist sachlich falsch.** Die Destatis-Werte gelten für **Vollzeitbeschäftigte**, nicht für „alle Beschäftigten“. Diese Ungenauigkeit stammt aus meinem eigenen E-12, das als „zu prüfen“ markiert war.
   - (b) **Die Kopiervorlage für den Vorstand ist zu absolut** („keine Daten einzelner Schülerinnen und Schüler“). Auch das geht auf meinen eigenen E-F3 zurück.
   - (c) **Im Schulleitungs-Schritt fehlen** die Transparenz über die Geldbeteiligung (wichtig für §§ 331 ff. StGB, H15) und der Hinweis auf Landesgremien (M14).
   - (d) **Ein Steuerhinweis für den Verein fehlt.**
4. **Der Wechsel von der Checkbox zum Hinweis ist tragfähig.** Für die freiwilligen Angaben empfehle ich **Art. 6 Abs. 1 lit. f DSGVO ohne Checkbox** (Abschnitt 5).
5. **Freigabe je Seite:**
   - `index.html`: **bedingt ja**, nach K-1.
   - `registrierung-foerderverein.html`: **ja**, K-4 wird empfohlen.
   - `foerderverein-bestaetigung.html`: **bedingt ja**, nach K-2 und K-3.
   - `datenschutz.html`: **nein**, wegen Platzhaltern und K-5 bis K-8.
   - `impressum.html`: **nein**, die Pflichtangaben fehlen.

   Livegang insgesamt: **nein, solange Impressum, Datenschutzerklärung, AV-Verträge und das Postfach hallo@edufy.world fehlen** (Abschnitt 7).

---

## 2. Umsetzungstabelle (ID → Status)

Legende: **umgesetzt** = wörtlich oder sinngleich · **abweichend** = bewusst anders, siehe Abschnitt 3 · **Korrektur** = umgesetzt, aber nachzubessern (Abschnitt 4) · **fehlt**

### 2.1 Landingpage `index.html`

| ID | Fundstelle | Status | Anmerkung |
|---|---|---|---|
| E-1 Badge | 447 | **abweichend** | „Im Aufbau – Pilotstart in Vorbereitung“ statt „[Monat/Jahr]“, siehe 3.1 |
| E-1 H1/Sub | 448, 449; Meta 8, 20, 27 | umgesetzt | Meta-Descriptions ebenfalls mit „Geplant:“, gut |
| E-2 | 455–461 | umgesetzt | Kommentar Z. 454 vor Livegang entfernen (K-13) |
| E-3 | 464, 483, 487, 500 | umgesetzt | Das Mockup zeigt weiter „Fit-Score 68 %“ (478, 495) und „Klasse 9b“ (472). Mit der Bildunterschrift Z. 500 vertretbar, siehe 4.3 N-3 |
| E-4 | 517, 523, 529, 537, 542–543 | umgesetzt | Neue Überschriften (509, 516, 522, 528, 536) sind unkritisch |
| E-5 | 709, 710 | umgesetzt | |
| E-6 | 553, 554 | umgesetzt | |
| E-7 | 610, 613, 616, 619, 621 | umgesetzt | 614, 617, 618 nicht einzeln „geplant“, aber die Abschnittsüberschrift Z. 609 „plant“ und der Hinweis Z. 601 decken das ab |
| E-8 | 571–578, 582–588, 592 | umgesetzt / **abweichend** | Zusatz „(nach der kostenlosen Pilotphase)“ Z. 584, siehe 3.4. Provision gestrichen |
| E-9 | 684–700 | umgesetzt | Neue Schritte 688/690/698 sind unkritisch |
| E-10 | 701 | umgesetzt | |
| E-11 | 630, 631 | **Korrektur** | „Beschäftigte“ → „Vollzeitbeschäftigte“ (K-1) |
| E-12 | 641, 649–651, 660–661, 669, 676 | **Korrektur** | Fußnote 676 nennt „aller Beschäftigten“, richtig ist Vollzeit (K-1). ★ entfernt, gut |
| E-13 | 714–719, 721 | umgesetzt / **abweichend** | Karten wörtlich. „Stand: November 2026“ statt Datum, siehe 3.3 |
| E-14 | 729, 730, 733–748 | umgesetzt / **abweichend** | Pilot-Block ohne Zahl/Datum (Z. 738), siehe 3.2. CTA Z. 746 ergänzt, unkritisch |
| E-15 | 749–752 | umgesetzt | wörtlich. Optional K-10 |
| E-16 | 758, 760, 873, 875 | umgesetzt | Z. 758 nutzt die Alternative „Jetzt für den Pilot vormerken“, damit ist M9 erledigt |
| E-17 | 797, 829, 863, 852, 856, 858–859 | umgesetzt | |
| E-18 | 7, 19, 26, 885, 913 | umgesetzt | |

### 2.2 `datenschutz.html` und `impressum.html`

| ID | Fundstelle | Status | Anmerkung |
|---|---|---|---|
| E-DS-1 | datenschutz 117–119 | umgesetzt (angepasst) | Weil G-006 erledigt ist, wurde der jsDelivr-Absatz richtig durch „lokal ausgeliefert“ ersetzt. Geprüft: keine externen `src`/`href` in HTML/CSS/JS |
| E-DS-2 | 108, 113 | umgesetzt | Anschrift, DPA und Log-Dauer sind Platzhalter |
| E-DS-3 | 155–159 | umgesetzt | Anschrift, Region und DPA sind Platzhalter |
| E-DS-4 | 172 | umgesetzt | |
| E-DS-5 | 180–184 | umgesetzt, **aber** | Der Absatz zu S-002 (Z. 183) beschreibt ein Verfahren, das es noch nicht gibt, siehe K-8 |
| E-DS-6 | 162–163 | umgesetzt | E-Mail-Anbieter ist ein Platzhalter |
| E-DS-7/8 | – | bewusst nicht | richtig so, erst mit U-003 bzw. dem Schüler-Modul |
| Nr. 6 (F-008) | 132–152 | umgesetzt | Die Rechtsgrundlage der freiwilligen Angaben ist offen (K-5) |
| Impressum Z. 87 | impressum 87 | umgesetzt | Alle übrigen Pflichtangaben sind Platzhalter (H13 weiterhin offen) |

### 2.3 Förderverein-Seiten

| ID | Fundstelle | Status | Anmerkung |
|---|---|---|---|
| E-F1 | registrierung 149, 150, 152 (+151 Pilot) | umgesetzt | Pilot-Satz aus L-001 4.1 ergänzt, gut. Optional K-9 |
| E-F2 | registrierung 353–356, 359 (+358) | umgesetzt | |
| E-F3 | bestätigung 152–153 | **Korrektur** | Satz zu Schülerdaten zu absolut (K-2), Fehler in meiner Vorlage |
| E-F4 | bestätigung 159, 391, 411 | umgesetzt | Neue Schritte 162–167, siehe K-3 und K-4 |
| E-F5 | registrierung 331; SQL 169–193, 607–611 | umgesetzt | Zeitstempel und Version siehe 5.3 |
| E-F6 | registrierung 328 | umgesetzt | |

---

## 3. Bewertung der dokumentierten Abweichungen

### 3.1 Badge ohne Datum (index.html:447) – **akzeptiert**
„Pilotstart in Vorbereitung“ ist besser als ein Monat, der nicht sicher ist. Ein konkretes Datum würde beim Publikum eine Erwartung wecken (§ 5 Abs. 1 S. 2 Nr. 1 UWG, Verfügbarkeit), und wenn es sich verschiebt, wird die Aussage unrichtig. **Bedingung:** Die Aussage muss stimmen, d. h. der Pilot wird tatsächlich vorbereitet. Risiko: niedrig.

### 3.2 Pilot-Block ohne Zahl und Datum (index.html:738) – **akzeptiert mit Bedingung**
- **Befristung ohne Datum:** Gegenüber Unternehmen (B2B) ist die Karte nur eine Aufforderung, ein Angebot abzugeben. Die geschäftliche Entscheidung fällt erst mit den Pilotbedingungen (L-001 4.8). Nach § 5a UWG ist die Pilotdauer an dieser Stelle nicht wesentlich, **wenn** sie in den Pilotbedingungen vor Vertragsschluss steht. Risiko: niedrig.
- **„für eine begrenzte Zahl von Pilotunternehmen“:** Das ist eine Knappheitsaussage. Sie ist nur zulässig, wenn intern wirklich eine Obergrenze festgelegt ist. Die Entscheidung ist laut Backlog offen („Dauer der kostenlosen Pilotphase und Zahl der Pilotunternehmen“). Ohne Obergrenze ist sie irreführend (§ 5 Abs. 1 UWG). Risiko: mittel, solange die Zahl nicht entschieden ist.
- **Ersetzungstext, falls keine Obergrenze festgelegt wird (K-11):**
  `befristet – Dauer und Bedingungen erhalten Sie mit der Pilotvereinbarung`

### 3.3 „Stand: November 2026“ (index.html:721) – **akzeptiert mit Bedingung**
Eine Monatsangabe genügt als Stand. **Bedingungen:**
- (a) Jeder Betrag ist im November 2026 tatsächlich an einer amtlichen Quelle geprüft und intern dokumentiert. Der HTML-Kommentar in Z. 712 sagt aber noch „vor Veröffentlichung prüfen“. Solange das gilt, behauptet der Stand eine Prüfung, die nicht stattgefunden hat.
- (b) Es gibt einen Wiedervorlagetermin, z. B. jeweils zum 1. Januar wegen Kindergeld und Pauschalen.

Meine Recherche heute:
- Kindergeld 259 € seit 01.01.2026: **bestätigt**, Treffer u. a. arbeitsagentur.de und bmbfsfj.bund.de. Die Seite selbst konnte ich nicht öffnen.
- Weiterbildungsstipendium bis 9.135 € in 3 Jahren, 10 % Eigenanteil: **bestätigt** über mehrere IHK-Seiten (Körperschaften öffentlichen Rechts). Bei SBB bzw. BMFTR ist es noch gegenzuprüfen.
- Deutschlandstipendium 300 €: unverändert plausibel, aber **zu prüfen**.

Risiko: niedrig, wenn die Bedingungen erfüllt sind.

### 3.4 E-8-Zusatz „(nach der kostenlosen Pilotphase)“ (index.html:584) – **akzeptiert, Präzisierung empfohlen**
Der Zusatz setzt L-001 4.1 um und vermeidet eine Irreführung durch Unterlassen (§ 5a UWG). Das ist ein Gewinn. Testrunde 2 zeigt aber, dass Leserinnen und Leser „kostenlose Pilotphase“ auf den Verein beziehen. Ich empfehle deshalb denselben Wortlaut wie auf den Förderverein-Seiten:
`… erzielt (nach der für Unternehmen kostenlosen Pilotphase)`
Das gilt entsprechend für Z. 751. Risiko: niedrig.

---

## 4. Neue Risiken und Widersprüche

### 4.1 Befunde nach Risiko

| # | Fundstelle | Problem | Norm | Risiko | Korrektur |
|---|---|---|---|---|---|
| R1 | index.html:631, 676 | Die Werte 5.405 € / 5.289 € / 7.019 € (Destatis, PM vom 25.03.2026) gelten laut Pressemitteilung für **Vollzeitbeschäftigte**. Text und Fußnote sagen „Beschäftigte“ bzw. „Durchschnitt aller Beschäftigten“. Damit ist die Quelle falsch zitiert, und die Fußnote erweckt den Eindruck, Teilzeit sei einbezogen. | § 5 Abs. 1 UWG; § 3 Abs. 4 UWG (Jugendliche) | **mittel** (Livegang-Bedingung, weil leicht zu beheben) | K-1 |
| R2 | foerderverein-bestaetigung.html:153 | „Unternehmen sehen dabei nur anonyme Statistiken, keine Daten einzelner Schülerinnen und Schüler.“ Das widerspricht der Entscheidung, `index.html:577, 701, 730` und `datenschutz.html:178`, wonach Unternehmen nach aktiver Kontaktaufnahme persönliche Angaben erhalten. Vorstände geben den Satz an Schulleitungen weiter. Fehler in meinem E-F3. | § 5 Abs. 1 UWG (sonstige Marktteilnehmer); Art. 5 Abs. 1 lit. a, Art. 12 DSGVO (Transparenz) | **mittel** | K-2 |
| R3 | foerderverein-bestaetigung.html:163 | Die Zustimmung der Schulleitung wird ohne Hinweis beschrieben, dass der Verein an Einnahmen beteiligt wird. Für die Strafbarkeitsfrage (Drittvorteil, §§ 331, 333 StGB; L-001 H15, 4.4) ist gerade die **Kenntnis und Genehmigung** der Beteiligung entscheidend. „Pflichten für die Schule entstehen dadurch nicht“ ist je nach Land unvollständig, weil z. B. in NRW nach § 99 SchulG Schulkonferenz und Schulträger mitwirken (M14, Wortlaut zu prüfen). | §§ 331 Abs. 3, 333 StGB; Landesschulgesetze; § 5a UWG | **mittel** | K-3 |
| R4 | registrierung-foerderverein.html:152; foerderverein-bestaetigung.html:153, 167 | Steuerliche Folgen für den gemeinnützigen Verein fehlen. Laut T-001 ist ein wirtschaftlicher Geschäftsbetrieb wahrscheinlich, ggf. mit USt. Für die Entscheidung des Vorstands ist das wesentlich. Edufy darf aber **keinen Steuerrat** geben (§§ 2, 5 StBerG, unbefugte Hilfeleistung in Steuersachen). Deshalb nur ein allgemeiner Hinweis mit Verweis auf Beratung. | § 5a UWG; StBerG | **mittel** | K-4 |
| R5 | datenschutz.html:148, 167 | Die Rechtsgrundlage der freiwilligen Angaben ist ein Platzhalter. In der Übersicht (Z. 167) stehen sie zudem unter „lit. a – Einwilligung“, obwohl es keine Einwilligung gibt. Das widerspricht sich (EDSA-Leitlinien 05/2020 Rn. 121–123). | Art. 6, 13 Abs. 1 lit. c DSGVO | **mittel** | K-5 |
| R6 | datenschutz.html:145 ↔ 203 | Nr. 6 verweist für das Anmelde-Token im lokalen Speicher auf Nr. 15. Nr. 15 sagt dazu nur „[BITTE PRÜFEN … sobald relevant]“, obwohl das mit der Anmeldung auf `foerderverein-bestaetigung.html` schon relevant ist. | Art. 13 DSGVO; § 25 Abs. 2 Nr. 2 TDDDG | **mittel** | K-6 |
| R7 | datenschutz.html:178 | „Empfänger … sind **ausschließlich** die … technischen Dienstleister“. Im nächsten Satz stehen Unternehmen als Empfänger bei Kontaktaufnahme. Künftig ist auch die Schulleitung Empfängerin (F-006: Zustimmungslink mit Vereinsdaten). Das widerspricht sich. | Art. 13 Abs. 1 lit. e DSGVO | **niedrig–mittel** | K-7 |
| R8 | datenschutz.html:182–183 | Der Absatz zum Eltern-Verfahren (S-002) steht mit internem Hinweis „Erst veröffentlichen, wenn umgesetzt“ im veröffentlichten Text. Damit wird eine Verarbeitung beschrieben, die es nicht gibt. | Art. 5 Abs. 1 lit. a, Art. 12 DSGVO | **mittel** (Livegang) | K-8 |
| R9 | registrierung-foerderverein.html:151, 358; foerderverein-bestaetigung.html:153, 167 | „Kostenlose Pilotphase für Unternehmen“ steht je Seite 2-mal. Laut Testrunde 2 wird das auf den Verein bezogen. Die Dauer fehlt. Ungeklärt ist außerdem, ob die 12-monatige Jahresvereinbarung schon in der Pilotphase ohne Vergütung läuft. Das ist für den Vorstand wesentlich (§ 5a UWG) und gemeinnützigkeitsrechtlich offen (T-001 Frage 6, § 55 Abs. 1 Nr. 3 AO). | § 5a UWG; § 307 BGB (später Vertrag) | **niedrig–mittel** | K-9; Frage A15 |
| R10 | index.html:738 | „begrenzte Zahl“ ohne festgelegte Obergrenze, siehe 3.2 | § 5 UWG | mittel (bedingt) | K-11 |
| R11 | index.html:750 | „Schulen & Fördervereine profitieren mit“ steht direkt im Preisbereich und kann so verstanden werden, dass die **Schule** Geld erhält. Das ist schul- und strafrechtlich heikel (R3). Die Jahresvereinbarung wird auf der Landingpage nicht erwähnt. | § 5 UWG; §§ 331 ff. StGB | niedrig | K-10 |
| R12 | registrierung-foerderverein.html, beide Seiten | Es steht nirgends, wie man die Registrierung vor der Jahresvereinbarung zurückzieht. Art. 17 DSGVO gilt ohnehin, aber der Weg sollte genannt werden. | Art. 12 Abs. 2, 17 DSGVO | niedrig | K-12 |
| R13 | index.html:454, 675, 712, 732 | HTML-Kommentare („vor Veröffentlichung prüfen“, „TODO Marcus“) sind im Quelltext öffentlich lesbar und dokumentieren ungeprüfte Zahlen. | (Beweis-/Reputationsrisiko) | niedrig | K-13 |
| R14 | datenschutz.html:149 | „Ohne die Pflichtangaben ist eine Registrierung nicht möglich. Die Angabe ist freiwillig …“ wirkt für Laien widersprüchlich (Testrunde 2). | Art. 12 Abs. 1, 13 Abs. 2 lit. e DSGVO | niedrig | K-5 |
| R15 | index.html:688; foerderverein-bestaetigung.html:171 | „Fördervereine laden ein“ / Einladungslink an Schüler und Eltern weitergeben. Sobald die Verteilung über Schulkanäle läuft (Elternbrief der Schule, Aushang, Unterricht), greift das Landesrecht zu Werbung an Schulen (L-001 4.3). Auf diesen Seiten ist das nicht falsch, es muss aber im Infoschreiben und in der Jahresvereinbarung geregelt werden. | Landesschulgesetze, z. B. Art. 84 BayEUG | niedrig (hier), mittel (F-002/F-006) | Abschnitt 7, P1 |

### 4.2 Abgleich der Begriffe über alle Seiten

| Begriff | Landingpage | Förderverein-Seiten | Datenschutzerklärung | Bewertung |
|---|---|---|---|---|
| Geldfluss an den Verein | „an den Einnahmen beteiligt“ | „an den Einnahmen beteiligt“, Pilot: „keine Vergütung“ | „Beteiligung des Vereins“ | Einheitlich. „Vergütung“ entspricht der Empfehlung aus T-001 6.1 Nr. 2, kein Handlungsbedarf |
| Vertrag | nicht erwähnt | „Jahresvereinbarung“ | „Jahresvereinbarung“ (Z. 147) | Einheitlich. Landingpage optional ergänzen (K-10) |
| Schulleitung | „Zustimmung der Schulleitung“ | „Zustimmung“ / „formal zustimmen“ | – | Einheitlich. Gremienhinweis fehlt überall (K-3) |
| Schülerdaten an Unternehmen | anonyme Statistiken + Daten nach Kontaktaufnahme, U16 Eltern | **„keine Daten einzelner“** | wie Landingpage | **Widerspruch → K-2** |
| Pilotphase | kostenlos für Unternehmen, befristet | kostenlos für Unternehmen, keine Vergütung für Verein | „Pilotbetrieb“ (Warteliste) | Einheitlich. Dauer fehlt überall (Entscheidung offen) |
| Rechtsgrundlage Registrierung | – | Hinweis, lit. b (Code-Kommentar) | lit. b + offen für freiwillige Angaben | Nach K-5 einheitlich |
| Altersgrenze | Warteliste ab 16 | – | Warteliste ab 16 | Einheitlich |

### 4.3 Niedrig, ohne Pflicht zur Änderung
- **N-1** `index.html:641, 651, 661`: Auf den Karten fehlt „brutto“. In Z. 631 steht es. Mit K-1 in die Fußnote aufnehmen.
- **N-2** `index.html:456`: „über 11 Mio.“ (2024/25, alle Schularten) neben „rund 32.800“ (2025/26, allgemeinbildend). Die Quellenzeile Z. 461 legt die unterschiedlichen Bezugsjahre offen. Das ist zulässig, die Zahlen sind aber weiterhin vor Livegang gegenzuprüfen (zu prüfen).
- **N-3** `index.html:472–478, 495`: Das Mockup zeigt einen Neuntklässler (typisch 14–15 Jahre) mit Fit-Score. Mit der Bildunterschrift Z. 500 ist das zulässig. Sobald der Fit-Score real kommt, sind E-DS-8, die DSFA und A7 (DSA) zu beachten.

---

## 5. Frage 3: Checkbox → Hinweis bei der Förderverein-Registrierung

### 5.1 Ist der Wechsel tragfähig? **Ja.**
- Für das Konto und die Kontaktaufnahme ist eine **Einwilligung weder nötig noch passend**. Eine Checkbox „einverstanden“ hätte eine Einwilligung vorgetäuscht, die bei einem Widerruf ins Leere läuft (L-001 M13). Die Pflicht nach Art. 13 DSGVO ist eine **Informationspflicht**: Sie ist erfüllt, wenn die Information bei der Erhebung leicht zugänglich ist. Der Hinweis in `registrierung-foerderverein.html:331` steht in Schritt 3 neben den personenbezogenen Feldern und verlinkt auf den passenden Anker. Das genügt.
- **Feinheit zur Rechtsgrundlage:** Vertragspartner der Jahresvereinbarung ist der **Verein**, nicht die Ansprechperson. Lit. b trägt die Verarbeitung, soweit die Person **selbst Nutzerin des Kontos** ist (Login, Konto). Soweit Daten der Ansprechperson für die Kommunikation mit dem Verein genutzt werden, ist **lit. f** die genauere Grundlage. Grund ist das berechtigte Interesse, mit den Vertretern eines künftigen Vertragspartners zu kommunizieren (ErwG 47). Ich empfehle, beides zu nennen (K-5).
- **Voraussetzung:** Die verlinkte Datenschutzerklärung muss vollständig sein. Eine Art.-13-Information mit Platzhaltern („Weitergabe: [BITTE AUSFÜLLEN]“) erfüllt die Pflicht nicht. Das ist jetzt der eigentliche Blocker (Testrunde 2, P0).
- Die Checkbox zur Vertretung (Z. 327) ist keine Einwilligung, sondern eine Tatsachenbestätigung. Sie kann bleiben.

### 5.2 Rechtsgrundlage der freiwilligen Angaben: **Empfehlung lit. f ohne Checkbox**
- **Registergericht und Vereinsregister-Nummer** sind Angaben zum eingetragenen Verein, also zu einer juristischen Person. Sie sind **keine personenbezogenen Daten** der Ansprechperson (Art. 4 Nr. 1 DSGVO), deshalb braucht es dafür keine Rechtsgrundlage nach Art. 6. Ich würde sie in der Datenschutzerklärung trotzdem nennen, das schadet nicht.
- **Telefonnummer:** Hier empfehle ich **Art. 6 Abs. 1 lit. f DSGVO**. Gründe:
  - (1) Das Feld ist klar als freiwillig gekennzeichnet und nennt den Zweck („Für Rückfragen und das persönliche Gespräch“, Z. 314). Die Verarbeitung bleibt damit im Rahmen der vernünftigen Erwartung (ErwG 47).
  - (2) Eine Einwilligung bräuchte eine **eigene, nicht vorangekreuzte Checkbox** mit Widerrufsmanagement und Nachweis (Art. 7 Abs. 1). Das kostet beim wichtigsten Go-to-Market-Kanal unnötig Reibung.
  - (3) Ein späterer Wechsel von lit. a auf lit. f ist nach EDSA-Leitlinien 05/2020 Rn. 121–123 nicht zulässig. Deshalb sollte man sich von Anfang an festlegen.
  - (4) Das Widerspruchsrecht (Art. 21) und die Löschung auf Wunsch sind ohnehin schon zugesagt (Z. 148).
- **Lit. a mit Checkbox** wäre nur nötig, wenn die Nummer über den genannten Zweck hinaus genutzt werden soll, z. B. für Werbeanrufe zu anderen Produkten.
- **UWG-Seitenblick:** Telefonanrufe bei „sonstigen Marktteilnehmern“ brauchen mindestens eine mutmaßliche Einwilligung (§ 7 Abs. 2 Nr. 1 UWG). Wer die Nummer mit dem genannten Zweck angibt, willigt in Anrufe zu **diesem** Gespräch ein, nicht in spätere Werbeanrufe. Intern sollte das so geregelt werden.

### 5.3 Technische Hinweise (für PM / edufy-dev-foerderverein, kein Code von mir)
- `datenschutzhinweis_am` wird in der RPC mit `now()` gesetzt (SQL 611). Weil die RPC erst **nach** der E-Mail-Bestätigung läuft, ist das der Zeitpunkt der Übernahme und nicht der Zeitpunkt des Absendens. Für eine reine Informationspflicht genügt das. Die Kommentare (SQL 19–20, 191–193) sollten aber genau sagen, was gespeichert wird. Optional: den Zeitpunkt des Absendens in den Metadaten mitgeben und eine **Textversion** speichern (z. B. `dsh-2026-11-25`), damit später nachweisbar ist, welcher Hinweis angezeigt wurde.
- Bei der Migration (SQL 181–186) wird für Altzeilen der alte Einwilligungszeitpunkt übernommen. Das ist unproblematisch, weil Supabase laut Backlog noch nicht live konfiguriert war und es keine echten Datensätze gibt (zu bestätigen).
- Optional, laut Testrunde 2 (P3): den Hinweis in Schritt 4 neben „Kostenlos registrieren“ wiederholen.

---

## 6. Ersetzungstexte (direkt übernehmbar)

### K-1 · Verdienste Vollzeit (index.html, Owner edufy-dev-landing) – **Livegang-Bedingung**
- Z. 631:
  `Vollzeitbeschäftigte mit Meister-, Techniker- oder Fachschulabschluss verdienten im April 2025 im Schnitt 5.405 € brutto im Monat – etwas mehr als mit Bachelorabschluss (5.289 €). Mit Masterabschluss waren es 7.019 €. (Statistisches Bundesamt, Verdiensterhebung April 2025; Durchschnittswerte ohne Sonderzahlungen – der eigene Verdienst hängt stark von Beruf, Branche und Region ab.)`
- Z. 676:
  `* Durchschnittlicher Bruttomonatsverdienst von Vollzeitbeschäftigten mit Meister-, Techniker- oder Fachschulabschluss, April 2025, ohne Sonderzahlungen. Quelle: Statistisches Bundesamt (Destatis), Pressemitteilung vom 25.03.2026. Einzelwerte für Fachwirt, Betriebswirt oder einzelne Handwerke weist diese Statistik nicht aus.`
- Den Kommentar in Z. 675 danach entfernen.

### K-2 · Schülerdaten in der Vorstandsvorlage (foerderverein-bestaetigung.html:153, Owner edufy-dev-foerderverein) – **Livegang-Bedingung** (PM-Punkt 1)
Den Satz „Unternehmen sehen dabei nur anonyme Statistiken, keine Daten einzelner Schülerinnen und Schüler.“ ersetzen durch:
`Unternehmen sehen nur anonyme Statistiken je Schule. Persönliche Angaben einzelner Schülerinnen und Schüler erhalten sie nur, wenn diese selbst Kontakt zu einem Unternehmen aufnehmen – bei unter 16-Jährigen nur mit Freigabe der Eltern.`
Empfohlen, dieselbe Aussage auch auf der Registrierungsseite als Punkt in der Trust-Liste (nach Z. 150):
`<li><span><strong>Schülerdaten:</strong> Unternehmen sehen nur anonyme Statistiken je Schule. Persönliche Angaben erhalten sie nur, wenn Schülerinnen und Schüler selbst Kontakt aufnehmen – unter 16 nur mit Freigabe der Eltern.</span></li>`

### K-3 · Schritt „Zustimmung der Schulleitung“ (foerderverein-bestaetigung.html:163) – **Livegang-Bedingung** (PM-Punkt 2)
Bewertung des Satzes „Pflichten für die Schule entstehen dadurch nicht“: **Für Pflichten gegenüber Edufy stimmt er, als Gesamtaussage ist er missverständlich.** Je nach Land muss die Schule selbst Verfahren einhalten, z. B. Gremienbeteiligung oder Genehmigung nach Sponsoring-Erlass. Außerdem fehlt der zentrale Transparenzpunkt Geldbeteiligung (§ 331 StGB). Ersetzen durch:
`Bevor Ihr Verein aktiv wird, muss Ihre Schulleitung formal zustimmen. Sie bestätigt damit, dass sie Edufy kennt, dass sie weiß, dass Ihr Verein an den Einnahmen von Edufy beteiligt wird, und dass sie einverstanden ist, dass Ihr Verein Edufy bekannt macht. Vertragliche Pflichten gegenüber Edufy übernimmt die Schule dadurch nicht. Je nach Bundesland müssen außerdem weitere Gremien zustimmen, zum Beispiel die Schulkonferenz oder der Schulträger – das klären wir vorab mit Ihnen. Für das Gespräch mit Ihrer Schulleitung stellen wir Ihnen ein Infoschreiben bereit – es kommt in Kürze.`
Entsprechend kurz in registrierung-foerderverein.html:152 und :355 ergänzen:
- Z. 152: `… braucht es die Zustimmung Ihrer Schulleitung (je nach Bundesland auch weiterer Gremien) und eine Jahresvereinbarung, die Ihr Vorstand abschließt. …`
- Z. 355: `Ihre Schulleitung bestätigt, dass sie einverstanden ist – je nach Bundesland zusammen mit weiteren Gremien. Den Link dafür bekommen Sie von uns.`

### K-4 · Steuerhinweis für den Verein (PM-Punkt 3; abgestimmt mit T-001 6.2) – **dringend empfohlen vor Livegang**
Grundsätze: keine eigene steuerliche Einordnung als Gewissheit, keine Beträge oder Freigrenzen nennen (das wäre Steuerrat, § 5 StBerG, und Stand bzw. Werte müssten gepflegt werden), klar „keine Spende“ (T-001 6.1 Nr. 2, 6.2), Verweis auf Steuerberatung.
- **registrierung-foerderverein.html**, neuer Punkt nach Z. 152:
  `<li><span><strong>Steuern:</strong> Die Beteiligung ist keine Spende, sondern eine Vergütung. Sie kann für Ihren Verein steuerliche Folgen haben, zum Beispiel bei der Körperschaft- oder Umsatzsteuer. Bitte klären Sie das vor der Jahresvereinbarung mit Ihrer Steuerberatung oder Ihrem Finanzamt. Ein Hinweisblatt dazu bekommen Sie von uns.</span></li>`
- **foerderverein-bestaetigung.html:167**, nach dem Pilot-Satz:
  `Die Beteiligung ist keine Spende, sondern eine Vergütung und kann für Ihren Verein steuerliche Folgen haben. Bitte stimmen Sie das vor dem Abschluss mit Ihrer Steuerberatung oder Ihrem Finanzamt ab.`
- **Vorstandsvorlage (Z. 153)**, nach „… eine Jahresvereinbarung beschließen.“:
  `Die Beteiligung ist keine Spende, sondern eine Vergütung; die steuerlichen Folgen für unseren Verein klären wir vorher mit unserer Steuerberatung.`
- Voraussetzung für „Ein Hinweisblatt dazu bekommen Sie von uns“: Das Hinweisblatt nach T-001 6.2 muss es geben. Wenn nicht, diesen Satz weglassen.

### K-5 · Datenschutz Nr. 6 und Nr. 9 (datenschutz.html:148, 149, 167, Owner edufy-dev-landing)
- Z. 148:
  `Rechtsgrundlage: Für Ihr Nutzerkonto Art. 6 Abs. 1 lit. b DSGVO (Nutzungsverhältnis und vorvertragliche Maßnahmen). Soweit wir Ihre Angaben als Ansprechperson für die Kommunikation mit Ihrem Verein nutzen (z. B. für das persönliche Gespräch und die Jahresvereinbarung), Art. 6 Abs. 1 lit. f DSGVO; unser berechtigtes Interesse ist die Abstimmung mit dem Verein als künftigem Vertragspartner. Ihre freiwillige Telefonnummer nutzen wir nur für Rückfragen und das persönliche Gespräch (Art. 6 Abs. 1 lit. f DSGVO). Vereinsregister-Nummer und Registergericht betreffen den Verein, nicht Ihre Person. Sie können der Verarbeitung auf Grundlage von lit. f jederzeit widersprechen und freiwillige Angaben per E-Mail an <a href="mailto:hallo@edufy.world">hallo@edufy.world</a> löschen lassen.`
- Z. 149:
  `Pflichtangaben: Sie sind gesetzlich nicht verpflichtet, uns diese Daten zu geben. Ohne die Pflichtangaben können wir Ihren Verein aber nicht registrieren.`
- Z. 167:
  `<li>Art. 6 Abs. 1 lit. a DSGVO – Einwilligung (Warteliste).</li>`
- Z. 170:
  `<li>Art. 6 Abs. 1 lit. f DSGVO – berechtigtes Interesse (Betrieb und Sicherheit der Website; Kommunikation mit Ansprechpersonen von Fördervereinen; freiwillige Telefonnummer).</li>`

### K-6 · Datenschutz Nr. 15 (datenschutz.html:203)
`Die Startseite setzt keine Cookies und nutzt keine Analyse- oder Werbedienste. Wenn Sie sich als Förderverein anmelden, speichert Ihr Browser ein Anmelde-Token von Supabase im lokalen Speicher („localStorage“), damit Sie angemeldet bleiben. Das ist für den von Ihnen gewünschten Dienst unbedingt erforderlich (§ 25 Abs. 2 Nr. 2 TDDDG); eine Einwilligung ist dafür nicht nötig. Das Token wird beim Abmelden gelöscht. [BITTE PRÜFEN: Gültigkeitsdauer laut Supabase-Einstellungen ergänzen]`

### K-7 · Datenschutz Nr. 11 (datenschutz.html:178)
Den ersten Satz ersetzen durch:
`Ihre Daten verarbeiten in unserem Auftrag die oben genannten technischen Dienstleister (Vercel, Supabase[BITTE PRÜFEN: ggf. E-Mail-Versanddienst]) als Auftragsverarbeiter. Andere Empfänger gibt es nur in den folgenden Fällen:`
Den Rest als Liste:
`<li>Unternehmen: nur anonyme Statistiken je Schule; persönliche Angaben einer Schülerin oder eines Schülers nur, wenn diese oder dieser selbst Kontakt aufnimmt – bei unter 16-Jährigen nur nach Freigabe der Eltern.</li>`
`<li>Schulleitung: Für die Zustimmung der Schulleitung übermitteln wir Name des Fördervereins und der Ansprechperson an die Schule [BITTE PRÜFEN: erst mit F-006 aufnehmen].</li>`
Beibehalten: „Wir verkaufen keine Daten.“

### K-8 · Datenschutz Nr. 12 (datenschutz.html:182–184) – **Livegang-Bedingung**
Z. 182–184 bis zum Start von S-002 **aus dem veröffentlichten Text entfernen** (in einer Entwurfsdatei aufbewahren). Wenn der Text sichtbar bleiben soll, dann so:
`Geplant für Schülerkonten (noch nicht verfügbar): …` und danach den Absatz aus Z. 183 unverändert.

### K-9 · Pilot-Sätze auf den Förderverein-Seiten (optional, empfohlen)
Den Satz nur einmal je Seite verwenden (registrierung Z. 151, bestätigung Z. 167), Z. 358 und die Wiederholung entfallen:
`Pilotphase: Unternehmen testen Edufy zunächst kostenlos[, voraussichtlich bis [Datum]]. In dieser Zeit gibt es noch keine Einnahmen und deshalb auch noch keine Auszahlung an Ihren Verein.`
Das Datum nur einsetzen, wenn Marcus es entschieden hat.

### K-10 · Landingpage Schulhinweis (index.html:750–751, 584; optional)
- Z. 750: `<strong><span aria-hidden="true">🏫</span> Fördervereine profitieren mit</strong>`
- Z. 751: `Der Förderverein der Schule wird an den Einnahmen beteiligt, die Edufy mit Unternehmen über diese Schule erzielt (nach der für Unternehmen kostenlosen Pilotphase). Voraussetzung sind die Zustimmung der Schulleitung und eine Jahresvereinbarung mit dem Förderverein. Die Einzelheiten besprechen wir persönlich.`
- Z. 584: `… erzielt (nach der für Unternehmen kostenlosen Pilotphase)`

### K-11 · Pilot-Block (index.html:738), nur wenn keine Obergrenze festgelegt wird
`befristet – Dauer und Bedingungen erhalten Sie mit der Pilotvereinbarung`

### K-12 · Rückzug der Registrierung (registrierung-foerderverein.html:359; foerderverein-bestaetigung.html:391/411)
Anhängen an „Verbindlich wird es erst mit der Jahresvereinbarung.“:
` Bis dahin genügt eine E-Mail an hallo@edufy.world, und wir löschen Ihre Registrierung.`

### K-13 · HTML-Kommentare (index.html:454, 675, 712, 732)
Nach der Prüfung bzw. Entscheidung entfernen. Für die interne Dokumentation reicht dieser Bericht oder ein Ticket.

---

## 7. Livegang-Checkliste (nach Priorität)

### P0 – blockiert den Livegang
1. **Impressum vollständig** (§ 5 DDG): Rechtsträger mit Rechtsform, ladungsfähige Anschrift, Vertretung, zweiter Kontaktweg, Register, USt-IdNr bzw. W-IdNr, Verantwortliche/r nach § 18 Abs. 2 MStV; VSBG-Satz klären. Entwurfskasten Z. 66–69 entfernen. *(Marcus, Rechtsträger)*
2. **Datenschutzerklärung ohne Platzhalter:**
   - Verantwortlicher, Stand-Datum, Aufsichtsbehörde
   - Anschriften von Vercel und Supabase, Supabase-Region, Logfile-Dauer
   - E-Mail-Anbieter bzw. Versanddienst
   - Löschfristen (Warteliste, unbestätigte Konten)
   - IP-Logs in Supabase Auth
   - Weitergabe an andere Nutzer (Entscheidung, ob Unternehmen den Vereinsnamen sehen)
   - K-5 bis K-8 umsetzen, Entwurfskasten entfernen
3. **AV-Verträge mit Vercel und Supabase** abgeschlossen und datiert, Supabase-Region in der EU, Eintrag im DPF für Vercel geprüft. **Verzeichnis der Verarbeitungstätigkeiten** angelegt (Art. 30).
4. **Postfach hallo@edufy.world funktioniert.** Es ist der zugesagte Kanal für Widerruf, Abmeldung und Löschung (index 797/829/863/875, DSE Nr. 5, 6). Ohne Postfach laufen diese Zusagen ins Leere (Art. 7 Abs. 3, 12 Abs. 2 DSGVO).
5. **K-1** (Vollzeit), **K-2** (Schülerdaten in der Vorlage), **K-3** (Schulleitung: Transparenz und Gremien).
6. **Zahlen gegen amtliche Quellen geprüft und dokumentiert:** Hero-Statistiken (Destatis, BIBB), Kindergeld (familienkasse/arbeitsagentur), Weiterbildungsstipendium (SBB/BMFTR), Deutschlandstipendium. Danach K-13.
7. **Aussagen müssen stimmen:** „Pilotstart in Vorbereitung“ und „begrenzte Zahl von Pilotunternehmen“ (sonst K-11).

### P1 – vor dem ersten aktiven Förderverein bzw. ersten Pilotunternehmen (kein Hindernis für das Freischalten der Website)
8. **K-4 Steuerhinweis** und **Hinweisblatt für Vereine** (T-001 6.2). Ich empfehle das schon zum Livegang (Testrunde 2: P1).
9. **Anwalt A1/A2** (§ 331 StGB, Schulrecht der Länder, Bayern/NRW), **bevor** eine Schulleitung zustimmt. Danach das **Infoschreiben für Schulleitungen** länderspezifisch fertigstellen (F-006), einschließlich der zulässigen Verteilwege für Einladungslinks (R15).
10. **Jahresvereinbarung (F-007)** nach L-001 4.7 mit Klärung, ob und wie die Laufzeit während der Pilotphase läuft (R9, A15). Steuerberater zu T-001 Frage 6.
11. **Pilotbedingungen Unternehmen** (L-001 4.8) mit Datum der Befristung, vor dem ersten Pilotvertrag.
12. **Double-Opt-In der Warteliste (G-005)** vor der **ersten** E-Mail an die Warteliste. Ohne DOI fehlt der Nachweis der Einwilligung (Art. 7 Abs. 1 DSGVO; § 7 Abs. 2 Nr. 2 UWG für werbliche E-Mails).
13. **Löschroutine unbestätigter Konten (F-004)** mit der in der DSE genannten Frist.
14. **Markenrecherche „Edufy“** (L-001 4.6, A11), mindestens eine Identitätsrecherche in DPMA/EUIPO vor größerem Marketing.
15. K-9, K-10, K-12 und die Hinweise aus 5.3.

### P2 – vor dem Start des Schüler- bzw. Unternehmensmoduls
16. DSFA (Art. 35), Benennung einer bzw. eines DSB (§ 38 BDSG, A6), kindgerechte Kurzfassung, E-DS-5 freischalten (S-002), E-DS-8 (Profiling), Mindestgröße der Statistiken (M18), DSA-Prüfung (A7), Rolle des Fördervereins (A8).
17. E-DS-7 (Stripe) mit U-003.

---

## 8. Offene Punkte (intern)
- Entscheidungen Marcus: Dauer der Pilotphase und Zahl der Pilotunternehmen. Daran hängen K-9 und K-11.
- Entscheidung Marcus: Sehen Unternehmen den Namen des Fördervereins bzw. der Schule? Das betrifft DSE Nr. 6 Z. 150 und die Pilotbedingungen.
- Läuft die 12-monatige Jahresvereinbarung schon in der Pilotphase? Empfehlung: Beginn mit Aktivierung, aber Sonderkündigungsrecht bis zur ersten Vergütung oder Laufzeitbeginn erst mit Pilotende. Abstimmung mit edufy-steuer.
- Hinweisblatt für Vereine (T-001 6.2) erstellen lassen. Owner edufy-steuer, Prüfung edufy-legal.
- Infoschreiben für Schulleitungen (F-006). Entwurf durch edufy-legal nach A1/A2.
- destatis.de war in dieser Sitzung nicht direkt abrufbar (DNS gesperrt). Die Bezugsgruppe „Vollzeitbeschäftigte“ stammt aus mehreren übereinstimmenden Suchtreffern auf die Destatis-PM vom 25.03.2026. Vor dem Livegang auf der Originalseite bestätigen.

---

## 9. Fragenkatalog für den Anwalt (Ergänzungen zu A1–A13 aus L-001)
- **A14 (DSGVO):** Tragen Art. 6 Abs. 1 lit. b (Konto) und lit. f (Kommunikation mit der Ansprechperson des Vereins, freiwillige Telefonnummer) die Förderverein-Registrierung ohne Einwilligung? Genügt der Hinweis in Schritt 3 des Formulars für Art. 13?
- **A15 (AGB/UWG):** Darf die Jahresvereinbarung schon in der kostenlosen Pilotphase für Unternehmen beginnen, in der der Verein nichts erhält? Wenn ja, welches Sonderkündigungsrecht ist nach § 307 BGB nötig, und welche Information muss vor dem Abschluss erfolgen (§ 5a UWG)?
- **A16 (Strafrecht/Schulrecht, Ergänzung zu A1):** Reicht der Zustimmungsinhalt aus K-3 (Kenntnis der Beteiligung, Einverständnis mit dem Bekanntmachen, Hinweis auf Gremien) als Transparenzgrundlage im Sinne des § 331 Abs. 3 StGB, oder braucht es eine ausdrückliche Genehmigung durch Schulträger bzw. Schulaufsicht?
- **A17 (StBerG):** Ist der allgemeine Steuerhinweis aus K-4 („keine Spende, sondern Vergütung; kann steuerliche Folgen haben; bitte mit Steuerberatung klären“) mit § 5 StBerG vereinbar? Darf ein Hinweisblatt nach T-001 6.2 Freigrenzen nennen, ohne unbefugte Hilfeleistung in Steuersachen zu sein?
- **A18 (UWG B2B):** Ist „befristet, für eine begrenzte Zahl von Pilotunternehmen“ ohne Datum und Zahl auf der Website zulässig, wenn die Pilotbedingungen beides vor Vertragsschluss nennen?

---

## 10. Quellen (Abruf 2026-11-25 über die Websuche; destatis.de, familienkasse/arbeitsagentur.de nicht direkt abrufbar)
- Destatis, Pressemitteilung vom 25.03.2026 „Verdienste in vielen Ausbildungsberufen im Handwerk unter dem Durchschnitt“ (Vollzeitbeschäftigte, April 2025: Meister/Techniker/Fachschule 5.405 €, Bachelor 5.289 €, Master 7.019 €, ohne Sonderzahlungen): https://www.destatis.de/DE/Presse/Pressemitteilungen/2026/03/PD26_103_62.html
- Statistik Nord, Bachelor-Wert Hamburg (Gegenprobe Methodik): https://www.statistik-nord.de/fileadmin/Dokumente/SI26_065.pdf
- Kindergeld 259 € seit 01.01.2026: https://www.arbeitsagentur.de/vor-ort/marburg/presse/2026-23-mehr-unterstutzung-fur-familien · https://www.bmbfsfj.bund.de/bmbfsfj/themen/familie/familienleistungen/kindergeld · https://familienportal.de/bmbfsfj/themen/familie/familienleistungen/kindergeld/
- Weiterbildungsstipendium bis 9.135 € / 3 Jahre, 10 % Eigenanteil: https://www.bmftr.bund.de/weiterbildungsstipendium (nicht abrufbar) · https://www.ihk.de/koeln/hauptnavigation/ausbildung/auszubildende/weiterbildungsstipendium-5167478 · https://www.ihk.de/nordschwarzwald/aus-und-weiterbildung/weiterbildung/begabtenfoerderung/begabtenfoerderung-2611054 · https://www.foerderdatenbank.de/FDB/Content/DE/Foerderprogramm/Bund/BMBF/begabtenfoerderung-berufliche-bildung.html
- Interne Grundlagen: L-001 (`docs/legal/2026-11-25-vorpruefung-landingpage-und-onboarding.md`), T-001 (`docs/steuer/2026-11-25-vorpruefung-foerdervereinsmodell.md`, Abschnitte 6.1–6.5), Testrunde 2 (`feedback/foerderverein/2026-11-25-onboarding-runde2.md`), `docs/CHANGELOG.md`, `docs/BACKLOG.md`.
- Normen: UWG §§ 3, 5, 5a, 7; DDG § 5; MStV § 18; DSGVO Art. 4 Nr. 1, 5, 6, 7, 12, 13, 17, 21, 30, 35; ErwG 47; EDSA-Leitlinien 05/2020 Rn. 121–123; BDSG § 38; TDDDG § 25; BGB §§ 26, 307; StGB §§ 331, 333; StBerG §§ 2, 5; AO § 55; SchulG NRW § 99; BayEUG Art. 84.
