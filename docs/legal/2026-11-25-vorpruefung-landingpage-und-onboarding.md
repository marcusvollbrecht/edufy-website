# L-001 – Rechtliche Vorprüfung Landingpage, Rechtsseiten, Förderverein-Onboarding, Geschäftsmodell

> **Vorprüfung durch KI – keine Rechtsberatung, Bestätigung durch Rechtsanwalt erforderlich.**
> Erstellt von edufy-legal am 2026-11-25. Das ist keine Rechtsdienstleistung im Sinne des RDG, sondern eine strukturierte Vorarbeit, damit die Anwältin oder der Anwalt schneller prüfen kann.
> Geprüfter Stand: Commit `e17e152` (`index.html`, `datenschutz.html`, `impressum.html`, `registrierung-foerderverein.html`, `foerderverein-bestaetigung.html`). Zeilenangaben beziehen sich auf diesen Stand.

**Hinweise zur Methodik**
- **Lektorats-Befunde:** Das im Backlog (G-003) genannte Lektorats-Audit vom 2026-11-25 liegt nicht als Datei im Repo (nicht in `docs/`, `feedback/` und nicht in den Commit-Nachrichten). Ich habe deshalb alle Stellen selbst geprüft. Einbezogen ist das Test-Feedback `feedback/foerderverein/2026-11-25-onboarding.md`.
- **Recherche:** In dieser Sitzung waren amtliche Seiten nicht direkt abrufbar (arbeitsagentur.de, bmftr.bund.de, foerderdatenbank.de: DNS gesperrt). Die Werte stammen aus der Websuche, deren Treffer amtliche Seiten enthalten (destatis.de, bibb.de, gesetze-bayern.de, recht.nrw.de, bmbfsfj.bund.de). Jeder Wert hat einen Stand. Was ich nicht an einer amtlichen Quelle prüfen konnte, ist als **„zu prüfen“** markiert.
- **Zuständigkeit:** Code ändert edufy-legal nicht. Die Ersetzungstexte setzen edufy-dev-landing (G-003/G-007) bzw. edufy-dev-foerderverein um, jeweils nach Freigabe durch den PM.

---

## 1. Kurzfazit

1. **Die Landingpage ist in dieser Form nicht veröffentlichungsfähig.** Gemessen an UWG und DSGVO sind die schwersten Punkte:
   - (a) die unbelegte Aussage „Rechtssicher … in allen 16 Bundesländern möglich“, die das bayerische Schulrecht widerlegt;
   - (b) „Werbeflächen an Schulen“ als käufliche Leistung;
   - (c) „Öffentliche Spendennennung“ für eine Leistung mit Gegenleistung, also Sponsoring;
   - (d) ein irreführender Gehaltsvergleich: veraltete, nicht nachprüfbare Zahlen, und beim Pfad „Bachelor / Master“ fehlt der deutlich höhere Master-Wert;
   - (e) falsche bzw. veraltete Förderbeträge (Kindergeld, Begabtenförderung, BAB);
   - (f) Aussagen, die dem beschlossenen Datenmodell widersprechen („Plattform sammelt Daten → Unternehmen zahlen“, „Fit-Score gegen Schülerprofile“, „Frühzeitiger Kontakt“, „Direktkontakt Schüler“);
   - (g) Preis-Tiers und Provisionssätze (25–30 %, 10–15 %), die nach den Entscheidungen vom 2026-11-25 nicht mehr gelten;
   - (h) Funktionen, die als vorhanden dargestellt werden, obwohl es sie noch nicht gibt („Alles auf einer App“, „automatisch geprüft“);
   - (i) die fremde Marke „SAP“ im Mockup.
2. **Impressum und Datenschutzerklärung sind Gerüste.** Es fehlen Anbieter, Rechtsform und Anschrift, also die Pflichtangaben nach § 5 DDG. Die Drittland- und Auftragsverarbeitungsangaben (Vercel, Supabase, jsDelivr) sind offen. Das Verfahren für Minderjährige ist nicht beschrieben. Eine Datenschutz-Folgenabschätzung (DSFA) ist voraussichtlich nötig, und daraus folgt nach § 38 Abs. 1 S. 2 BDSG **unabhängig von der Mitarbeiterzahl die Pflicht, eine oder einen Datenschutzbeauftragten zu benennen**. Das ist bisher nirgends berücksichtigt.
3. **Förderverein-Seiten:** Die Formel „kostenlos und unverbindlich“ ist für die Registrierung vertretbar. Weil später ein Jahresvertrag folgt und die Schulleitung zustimmen muss, muss beides schon vor dem Absenden genannt werden (§ 5a UWG). Die Datenschutz-Checkbox mischt Einwilligung und Vertrag und sollte umgebaut werden.
4. **Geschäftsmodell:** Die größten Risiken sind:
   - (1) Das Schulrecht der Länder ist uneinheitlich, Bayern ist besonders restriktiv (Art. 84 BayEUG). In NRW reicht die Zustimmung der Schulleitung nach § 99 SchulG voraussichtlich nicht aus.
   - (2) **Strafrecht:** Die Schulleitung stimmt als Amtsträgerin bzw. Amtsträger zu, und der Förderverein erhält Geld. Das ist eine mögliche „Drittvorteils“-Konstellation (§§ 331, 333 StGB) und muss anwaltlich geprüft werden.
   - (3) Die Eltern-Freigabe per E-Mail ist als Basis vertretbar, sollte wegen des Kontakts Minderjähriger zu Unternehmen aber durch zusätzliche Maßnahmen gestützt werden.
   - (4) Bei 16- und 17-Jährigen stellt sich zusätzlich die Frage der Geschäftsfähigkeit (§§ 107 ff. BGB), wenn das Konto auf Art. 6 Abs. 1 lit. b DSGVO gestützt wird.
   - (5) Für die exakte Wortmarke „Edufy“ habe ich keinen Treffer gefunden. Es gibt aber eine gleichnamige Lern-App im App Store und eine US-Anmeldung „EDUFYI“. Eine professionelle Identitäts- und Ähnlichkeitsrecherche ist vor der Markenanmeldung Pflicht.

---

## 2. Befunde nach Risiko (Tabelle)

Risikostufen: **hoch** = abmahnfähig bzw. bußgeld- oder strafrechtlich relevant oder Entscheidung widersprochen; **mittel** = wahrscheinlich angreifbar oder unvollständig; **niedrig** = Stil- oder Vorsorgepunkt.

### 2.1 Hoch

