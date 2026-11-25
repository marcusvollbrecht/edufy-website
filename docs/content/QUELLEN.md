# Quellen und Prüfliste – Content-Datenbasis Schülerbereich (S-003)

Stand: 2026-11-25 · erstellt von der Content-Redaktion (edufy-dev-schueler) · Dateien: `data/berufe.json`,
`data/foerderungen.json`, `data/studium.json`, `data/bildungswege.json`

## Wichtig vorab: Wie die Werte zustande kamen

- In der Agentenumgebung waren **alle amtlichen und fast alle sonstigen Seiten gesperrt** (u. a. bibb.de,
  destatis.de, arbeitsagentur.de, bafoeg.de, sbb-stipendien.de, ihk.de, kmk.org, gesetze-im-internet.de).
  Weder WebFetch noch curl kamen durch. Verfügbar waren nur **Websuche-Auszüge**. Sie zeigen Textstücke
  aus den gefundenen Dokumenten, z. B. Tabellenzeilen aus der BIBB-PDF.
- Deshalb gilt: **Kein einziger Wert hat `geprueft: true`.** Laut SCHEMA.md darf `true` nur gesetzt werden, wenn der Wert
  an der Primärquelle abgelesen wurde. **Geprüft: 0 %.**
- Übernommen wurden nur Werte, die in einem Suchauszug als Zahl standen, meist als ganze Tabellenzeile der
  BIBB-Gesamtübersicht. Nichts wurde geschätzt oder gerechnet. Fehlte ein Wert, steht dort `null`.
- Risiko: In den Auszügen fehlen die Spaltenköpfe. Die Zuordnung „1.–4. Lehrjahr, dann Gesamtdurchschnitt“
  ist aus dem Aufbau der Tabelle abgeleitet und **vor Livegang an der PDF/Excel zu bestätigen**. Außerdem
  können einzelne Zeilen beim Auslesen verrutscht sein.
