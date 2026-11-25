# Mandatsanfrage: Steuerliche Prüfung des Fördervereinsmodells der Plattform Edufy

> **Vorbereitet mit KI-Unterstützung – Bewertung durch Steuerberater erbeten.**
> Stand: 25.11.2026. Absender: Marcus [Nachname], Edufy (GmbH in Planung), hallo@edufy.world.
> Werte und Normzitate stammen aus einer Vorrecherche mit Sekundärquellen. Wortlaut und aktuelle Fassung haben wir nicht an Primärquellen geprüft.

---

## 1. Mandatsanfrage

Wir planen die Gründung einer GmbH, die die Online-Plattform Edufy betreibt. Edufy bringt Schülerinnen und Schüler, Schulen, Schulfördervereine und Unternehmen zusammen. Unternehmen zahlen für den Zugang. Die Schulfördervereine sollen eine feste Beteiligung von 30 % an den Unternehmensumsätzen ihrer Schule erhalten, und zwar als Vergütung, nicht als Spende. Wir bitten Sie, unsere vorläufige steuerliche Einschätzung für die GmbH, die Fördervereine und die zahlenden Unternehmen zu prüfen, uns bei der Gründung zu begleiten und uns zu sagen, welche Unterlagen wir für eine rechtssichere Abrechnung brauchen.

---

## 2. Sachverhalt

### 2.1 Beteiligte

| Beteiligter | Rolle | Stand |
|---|---|---|
| **Edufy GmbH** (noch nicht gegründet) | Betreibt die Plattform edufy.world | Sitz im Inland, Regelbesteuerung geplant (siehe Frage 4). Vor der Gründung finden nur interne Tests statt, ohne echte Nutzer und ohne Umsätze. |
| **Unternehmen** | Kunden von Edufy | Erhalten Firmenprofil, Angebote (Praktika, Ausbildung), Veranstaltungen und anonyme Statistiken je Schule. Personenbezogene Schülerdaten gibt es nur, wenn ein Schüler selbst Kontakt aufnimmt. Abrechnung später über Stripe (Stripe Payments Europe Ltd., Irland). |
| **Schulförderverein** | Vertriebs- und Einführungspartner an seiner Schule | In der Regel ein eingetragener, gemeinnütziger Verein (§ 52 Abs. 2 Nr. 7 AO, Mittelweitergabe nach § 58 Nr. 1 AO). Viele dürften umsatzsteuerlich Kleinunternehmer sein. |
| **Schule / Schulträger** | Bildungseinrichtung | Kein Vertragspartner im Zahlungsfluss. Die Schulleitung stimmt formal zu, bevor der Verein tätig wird. |
| **Schüler / Eltern** | Nutzer | Kostenlos. |

### 2.2 Geldflüsse

```
                 Entgelt für Plattformleistung
                 (netto + 19 % USt, über Stripe)
 Unternehmen  ─────────────────────────────────▶  Edufy GmbH
                                                       │
                       30 % der Nettoerlöse der Schule │  Vergütung per Gutschrift
                       (+ USt, wenn regelbesteuert)    ▼  (§ 14 Abs. 2 Satz 2 UStG)
                                                  Förderverein
                                                       │
                                   satzungsgemäße      ▼  Mittelweitergabe
                                                 Schule / Schulträger
```

| Zahlung | Von → an | Rechtsgrund | Beleg | Zeitraum |
|---|---|---|---|---|
| Nutzungsentgelt | Unternehmen → Edufy | Unternehmensvertrag (Laufzeit in der Regel ein Jahr) | Rechnung von Edufy | erst nach der Pilotphase |
| Vergütung 30 % | Edufy → Förderverein | Jahresvereinbarung mit dem Verein | Gutschrift von Edufy | ab dem ersten zahlenden Unternehmen, z. B. quartalsweise |
| Mittelweitergabe | Förderverein → Schule | Satzung des Vereins | Beleg des Vereins | Sache des Vereins |
| Pilotphase | – | Pilotvereinbarungen | – | **keine Zahlungen** in beide Richtungen |