| # | Fundstelle | Aussage / Problem | Norm | Empfehlung |
|---|---|---|---|---|
| H1 | index.html:750–751 | „Schulen & Fördervereine erhalten 25–30 % … Rechtssicher über den Schulförderverein abgewickelt · in allen 16 Bundesländern möglich“. Die Rechtssicherheit ist unbelegt. Bayern untersagt Werbung, Vertrieb und Geschäftsabschlüsse in der Schule grundsätzlich (Art. 84 BayEUG), Sachsen erklärt Werbung grundsätzlich für nicht gestattet (VwV 2024). Der Prozentsatz widerspricht außerdem der Entscheidung „kein Prozentsatz“. | § 5 Abs. 1, Abs. 2 Nr. 1 UWG; Entscheidung 2026-11-25 | Komplett ersetzen (E-15) |
| H2 | index.html:563, 733 | „Werbeflächen an Partnerschulen (physisch + digital)“ / „Werbeflächen an Schulen“. Über Flächen der Schule verfügen weder Edufy noch der Förderverein, sondern Schulträger und Schulleitung nach Landesrecht. In Bayern ist das grundsätzlich unzulässig, in NRW nur Sponsoring-Hinweise mit Zustimmung der Gremien. Das Versprechen ist irreführend über Eigenschaften und Rechte des Anbieters. | § 5 Abs. 1, Abs. 2 Nr. 1, 3 UWG; Art. 84 BayEUG; § 99 SchulG NRW | Streichen (E-8, E-14) |
| H3 | index.html:575, 734 | „Öffentliche Spendennennung (als PR für Partnerunternehmen)“. Zahlt ein Unternehmen gegen eine Gegenleistung (Nennung, Reichweite), ist das Sponsoring und keine Spende. Wer „Spende“ verspricht, legt den Weg zu Zuwendungsbestätigungen nahe: Haftung des Vereins nach § 10b Abs. 4 EStG, Gefahr für die Gemeinnützigkeit. Abstimmung mit T-001. | § 5 Abs. 1 UWG; § 10b EStG; AEAO zu § 64 AO (Sponsoring) | Streichen. Allenfalls „Nennung als Partner (Sponsoring) nach Absprache mit Schule und Förderverein“, erst nach Freigabe durch den Steuerberater |
| H4 | index.html:619–620, 630, 640, 650, 664 | Gehaltsvergleich „Meister verdient mehr als Bachelor“ mit 4.826 € / 4.551 €, „Destatis Mikrozensus 2022“. (a) Die Werte waren nicht verifizierbar. Die aktuelle amtliche Zahl lautet anders: Destatis, Verdiensterhebung April 2025: Meister/Techniker/Fachschule Ø 5.405 €, Bachelor Ø 5.289 €, **Master Ø 7.019 €**. (b) Pfad A heißt „Bachelor / Master“, zeigt aber nur den niedrigeren Bachelor-Wert. Das verschleiert den Master-Wert und ist gegenüber Eltern und Jugendlichen besonders schutzwürdig irreführend. (c) „IHK Betriebswirt (DQR 7)“ erhält denselben Wert wie Meister. (d) Ein Durchschnitt wird zur pauschalen Aussage „verdient mehr“. (e) „Bundesagentur für Arbeit“ als Quelle ist unbestimmt. | § 5 Abs. 1 UWG; § 5a UWG; § 3 Abs. 4 UWG (Zielgruppe Jugendliche) | Ersetzen (E-11, E-12) |
| H5 | index.html:705 | „250 € / Monat Kindergeld … Kindergeld bis 25 … Sofort verfügbar“. Seit 01.01.2026 beträgt das Kindergeld **259 €** (zu prüfen auf familienkasse.de). Bis 25 gibt es Kindergeld nur bei Ausbildung oder Studium, sonst bis 18. Es wird an die Eltern gezahlt und auf Antrag, „sofort verfügbar“ stimmt also nicht. „Wohngeld für Azubis“: Wer dem Grunde nach Anspruch auf BAB hat, ist in der Regel vom Wohngeld ausgeschlossen (§ 20 Abs. 2 WoGG, zu prüfen). | § 5 Abs. 1 UWG | Ersetzen (E-13) |
| H6 | index.html:701 | „2.400 € / Jahr Begabtenförderung … über 3 Jahre = 7.200 € … kaum bekannt, selten genutzt“. Der Betrag ist veraltet: Das Weiterbildungsstipendium beträgt laut aktuellem Programmflyer (BMFTR, Aug. 2025) **bis zu 9.135 € in 3 Jahren**, mit 10 % Eigenanteil je Maßnahme. Das Geld ist zweckgebunden für Weiterbildungskosten und wird nicht frei ausgezahlt. Voraussetzungen: in der Regel unter 25 Jahre, besonders gute Abschlussprüfung. „Selten genutzt“ ist unbelegt. | § 5 Abs. 1 UWG | Ersetzen (E-13) |
| H7 | index.html:700 | „350 € / Monat BAB“. Die BAB ist kein fester Betrag. Sie richtet sich nach Bedarf (Unterkunft, Lebensunterhalt) abzüglich eigenem und elterlichem Einkommen (§§ 56 ff. SGB III). Der Wert 350 € ist nicht belegbar. Die Voraussetzungen sind verkürzt dargestellt. | § 5 Abs. 1 UWG | Ohne festen Betrag formulieren (E-13) |
| H8 | index.html:680–682, 541, 673, 688 | „Plattform sammelt Daten → Unternehmen zahlen für Reichweite“, „Je mehr Schüler, desto wertvoller für Unternehmen“. Daten Minderjähriger erscheinen als Handelsgut. Das widerspricht der Entscheidung (Unternehmen sehen nur Statistiken), dem Grundsatz der Zweckbindung und Datenminimierung (Art. 5 Abs. 1 lit. b, c DSGVO) und Erwägungsgrund 38 (besonderer Schutz von Kindern). Für Aufsichtsbehörden, Schulleitungen und Presse ist das ein Aufgreifpunkt. | Art. 5, 12, 25 DSGVO; § 5 UWG; Entscheidung | Ersetzen (E-9, E-10) |
| H9 | index.html:562, 564, 744, 714–715 | „Automatischer Fit-Score gegen Schülerprofile“, „Frühzeitiger Kontakt 1–2 Jahre vor Ausbildungsstart“, „Direktkontakt Schüler (opt-in)“, „1–2 Jahre früher als bei jedem Wettbewerber“, „bevor sie sich anderswo bewerben“. Das widerspricht dem Datenmodell, nach dem Details erst nach aktiver Kontaktaufnahme des Schülers fließen. Dazu kommen eine Alleinstellungsbehauptung („jedem Wettbewerber“) und eine implizit vergleichende Werbung ohne Beleg. | § 5, § 6 UWG; Art. 5, 22, 25 DSGVO; ggf. Art. 28 DSA | Ersetzen (E-8, E-14) |
| H10 | index.html:718–747 | Preis-Tiers 500–15.000 €/Jahr. Laut Entscheidung ist die Pilotphase kostenlos. Spannen statt Preisen sind bei gleichzeitig bestehendem Gratis-Pilot irreführend über den Preis (§ 5 Abs. 2 Nr. 2 UWG). Die PAngV gilt hier nicht direkt, weil es um B2B geht. | § 5 UWG; Entscheidung | Durch Pilot-Block ersetzen (E-14) |
| H11 | index.html:572, 750 | „25–30 % der Unternehmenseinnahmen fließen in den Förderverein“ widerspricht der Entscheidung „öffentlich kein Prozentsatz“. Außerdem ist der Satz falsch, weil intern 30 % fix gelten. | Entscheidung; § 5 UWG | Ersetzen (E-8, E-15) |
| H12 | index.html:852, 856–859 | Option „Schüler / Schülerin (14+)“ mit der Checkbox „16 Jahre oder älter bzw. meine Eltern sind einverstanden“. Bei 14- und 15-Jährigen beruht die Speicherung auf Einwilligung. Nach Art. 8 Abs. 1, 2 DSGVO braucht es dafür die Einwilligung der Eltern **und angemessene Anstrengungen zur Überprüfung**. Eine Selbstauskunft des Kindes reicht dafür nicht. | Art. 8, 7 Abs. 1 DSGVO | Warteliste für Schülerinnen und Schüler auf 16+ begrenzen; U16 tragen die Eltern ein (E-17) |
| H13 | impressum.html:74–104 | Anbieter, Rechtsform, Anschrift, Vertretung, Register und USt-IdNr fehlen. Ohne vollständiges Impressum darf die Seite nicht live gehen (Bußgeld bis 50.000 €, § 33 DDG; abmahnfähig nach § 3a UWG). | § 5 DDG; § 18 Abs. 2 MStV | Ausfüllen (Marcus, offene Entscheidung). Rechtsträger klären |
| H14 | datenschutz.html (gesamt) | Viele Pflichtangaben fehlen (Art. 13 DSGVO). Weder DSB noch DSFA sind berücksichtigt (siehe M10). Das Verfahren für Minderjährige ist nicht beschrieben. Auf diesen Text verweisen schon Einwilligungen (Warteliste, Registrierung). Eine Einwilligung auf Grundlage einer unvollständigen Information ist nicht „in informierter Weise“ erteilt (Art. 4 Nr. 11 DSGVO). | Art. 7, 12, 13 DSGVO | Vor dem Livegang fertigstellen (Abschnitt 4.2) |
| H15 | Geschäftsmodell | Die Schulleitung erteilt als Amtsträgerin bzw. Amtsträger eine formale Zustimmung, und der Förderverein der Schule erhält dadurch Geld. Die Vorteilsannahme nach § 331 StGB erfasst seit 1997 auch Vorteile für **Dritte**. Schulsponsoring-Erlasse lösen das in der Regel über Genehmigung, Transparenz und Gremienbeteiligung (§ 331 Abs. 3 StGB). Ohne solche Strukturen besteht ein Risiko für Schulleitungen. Dass Schulleitungen deshalb nicht zustimmen, ist ein Vertriebsrisiko. | §§ 331, 333 StGB; Landes-Sponsoringerlasse | **Anwaltlich prüfen** (Frage A1). Zustimmung als „Kenntnisnahme und Genehmigung nach Landes-Sponsoringregeln“ ausgestalten, ggf. mit Schulträger bzw. Schulkonferenz |

### 2.2 Mittel