- Für den schnellsten Abgleich reicht die **Excel-Datei der BIBB-Gesamtübersicht 2025**
  (https://www.bibb.de/de/12209.php). Damit lassen sich alle 50 Berufe auf einmal prüfen.

## Quellen

Abrufdatum aller Einträge: 2026-11-25. „Weg“ sagt, wie die Quelle erreicht wurde:
WS = Websuche-Auszug, Vorwissen = Wissen der Redaktion, nicht recherchiert.

| # | Quelle | Herausgeber | URL | Stand | Weg | Genutzt für |
|---|---|---|---|---|---|---|
| Q1 | Tarifliche Ausbildungsvergütungen 2025 – Gesamtübersicht Bundesgebiet (PDF) | BIBB | https://www.bibb.de/dokumente/pdf/2025_Dav-Gesamt%C3%BCbersicht_Ausbildungsverg%C3%BCtungen_Bundesgebiet.pdf | 1.10.2025 | WS (Tabellenzeilen) | Vergütung je Lehrjahr (berufe.json) |
| Q2 | Gesamtübersicht 2025 Ost/West (PDF) | BIBB | https://www.bibb.de/dokumente/pdf/2025_Dav-Gesamt%C3%BCbersicht_Ausbildungsverg%C3%BCtungen_Ost_West.pdf | 1.10.2025 | WS | Ost/West-Hinweis Tischler |
| Q3 | Tarifliche Ausbildungsvergütungen – Übersichtsseite (PDF/Excel) | BIBB | https://www.bibb.de/de/12209.php | 10/2025 | WS | Methodik (rund 500 Tarifbereiche, bis zu 20 % Abweichung bei Betrieben ohne Tarif) |
| Q4 | Tarifliche Ausbildungsvergütungen 2025: Starker Anstieg … (Bericht) | BIBB | https://www.bibb.de/dienst/publikationen/de/20846 | 2025 | WS | Durchschnitt 1.209 €, Durchschnitt TFA 1.014 €, PKA 925 €, Steuer-/RA-Fachangestellte ohne Tarif |
| Q5 | Rangliste 2025 der Ausbildungsberufe (Neuabschlüsse zum 30.9., Tab. 67) | BIBB | https://www.bibb.de/dokumente/pdf/naa309/naa309_2025_tab067_0bund.pdf | 05.12.2025 | WS (nur Spitzengruppe sichtbar) | Auswahl der 50 Berufe |
| Q6 | Pressemitteilung Rangliste der Neuabschlüsse 2025 | BIBB über idw | https://idw-online.de/de/news866879 | 12/2025 | WS | Spitzengruppe (Kfz-Mechatroniker/-in Rang 1) |
| Q7 | Kaufmann/-frau für Spedition und Logistikdienstleistung – Vergütung | ausbildung123.de, azubimeter.de (Sekundärquellen) | https://www.ausbildung123.de/ausbildungsberuf/21-kaufmann-frau-fuer-spedition-und-logistikdienstleistung/ | 2025/26 | WS | Vergütung Spedition (nur Sekundärquelle!) |
| Q8 | Berufsausbildungsbeihilfe (BAB) | Bundesagentur für Arbeit | https://www.arbeitsagentur.de/bildung/ausbildung/berufsausbildungsbeihilfe-bab | 2026 | WS, Sekundärquellen (einstieg.com, meinestelle.de u. a.) | BAB |
| Q9 | Aufstiegs-BAföG | BMFTR/Länder | https://www.aufstiegs-bafoeg.de | 2026 | WS, Sekundärquellen (meistertreff.de, foerderbase.de u. a.) | Aufstiegs-BAföG, Reformstand |
| Q10 | Weiterbildungsstipendium | SBB | https://www.sbb-stipendien.de/weiterbildungsstipendium | 2026 | WS (IHK Rhein-Neckar, Bildungszentrum Würzburg, wizbii) | Weiterbildungsstipendium |
| Q11 | Aufstiegsstipendium | SBB | https://www.sbb-stipendien.de/aufstiegsstipendium | 2026 | WS (Hochschulseiten, fernstudi.net) | Aufstiegsstipendium |
| Q12 | BAföG | BMFTR | https://www.bafoeg.de | WS 2026/27 | WS (Finanztip, Studis Online, Stuttgarter Zeitung) | BAföG-Höchstsatz, Wohnpauschale, Reformstand |
| Q13 | Deutschlandstipendium | BMFTR | https://www.deutschlandstipendium.de | 2026/27 | WS (Hochschulseiten TU Darmstadt, FU Berlin, LUH) | Deutschlandstipendium |
| Q14 | Kindergeld | Familienportal (BMBFSFJ) | https://familienportal.de/bmbfsfj/themen/familie/familienleistungen/kindergeld/ | 01.01.2026 | WS | Kindergeld 259 € |
| Q15 | § 20 WoGG | gesetze-im-internet.de | https://www.gesetze-im-internet.de/wogg/__20.html | aktuell | WS + Merkblätter Hamburg, Wiesbaden, NRW-FAQ | Wohngeld-Ausschluss bei BAB/BAföG-Anspruch dem Grunde nach |
| Q16 | Meisterbonus & Co (Länderübersicht) | Deutsche Handwerks Zeitung | https://www.deutsche-handwerks-zeitung.de/meisterbonus-co-hier-gibt-es-praemien-fuer-meisterschueler-145931/ | 01/2026 | WS | Meisterprämien (nur allgemein übernommen) |
| Q17 | Studierende nach Fächergruppen WS 2024/25 | Destatis | https://www.destatis.de/DE/Themen/Gesellschaft-Umwelt/Bildung-Forschung-Kultur/Hochschulen/Tabellen/studierende-insgesamt-faechergruppe.html | 13.08.2025 | WS (nur Fächergruppen, keine Einzelfächer) | Auswahl studium.json |
| Q18 | Studierende in MINT-Fächern | Destatis | https://www.destatis.de/DE/Themen/Gesellschaft-Umwelt/Bildung-Forschung-Kultur/Hochschulen/Tabellen/studierende-mint-faechern.html | 2025 | WS | Auswahl studium.json |
| Q19 | AusbildungPlus – Duales Studium in Zahlen 2024 | BIBB | https://www.bibb.de/dienst/publikationen/de/20540 | 2025 | WS | Auswahl duale Studiengänge (Wirtschaftswiss. 60.106, Ingenieurwesen 42.552, Gesundheit 8.580 Studierende) |
| Q20 | hochschulstart.de | Stiftung für Hochschulzulassung | https://www.hochschulstart.de | – | Vorwissen | NC-Hinweis Medizin (zentrales Verfahren) |
| Q21 | KMK Ländervereinbarung (Erster/Mittlerer Schulabschluss) | KMK | https://www.kmk.org/themen/allgemeinbildende-schulen.html | 10/2020 | Vorwissen | bildungswege.json |
| Q22 | KMK-Beschluss Hochschulzugang beruflich Qualifizierter (06.03.2009) | KMK | https://www.kmk.org/themen/hochschulen/zugang-zur-hochschule.html | 03/2009 | Vorwissen | Studium ohne Abitur |
| Q23 | DQR-Zuordnungen | BLK DQR | https://www.dqr.de | – | Vorwissen | DQR-Stufen (Ausbildung 4 bzw. 3, Meister/Fachwirt/Techniker/Bachelor 6, Master/Betriebswirt 7) |
| Q24 | BBiG § 53a ff. (Fortbildungsstufen) | gesetze-im-internet.de | https://www.gesetze-im-internet.de/bbig_2005/__53a.html | 2020 | Vorwissen | Bachelor/Master Professional |

## Auswahl und Vorgehen

- **Berufe:** 50 duale Berufe nach BBiG/HwO, ausgewählt nach der BIBB-Rangliste der Neuabschlüsse 2025 (Q5/Q6).
  Die vollständige Bundes-Rangliste war nicht lesbar. Die Auswahl beruht deshalb auf der sichtbaren Spitzengruppe
  und auf den bekannten Ranglisten der Vorjahre. **Die Reihenfolge in der Datei ist keine geprüfte Rangfolge.**
  Neuabschlusszahlen wurden nicht übernommen, weil die Quellen widersprüchlich waren und das Schema kein Feld dafür
  hat. Bei der Prüfung mit Tab. 67 abgleichen: Gehören Randkandidaten wirklich zu den Top 50? Unsicher sind z. B.
  Fachmann/-frau für Systemgastronomie, Chemikant/-in, Elektroniker/-in für Automatisierungstechnik und
  Augenoptiker/-in. Wahrscheinlich fehlt dagegen z. B. Konstruktionsmechaniker/-in oder Bäcker/-in.
- **Pflegefachmann/-frau** (eine der größten Ausbildungen) und andere schulische Ausbildungen stehen **nicht** in der
  BIBB-Rangliste nach BBiG/HwO. Sie sind deshalb nicht enthalten. Vorschlag für später: Pflege, Erzieher/-in und
  Gesundheitsberufe als eigene Gruppe mit Quellen wie Destatis Pflegeausbildungsstatistik und TVAöD-Pflege.
  Das Pflegestudium ist in `studium.json` enthalten.
- **Zuständigkeitsbereich:** Für Berufe mit mehreren Bereichen (IH/Hw/ÖD) wurde der Bereich mit den meisten Azubis
  gewählt. Er steht in `verguetung.hinweis` und `verguetung.hinweis_oeffentlich`.
- **Texte** (kurz, Tätigkeiten, Stärken, Aufstieg, typischer Schulabschluss) beruhen auf dem Wissen der
  Redaktion (Ausbildungsordnungen/BERUFENET). Sie enthalten keine Zahlen und keine Gehaltsversprechen.
  `schulabschluss_typisch` beginnt nach der PM-Ergänzung immer mit einer Stufe und sagt dazu: „rechtlich kein
  bestimmter Abschluss vorgeschrieben“.
- **Studium:** 20 grundständige Fächer und 10 duale Studiengänge. Gewählt wurde nach den Destatis-Fächergruppen
  und den größten dualen Fachrichtungen (Q17–Q19). Einzelzahlen je Fach waren nicht abrufbar. **Keine NC-Werte.**
  `dauer_semester` ist die typische Regelstudienzeit. Bei Lehramt steht `null`, weil sie je Land und Schulform
  verschieden ist.
- **Förderungen:** Bewusst kein Eurobetrag steht bei BAB (Ratgeber widersprüchlich) und bei den Meisterprämien
  (Länder unterschiedlich, Stände widersprüchlich). Bei Aufstiegsstipendium und Weiterbildungsstipendium
  wurden die Kinderbetreuungspauschale bzw. die Wirkung des Eigenanteils weggelassen.

## Abweichungen vom Schema (dokumentiert)

1. `verguetung.hinweis` (intern) und `verguetung.hinweis_oeffentlich` stehen bei jedem Beruf. Das entspricht der
   PM-Ergänzung. Auch die Köpfe aller Dateien haben `hinweis` und `hinweis_oeffentlich`.
2. `foerderungen[].hinweis` (intern) und optional `hinweis_oeffentlich`.
3. `aufstieg[].dqr` ist `null`, wenn ein Fortbildungsabschluss nicht sicher einer DQR-Stufe zugeordnet ist
   (z. B. Fortbildungen der Zahnärztekammer, Verwaltungsfachwirt/-in).
4. `verguetung.jahrN` ist `null`, wenn kein Wert belegt ist. Das gilt auch für einzelne Lehrjahre, z. B. bei 2-jährigen Berufen ab `jahr3`.
5. `schritte[].dauer_monate` und `studiengaenge[].dauer_semester` sind `null`, wenn die Dauer stark schwankt.
6. `bildungswege.json`: `schulformen[]` haben die Felder `id, name, art, klassen, abschluesse[], hinweis_laender`,
   weil das Schema hier keine Felder vorgibt. Jeder `weg` hat zusätzlich `titel`. Weil `von.schulform` ein
   Einzelwert ist, die Seite navigator.html aber genau nach Schulform filtert, sind die 11 Grundwege **für jede
   passende Schulform dupliziert**. So entstehen 40 Einträge. Die id hat dann das Suffix `--<schulform>`, und das
   zusätzliche Feld `basis_id` verweist auf den Grundweg. Ein Grundweg wird also nur einmal geprüft, Änderungen
   gehören in alle Kopien.
7. `bildungswege.json` hat im Kopf `geprueft: false`.

## Liste aller Werte mit `geprueft: false` (zum Nachprüfen durch Marcus)

**Alle Werte in allen vier Dateien haben `geprueft: false`.** Die Liste unten ist nach Priorität geordnet.

### Ausbildungsvergütungen (data/berufe.json) – gegen Q1 (Excel) prüfen

141 Einzelwerte bei 44 Berufen sind belegt, 19 Lehrjahreswerte sind `null` (6 Berufe ganz ohne Wert).
Bitte jede Zeile mit der BIBB-Excel abgleichen, Bereich (IH/Hw/FB/ÖD/Lw) beachten und Datum/Kürzel eintragen.
Nach erfolgreicher Prüfung in der JSON `geprueft: true` setzen und den internen `hinweis` kürzen.

| # | Beruf (id) | Bereich Tabelle | 1. LJ | 2. LJ | 3. LJ | 4. LJ | Hinweis | Geprüft am / von |
|---|---|---|---|---|---|---|---|---|
| 1 | Kraftfahrzeugmechatroniker/-in (`kfz-mechatroniker`) | Handwerk (Hw) | 1.090 | 1.148 | 1.222 | 1.285 |  | |
| 2 | Kaufmann/-frau für Büromanagement (`kaufmann-buero`) | Industrie und Handel (IH) | 1.161 | 1.245 | 1.342 | – |  | |
| 3 | Verkäufer/-in (`verkaeufer`) | Industrie und Handel (IH) | 1.084 | 1.195 | – | – |  | |
| 4 | Kaufmann/-frau im Einzelhandel (`kaufmann-einzelhandel`) | Industrie und Handel (IH) | 1.087 | 1.195 | 1.328 | – |  | |
| 5 | Medizinische/-r Fachangestellte/-r (`medizinische-fachangestellte`) | Freie Berufe (FB) | 1.023 | 1.115 | 1.209 | – |  | |
| 6 | Zahnmedizinische/-r Fachangestellte/-r (`zahnmedizinische-fachangestellte`) | Freie Berufe (FB) | 1.021 | 1.115 | 1.213 | – |  | |
| 7 | Fachinformatiker/-in (`fachinformatiker`) | Industrie und Handel (IH), alle Fachrichtungen | 1.211 | 1.279 | 1.356 | – |  | |
| 8 | Industriekaufmann/-frau (`industriekaufmann`) | Industrie und Handel (IH) | 1.195 | 1.267 | 1.362 | – |  | |
| 9 | Elektroniker/-in (Handwerk) (`elektroniker-handwerk`) | Handwerk (Hw), alle Fachrichtungen | 979 | 1.050 | 1.125 | 1.201 |  | |
| 10 | Anlagenmechaniker/-in für Sanitär-, Heizungs- und Klimatechnik (`anlagenmechaniker-shk`) | – | – | – | – | – | **kein Wert** – Bundeswert der Zeile Hw in der BIBB-Gesamtübersicht 2025 in den Suchauszügen nicht eindeutig lesbar | |
| 11 | Industriemechaniker/-in (`industriemechaniker`) | Industrie und Handel (IH) | 1.221 | 1.287 | 1.375 | 1.452 |  | |
| 12 | Fachkraft für Lagerlogistik (`fachkraft-lagerlogistik`) | Industrie und Handel (IH) | 1.171 | 1.247 | 1.330 | – |  | |
| 13 | Kaufmann/-frau für Groß- und Außenhandelsmanagement (`kaufmann-gross-aussenhandel`) | Industrie und Handel (IH), alle Fachrichtungen | 1.198 | 1.271 | 1.347 | – |  | |
| 14 | Steuerfachangestellte/-r (`steuerfachangestellte`) | – | – | – | – | – | **kein Wert** – Laut BIBB gibt es für diesen Beruf keine Tarifverträge zur Ausbildungsvergütung, daher kein Wert in der Gesamtübersicht | |
| 15 | Bankkaufmann/-frau (`bankkaufmann`) | Industrie und Handel (IH) | 1.333 | 1.387 | 1.455 | – |  | |
| 16 | Elektroniker/-in für Betriebstechnik (`elektroniker-betriebstechnik`) | Industrie und Handel (IH) | 1.227 | 1.310 | 1.401 | 1.498 |  | |
| 17 | Mechatroniker/-in (`mechatroniker`) | Industrie und Handel (IH) | 1.224 | 1.297 | 1.387 | 1.472 | Sekundärquelle | |
| 18 | Tischler/-in (`tischler`) | Handwerk (Hw) | 827 | 964 | 1.085 | – |  | |
| 19 | Fachlagerist/-in (`fachlagerist`) | Industrie und Handel (IH) | 1.151 | 1.231 | – | – |  | |
| 20 | Verwaltungsfachangestellte/-r (`verwaltungsfachangestellte`) | Öffentlicher Dienst (ÖD), alle Fachrichtungen | 1.286 | 1.337 | 1.383 | – |  | |
| 21 | Friseur/-in (`friseur`) | Handwerk (Hw) | 623 | 723 | 857 | – |  | |
| 22 | Maler/-in und Lackierer/-in (`maler-lackierer`) | Handwerk (Hw), alle Fachrichtungen | 868 | 961 | 1.127 | – |  | |
| 23 | Koch/Köchin (`koch`) | Industrie und Handel (IH) | 1.120 | 1.233 | 1.346 | – |  | |
| 24 | Kaufmann/-frau für Spedition und Logistikdienstleistung (`kaufmann-spedition`) | – | 1.119 | 1.206 | 1.287 | – | Sekundärquelle | |
| 25 | Metallbauer/-in (`metallbauer`) | Handwerk (Hw), alle Fachrichtungen | 968 | 1.045 | 1.142 | 1.204 |  | |
| 26 | Zimmerer/Zimmerin (`zimmerer`) | Handwerk (Hw) | 1.070 | 1.281 | 1.527 | – |  | |
| 27 | Hotelfachmann/-frau (`hotelfachmann`) | Industrie und Handel (IH) | 1.112 | 1.231 | 1.347 | – |  | |
| 28 | Fachverkäufer/-in im Lebensmittelhandwerk (`fachverkaeufer-lebensmittelhandwerk`) | Handwerk (Hw), alle Schwerpunkte | 1.029 | 1.104 | 1.239 | – |  | |
| 29 | Gärtner/-in (`gaertner`) | Landwirtschaft (Lw), alle Fachrichtungen | 1.118 | 1.223 | 1.334 | – |  | |
| 30 | Elektroniker/-in für Geräte und Systeme (`elektroniker-geraete-systeme`) | Industrie und Handel (IH) | 1.236 | 1.298 | 1.381 | 1.451 |  | |
| 31 | Land- und Baumaschinenmechatroniker/-in (`land-baumaschinenmechatroniker`) | Handwerk (Hw) | 927 | 1.019 | 1.137 | 1.202 |  | |
| 32 | Maurer/-in (`maurer`) | Handwerk (Hw) | 1.079 | 1.286 | 1.533 | – |  | |
| 33 | Straßenbauer/-in (`strassenbauer`) | Handwerk (Hw) | 1.084 | 1.286 | 1.522 | – |  | |
| 34 | Dachdecker/-in (`dachdecker`) | Handwerk (Hw) | 1.002 | 1.155 | 1.403 | – |  | |
| 35 | Kaufmann/-frau für Versicherungen und Finanzanlagen (`kaufmann-versicherungen`) | Industrie und Handel (IH) | 1.336 | 1.407 | 1.497 | – |  | |
| 36 | Immobilienkaufmann/-frau (`immobilienkaufmann`) | Industrie und Handel (IH) | 1.170 | 1.278 | 1.390 | – |  | |
| 37 | Automobilkaufmann/-frau (`automobilkaufmann`) | Industrie und Handel (IH) | 1.101 | 1.147 | 1.222 | – |  | |
| 38 | Kaufmann/-frau im E-Commerce (`kaufmann-e-commerce`) | Industrie und Handel (IH) | 1.146 | 1.233 | 1.334 | – |  | |
| 39 | Landwirt/-in (`landwirt`) | Landwirtschaft (Lw) | 902 | 993 | 1.091 | – |  | |
| 40 | Tiermedizinische/-r Fachangestellte/-r (`tiermedizinische-fachangestellte`) | – | – | – | – | – | **kein Wert** – In den Suchauszügen nur der Gesamtdurchschnitt über alle Lehrjahre gefunden: 1 | |
| 41 | Pharmazeutisch-kaufmännische/-r Angestellte/-r (`pharmazeutisch-kaufmaennische-angestellte`) | – | – | – | – | – | **kein Wert** – In den Suchauszügen nur der Gesamtdurchschnitt über alle Lehrjahre gefunden: 925 € (BIBB 2025, Freie Berufe) | |
| 42 | Rechtsanwaltsfachangestellte/-r (`rechtsanwaltsfachangestellte`) | – | – | – | – | – | **kein Wert** – Laut BIBB gibt es für diesen Beruf keine Tarifverträge zur Ausbildungsvergütung, daher kein Wert in der Gesamtübersicht | |
| 43 | Berufskraftfahrer/-in (`berufskraftfahrer`) | Industrie und Handel (IH) | 1.114 | 1.200 | 1.290 | – |  | |
| 44 | Mediengestalter/-in Digital und Print (`mediengestalter`) | Industrie und Handel (IH), alle Fachrichtungen | 1.156 | 1.227 | 1.305 | – |  | |
| 45 | Augenoptiker/-in (`augenoptiker`) | Handwerk (Hw) | 915 | 990 | 1.062 | – |  | |
| 46 | Kaufmann/-frau im Gesundheitswesen (`kaufmann-gesundheitswesen`) | Industrie und Handel (IH) | 1.244 | 1.317 | 1.380 | – |  | |
| 47 | Chemikant/-in (`chemikant`) | Industrie und Handel (IH) | 1.185 | 1.274 | 1.345 | 1.447 |  | |
| 48 | Zerspanungsmechaniker/-in (`zerspanungsmechaniker`) | Industrie und Handel (IH) | 1.224 | 1.284 | 1.371 | 1.447 |  | |
| 49 | Elektroniker/-in für Automatisierungstechnik (`elektroniker-automatisierungstechnik`) | Industrie und Handel (IH) | 1.211 | 1.283 | 1.380 | 1.475 |  | |
| 50 | Fachmann/-frau für Systemgastronomie (`fachmann-systemgastronomie`) | – | – | – | – | – | **kein Wert** – Zeile in den Suchauszügen der BIBB-Gesamtübersicht 2025 nicht gefunden | |

### Förderungen (data/foerderungen.json)

| id | Wert / Aussage | Hinweis (intern) | Geprüft am / von |
|---|---|---|---|
| `bab` | bedarfsabhängig – die Agentur für Arbeit berechnet den Betrag für dich persönlich; muss nicht zurückgezahlt werden | Voraussetzungen aus Sekundärquellen zusammengefasst (arbeitsagentur.de gesperrt). Bewusst kein Eurobetrag: Ratgeberseiten nennen für 2026 widersprüchliche Bedarfssätze (z. B. 822 €/Monat bei eigener Wohnung). Unter-18-Regel und Erstausbildung an der Primärquelle prüfen. | |
| `aufstiegs-bafoeg` | Lehrgangs- und Prüfungsgebühren bis zu 15.000 € förderfähig, davon 50 % als Zuschuss, der Rest als zinsgünstiges Darlehen; bei bestandener Prüfung kann ein Teil des Restdarlehens erlassen werden. Bei Vollzeit-Fortbildung zusätzlich Unterhaltsbeitrag (einkommensabhängig). Kein Alterslimit. | 15.000 € und 50 % Zuschuss aus mehreren Sekundärquellen (Stand 2026). Erlass-Anteil und Unterhaltsbeitrag nicht beziffert, da nur Ratgeberseiten. Achtung: Eine Reform (u. a. höherer Zuschussanteil) ist laut Sekundärquellen als Kabinettsentwurf (Juli 2026) in Arbeit, aber noch nicht in Kraft – bei Wiedervorlage prüfen. | |
| `weiterbildungsstipendium` | bis zu 9.135 € für Weiterbildungen innerhalb von drei Jahren; je Maßnahme trägst du 10 % Eigenanteil | 9.135 € laut mehreren Quellen (u. a. IHK-Seiten, siehe docs/ZAHLEN-PRUEFEN.md Nr. 6); einzelne Sekundärquellen nennen für 2026 abweichend 8.700 € bzw. ältere 8.100 €. Wirkung des 10-%-Eigenanteils (mindert Gesamtbetrag ja/nein) widersprüchlich – an der SBB-Seite prüfen. | |
| `aufstiegsstipendium` | Vollzeitstudium: 992 € pro Monat plus 80 € Büchergeld (zusammen 1.072 €); berufsbegleitendes Studium: 3.045 € pro Jahr; einkommensunabhängig | Beträge aus Sekundärquellen (Hochschul- und Ratgeberseiten, Stand 2026), nicht an sbb-stipendien.de gelesen. Kinderbetreuungspauschale bewusst weggelassen (Angaben widersprüchlich). | |
| `bafoeg-studium` | bedarfsabhängig; Höchstsatz 992 € pro Monat (bei eigener Wohnung, inkl. Wohnpauschale 380 € und Zuschlag für Kranken- und Pflegeversicherung); in der Regel zur Hälfte Zuschuss, zur Hälfte zinsloses Darlehen mit begrenzter Rückzahlung | 992 € und Wohnpauschale 380 € für WS 2026/27 laut mehreren Sekundärquellen (Finanztip, Studis Online u. a.). Geplante Erhöhung der Wohnpauschale auf 440 € ist laut Sekundärquellen verschoben (frühestens Sommersemester 2027) und noch nicht beschlossen. Altersgrenze 45 aus Vorwissen, nicht in dieser Recherche belegt – prüfen. | |
| `deutschlandstipendium` | 300 € pro Monat, einkommensunabhängig; wird nicht auf BAföG angerechnet | 300 €/Monat, hälftig Bund und private Förderer, laut mehreren Hochschulseiten (2026/27). An deutschlandstipendium.de nicht gelesen. | |
| `kindergeld` | 259 € pro Kind und Monat (seit 1. Januar 2026), einkommensunabhängig; wird an die Eltern gezahlt | 259 € seit 01.01.2026 laut Suchauszug des Familienportals und Finanztip; Primärseite nicht direkt geöffnet (siehe docs/ZAHLEN-PRUEFEN.md Nr. 5). | |
| `meisterpraemie` | je nach Bundesland unterschiedlich – nicht jedes Bundesland zahlt eine Prämie | Bewusst ohne Länderliste und ohne Beträge: Quellen nennen widersprüchliche Stände (Jan./Apr./Nov. 2026). Link ist eine Sekundärquelle – vor Livegang durch eine amtliche oder Kammer-Übersicht ersetzen. | |
| `wohngeld` | bedarfsabhängig (abhängig von Einkommen, Miete, Wohnort und Haushaltsgröße) | Einschränkung nach § 20 Abs. 2 WoGG und Verwaltungsvorschrift, bestätigt durch Merkblätter (Hamburg, Wiesbaden, NRW-FAQ) in Suchauszügen; Gesetzestext nicht direkt gelesen. Ausnahme „BAB/BAföG nur als Darlehen“ wegen Seltenheit nicht aufgenommen. | |

### Bildungswege und Studium (Aussagen ohne Zahlen, aber prüfpflichtig)

| Datei / Stelle | Aussage | Prüfen an |
|---|---|---|
| bildungswege `meister-studium-ohne-abitur` | Meister/Fachwirt/Techniker → allgemeiner Hochschulzugang (KMK 2009) | Q22 |
| bildungswege `berufserfahrung-studium-ohne-abitur` | Ausbildung + i. d. R. 3 Jahre Berufserfahrung → fachgebundener Hochschulzugang | Q22 |
| bildungswege, berufe `aufstieg` | DQR 4 (3-jährige Ausbildung), DQR 3 (2-jährige), DQR 6 (Meister/Fachwirt/Techniker/Bachelor/Rechtsfachwirt/Steuerfachwirt), DQR 7 (Betriebswirt/Master) | Q23 |
| bildungswege `schulformen` | Bezeichnungen Erster/Mittlerer Schulabschluss, FOS mit Ausbildung oft nur Klasse 12, BOS-Abschlüsse | Q21, Kultusministerien |
| foerderungen `bafoeg-studium` | Altersgrenze unter 45 Jahren bei Studienbeginn | Q12 (aus Vorwissen) |
| studium `medizin` | zentrale Vergabe über die Stiftung für Hochschulzulassung | Q20 |
| studium `dual-pflege` | Pflegestudium mit Vertrag beim Träger und Berufserlaubnis | Pflegeberufegesetz |
| studium `rechtswissenschaft` | `dauer_semester` 10 (je nach Land 9 oder 10) | Juristenausbildungsgesetze der Länder |

## Wichtigste Lücken

1. **Anlagenmechaniker/-in SHK** (Top-10-Beruf) hat keine Vergütung: Die Zeile war im Auszug nicht lesbar, und die
   Sekundärquelle war nicht verlässlich.
2. **Steuer- und Rechtsanwaltsfachangestellte:** Laut BIBB gibt es keine Tarifverträge. Ein Wert lässt sich nur
   mit den Empfehlungen der Kammern ergänzen, und dafür wäre eine Entscheidung zur Darstellung nötig.
3. **Tiermedizinische Fachangestellte und PKA:** Bekannt ist nur der Gesamtdurchschnitt (1.014 € bzw. 925 €),
   keine Werte je Lehrjahr.
4. **Systemgastronomie:** Kein Wert gefunden. Der Spedition-Wert stammt nur aus einer Sekundärquelle, der
   Mechatroniker-Wert nur aus einer Websuche-Zusammenfassung.
5. **Spaltenzuordnung** aller BIBB-Werte ist unbestätigt (siehe oben).
6. **Auswahl der 50 Berufe** ist nicht an der vollständigen Tab. 67 geprüft.
7. **Förderbeträge** stammen nur aus Sekundärquellen. Das BAB-Bedarfsniveau 2026 ist ungeklärt. Bei den
   Meisterprämien gibt es keine Länderliste.

## Wiedervorlage (jährlich)

| Wann | Was | Quelle |
|---|---|---|
| jährlich zum 1. Januar | Kindergeld, Mindestausbildungsvergütung (§ 17 BBiG), Aufstiegsstipendium/BAföG-Sätze, Meisterprämien der Länder | Q14, BIBB/BMFTR, Q11, Q12, Q16 |
| jährlich im Frühjahr | BIBB-Gesamtübersicht tarifliche Ausbildungsvergütungen (erscheint meist zum Jahreswechsel, Stichtag 1.10.) → alle `verguetung`-Werte ersetzen, `stand` anpassen | Q1, Q3 |
| jährlich im Dezember | BIBB-Rangliste der Neuabschlüsse (Stichtag 30.9.) → Auswahl der 50 Berufe prüfen | Q5 |
| zum Semesterstart (April/Oktober) | BAföG-Reform (Wohnpauschale 440 € geplant), Aufstiegs-BAföG-Reform (Kabinettsentwurf 07/2026), Deutschlandstipendium | Q9, Q12, Q13 |
| jährlich (Herbst) | Destatis Studierende nach Fächern, BIBB AusbildungPlus | Q17–Q19 |
| bei Gesetzesänderung | § 20 WoGG, KMK-Beschlüsse, Neuordnung von Ausbildungsberufen (z. B. neue Berufsnamen) | Q15, Q21, Q22 |