**Bemessungsgrundlage (vorgesehen, noch nicht endgültig):** 30 % der Nettoentgelte, die Edufy für Unternehmensverträge vereinnahmt, die der Schule zugeordnet sind, nach Erstattungen und Stornos. Noch offen sind drei Punkte: ob Stripe-Gebühren abgezogen werden, wie Unternehmen mit mehreren Schulen aufgeteilt werden und in welchem Rhythmus abgerechnet wird.

### 2.3 Gegenleistungen des Vereins

Den Vertragstext der Jahresvereinbarung gibt es noch nicht. Vorgesehen ist, dass der Verein **aktiv** mitwirkt:

- die Schule registrieren und die formale Zustimmung der Schulleitung einholen,
- Schulleitung, Eltern und Schüler über Edufy informieren und Einladungslinks oder QR-Codes weitergeben,
- Edufy gestatten, den Verein und die Schule als Partner zu nennen,
- gegebenenfalls Unternehmen auf Edufy hinweisen.

**Nicht** vorgesehen sind physische Werbeflächen an der Schule, eine hervorgehobene Werbung des Vereins für einzelne Unternehmen und Spendenquittungen. Werbe- und Infomaterial bezahlt Edufy. Der Verein soll keine Vereinsmittel für Edufy ausgeben.

### 2.4 Zeitplan

| Phase | Inhalt | Steuerlich relevante Vorgänge |
|---|---|---|
| **1. Interner Test** (laufend) | Entwicklung und Tests nur mit Testdaten, ohne Livegang | Kosten für Entwicklung, Hosting und Domain trägt der Gründer privat. Es gibt keine Umsätze. |
| **2. GmbH-Gründung** (nach Abschluss der Tests, Termin offen, voraussichtlich 2027) | Notartermin, Eintragung, steuerliche Erfassung | Einlage, gegebenenfalls Übertragung von Software und Domain auf die GmbH, Wahl der Umsatzbesteuerung |
| **3. Pilotphase** (6 Monate ab Start) | höchstens 20 Pilotunternehmen kostenlos; Vereine mit einer **jederzeit kündbaren Pilotvereinbarung ohne Vergütung** | keine Ausgangsumsätze, Vorsteuer aus Anlaufkosten, unentgeltliche Leistungen an Unternehmen; der Verein wird ohne Entgelt tätig |
| **4. Regelbetrieb** (nach dem Pilot) | Die **Jahresvereinbarung** mit dem Verein beginnt mit dem ersten zahlenden Unternehmen an seiner Schule | erste Ausgangsrechnungen; erste Gutschriften an Vereine |
| **5. Nachwirkung** | Endet die Jahresvereinbarung, läuft die Beteiligung für Unternehmensverträge weiter, die während ihrer Laufzeit geschlossen wurden, **bis zu deren aktuellem Laufzeitende**. Für Verlängerungen gibt es keine Beteiligung mehr. | Gutschriften nach dem Ende des Vereinsvertrags |

---

## 3. Getroffene Entscheidungen