| # | Fundstelle | Aussage / Problem | Norm | Empfehlung |
|---|---|---|---|---|
| M1 | index.html:440–441, 597–611, 697, 700, 705 | Funktionen werden als vorhanden dargestellt: „Alles auf einer App“, „die App zeigt sofort“, „automatisch berechnet“, „automatisch auf Berechtigung geprüft“, „mit einem Klick buchbar“, Family-Account, Smart Notifications. Tatsächlich gibt es eine Warteliste, Nachhilfe-Buchung und App existieren nicht. Das ist Irreführung über Verfügbarkeit und Merkmale. Bei „automatisch geprüft“ für Förderansprüche kommt der Eindruck einer verbindlichen Prüfung hinzu. | § 5 Abs. 1, Abs. 2 Nr. 1 UWG | Kennzeichnung „geplant / im Aufbau“, Ergebnisse als „unverbindliche Orientierung“ (E-1, E-7) |
| M2 | index.html:447–450 | Hero-Statistiken: „11 Mio. Schüler“ passt in etwa (Destatis 2024/25: rund 11,4 Mio. an allgemeinbildenden und beruflichen Schulen, vorläufig; zu prüfen). „34.000 Schulen“ ist nicht belegt (Destatis 2025/26: rund 32.800 allgemeinbildende Schulen). „50.000+ unbesetzte Azubi-Plätze“ passt (BIBB 30.09.2025: rund 54.400). „Mrd. € ungenutzte Fördergelder“ ist ohne Quelle. | § 5 Abs. 1 UWG | Mit Quelle und Stand korrigieren, die vierte Zahl ersetzen (E-2) |
| M3 | index.html:530, 696 | „Milliarden Euro an BAföG, Stipendien und Meisterprämien werden nicht abgerufen — weil niemand informiert.“ Die Zahl und die Kausalität sind unbelegt. | § 5 Abs. 1 UWG | Ersetzen (E-5, E-13) |
| M4 | index.html:504, 510 | „53 %“ und „73 %“ stimmen mit der Bertelsmann Stiftung, Jugendbefragung 2022 (n = 1.666, 14–20 J.) überein. Die Quelle ist aber nicht genannt. „Orientierung kommt meist erst wenige Monate vor dem Schulabschluss“ ist unbelegt. | § 5 Abs. 1 UWG | Quelle und Jahr nennen, unbelegten Halbsatz streichen (E-4) |
| M5 | index.html:599 | „Kein anderer Anbieter verbindet …“ ist eine Alleinstellungsbehauptung. Edufy trägt dafür die Beweislast, und es gibt Wettbewerber (Berufsorientierungs-Apps, Arbeitsagentur-Tools). | § 5 Abs. 1 UWG | Ersetzen (E-7) |
| M6 | index.html:472 | Mockup „Praktikum bei SAP buchen“. Die fremde Marke erweckt den Eindruck einer Partnerschaft bzw. Zulassung (§ 5 Abs. 2 Nr. 4 UWG) und ist eine markenmäßige Nutzung im geschäftlichen Verkehr (§ 14 Abs. 2 MarkenG, Ausnutzung der Wertschätzung bei einer bekannten Marke). | § 5 UWG; § 14 MarkenG | Fiktiv bzw. generisch ersetzen (E-3) |
| M7 | index.html:702, 703, 704 | Aufstiegs-BAföG „75 % Kostenübernahme“: Richtig ist „bis zu 75 % der Lehrgangs- und Prüfungsgebühren“ (50 % Zuschuss plus 50 % Erlass des Restdarlehens bei Bestehen). Meisterprämien: Die Beträge stimmen mit Sekundärquellen überein (BY 3.000, NW 2.500, HE 3.500, BE 5.000, 6.000 nur in Sonderfällen), jeweils mit Bedingungen. Brandenburg und Schleswig-Holstein haben laut Sekundärquellen keine Prämie. Amtliche Prüfung je Land steht aus. Deutschlandstipendium 300 € stimmt, aber es gibt keinen Rechtsanspruch, es wird leistungsabhängig vergeben. | § 5 Abs. 1 UWG | Präzisieren (E-13) |
| M8 | index.html:638–639, 649 | „DQR 6 = Bachelor“: Gemeint ist „gleichwertig“, nicht „gleichartig“. Seit der BBiG-Novelle 2020 gibt es die Abschlussbezeichnungen „Bachelor Professional“ und „Master Professional“. | § 5 UWG | „DQR-Niveau 6 – wie Bachelor“ (E-12) |
| M9 | index.html:758 | „Erste Pilotschulen registrieren sich gerade“: Sozialer Beweis, der stimmen muss. Gibt es noch keine Anmeldungen, ist der Satz irreführend. | § 5 Abs. 1 UWG | Nur verwenden, wenn wahr, sonst ersetzen (E-16) |
| M10 | datenschutz.html:103–104 | DSB „ggf. erforderlich“. Ein Matching und eine Notenauswertung bei Minderjährigen erfüllen voraussichtlich mehrere Kriterien der DSK-Muss-Liste bzw. der WP248-Kriterien: schutzbedürftige Betroffene, Bewertung bzw. Scoring, neue Technologie, Datenzusammenführung. Dann ist eine DSFA nötig (Art. 35 DSGVO), und daraus folgt die DSB-Pflicht nach § 38 Abs. 1 S. 2 BDSG. | Art. 35, 37 DSGVO; § 38 BDSG | DSFA vor dem Start des Schüler-Moduls anlegen, DSB benennen (extern möglich). Frage A6 |
| M11 | index.html:920; registrierung-foerderverein.html:380; foerderverein-bestaetigung.html:230; datenschutz.html:118 | supabase-js wird über jsDelivr geladen. Dabei geht die IP-Adresse bei jedem Seitenaufruf an Dritte, auf der Startseite auch ohne Formularnutzung. Rechtsprechung: LG München I, Urteil vom 20.01.2022 – 3 O 17493/20, zu Google Fonts. Der BGH hat Fragen zu dynamischen IP-Adressen und Schadensersatz dem EuGH vorgelegt (Beschluss vom 28.08.2025 – VI ZR 258/24), die Entscheidung steht aus. Wer jsDelivr betreibt und ob ein Drittlandbezug besteht, ist ungeklärt (zu prüfen; jsDelivr nutzt mehrere CDN-Anbieter). | Art. 6 Abs. 1 lit. f, 44 ff. DSGVO | G-006 umsetzen (lokal ausliefern), dann Absatz 4 S. 2 streichen. Bis dahin Text E-DS-1 |
| M12 | registrierung-foerderverein.html:149, 355; foerderverein-bestaetigung.html:153, 382, 402 | „Kostenlos und unverbindlich: keine Gebühren, kein Abo …“. Für die Registrierung ist das zutreffend. Dass bei Aktivierung ein **Jahresvertrag** folgt und die Schulleitung zustimmen muss, ist aber eine wesentliche Information, die bisher fehlt. Fördervereine sind „sonstige Marktteilnehmer“ und durch § 5a UWG geschützt. | § 5a UWG | Ergänzen (E-F1 bis E-F4) |
| M13 | registrierung-foerderverein.html:327; index.html:797, 829, 863 | Checkbox „Ich habe die Datenschutzerklärung gelesen und bin einverstanden …“. (a) Für die Registrierung ist die Rechtsgrundlage Art. 6 Abs. 1 lit. b DSGVO. Eine zusätzliche „Einwilligung“ täuscht über die Rechtsgrundlage (vgl. EDSA-Leitlinien 05/2020 Rn. 122 f.) und lässt einen Widerruf ins Leere laufen. (b) „gelesen“ ist eine Tatsachenbestätigung (Rechtsgedanke § 309 Nr. 12 b BGB). Für die Warteliste ist die Einwilligung als Rechtsgrundlage richtig, der Text sollte aber Zweck und Widerruf selbst nennen. | Art. 6, 7, 13 DSGVO | Ersetzen (E-17, E-F5) |
| M14 | Geschäftsmodell, Schulleitung | In NRW entscheidet die Schulleitung über Sponsoring nach § 99 SchulG voraussichtlich nur mit Zustimmung von Schulkonferenz und Schulträger (Wortlaut zu prüfen). Die Entscheidung „formale Zustimmung der Schulleitung“ reicht dort ggf. nicht aus. Ähnliche Gremienregeln gibt es in anderen Ländern. | Landesschulgesetze | Zustimmungsformular länderspezifisch (Abschnitt 4.4). F-006 entsprechend anpassen |
| M15 | Geschäftsmodell, U16-Freigabe | Die Eltern-Freigabe per E-Mail-Link gilt in der Literatur als praktikable Mindestlösung für Art. 8 Abs. 2 DSGVO. Die Schwäche: Das Kind kann eine eigene Zweitadresse angeben. Das Risiko des Dienstes ist höher als bei einem Newsletter (Kontakt Minderjähriger mit Unternehmen, Noten). | Art. 8 Abs. 2, 24, 25 DSGVO | Zusatzmaßnahmen (Abschnitt 4.5). Frage A4 |
| M16 | Geschäftsmodell, 16–17 J. | Wird das Schülerkonto auf Art. 6 Abs. 1 lit. b DSGVO (Nutzungsvertrag) gestützt, braucht ein beschränkt geschäftsfähiger Mensch bis 17 grundsätzlich die Zustimmung der Eltern zum Vertrag (§§ 106, 107 BGB), solange der Vertrag nicht lediglich rechtlich vorteilhaft ist (Nutzungsbedingungen mit Pflichten: umstritten). Art. 8 DSGVO regelt dies ausdrücklich nicht (Art. 8 Abs. 3). | §§ 107 ff. BGB | Frage A5. Pragmatisch: Nutzungsbedingungen ohne Pflichten bzw. Kosten für Schüler, Eltern-Info bei 16–17 |
| M17 | Geschäftsmodell, DSA | Erreicht Edufy Minderjährige und stellt Unternehmensangebote dar, kann Edufy eine „Online-Plattform“ im Sinne des DSA sein. Art. 28 Abs. 2 DSA verbietet Werbung, die auf Profiling beruht, gegenüber Minderjährigen. Ob „passende Angebote nach Notenprofil“ Werbung auf Profiling-Basis ist, ist zu klären. Kleinst- und Kleinunternehmen sind von Abschnitt 3 (Art. 20–28) nach Art. 19 DSA grundsätzlich ausgenommen (zu prüfen, ob und wie lange das für Edufy gilt). | Art. 19, 28 DSA | Frage A7 |
| M18 | index.html:565, 735 | „Anonymisierte Reichweitendaten je Region/Schule“. Bei kleinen Schulen bzw. Jahrgängen ist eine Re-Identifizierung möglich, dann sind die Daten nicht anonym. | Art. 4 Nr. 1, Erwägungsgrund 26 DSGVO | Mindestgröße für Statistiken (z. B. ≥ 10 Personen je Zelle), technisch in U-001 bzw. U-002 |
| M19 | datenschutz.html:167 | „Art. 8 DSGVO“ ist als Rechtsgrundlage aufgeführt. Art. 8 ist aber eine Bedingung für die Einwilligung und keine eigene Rechtsgrundlage. | Art. 6, 8 DSGVO | Umformulieren (E-DS-4) |
| M20 | Marke | Bisher heißt die Seite „EduConnect“ (Kennzeichen ist sehr verbreitet). Künftig heißt sie „Edufy“. Für die exakte Wortmarke habe ich bei der Websuche keinen Eintrag gefunden. Es gibt aber die App „Edufy“ (Apple App Store, Anbieter „Edufy Publications“), die US-Anmeldung „EDUFYI“ (Serial 99514401, Kl. 9/42, eingereicht am 24.11.2025) und ähnliche Zeichen (EDUFII, EDUFIND, EDUNIFY). | §§ 4, 9, 14 MarkenG; Art. 8, 9 UMV | Recherche (Abschnitt 4.6) |

### 2.3 Niedrig

| # | Fundstelle | Problem | Empfehlung |
|---|---|---|---|
| N1 | index.html:439, 7, 19, 26, 885 | „Das Bildungs-OS für Deutschland“: Durch den bestimmten Artikel ist eine Spitzenstellung angedeutet, eher eine reklamehafte Übertreibung. | „Edufy – Berufs- und Studienorientierung für Jugendliche in Deutschland“ |
| N2 | index.html:913 | „Made in Germany“: Die Software wird bei US-Anbietern gehostet. Leser könnten einen Serverstandort in Deutschland erwarten. | „Entwickelt in Deutschland“ |
| N3 | index.html:875 | „Kein Spam. Keine Weitergabe. Jederzeit abmeldbar.“ Das ist zutreffend, solange Auftragsverarbeiter keine „Weitergabe“ sind und eine Abmeldung per E-Mail funktioniert. | Präzisieren (E-16) |
| N4 | index.html:587 | „10–15 % Provision pro gebuchter Stunde“ (Nachhilfe): Das ist eine interne Kalkulation und kein Nutzen für die Zielgruppe. | Streichen (E-8) |
| N5 | index.html:658 | „Abendgymnasium (kostenlos)“: An öffentlichen Schulen in der Regel schulgeldfrei, an privaten nicht. | „Abendgymnasium / Kolleg“ |
| N6 | impressum.html:106–107 | Erklärung nach VSBG: Die allgemeine Informationspflicht nach § 36 VSBG gilt nur für Unternehmer mit mehr als 10 Beschäftigten, die AGB gegenüber Verbrauchern verwenden. Den Link zur OS-Plattform braucht es nicht mehr, weil die ODR-Verordnung zum 20.07.2025 aufgehoben wurde (zu prüfen). | Bei ≤ 10 Beschäftigten freiwillig weglassen oder neutrale Erklärung |
| N7 | registrierung-foerderverein.html:153; foerderverein-bestaetigung.html:153 | Vorlage: „Einnahmen …, die Unternehmen über unsere Schule erzielen“ ist sachlich schief, denn Edufy erzielt die Einnahmen. | E-F3 |

---

## 3. Ersetzungstexte (direkt übernehmbar)

Die Texte sind für edufy-dev-landing (G-003/G-007) bzw. edufy-dev-foerderverein gedacht. **„[…]“ = Marcus füllt aus.** Die Marke ist durchgehend „Edufy“, Kontakt `hallo@edufy.world` (index.html:766, 873, 904, 927; alle `edu-connect.com` in den Förderverein-Seiten).

### Landingpage `index.html`

**E-1 · Hero (Z. 439–441)**
- Z. 439 Badge: `Im Aufbau – Pilotstart [Monat/Jahr]`
- Z. 440 H1: `Vom Schulzeugnis zum<br><em>Traumberuf.</em><br>Alles an einem Ort.`
- Z. 441: `Edufy verbindet Schülerinnen und Schüler, Eltern, Schulen, Fördervereine und Unternehmen. Geplant sind Notenprofil, Berufsorientierung, Überblick über Förderungen und Praktikumsangebote – kostenlos für Schülerinnen und Schüler.`

**E-2 · Hero-Statistiken (Z. 446–451)**, unter den Zahlen eine Quellenzeile ergänzen:
```html
<div class="hero-stat"><strong>über 11 Mio.</strong><span>Schülerinnen und Schüler in Deutschland¹</span></div>
<div class="hero-stat"><strong>rund 32.800</strong><span>allgemeinbildende Schulen¹</span></div>
<div class="hero-stat"><strong>rund 54.400</strong><span>unbesetzte Ausbildungsstellen 2025²</span></div>
<div class="hero-stat"><strong>0 €</strong><span>für Schülerinnen und Schüler</span></div>
<!-- nach .hero-stats: -->
<p class="hero-src">¹ Statistisches Bundesamt (Destatis), Schuljahr 2024/25 (alle Schularten, vorläufig) bzw. 2025/26 (allgemeinbildende Schulen). ² BIBB, Ausbildungsmarkt zum 30.09.2025.</p>
```
*Vor Veröffentlichung beide Destatis-Zahlen in den Pressemitteilungen gegenprüfen (Abschnitt 6).*