1. Rechtsträger wird eine **GmbH**. Gegründet wird erst, wenn das Produkt intern fertig getestet ist.
2. Die Beteiligung der Fördervereine beträgt **fest 30 %** der Unternehmensumsätze über ihre Schule. Öffentlich nennen wir keinen Prozentsatz, sondern sprechen nur von einer „Beteiligung an den Einnahmen“.
3. Die Beteiligung heißt in allen Texten **„Vergütung“**, ausdrücklich **„keine Spende“**. Auf der Website steht nichts mehr zu „Spendennennung“, „Werbeflächen“ oder „rechtssicher“. Fördervereine sehen vor der Registrierung diesen Hinweis: „Die Beteiligung ist keine Spende, sondern eine Vergütung. Sie kann für Ihren Verein steuerliche Folgen haben, zum Beispiel bei der Körperschaft- oder Umsatzsteuer. Bitte klären Sie das vor der Jahresvereinbarung mit Ihrer Steuerberatung oder Ihrem Finanzamt.“
4. Die **Pilotphase dauert 6 Monate** und ist für Unternehmen kostenlos (höchstens 20 Unternehmen). Vereine erhalten im Pilot **keine Vergütung**. Sie schließen nur eine jederzeit kündbare Pilotvereinbarung.
5. Die **Jahresvereinbarung** mit dem Verein beginnt erst nach dem Pilot, mit dem ersten zahlenden Unternehmen.
6. Es gibt eine **Nachwirkung** bis zum aktuellen Laufzeitende der Unternehmensverträge (siehe 2.4).
7. Die Schulleitung muss **formal zustimmen**, bevor ein Verein tätig wird.
8. Zahlungen laufen später über **Stripe**. Die Vereine erhalten ihre Vergütung **per Gutschrift**.

---

## 4. Unsere vorläufige Einschätzung (bitte bestätigen oder korrigieren)

**4.1 Verein: Sphäre.** Wir gehen davon aus, dass die Vergütung eine Einnahme im **steuerpflichtigen wirtschaftlichen Geschäftsbetrieb** ist (§§ 14, 64 AO). Der Verein wirkt aktiv und vertriebsähnlich mit, und die Vergütung hängt vom Umsatz ab. Ein reines Duldungsmodell (ideeller Bereich oder Vermögensverwaltung nach BMF-Sponsoringerlass vom 18.02.1998 und AEAO zu § 64) entspräche nicht der tatsächlichen Durchführung. Einen Zweckbetrieb (§ 65 AO) halten wir für ausgeschlossen.

**4.2 Verein: Freigrenze.** Nach dem Steueränderungsgesetz 2025 (BGBl. 2025 I Nr. 363) beträgt die Freigrenze des § 64 Abs. 3 AO **ab VZ 2026 50.000 €** Bruttoeinnahmen aus allen wirtschaftlichen Geschäftsbetrieben des Vereins. Für die meisten Schulfördervereine dürfte damit keine KSt und keine GewSt anfallen. Die Gemeinnützigkeit sehen wir nicht gefährdet, solange die Mittel satzungsgemäß verwendet werden. Verluste können bei einer reinen Umsatzbeteiligung nicht entstehen.

**4.3 Verein: Umsatzsteuer.** Der Verein erbringt an Edufy eine steuerbare und steuerpflichtige sonstige Leistung zu **19 %**. Den ermäßigten Satz nach § 12 Abs. 2 Nr. 8 Buchst. a UStG halten wir für nicht anwendbar, weil die Leistung im wirtschaftlichen Geschäftsbetrieb erbracht wird. Viele Vereine sind Kleinunternehmer nach § 19 UStG (Vorjahr höchstens 25.000 €, laufendes Jahr höchstens 100.000 €). Die Gutschrift muss deshalb den Status jedes einzelnen Vereins richtig abbilden, sonst droht § 14c UStG.

**4.4 Edufy: Gutschriften.** Die Gutschrift wird in der Jahresvereinbarung vorab vereinbart (§ 14 Abs. 2 Satz 2 UStG), einschließlich Widerspruchsrecht. Sie enthält die Pflichtangaben nach § 14 Abs. 4 UStG und die Bezeichnung „Gutschrift“. Steuernummer oder USt-IdNr., Anschrift und Kleinunternehmer-Status des Vereins erheben wir vor der ersten Auszahlung und lassen den Status jährlich bestätigen.