**E-3 · Mockup (Z. 453, 472, 476)**
- Z. 453 aria-label: `Beispielhafte App-Vorschau (Entwurf): Zielberuf, Fortschritt, nächste Schritte und mögliche Förderungen`
- Z. 472: `<span>💼 Praktikum im IT-Betrieb finden</span>`
- Z. 476: `BAB · Kindergeld · Stipendien`
- Unter `.phone-wrap` eine sichtbare Bildunterschrift ergänzen: `Beispielhafte Darstellung – Funktionen in Entwicklung.`

**E-4 · Problem-Karten (Z. 504, 510, 516, 524, 530)**
- Z. 504: `53 % der Jugendlichen fühlen sich vom Informationsangebot zur Berufswahl überfordert (Bertelsmann Stiftung, Jugendbefragung 2022).`
- Z. 510: `Für 73 % der Jugendlichen sind die Eltern die wichtigste Unterstützung bei der Berufswahl (Bertelsmann Stiftung, 2022). Viele Eltern kennen vor allem den Weg über das Studium – dabei bieten auch Ausbildung und Aufstiegsfortbildung wie Meister oder Fachwirt sehr gute Perspektiven.`
- Z. 516: `Rund 54.400 Ausbildungsstellen blieben 2025 unbesetzt (BIBB, Stand 30.09.2025). Viele Betriebe erreichen Schülerinnen und Schüler erst spät.`
- Z. 524: `Schulen organisieren Praktika oft noch mit viel Handarbeit.` *(„erhalten keinerlei finanzielle Unterstützung“ streichen, unbelegt)*
- Z. 529 H3: `Förderungen sind oft unbekannt`
- Z. 530: `BAföG, BAB, Stipendien, Meisterprämien: Viele Angebote sind kompliziert und wenig bekannt. Edufy will helfen, den Überblick zu behalten.`

**E-5 · Abschnitt Förderung, Überschrift (Z. 696–697)**
- Z. 696: `Förderungen, die viele nicht kennen.`
- Z. 697: `Geplant: Edufy zeigt Schülerinnen und Schülern einen Überblick über Förderungen, die für sie in Frage kommen können – nach Bundesland und Bildungsweg. Ob ein Anspruch besteht, entscheidet immer die zuständige Stelle.`

**E-6 · Zielgruppen-Einleitung (Z. 540–541)**
- Z. 540: `Eine Plattform. Vier Zielgruppen.`
- Z. 541: `Schülerinnen und Schüler entdecken ihren Weg. Unternehmen stellen sich und ihre Angebote vor. Schulen und Fördervereine profitieren mit.`

**E-7 · Features (Z. 598–611)**
- Z. 599: `Geplante Funktionen: Noten, Bildungswege, Förderungen und Praktika in einem persönlichen Pfad.`
- Z. 602: `Noten eingeben, Zielberuf wählen – Edufy zeigt, in welchen Fächern noch Luft nach oben ist.`
- Z. 605: `BAföG, BAB, Stipendien, Meisterprämien – als Überblick im Pfad. Unverbindliche Orientierung, keine Antragsprüfung.`
- Z. 608: `Direkt aus der Gap-Analyse passende Nachhilfeangebote finden (geplant).`
- Z. 610: `Hinweise auf neue Praktikumsplätze, Bewerbungsfristen und Stipendien (geplant).`

**E-8 · Zielgruppen-Karten (Z. 556–589)**
- Z. 558 H3: `Unternehmen`
- Z. 559–566 Liste:
```html
<li>Unternehmensprofil mit Videos und Azubi-Berichten</li>
<li>Ausbildungs- und Praktikumsangebote veröffentlichen</li>
<li>Anonyme Statistiken je Partnerschule (z. B. Interesse an Berufsfeldern)</li>
<li>Kontaktanfragen von Schülerinnen und Schülern, die sich für Ihr Angebot interessieren</li>
<li>Kontaktdaten nur, wenn Jugendliche selbst Kontakt aufnehmen – unter 16 nur mit Freigabe der Eltern</li>
```
- Z. 570 H3: `Schulen & Fördervereine`
- Z. 571–577 Liste:
```html
<li>Der Förderverein wird an den Einnahmen beteiligt, die Edufy mit Unternehmen über die Schule erzielt</li>
<li>Praktikumsverwaltung digital (geplant)</li>
<li>Fertige Materialien zur Berufsorientierung für Lehrkräfte (geplant)</li>
<li>Start nur mit Zustimmung der Schulleitung</li>
```
- Z. 581 H3: `Nachhilfe & Lernplattformen (geplant)`. Z. 587 (Provision) **streichen**.

**E-9 · Netzwerk (Z. 672–688)**
- Z. 672: `So wirkt Edufy zusammen.`
- Z. 673: `Fördervereine laden Schülerinnen und Schüler ein – Jugendliche entdecken Angebote – Unternehmen stellen sich vor – der Förderverein der Schule wird beteiligt.`
- Z. 680: `<p>Edufy zeigt<br>passende<br>Angebote</p>`
- Z. 682: `<p>Unternehmen<br>stellen sich<br>vor</p>`
- Z. 684: `<p>Förderverein<br>wird<br>beteiligt</p>`
- Z. 688: `Mehr Schulen → mehr Orientierung für Jugendliche → mehr Ausbildungsangebote → mehr Unterstützung für Fördervereine`

**E-10 · Datenschutzhinweis im Netzwerkabschnitt** (neu unter Z. 688):
`Wir verkaufen keine Daten. Unternehmen sehen nur anonyme Statistiken. Persönliche Angaben erhalten sie erst, wenn eine Schülerin oder ein Schüler selbst Kontakt aufnimmt.`

**E-11 · Bildungswege, Überschrift (Z. 619–620)**
- Z. 619: `Meister, Techniker, Fachwirt:<br>Gute Verdienstchancen auch ohne Studium.`
- Z. 620: `Beschäftigte mit Meister-, Techniker- oder Fachschulabschluss verdienten im April 2025 im Schnitt 5.405 € brutto im Monat – etwas mehr als mit Bachelorabschluss (5.289 €). Mit Masterabschluss waren es 7.019 €. (Statistisches Bundesamt, Verdiensterhebung April 2025; Durchschnittswerte ohne Sonderzahlungen – der eigene Verdienst hängt stark von Beruf, Branche und Region ab.)`

**E-12 · Pfad-Karten (Z. 630, 638–640, 649–650, 658, 664)**
- Z. 630: `Bachelor Ø 5.289 € · Master Ø 7.019 €`
- Z. 638: `IHK Fachwirt (DQR-Niveau 6 – wie Bachelor)`
- Z. 639: `IHK Betriebswirt (DQR-Niveau 7 – wie Master)`
- Z. 640: `Ø 5.405 € / Monat*`
- Z. 649: `Meister (DQR-Niveau 6 – wie Bachelor)`
- Z. 650: `Ø 5.405 € / Monat*`
- Z. 658: `Abendgymnasium / Kolleg`
- Z. 664: `* Durchschnitt aller Beschäftigten mit Meister-, Techniker- oder Fachschulabschluss, April 2025. Quelle: Statistisches Bundesamt (Destatis), Pressemitteilung vom 25.03.2026. Einzelwerte für Fachwirt, Betriebswirt oder einzelne Handwerke weist diese Statistik nicht aus.`
- Den Stern (★) in Z. 634 und 644 entfernen oder ihn nur als Verweis auf die Fußnote verwenden.

*Vor Veröffentlichung prüfen, ob die Destatis-Werte „Vollzeit“ oder „alle Beschäftigten“ betreffen, und die Fußnote entsprechend anpassen.*

**E-13 · Förder-Karten (Z. 700–705)**, ohne feste Beträge, wo kein amtlicher Stand vorliegt:
```html
<div class="foerd-card"><div class="foerd-amount" style="color:var(--teal-text)">je nach Bedarf</div><h3>BAB – Berufsausbildungsbeihilfe</h3><p>Zuschuss der Agentur für Arbeit für Azubis, die nicht bei den Eltern wohnen (z. B. weil der Ausbildungsbetrieb zu weit entfernt ist). Die Höhe hängt von Ausbildungsvergütung, Miete und Einkommen der Eltern ab.</p><span class="foerd-tag" style="background:rgba(13,148,136,.1);color:var(--teal-text)">Während der Ausbildung</span></div>
<div class="foerd-card"><div class="foerd-amount" style="color:var(--gold-text)">bis 9.135 €</div><h3>Weiterbildungsstipendium</h3><p>Für junge Fachkräfte mit sehr gutem Berufsabschluss, in der Regel unter 25 Jahren. Zuschuss zu Weiterbildungskosten über bis zu drei Jahre, 10 % Eigenanteil.</p><span class="foerd-tag" style="background:rgba(245,158,11,.1);color:var(--gold-text)">Nach der Ausbildung</span></div>
<div class="foerd-card"><div class="foerd-amount" style="color:var(--coral-dark)">bis zu 75 %</div><h3>Aufstiegs-BAföG</h3><p>Für Meister, Fachwirt, Techniker und weitere Fortbildungen: 50 % der Lehrgangs- und Prüfungsgebühren als Zuschuss, beim Bestehen wird die Hälfte des Restdarlehens erlassen.</p><span class="foerd-tag" style="background:rgba(244,63,94,.1);color:var(--coral-dark)">Für Weiterbildung</span></div>
<div class="foerd-card"><div class="foerd-amount" style="color:var(--purp-dark)">je nach Land</div><h3>Meisterprämien der Länder</h3><p>Viele Bundesländer zahlen nach bestandener Meisterprüfung eine Prämie – Höhe und Bedingungen unterscheiden sich je nach Land, einige Länder zahlen keine.</p><span class="foerd-tag" style="background:rgba(139,92,246,.1);color:var(--purp-dark)">Nach der Prüfung</span></div>
<div class="foerd-card"><div class="foerd-amount" style="color:var(--green-text)">300 € / Monat</div><h3>Deutschlandstipendium</h3><p>Für leistungsstarke Studierende, vergeben von den Hochschulen. Einkommensunabhängig und nicht auf das BAföG angerechnet. Kein Rechtsanspruch.</p><span class="foerd-tag" style="background:rgba(16,185,129,.1);color:var(--green-text)">Für das Studium</span></div>
<div class="foerd-card"><div class="foerd-amount" style="color:var(--teal-text)">259 € / Monat</div><h3>Kindergeld</h3><p>Erhalten die Eltern auf Antrag – bis 18 Jahre, während Ausbildung oder Studium in der Regel bis 25 Jahre. Betrag seit 1. Januar 2026.</p><span class="foerd-tag" style="background:rgba(13,148,136,.1);color:var(--teal-text)">Für Familien</span></div>
```
Darunter ergänzen: `<p class="foerd-src">Stand: [Datum]. Angaben ohne Gewähr; maßgeblich sind die zuständigen Stellen (Familienkasse, Agentur für Arbeit, Kammern, Hochschulen, Länder).</p>`