**4.5 Edufy: E-Rechnung.** Nach unserem Verständnis gilt die Ausstellungspflicht auch für Gutschriften, und es kommt auf den Vorjahresumsatz des Ausstellers an, also auf Edufy. Die Übergangsregel für Vorjahresumsätze bis 800.000 € reicht bis 31.12.2027, ab 2028 gilt die Pflicht für alle. Wir würden die Gutschriften von Anfang an als E-Rechnung (ZUGFeRD/XRechnung) erzeugen. Offen ist, wie das gegenüber Kleinunternehmer-Vereinen zu handhaben ist, auch mit Blick auf das BMF-Schreiben vom 15.10.2026.

**4.6 Edufy: Vorsteuer und Ertragsteuer.** Die Vergütung ist eine voll abziehbare Betriebsausgabe und keine Spende. Der Verein darf dafür keine Zuwendungsbestätigung ausstellen, sonst drohen die Haftungsfolgen des § 10b Abs. 4 EStG. Vorsteuer aus der Gutschrift kann Edufy nur abziehen, wenn der Verein regelbesteuert ist. Bei Kleinunternehmer-Vereinen ist die Vergütung reiner Nettoaufwand.

**4.7 Unternehmen.** Die Zahlungen an Edufy sind Entgelt für eine Plattform- und Recruitingleistung. Sie sind als Betriebsausgaben abziehbar, die Vorsteuer aus der Edufy-Rechnung ebenfalls. Der Sponsoringerlass greift im Verhältnis Unternehmen zu Edufy nicht. Einen Spendenabzug gibt es nicht, und wir werden keinen suggerieren.

**4.8 Gemeinnützigkeit in der Pilotphase ohne Vergütung.** Der Verein wird bis zu 6 Monate ohne Entgelt für ein gewerbliches Unternehmen tätig. Wir sehen darin ein **niedriges bis mittleres Risiko** im Hinblick auf § 55 Abs. 1 Nr. 3 AO (Begünstigung Dritter) und § 56 AO. Es bleibt beherrschbar, wenn der Verein nur ehrenamtliche Zeit und keine Vereinsmittel einsetzt und Edufy alle Sachkosten trägt. Außerdem lässt sich das Engagement als Anlaufphase einer später vergüteten Tätigkeit verstehen und zugleich als Beitrag zur Berufsorientierung der Schüler.

**4.9 Nachwirkung.** Die Zahlungen nach dem Ende der Jahresvereinbarung verstehen wir als nachträgliches Entgelt für die Leistung, die der Verein während der Laufzeit erbracht hat. Damit bleiben sie Einnahmen im wirtschaftlichen Geschäftsbetrieb und zählen im Jahr des Zuflusses zur Freigrenze. Ungeklärt ist uns, wann die Umsatzsteuer entsteht, nach welchem Status (Kleinunternehmer oder nicht) abzurechnen ist und ob die Nachwirkung als Teil einer einheitlichen Leistung oder als eigenständige Leistung zu behandeln ist.

---

## 5. Fragen an Sie (priorisiert)

### A. Vor der Gründung (einschließlich Vorbereitung des Piloten, der unmittelbar nach der Gründung beginnt)