*Option Meisterprämien mit Beträgen:* Konkrete Länderwerte (z. B. „Bayern 3.000 €, NRW 2.500 €“) erst einsetzen, wenn sie auf der amtlichen Landesseite geprüft und mit Stand dokumentiert sind.

**E-14 · Für Unternehmen (Z. 714–751)**
- Z. 714: `Azubis früh erreichen –<br>mit Respekt vor dem Datenschutz.`
- Z. 715: `Über Edufy stellen Sie Ihr Unternehmen und Ihre Ausbildungs- und Praktikumsangebote Schülerinnen und Schülern in Ihrer Region vor. Sie sehen anonyme Statistiken je Schule. Persönliche Angaben erhalten Sie erst, wenn Jugendliche von sich aus Kontakt zu Ihnen aufnehmen.`
- Z. 717–748 (`.price-grid`) ersetzen durch eine Karte:
```html
<div class="price-grid reveal" style="grid-template-columns:1fr;max-width:560px;margin-left:auto;margin-right:auto">
  <div class="price-card feat">
    <div class="price-badge">Pilotphase</div>
    <h3 class="price-tier" style="color:var(--gold)">Pilotunternehmen</h3>
    <div class="price-val">kostenlos</div>
    <div class="price-period">für [Zahl] Pilotunternehmen, befristet bis [Datum]</div>
    <ul class="price-list">
      <li>Unternehmensprofil</li>
      <li>Ausbildungs- und Praktikumsangebote veröffentlichen</li>
      <li>Anonyme Statistiken je Partnerschule</li>
      <li>Kontaktanfragen interessierter Schülerinnen und Schüler</li>
    </ul>
    <p class="price-period" style="margin:1rem 0 0">Keine automatische Verlängerung: Nach der Pilotphase entscheiden Sie selbst, ob Sie weitermachen. Die Preise danach legen wir mit dem Feedback der Pilotunternehmen fest.</p>
  </div>
</div>
```
*Ein „Ab-Preis“ erst nennen, wenn Preise feststehen.*

**E-15 · Hinweis Schulen (Z. 749–752)**
```html
<div class="price-school reveal">
  <strong><span aria-hidden="true">🏫</span> Schulen & Fördervereine profitieren mit</strong>
  Der Förderverein der Schule wird an den Einnahmen beteiligt, die Edufy mit Unternehmen über diese Schule erzielt (nach der kostenlosen Pilotphase). Voraussetzung ist die Zustimmung der Schulleitung. Die Einzelheiten besprechen wir persönlich.
</div>
```
*Ersatzlos gestrichen: „Rechtssicher …“, „in allen 16 Bundesländern“, „25–30 %“.*

**E-16 · Warteliste, Rahmen (Z. 758, 760, 873, 875)**
- Z. 758: *Nur wenn zutreffend:* `Pilotphase in Vorbereitung`. Andernfalls `Jetzt für den Pilot vormerken`.
- Z. 760: `Ob Schule, Förderverein, Unternehmen oder Eltern – lassen Sie sich vormerken und gestalten Sie Edufy mit.`
- Z. 873: `Bei Fragen: <strong>hallo@edufy.world</strong>`
- Z. 875: `Kein Spam. Ihre Angaben geben wir nicht an Unternehmen weiter. Abmelden jederzeit per E-Mail an hallo@edufy.world.`

**E-17 · Einwilligungstexte und Altersgrenze Warteliste (Z. 797, 829, 852, 856–859, 863)**
- Z. 797 / 829 / 863 (Datenschutz-Checkbox):
  `Ich willige ein, dass Edufy meine Angaben speichert, um mich zum Pilotstart zu kontaktieren. Ich kann die Einwilligung jederzeit per E-Mail an hallo@edufy.world widerrufen. Mehr in der <a href="datenschutz.html">Datenschutzerklärung</a>.`
- Z. 852: `<option value="schueler">Schülerin / Schüler (ab 16 Jahren)</option>`
- Z. 856: `Du bist jünger als 16? Dann können sich deine Eltern hier für dich vormerken lassen.`
- Z. 858–859: `<input type="checkbox" name="consent_age" … /> <span>Ich bin mindestens 16 Jahre alt oder melde mich als Elternteil bzw. Lehrkraft an.</span>`
- *Technisch (SQL `waitlist.rolle`): Der Check bleibt gleich. Kein Feld für das Alter des Kindes erheben.*

**E-18 · Footer, Meta, Marke (Z. 7–27, 417, 884–913)**
- Title/OG: `Edufy – Berufs- und Studienorientierung für Jugendliche in Deutschland`
- Z. 885: `Berufs- und Studienorientierung für Jugendliche in Deutschland. Schülerinnen und Schüler, Eltern, Schulen und Unternehmen auf einer Plattform.`
- Z. 913: `Entwickelt in Deutschland`

### Förderverein-Seiten (Owner edufy-dev-foerderverein)

**E-F1 · registrierung-foerderverein.html:149–150**
```html
<li><span><strong>Kostenlose Registrierung:</strong> Die Anmeldung kostet nichts und verpflichtet zu nichts – keine Gebühren, kein Mitgliedsbeitrag.</span></li>
<li><span><strong>Ihr Vorteil:</strong> Der Förderverein wird an den Einnahmen beteiligt, die Edufy mit Unternehmen über Ihre Schule erzielt. Die Details besprechen wir mit Ihnen persönlich.</span></li>
<li><span><strong>Erst später verbindlich:</strong> Bevor Ihr Verein aktiv wird, braucht es die Zustimmung Ihrer Schulleitung und eine Jahresvereinbarung, die Ihr Vorstand abschließt. Beides erklären wir im Gespräch.</span></li>
```

**E-F2 · registrierung-foerderverein.html:351–355**
```html
<li>Sie bekommen eine E-Mail mit einem Bestätigungslink. Bitte klicken Sie darauf.</li>
<li>Wir melden uns und erklären im persönlichen Gespräch, wie der Verein an den Einnahmen beteiligt wird.</li>
<li>Ihre Schulleitung bestätigt, dass sie einverstanden ist. Den Link dafür bekommen Sie von uns.</li>
<li>Ihr Vorstand schließt eine Jahresvereinbarung mit Edufy. Erst dann wird Ihr Verein aktiv und kann Schülerinnen und Schüler einladen.</li>
…
<p style="margin-top:.5rem">Die Registrierung ist kostenlos und verpflichtet Sie zu nichts. Verbindlich wird es erst mit der Jahresvereinbarung.</p>
```

**E-F3 · foerderverein-bestaetigung.html:152–153 (Vorlage Vorstand)**
`Liebe Vorstandskolleginnen und -kollegen,
ich habe unseren Förderverein kostenlos bei Edufy registriert. Edufy hilft Schülerinnen und Schülern bei der Berufs- und Studienorientierung. Unser Verein soll an den Einnahmen beteiligt werden, die Edufy mit Unternehmen über unsere Schule erzielt. Die Registrierung ist kostenlos und unverbindlich. Bevor es losgeht, muss unsere Schulleitung zustimmen und der Vorstand eine Jahresvereinbarung beschließen. Unternehmen sehen dabei nur anonyme Statistiken, keine Daten einzelner Schülerinnen und Schüler. Die Details erklärt uns Edufy in einem persönlichen Gespräch.`

**E-F4 · foerderverein-bestaetigung.html:159, 382, 402**
- Z. 159: `Wir melden uns per E-Mail oder Telefon. Im Gespräch erklären wir, wie die Beteiligung des Vereins funktioniert, wie die Zustimmung der Schulleitung abläuft und was in der Jahresvereinbarung steht.`
- Z. 382 / 402 („kostenlos und unverbindlich“): `Die Registrierung ist kostenlos und verpflichtet Sie zu nichts. Verbindlich wird es erst mit der Jahresvereinbarung.`

**E-F5 · registrierung-foerderverein.html:327 (Datenschutz)**. Die Checkbox wird durch einen Hinweis ersetzt, weil die Rechtsgrundlage Art. 6 Abs. 1 lit. b DSGVO ist:
`<p class="hint">Wir verarbeiten Ihre Angaben, um Ihr Konto anzulegen und Sie zur Beteiligung Ihres Vereins zu kontaktieren. Telefonnummer und Registerangaben sind freiwillig. Details in der <a href="datenschutz.html#registrierung-foerderverein" target="_blank" rel="noopener">Datenschutzerklärung (öffnet in neuem Tab)</a>.</p>`
*Folge für die Technik: `p_datenschutz_akzeptiert` bzw. die Prüfung `edufy:datenschutz_fehlt` in RPC und SQL entfällt oder wird zu einem „Hinweis angezeigt“-Zeitstempel. Das klärt der PM mit edufy-dev-foerderverein. Bleibt die Checkbox aus Produktgründen, dann mit dem Wortlaut „Ich habe die Datenschutzhinweise zur Kenntnis genommen“ und ohne „einverstanden“.*

**E-F6 · Vertretung (registrierung-foerderverein.html:325)**, Hinweis unter der Checkbox ergänzen:
`Für die kostenlose Registrierung genügt das. Die spätere Jahresvereinbarung schließt der vertretungsberechtigte Vorstand laut Satzung (§ 26 BGB).`

### Datenschutzerklärung `datenschutz.html` (Textbausteine)

**E-DS-1 · Nr. 4 (Z. 118)**, nur solange G-006 nicht umgesetzt ist:
`Für Formulare und Anmeldung laden wir die Programmbibliothek „supabase-js“ über das Content-Delivery-Network jsDelivr (cdn.jsdelivr.net). Dabei wird Ihre IP-Adresse an den Betreiber [BITTE PRÜFEN: Betreiber und Anschrift, ggf. eingesetzte CDN-Anbieter] übermittelt, damit die Datei ausgeliefert werden kann. Rechtsgrundlage ist Art. 6 Abs. 1 lit. f DSGVO (berechtigtes Interesse an einer schnellen, ausfallsicheren Auslieferung). [BITTE PRÜFEN: Drittlandübermittlung und Grundlage].`
→ **Empfehlung: G-006 vor dem Livegang umsetzen und den Absatz dann streichen.**