1. **Gründung und Stammkapital:** Reicht eine Bargründung mit dem Mindeststammkapital von 25.000 € und hälftiger Einzahlung (§§ 5, 7 GmbHG) aus? Wäre angesichts des Anlaufs ohne Umsätze ein höheres Kapital oder ein Gesellschafterdarlehen sinnvoll?
2. **Einbringung von Vorleistungen:** Website, Software und Domain hat der Gründer privat vor der Gründung entwickelt bzw. erworben. Wie sollten sie auf die GmbH übergehen (Sacheinlage, Kauf, Lizenz, unentgeltliche Überlassung)? Welche Steuerfolgen hat das beim Gründer und bei der GmbH (verdeckte Einlage, vGA, Bewertung)?
3. **Vorgründungskosten:** Kann die GmbH die vor der Gründung angefallenen Kosten (Entwicklung, Hosting, Beratung) als Betriebsausgaben und für die Vorsteuer geltend machen? Was ist dafür zu dokumentieren?
4. **Umsatzsteuer in der Anlaufphase:** Empfehlen Sie wegen der Pilotphase ohne Umsätze die Kleinunternehmerregelung für die GmbH oder die Regelbesteuerung? Wir vermuten Regelbesteuerung, wegen des Vorsteuerabzugs aus den Anlaufkosten und wegen der ab dem Regelbetrieb zu erwartenden Umsätze. Welche Grenze gilt im Gründungsjahr nach § 19 UStG in der Fassung ab 2025, und welche Bindung hat ein Verzicht?
5. **Steuerliche Erfassung:** Welche Angaben sollten wir im Fragebogen zur steuerlichen Erfassung machen (voraussichtliche Umsätze, Sollversteuerung, USt-IdNr. für die Stripe-Beziehung)? Bis wann ist er einzureichen?
6. **Kostenlose Pilotleistungen an Unternehmen:** Ist die unentgeltliche Bereitstellung der Plattform an bis zu 20 Pilotunternehmen eine unentgeltliche Wertabgabe (§ 3 Abs. 9a UStG)? Oder handelt es sich um eine unternehmerisch veranlasste Anlaufleistung ohne Umsatzsteuerfolgen und ohne Vorsteuerkürzung?
7. **Gemeinnützigkeit in der Pilotphase:** Gefährdet die unentgeltliche Mitwirkung eines gemeinnützigen Fördervereins für Edufy über bis zu 6 Monate dessen Steuerbegünstigung (§ 55 Abs. 1 Nr. 3, §§ 56, 57 AO)? Wo verläuft die Grenze zwischen unschädlicher ehrenamtlicher Zeit und schädlichem Mitteleinsatz? Was sollte die Pilotvereinbarung dazu regeln (Kostentragung durch Edufy, Hinweis auf eine spätere Vergütung)?
8. **Beginn des wirtschaftlichen Geschäftsbetriebs:** Beginnt beim Verein der wirtschaftliche Geschäftsbetrieb bzw. die Unternehmereigenschaft (§ 2 UStG) schon mit der unvergüteten Pilottätigkeit oder erst mit der Jahresvereinbarung? Hat das Folgen für Erklärungspflichten?
9. **Nähebeziehungen:** Was gilt, wenn ein Gesellschafter oder Geschäftsführer der GmbH zugleich im Vorstand eines teilnehmenden Fördervereins sitzt (vGA, Fremdvergleich, § 55 AO)? Reichen einheitliche Konditionen für alle Vereine aus?

### B. Vor der ersten Jahresvereinbarung und der ersten Gutschrift