**E-DS-2 · Vercel (Nr. 3, Z. 107/112)**
`Anbieter: Vercel Inc., [Anschrift laut DPA]. Vercel ist nach dem EU-U.S. Data Privacy Framework zertifiziert (Angemessenheitsbeschluss der EU-Kommission vom 10.07.2023, Art. 45 DSGVO); ergänzend gelten Standardvertragsklauseln. [BITTE PRÜFEN: aktueller Eintrag auf dataprivacyframework.gov; Region der Functions].`

**E-DS-3 · Supabase (Nr. 7, Z. 154–158)**
`Anbieter: Supabase, Inc., [Anschrift laut DPA]. Die Daten werden in der Region [z. B. „Central EU (Frankfurt)“] gespeichert. Für mögliche Zugriffe aus den USA (z. B. Support) haben wir mit Supabase Standardvertragsklauseln der EU-Kommission (Durchführungsbeschluss (EU) 2021/914, Modul 2) vereinbart (Art. 46 Abs. 2 lit. c DSGVO).`
*Nach meiner Recherche stützt sich Supabase auf SCC. Eine DPF-Zertifizierung habe ich nicht gefunden (zu prüfen). DPA im Dashboard abschließen und das Datum dokumentieren.*

**E-DS-4 · Nr. 8 (Z. 167)**
`Bei Kindern unter 16 Jahren ist eine Einwilligung nur wirksam, wenn die Eltern bzw. Sorgeberechtigten sie erteilen oder ihr zustimmen (Art. 8 DSGVO).`

**E-DS-5 · Nr. 11 Kinder und Jugendliche (Z. 177)**, Entwurf für das Verfahren nach S-002:
`Schülerinnen und Schüler unter 16 Jahren können ein Konto zunächst nur eingeschränkt nutzen. Wir senden einen Bestätigungslink an die E-Mail-Adresse eines Elternteils, die bei der Registrierung angegeben wird. Erst wenn ein Elternteil über diesen Link zustimmt, werden Funktionen freigeschaltet, bei denen Daten an Unternehmen gehen können (Kontaktaufnahme zu einem Unternehmen). Die Zustimmung speichern wir mit Zeitpunkt als Nachweis. Eltern können die Zustimmung jederzeit widerrufen. Unternehmen sehen nur anonyme Statistiken je Schule. Persönliche Angaben einer Schülerin oder eines Schülers erhalten sie nur, wenn diese oder dieser selbst Kontakt aufnimmt – bei unter 16-Jährigen nur nach Freigabe der Eltern.`
Dazu eine **kindgerechte Kurzfassung** (Art. 12 Abs. 1 S. 1 DSGVO), z. B. `datenschutz-kurz.html`, die du-Form verwendet.

**E-DS-6 · Neu: Kontakt per E-Mail**
`Wenn Sie uns per E-Mail schreiben, verarbeiten wir Ihre Angaben, um Ihre Anfrage zu beantworten (Art. 6 Abs. 1 lit. b bzw. f DSGVO). Wir löschen sie, wenn die Anfrage erledigt ist und keine Aufbewahrungspflichten bestehen. E-Mail-Anbieter: [BITTE AUSFÜLLEN].`

**E-DS-7 · Neu, erst bei Einführung: Zahlungen (Stripe)**
`Für die Abrechnung mit Unternehmen nutzen wir Stripe (Stripe Payments Europe, Ltd., [Anschrift]). [BITTE PRÜFEN: Rolle von Stripe – Auftragsverarbeiter bzw. eigener Verantwortlicher (z. B. Betrugsprävention); Drittlandübermittlung an Stripe, Inc. (DPF/SCC)].` Schülerinnen und Schüler sind davon nicht betroffen. Den Baustein erst einfügen, wenn U-003 live geht.

**E-DS-8 · Neu, wenn das Schüler-Modul startet: Profiling / Matching**
Abschnitt „Notenprofil, Fit-Score und Vorschläge“: welche Daten, Logik in Grundzügen, keine automatisierte Entscheidung mit rechtlicher Wirkung (Art. 22 DSGVO), Hinweis auf DSFA, Widerspruch bzw. Löschung von Noten.

### Impressum `impressum.html`

Pflichtangaben nach § 5 Abs. 1 DDG für den Rechtsträger: Name bzw. Firma mit Rechtsform, ladungsfähige Anschrift, Vertretungsberechtigte, E-Mail **und** ein weiterer schneller Kontaktweg, Register und Nummer, USt-IdNr (§ 27a UStG) bzw. Wirtschafts-Identifikationsnummer (§ 139c AO), sobald vorhanden. Bei einer Gesellschaft in Gründung bzw. einer UG den Zusatz „(haftungsbeschränkt)“. § 18 Abs. 2 MStV beibehalten, wenn Edufy redaktionelle Inhalte anbietet (Berufs- und Studiumsbibliothek). Z. 87: `E-Mail: hallo@edufy.world`.

---

## 4. Geschäftsmodell-Risiken und Eckpunkte

### 4.1 Pilotphase und Förderverein-Beteiligung
In der kostenlosen Pilotphase gibt es keine Unternehmenseinnahmen und damit auch **keine Auszahlungen an Fördervereine**. Wer jetzt „Ihr Vorteil: Beteiligung“ kommuniziert, muss das sagen, sonst ist das eine Irreführung durch Unterlassen (§ 5a UWG). Erledigt in E-15. Für E-F1 bis E-F3 ergänzen, z. B.: „Während der kostenlosen Pilotphase für Unternehmen fallen noch keine Einnahmen an.“

### 4.2 Datenschutzerklärung – Vollständigkeitsliste (Art. 13 DSGVO)
Fehlt bzw. offen:
- Verantwortlicher
- DSB (siehe M10)
- E-Mail-Anbieter
- Supabase-Auth-Logs (IP)
- Speicherfristen (Logs, Warteliste, unbestätigte Konten: F-004)
- Löschkonzept
- Empfänger bei Förderverein und Unternehmen (Statistiken, Kontaktanfrage)
- Rolle des Fördervereins (eigener Verantwortlicher oder gemeinsame Verantwortung nach Art. 26, wenn er Einladungen versendet bzw. Statistiken sieht; Frage A8)
- Matching/Profiling
- kindgerechte Fassung
- Stand-Datum
- Double-Opt-In Warteliste (G-005)
- zuständige Aufsichtsbehörde (Sitzland)

Vorhanden und gut: Rechtekatalog, Struktur, Hinweise zu Google Fonts lokal und zum Metadaten-Ablauf.

### 4.3 Schulrecht der Länder – Überblick (nur belegte Punkte)
| Land | Regelung | Tendenz | Quelle |
|---|---|---|---|
| Bayern | Art. 84 BayEUG: Vertrieb von Gegenständen, Werbung dafür und der Abschluss sonstiger Geschäfte in der Schule untersagt; Ausnahmen nur über die Schulordnung | **restriktiv** | gesetze-bayern.de, BayEUG Art. 84 |
| Sachsen | VwV (Juli 2024): Werbung an Schulen grundsätzlich nicht gestattet, mit Ausnahmen; Sponsoring = Leistung mit vertraglicher Gegenleistung | **restriktiv** | revosax.sachsen.de (zu prüfen: genaue VwV-Bezeichnung) |
| Nordrhein-Westfalen | § 99 SchulG: Sponsoring zulässig, wenn mit dem Bildungsauftrag vereinbar und die Werbewirkung deutlich hinter dem schulischen Nutzen zurücktritt; Entscheidung der Schulleitung mit Zustimmung von Schulkonferenz und Schulträger; sonstige Werbung grundsätzlich unzulässig | **mittel, gremienpflichtig** | recht.nrw.de, SchulG § 99 (Wortlaut prüfen) |
| Hessen | § 3 Abs. 15 HSchG, gemeinsamer Runderlass 2015, Leitfaden des Kultusministeriums zu Sponsoring, Werbung und Spenden; Leitprinzip Integrität und Neutralität der Schule | mittel | kultus.hessen.de, Leitfaden |
| Brandenburg | Schulgesetz (§ 47 BbgSchulG): Spenden und Sponsoring unter Wahrung der Rechte des Schulträgers zulässig | eher offen | anwalt24.de / bravors (zu prüfen) |
| Rheinland-Pfalz | Schulgesetz und Schulordnungen; Broschüre „Sponsoring“ des Bildungsministeriums (Okt. 2025) | zu prüfen | bildung.rlp.de |
| Übrige Länder (BW, BE, HB, HH, MV, NI, SL, ST, SH, TH) | Laut vzbv haben **alle 16 Länder** Regeln zu Werbung und Sponsoring, die sehr unterschiedlich und oft unkonkret sind; Saarland laut Sekundärquelle restriktiv | **zu prüfen** | vzbv-Faktenblatt 2019 / Positionspapier 2020 |

**Folgerungen:**
- Edufy verkauft keine Werbung in der Schule. Unternehmen präsentieren sich **auf der Plattform**, und die Plattform nutzen Jugendliche freiwillig und auch außerhalb des Unterrichts.
- Die Beteiligung des Fördervereins ist **kein Sponsoring der Schule**, sofern die Schule keine Gegenleistung erbringt. Sobald die Schule selbst etwas tut (Einladung im Unterricht, Aushang, Elternbrief über die Schule), greift das Landesrecht.
- Zustimmungsformular und Infopaket für Schulleitungen länderspezifisch gestalten. Für Bayern vor dem Start einen Rechtsrat einholen.

### 4.4 Rolle der Schulleitung (Entscheidung: formale Zustimmung)
- **Gegenstand der Zustimmung:** Kenntnis vom Angebot, Einverständnis, dass der Förderverein Edufy an der Schule bekannt macht, und Kenntnis der Beteiligung des Vereins (Transparenz). Keine Pflichten der Schule, keine Daten der Schule an Edufy.
- **Länderabhängig zusätzlich:** Schulkonferenz bzw. Schulträger (z. B. NRW).
- **Strafrecht (H15):** Die Zustimmung sollte als Genehmigung nach dem Sponsoring-Erlass bzw. Schulgesetz des Landes erteilt oder an die zuständige Stelle gemeldet werden (Rechtsgedanke § 331 Abs. 3 StGB). Zahlungen gehen nur an den Verein, nie an Personen. Keine Vorteile für Lehrkräfte oder Schulleitung.
- Widerruf der Zustimmung = Sonderkündigungsgrund im Jahresvertrag.