10. **Sphäre:** Teilen Sie die Einordnung der Vergütung als Einnahme im steuerpflichtigen wirtschaftlichen Geschäftsbetrieb bei den unter 2.3 beschriebenen Gegenleistungen?
11. **Gestaltungsspielraum:** Lässt sich ein Teil der Vergütung tragfähig der Vermögensverwaltung zuordnen, etwa für die Überlassung von Namensrechten oder die Duldung der Partnernennung? Wie hoch schätzen Sie das Risiko einer Umqualifizierung ein? Wir neigen dazu, den wirtschaftlichen Geschäftsbetrieb offen anzunehmen.
12. **Freigrenze:** Bestätigen Sie die Freigrenze von 50.000 € nach § 64 Abs. 3 AO ab VZ 2026 einschließlich Umsatzsteuer, den Verzicht auf die Sphärenzuordnung unterhalb der Grenze und die Übergangsregel in Art. 97 § 1b EGAO?
13. **Umsatzsteuersatz und Befreiungen:** Ist die Leistung des Vereins mit 19 % steuerpflichtig, und sind § 12 Abs. 2 Nr. 8 Buchst. a UStG sowie Steuerbefreiungen (z. B. § 4 Nr. 21/22 UStG) sicher ausgeschlossen?
14. **Vergütungsklausel:** Wie sollten wir formulieren, damit Kleinunternehmer und regelbesteuerte Vereine richtig abgerechnet werden? Unser Entwurf: „30 % der Nettoerlöse zzgl. gesetzlicher USt, soweit der Verein nicht Kleinunternehmer nach § 19 UStG ist“. Sollen Stripe-Gebühren die Bemessungsgrundlage mindern?
15. **Gutschrift-Pflichtangaben:** Welche Pflichtangaben braucht die Gutschrift an (a) regelbesteuerte und (b) Kleinunternehmer-Vereine? Gilt § 34a UStDV auch bei Gutschriften? Wie müssen die Gutschriftvereinbarung und die Widerspruchsregel formuliert sein?
16. **E-Rechnung:** Muss Edufy Gutschriften an Kleinunternehmer-Vereine als E-Rechnung ausstellen? Welche Übergangsfrist gilt für Edufy im ersten Geschäftsjahr? Was folgt aus dem BMF-Schreiben vom 15.10.2026 für Storno- und Korrekturgutschriften?
17. **Statusfehler:** Wie gehen wir vor, wenn ein Verein im laufenden Jahr die 100.000 €-Grenze überschreitet oder seinen Status falsch gemeldet hat (Korrekturgutschrift, § 14c UStG, Widerspruch)?
18. **Nachwirkung, Umsatzsteuer:** Ist die Vergütung, die nach dem Vertragsende für fortlaufende Unternehmensverträge gezahlt wird, Entgelt für die während der Laufzeit erbrachte Leistung oder für eine eigene Leistung? Wann entsteht die Steuer (Soll- bzw. Istversteuerung des Vereins, § 13 UStG)? Nach welchem Kleinunternehmer-Status ist abzurechnen, wenn sich der Status zwischen Leistung und Zahlung ändert?
19. **Nachwirkung, Ertragsteuer und Bilanzierung:** Ordnen Sie die Nachwirkungszahlungen beim Verein im Jahr des Zuflusses dem wirtschaftlichen Geschäftsbetrieb zu? Muss Edufy für künftige Nachwirkungszahlungen eine Rückstellung oder Verbindlichkeit bilden?
20. **Stripe:** Wie sind die Gebühren von Stripe Payments Europe Ltd. (Irland) bei Edufy umsatzsteuerlich zu behandeln (§ 13b UStG, § 4 Nr. 8 UStG)?
21. **Hinweise an Vereine:** Wie weit dürfen wir Vereinen gegenüber gehen, ohne unbefugt Hilfe in Steuersachen zu leisten (§§ 2, 5 StBerG)? Dürfen wir in einem Hinweisblatt allgemein Freigrenzen und Kleinunternehmergrenzen nennen? Ist der zitierte Hinweis aus Abschnitt 3 Nr. 3 unbedenklich?
22. **Satzung:** Müssen typische Schulfördervereine ihre Satzung für diese Tätigkeit anpassen? Welche Klauseln sollten sie vorab prüfen (Förderzweck, Ausschluss wirtschaftlicher Tätigkeit, Vertretungsbefugnis des Vorstands)?

### C. Laufend