### 4.5 U16-Eltern-Freigabe per E-Mail – Einordnung
- **Art. 8 Abs. 2 DSGVO** verlangt „angemessene Anstrengungen unter Berücksichtigung der verfügbaren Technik“. Die Literatur hält ein auf die Eltern-Adresse bezogenes Double-Opt-In für die derzeit praktikable Lösung. Weil Minderjährige Kontakt zu Unternehmen aufnehmen, sollte die Ausgestaltung dem höheren Risiko folgen.
- **Empfohlene Zusatzmaßnahmen:**
  - (1) Die Eltern-Adresse darf nicht der Schüler-Adresse entsprechen.
  - (2) Auf der Freigabeseite bestätigt ein Elternteil mit Namen ausdrücklich, sorgeberechtigt zu sein, und sieht eine verständliche Erklärung, was freigeschaltet wird.
  - (3) Protokoll mit Zeitpunkt, Adresse und Versionsstand des Textes (Nachweis nach Art. 7 Abs. 1).
  - (4) Eine Info-Mail an die Eltern bei jeder ersten Kontaktaufnahme zu einem Unternehmen, mindestens eine regelmäßige Erinnerung mit Widerrufslink.
  - (5) Konten über Förderverein bzw. Schulcode als zusätzliches Plausibilitätssignal.
  - (6) Kein Unternehmenskontakt vor der Freigabe (so beschlossen).
  - (7) Die DSFA dokumentiert die Abwägung.
- **Gesamturteil:** Mit (1) bis (7) halte ich das Verfahren für vertretbar. Bestätigen muss das der Anwalt (A4).

### 4.6 Markenrecherche „Edufy“ – Hinweise
- **Gefunden (Websuche, nicht abschließend):** App „Edufy“ im Apple App Store (Lern-App, „Edufy Publications“); USPTO-Anmeldung „EDUFYI“ (99514401, Kl. 9/42, 24.11.2025); ähnliche Zeichen EDUFII, EDUFIND (Signum International AG), EDUNIFY, EduFi. Zu „Edufy“ in DPMA/EUIPO konnte ich nicht direkt suchen.
- **To-do:**
  - (1) Identitätsrecherche in DPMAregister, EUIPO eSearch/TMview und WIPO Global Brand Database für die Klassen **9, 35, 41, 42** (ggf. 36 für Zahlungs- und Fördervermittlung).
  - (2) Ähnlichkeitsrecherche (phonetisch: Edify, Edufi, Edufii) durch eine Kanzlei bzw. einen Rechercheservice.
  - (3) Firmen- und Unternehmenskennzeichen (Handelsregister, § 5 MarkenG) und App-Stores.
  - (4) Danach eine DE- oder EU-Wortmarke (ggf. Wort-/Bildmarke) anmelden, vor größerem Marketing.
  - (5) Domain edufy.world ist vorhanden. Gängige Varianten prüfen (.de, .com).
  - Die alte Bezeichnung „EduConnect“ wird ohnehin aufgegeben. Gut so, das Zeichen ist sehr verbreitet.

### 4.7 Eckpunkte Förderverein-Jahresvereinbarung (kein fertiger Vertrag)
1. **Parteien und Vertretung:** Edufy [Rechtsträger] und der Förderverein, vertreten durch den Vorstand nach § 26 BGB bzw. Satzung. Nachweis über Vereinsregisterauszug oder Bestätigung. Es handelt sich um AGB, deshalb gilt die Inhaltskontrolle nach § 307 BGB auch gegenüber dem Verein.
2. **Aufschiebende Bedingung:** Die Vereinbarung wird erst wirksam bzw. aktiv mit der Zustimmung der Schulleitung, landesabhängig auch von Schulkonferenz bzw. Schulträger. Ist sie nach X Wochen nicht erteilt, endet die Vereinbarung ohne Folgen.
3. **Leistungen des Vereins:** Bekanntmachen von Edufy bei Schülerinnen, Schülern und Eltern (Einladungslink, QR-Code). Keine Werbung für Unternehmen im Schulgebäude, keine Schülerdaten erheben oder weitergeben. **Mit T-001 abstimmen:** Welche Leistungen der Verein erbringt, entscheidet über die steuerliche Einordnung (Vermögensverwaltung, wirtschaftlicher Geschäftsbetrieb, Sponsoring).
4. **Beteiligung:** 30 % der tatsächlich vereinnahmten Netto-Entgelte (ohne USt, nach Erstattungen bzw. Gutschriften) aus Unternehmensverträgen, die der Schule zugeordnet sind. **Eine klare Zuordnungsregel** ist nötig (z. B. Unternehmen wählt Partnerschule, Region, Anteil bei mehreren Schulen). Abrechnung quartalsweise per **Gutschrift** (§ 14 Abs. 2 S. 2 UStG, Vereinbarung erforderlich; USt-Ausweis nach T-001). Einsichtsrecht in die Abrechnungsgrundlagen, Mindestauszahlungsbetrag, Verjährung bzw. Einwendungsfrist. Pilotphase: keine Beteiligung, weil es keine Einnahmen gibt.
5. **Keine Spendenbescheinigungen:** Der Verein stellt Unternehmen für Zahlungen über Edufy keine Zuwendungsbestätigungen aus, und Edufy bezeichnet Unternehmenszahlungen nicht als Spende.
6. **Datenschutz:** Der Verein erhält nur aggregierte Statistiken (Mindestgröße). Er hat keinen Zugriff auf Schülerdaten. Verschwiegenheit. Rollenklärung Art. 26 bzw. 28 DSGVO (A8).
7. **Laufzeit und Kündigung:** 12 Monate ab Aktivierung. Verlängerung um jeweils 12 Monate, wenn nicht mit 3 Monaten Frist zum Laufzeitende in Textform gekündigt wird (Empfehlung: Frist kurz halten, den Rechtsgedanken des § 309 Nr. 9 BGB beachten). **Sonderkündigung** bei: Widerruf der Zustimmung der Schulleitung, Verlust der Gemeinnützigkeit bzw. steuerlichen Bedenken, Schulschließung oder Fusion, wesentlicher Änderung des Beteiligungsmodells.
8. **Exklusivität:** ein Verein je Schule. Regelung bei Streit bzw. Wechsel (F-003, F-005).
9. **Nachwirkung:** Beteiligung an Entgelten aus Unternehmensverträgen, die während der Laufzeit geschlossen wurden, für [X Monate] nach dem Ende. Das ist als Entscheidung für Marcus offen.
10. **Kommunikation:** Edufy nennt den Verein bzw. die Schule öffentlich nur mit Zustimmung. Der Verein darf das Edufy-Logo im Rahmen der Leitlinien nutzen.
11. **Änderungen** nur mit Zustimmung bzw. Textform-Ankündigung und Sonderkündigungsrecht (§ 308 Nr. 4, 5 BGB als Leitbild).
12. **Haftung:** Begrenzung auf Vorsatz und grobe Fahrlässigkeit sowie Kardinalpflichten (vorhersehbarer Schaden). Leben, Körper und Gesundheit bleiben unberührt. Kein Gerichtsstand gegen den Verein vereinbaren (Verein ist kein Kaufmann, § 38 ZPO).
13. **Steuerhinweis:** Der Verein verantwortet seine steuerliche Behandlung selbst. Empfehlung: Rücksprache mit dem Steuerberater bzw. Finanzamt (Ergebnis T-001).

### 4.8 Eckpunkte Pilotbedingungen Unternehmen (kein fertiger Vertrag)
1. **Nur für Unternehmer** (§ 14 BGB), Bestätigung bei der Anmeldung. Kein Verbrauchergeschäft, also kein Widerrufsrecht.
2. **Kostenlos, befristet** bis [Datum] bzw. [X Monate]. Begrenzte Zahl an Pilotplätzen. **Keine automatische Umstellung** auf einen kostenpflichtigen Tarif. Ein Folgevertrag kommt nur durch ausdrückliche Annahme zustande. Preise werden mindestens [4 Wochen] vor Pilotende mitgeteilt.
3. **Leistungsumfang:** Profil, Angebote, Statistiken je Schule (Mindestgröße), Kontaktanfragen von Jugendlichen. **Keine Zusage** von Reichweite, Bewerberzahlen oder Schulen. Beta-Status, keine Verfügbarkeitszusage.
4. **Datenschutz:**
   - Personenbezogene Daten erhält das Unternehmen nur nach aktiver Kontaktaufnahme durch die Schülerin oder den Schüler (U16 nur nach Eltern-Freigabe).
   - Das Unternehmen ist dann eigener Verantwortlicher. Es nutzt die Daten nur für die Anfrage bzw. Bewerbung, gibt sie nicht weiter und löscht sie nach Abschluss bzw. spätestens [X Monate].
   - Keine Ansprache außerhalb des Kanals ohne Zustimmung. Kein Scraping und kein Export.
5. **Inhalte und Jugendschutz:**
   - Angebote müssen wahr, aktuell und AGG-konform sein (§ 11 AGG).
   - Keine für Minderjährige ungeeigneten Inhalte (Alkohol, Glücksspiel usw.).
   - Praktika und Ausbildung nur im Einklang mit dem JArbSchG.
   - Edufy darf Inhalte prüfen und entfernen (Melde- und Abhilfeverfahren, Art. 16 DSA, falls anwendbar).
6. **Feedback:** Teilnahme an Interviews (freiwillig bzw. vereinbart). Nutzungsrecht an Feedback. Nennung als Referenz nur mit Zustimmung.
7. **Laufzeit und Kündigung:** jederzeit mit sofortiger Wirkung in Textform durch beide Seiten. Danach werden Profil und Daten gelöscht.
8. **Haftung** wie 4.7 Nr. 12. **Rechtswahl** deutsches Recht. **Gerichtsstand** Sitz von Edufy (B2B unter Kaufleuten zulässig).
9. **Förderverein-Transparenz:** Unternehmen erfahren, dass Edufy die Fördervereine der Partnerschulen an späteren Einnahmen beteiligt (ohne Prozentsatz). Ihre Zahlungen sind keine Spenden.

---

## 5. Offene Punkte (intern)
- Rechtsträger von Edufy (GmbH/UG/Einzelunternehmen), Sitz → Impressum, Aufsichtsbehörde, Verträge (Marcus).
- G-006 (supabase-js lokal) vor dem Livegang. Danach Nr. 4 der DSE kürzen.
- DSFA für das Schüler-Modul vor S-002/U-001 anlegen, DSB benennen (extern).
- DPA mit Vercel und Supabase abschließen, Region festlegen, Daten dokumentieren. Verzeichnis der Verarbeitungstätigkeiten (Art. 30) anlegen.
- Stand-Daten aller Förderbeträge vor Veröffentlichung an amtlicher Quelle prüfen. Werte, die ich nicht verifizieren konnte: Kindergeld 259 € (Familienkasse), Weiterbildungsstipendium 9.135 € (SBB/BMFTR), Meisterprämien je Land, Destatis-Bezugsgruppe (Vollzeit oder alle).
- Ist die Aussage „Erste Pilotschulen registrieren sich gerade“ wahr?
- Einheitliche Kommunikation „Pilotphase = noch keine Auszahlung an Vereine“.
- Steuerliche Folgen (Sponsoring vs. Spende, Gutschrift, USt) → T-001.
- Lektorats-Audit als Datei ablegen (z. B. `feedback/` oder `docs/`), damit künftige Prüfungen darauf aufbauen können.

---