23. **Jahresübersicht:** Sollte Edufy den Vereinen eine jährliche Übersicht der Bruttozahlungen schicken (wegen Freigrenze und Kleinunternehmergrenze)? Welche Angaben gehören hinein?
24. **Gepräge:** Ab welchem Verhältnis von Edufy-Einnahmen zu ideellen Einnahmen eines Vereins würden Sie vor einer Prägung durch den wirtschaftlichen Geschäftsbetrieb warnen?
25. **Mittelverwendung:** Bestätigen Sie, dass die Pflicht zur zeitnahen Mittelverwendung ab 2026 für Körperschaften mit Jahreseinnahmen bis 100.000 € entfällt?
26. **GoBD und Aufbewahrung:** Welche Anforderungen gelten für automatisch erzeugte Gutschriften (Aufbewahrungsfrist nach § 147 AO in der aktuellen Fassung, Unveränderbarkeit, Verfahrensdokumentation)?
27. **Direktspenden:** Wie trennen wir eine echte Direktspende eines Unternehmens an einen Verein, mit Danke-Nennung, sauber vom Plattformvertrag, damit kein Doppelvorteil aus Betriebsausgabe und Spendenabzug entsteht?
28. **Verbindliche Auskunft:** Empfehlen Sie eine verbindliche Auskunft nach § 89 Abs. 2 AO, z. B. durch Edufy oder einen Muster-Verein? Oder raten Sie den Vereinen eher zu einer formlosen Abstimmung mit ihrem Finanzamt? Was würde eine verbindliche Auskunft kosten, und wie lange dauert sie?

---

## 6. Gewünschte Liefergegenstände

1. **Kurze schriftliche Stellungnahme** zu Abschnitt 4 und zu den Fragen 1–28. Die Fragen der Gruppe A brauchen wir **vor der Gründung**, die der Gruppe B vor der ersten Jahresvereinbarung.
2. **Muster-Hinweisblatt für Fördervereine** (1–2 Seiten), das wir vor Vertragsschluss aushändigen dürfen, ohne Steuerrat zu erteilen: keine Spende, mögliche Einordnung, Umsatzsteuer und Kleinunternehmer, Empfehlung zur eigenen Beratung.
3. **Gutschrift-Muster** mit allen Pflichtangaben für regelbesteuerte und Kleinunternehmer-Vereine, einschließlich Storno- bzw. Korrekturgutschrift und der Formulierung der Gutschriftvereinbarung für die Jahresvereinbarung.
4. **Empfehlung zur verbindlichen Auskunft** (ja oder nein, durch wen, mit welcher Fragestellung).
5. **Gründungsberatung** zu den Fragen 1–6 (Kapital, Einbringung, Vorgründungskosten, Umsatzbesteuerung, steuerliche Erfassung). Gegebenenfalls möchten wir Sie auch für die laufende Buchhaltung und die Steuererklärungen der GmbH beauftragen, bitte getrennt anbieten.

**Bitte um Kostenschätzung:** Wir bitten um eine Kostenschätzung bzw. ein Angebot je Liefergegenstand (Pauschale oder Zeitrahmen nach StBVV) und um einen realistischen Zeitplan. Falls Sie einzelne Punkte, etwa die Gemeinnützigkeitsfragen, an einen spezialisierten Kollegen geben würden, sagen Sie uns das bitte.

---

## 7. Anlagen

1. Ausführliche steuerliche Vorprüfung des Fördervereinsmodells vom 25.11.2026 mit Normen, Risikotabelle und Quellenliste (KI-gestützt, nicht durch einen Berufsträger geprüft).
2. Auszug der aktuellen Website-Texte zur Beteiligung und zum Steuerhinweis für Fördervereine (Registrierungsseite, Bestätigungsseite, Vorlage für den Vereinsvorstand).
3. Geplante Datenfelder für die Abrechnung, Stand Entwurf:
   - Verein: Anschrift, Steuernummer bzw. USt-IdNr., Kleinunternehmer-Status mit Bestätigungsdatum, Finanzamt, Datum des Freistellungsbescheids, Annahme der Gutschriftvereinbarung, Vertragsbeginn und -ende.
   - Gutschrift: Bemessungsgrundlage, Netto, Steuersatz, USt, Brutto, Leistungszeitraum, Gutschriftnummer und -datum, Verweis auf korrigierte Gutschrift.
4. Entwurf der Jahres- und Pilotvereinbarung mit Fördervereinen. Wird nachgereicht, sobald die anwaltliche Prüfung vorliegt.

Für Rückfragen stehen wir gern zur Verfügung, auch für ein kurzes Erstgespräch.