## 6. Fragenkatalog für den Anwalt
- **A1 (Strafrecht/Schulrecht):** Ist die formale Zustimmung der Schulleitung bei einer Geldbeteiligung des schuleigenen Fördervereins ein Drittvorteil im Sinne des § 331 StGB? Welche Genehmigungs- bzw. Transparenzstruktur (Schulträger, Schulkonferenz, Meldung an die Schulaufsicht) schließt das Risiko aus? Unterschiede je Land?
- **A2 (Schulrecht):** In welchen Ländern ist das Modell „Förderverein macht eine Online-Plattform bekannt, auf der sich Unternehmen präsentieren, Verein wird beteiligt“ Werbung bzw. Sponsoring *an der Schule*, und unter welchen Bedingungen ist es zulässig? Ist ein Start in Bayern (Art. 84 BayEUG) möglich, und welche Gremien müssen in NRW (§ 99 SchulG) zustimmen?
- **A3 (UWG):** Sind die Ersetzungstexte E-1 bis E-18 aus Ihrer Sicht ausreichend, insbesondere der Gehaltsvergleich (E-11/E-12), die Förderbeträge (E-13) und die Kennzeichnung „geplant“ (E-1/E-7)?
- **A4 (DSGVO Art. 8):** Genügt die Eltern-Freigabe per E-Mail-Link mit den Zusatzmaßnahmen in 4.5 den „angemessenen Anstrengungen“? Ist für die Kontaktaufnahme zu Unternehmen eine stärkere Verifikation nötig?
- **A5 (BGB/DSGVO):** Rechtsgrundlage des Schülerkontos: Art. 6 Abs. 1 lit. b (Vertrag; bei 16–17-Jährigen §§ 107 ff. BGB?) oder lit. a (Einwilligung)? Braucht es bei unter 18-Jährigen die Zustimmung der Eltern zu den Nutzungsbedingungen?
- **A6 (DSFA/DSB):** Ist eine DSFA für Notenprofil, Fit-Score und Matching Minderjähriger Pflicht, und folgt daraus die DSB-Pflicht nach § 38 Abs. 1 S. 2 BDSG schon in der Pilotphase?
- **A7 (DSA):** Ist Edufy eine Online-Plattform im Sinne des DSA? Fällt das Ausspielen passender Unternehmensangebote nach Notenprofil unter das Verbot profilingbasierter Werbung gegenüber Minderjährigen (Art. 28 Abs. 2 DSA)? Gilt die Ausnahme für Klein- und Kleinstunternehmen?
- **A8 (Rollen):** Ist der Förderverein Auftragsverarbeiter, gemeinsamer Verantwortlicher (Art. 26) oder Dritter, wenn er Schülerinnen und Schüler einlädt und Schulstatistiken sieht?
- **A9 (Drittland):** Sind DPF (Vercel) und SCC plus TIA (Supabase) für Daten Minderjähriger ausreichend, oder sollten wir eine EU-only-Konfiguration bzw. einen anderen Anbieter wählen? Wer betreibt jsDelivr, und reicht die Übergangslösung bis G-006?
- **A10 (AGB):** Sind die Eckpunkte 4.7 (Laufzeit 12 Monate, Verlängerung 12 Monate, Kündigung 3 Monate, Sonderkündigung) gegenüber einem eingetragenen Verein AGB-fest? Wie wird die Nachwirkung der Beteiligung (Nr. 9) gestaltet?
- **A11 (Marke):** Bitte um Identitäts- und Ähnlichkeitsrecherche „Edufy“ (Kl. 9, 35, 41, 42) und eine Einschätzung zu „Edufy“-App (App Store) und „EDUFYI“ (USPTO). Empfehlung DE- oder EU-Marke?
- **A12 (Impressum/VSBG):** Muss Edufy eine Erklärung nach § 36 VSBG aufnehmen (Nutzungsbedingungen gegenüber Schülerinnen und Schülern als Verbraucher; Beschäftigtenzahl)?
- **A13 (UWG/Steuer):** Bestätigung, dass „Spendennennung“ für Unternehmenszahlungen über Edufy zu unterlassen ist und dass Unternehmen keine Zuwendungsbestätigungen erhalten dürfen (zusammen mit dem Steuerberater, T-001).

---

## 7. Quellen (Stand des Abrufs: 2026-11-25, über die Websuche; amtliche Seiten in dieser Sitzung teils nicht direkt abrufbar)
- Destatis, PM vom 25.03.2026 (Verdienste nach Bildungsabschluss, April 2025): https://www.destatis.de/DE/Presse/Pressemitteilungen/2026/03/PD26_103_62.html
- Destatis, PM Schuljahr 2025/2026 (≈ 8,998 Mio. Schüler, ≈ 32.800 allgemeinbildende Schulen): https://www.destatis.de/DE/Presse/Pressemitteilungen/2026/11/PD26_384_213.html
- Destatis, Themenseite Schulen: https://www.destatis.de/DE/Themen/Gesellschaft-Umwelt/Bildung-Forschung-Kultur/Schulen/_inhalt.html
- BIBB, Ausbildungsmarkt 2025 (unbesetzte Stellen 30.09.2025): https://www.bibb.de/ausbildungsmarkt2025 · https://www.bibb.de/de/pressemitteilung_215396.php
- Bertelsmann Stiftung, Jugendbefragung 2022 (53 % / 73 %): https://www.bertelsmann-stiftung.de/de/themen/aktuelle-meldungen/2022/juli/mehrheit-der-jugendlichen-fehlt-der-durchblick-bei-der-berufswahl
- Kindergeld 2026 (259 €, Sekundärquellen; amtlich gegenprüfen): https://www.bmbfsfj.bund.de/resource/blob/256052/2b19e389612f4244069d5b1a686e82f8/einlegeblatt-leistungen-fuer-alleinerziehende-2026-data.pdf · https://www.sparkasse.de/pk/ratgeber/familie/eltern-und-kinder/kindergeld.html
- Weiterbildungsstipendium (bis 9.135 €): https://www.bmftr.bund.de/weiterbildungsstipendium (nicht abrufbar) · https://www.gruene-berufe.sachsen.de/download/2026_Flyer_Weiterbildungsstipendium_dual_web_mit_Kontakt.pdf · https://www.ihk.de/rheinhessen/aus-und-weiterbildung/beratung/stipendium-weiterbildung-3168834
- Aufstiegs-BAföG (50 % Zuschuss, 50 % Erlass): https://www.bmbfsfj.bund.de/resource/blob/291234/8567331fc96c5749e4cbe9a61c5051df/aufstiegs-bafoeg-flyer-data.pdf · https://www.ihk.de/schwerin/bildung/ihk-weiterbildung/aufstiegsfortbildung-bafoeg-4859422
- BAB: Merkblatt BA https://www.arbeitsagentur.de/datei/merkblatt-bab_ba013469.pdf (nicht abrufbar); BAföG-Sätze 2026 (Grundbedarf 475 €, Wohnpauschale 380 €, Novelle verschoben): https://www.studierendenwerke.de/presse/pressemitteilungen/pressemitteilung/30-bafoeg-novelle-richtung-stimmt-tempo-zu-langsam
- Meisterprämien (Sekundärquellen, amtlich je Land prüfen): https://www.handwerksblatt.de/betriebsfuehrung/meisterbonus-meisterpraemie-meister-extra-aufstiegsbonus-aufstiegsfortbildungspraemie-und-aufstiegspraemie-so-hoch-ist-die-foerderung-der-bundeslaender · https://www.deutsche-handwerks-zeitung.de/meisterbonus-meisterpraemie-meister-extra-2024-145931/
- Deutschlandstipendium: https://www.uni-erfurt.de/to/deutschlandstipendium · https://www.lmu.de/de/workspace-fuer-studierende/support-angebote/studienfinanzierung/stipendien/deutschlandstipendium/bewerbung/
- Art. 84 BayEUG: https://www.gesetze-bayern.de/Content/Pdf/BayEUG-84?all=False
- § 99 SchulG NRW: https://recht.nrw.de/lmi/owa/br_bes_detail?sg=0&menu=0&bes_id=7345&anw_nr=2&aufgehoben=N&det_id=694838
- Hessen, Leitfaden Sponsoring/Werbung/Spenden: https://kultus.hessen.de/sites/kultusministerium.hessen.de/files/2021-09/leitfaden_zum_umgang_mit_sponsoring_werbung_spenden_und_maezenatischen_schenkungen_an_schulen.pdf
- Sachsen, VwV Werbung/Sponsoring: https://revosax.sachsen.de/vorschrift/20941
- Rheinland-Pfalz, Broschüre Sponsoring (Okt. 2025): https://bildung.rlp.de/fileadmin/user_upload/pl.rlp.de/Bilder_Faecher_Rubriken/Broschuere_Sponsoring_Oktober2025.pdf
- vzbv, Faktenblatt Wirtschaft in der Schule: https://www.verbraucherbildung.de/sites/default/files/2021-01/2019_vzbv_faktenblatt_wirtschaft_in_der_schule%20%282%29.pdf
- Art. 8 DSGVO, Literatur zum Double-Opt-In der Eltern: https://www.dr-datenschutz.de/anforderungen-an-die-einwilligung-von-kindern-nach-der-dsgvo-teil-2/ · https://www.it-recht-kanzlei.de/datenverarbeitung-minderjaehrige-dsgvo.html
- BGH, Beschluss vom 28.08.2025 – VI ZR 258/24 (EuGH-Vorlage IP-Adressen/Google Fonts): https://curia.europa.eu/site/jcms/p1_1000070156/de/bundesgerichtshof-beschluss-vom-28-august-2025-vi-zr-258/24
- jsDelivr-Stellungnahme (Anbieter-Selbstauskunft): https://jsdelivr.com/blog/how-the-german-courts-ruling-on-google-fonts-affects-jsdelivr-and-why-it-is-safe-to-use
- Vercel DPF: https://vercel.com/changelog/vercel-is-now-certified-under-the-eu-us-data-privacy-framework-dpf · DPA: https://vercel.com/legal/dpa
- Supabase DPA (SCC): https://supabase.com/legal/customer-resources/data-processing-addendum
- Markenrecherche-Hinweise: https://apps.apple.com/py/app/edufy/id6748334849 · https://markinton.com/trademark/edufyi-99514401 · https://trademark.justia.com/858/81/edufii-85881693.html
- Normen: UWG §§ 3, 3a, 5, 5a, 6; MarkenG §§ 5, 14; DDG §§ 5, 33; MStV § 18; DSGVO Art. 4–8, 12, 13, 22, 25, 26, 28, 35, 37, 44 ff.; BDSG § 38; TDDDG § 25; BGB §§ 26, 106 ff., 305 ff.; StGB §§ 331, 333; EStG § 10b; UStG § 14; DSA Art. 16, 19, 28; SGB III §§ 56 ff.
