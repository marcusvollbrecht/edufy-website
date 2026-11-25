# Mandatsanfrage Edufy – Briefing für die anwaltliche Prüfung

> **Vorbereitet mit KI-Unterstützung – Bewertung durch Rechtsanwalt erbeten.**
> Stand: 25.11.2026 · Absender: [Name], Gründer Edufy, [Anschrift], hallo@edufy.world, [Telefon]
> Empfänger: [Kanzlei, Ansprechpartner/in]

---

## 1. Mandatsanfrage

Wir gründen eine GmbH, die unter der Marke „Edufy“ (edufy.world) eine Online-Plattform zur Berufs- und Studienorientierung betreibt. Die Plattform verbindet Schülerinnen und Schüler, Eltern, Schulen, Schulfördervereine und Unternehmen. Die Fördervereine werden an den Einnahmen aus Unternehmensverträgen beteiligt.
Wir bitten um eine rechtliche Prüfung des Modells, vor allem zu Strafrecht (§ 331 StGB), Schulrecht der Länder, Datenschutz bei Minderjährigen sowie Vertrags- und Wettbewerbsrecht. Außerdem bitten wir um die Erstellung bzw. Prüfung der Vertragsdokumente.
Ziel ist eine Freigabe, bevor wir die GmbH gründen und die Pilotphase mit echten Nutzerinnen und Nutzern beginnt.

---

## 2. Sachverhalt

### 2.1 Geschäftsmodell und Beteiligte

| Beteiligte | Rolle | Vertragsbeziehung zu Edufy |
|---|---|---|
| **Edufy** (künftige GmbH) | Betreiberin der Plattform | – |
| **Schülerinnen und Schüler** (überwiegend 14–19 Jahre, viele minderjährig) | Nutzen die Plattform kostenlos: Notenprofil, Berufsorientierung, Überblick über Förderungen, Praktikums- und Ausbildungsangebote (Funktionen überwiegend noch in Entwicklung) | Nutzungsverhältnis, unentgeltlich |
| **Eltern** | Geben die Nutzung bei Kindern unter 16 frei (siehe 2.3) | keine eigene, ggf. Zustimmung zum Nutzungsverhältnis des Kindes |
| **Schulfördervereine** (eingetragene, in der Regel gemeinnützige Vereine) | Wichtigster Vertriebskanal: Sie machen Edufy an ihrer Schule bekannt, z. B. mit einem Einladungslink für Schülerinnen, Schüler und Eltern | Pilotvereinbarung, danach Jahresvereinbarung (siehe 2.5) |
| **Schulleitung** | Stimmt formal zu, bevor der Förderverein aktiv wird | keine; die Schule übernimmt keine Pflichten gegenüber Edufy |
| **Unternehmen** (Ausbildungsbetriebe) | Stellen sich und ihre Ausbildungs- und Praktikumsangebote vor, sehen anonyme Statistiken je Schule, erhalten Kontaktanfragen von Schülerinnen und Schülern | Pilotvereinbarung (kostenlos), danach entgeltlicher Vertrag |

Edufy verkauft **keine Werbung im Schulgebäude** und keine Werbeflächen der Schule. Die Unternehmen präsentieren sich ausschließlich **auf der Plattform**. Die Jugendlichen nutzen sie freiwillig, auch außerhalb des Unterrichts.

### 2.2 Geldflüsse

```
Unternehmen ──(Entgelt für Plattformleistungen, nach dem Pilot über Stripe)──▶ Edufy
Edufy ──(30 % der Netto-Entgelte aus Unternehmensverträgen, die der Schule zugeordnet sind; per Gutschrift)──▶ Förderverein
Förderverein ──(satzungsgemäße Mittelverwendung)──▶ Schule / Schulträger
```

- Der Anteil ist **fest 30 %** und für alle Vereine gleich. **Öffentlich nennen wir keinen Prozentsatz.** Auf der Website steht nur „Beteiligung an den Einnahmen“, die Einzelheiten erklären wir im persönlichen Gespräch.
- Die Zahlung ist eine **Vergütung für Leistungen des Vereins, keine Spende**. Zuwendungsbestätigungen werden dafür nicht ausgestellt. Eine steuerliche Vorprüfung liegt vor und wird parallel einem Steuerberater vorgelegt. Ihr Ergebnis: Beim Verein liegt wahrscheinlich ein steuerpflichtiger wirtschaftlicher Geschäftsbetrieb vor, mit Umsatzsteuer, soweit der Verein nicht Kleinunternehmer ist.
- An Schulleitungen, Lehrkräfte oder andere Einzelpersonen fließt **kein Geld**. Die Schule selbst erhält von Edufy ebenfalls nichts.
- In der Pilotphase zahlen die Unternehmen nichts. Deshalb erhält auch der Verein in dieser Zeit nichts.
- Offen sind noch die Zuordnungsregel bei Unternehmen, die mit mehreren Schulen arbeiten, und die genaue Bemessungsgrundlage (z. B. vor oder nach Zahlungsdienstleister-Gebühren).

### 2.3 Datenflüsse: wer welche Daten sieht

| Datenkategorie | Erhoben von | Sichtbar für | Stand |
|---|---|---|---|
| **Warteliste**: Name, E-Mail, ggf. Organisation, Funktion, Bundesland, Zahl der Ausbildungsplätze, Rolle (Elternteil, Schüler/in ab 16, Lehrkraft) | Interessenten | nur Edufy | umgesetzt; Rechtsgrundlage Einwilligung; Double-Opt-In geplant |
| **Förderverein-Registrierung**: Vereinsname, Schule (Name, Schulform, Anschrift, Bundesland), Gemeinnützigkeit (ja/nein/unklar), optional Registernummer und Registergericht; Ansprechperson: Vor- und Nachname, Funktion im Vorstand, E-Mail, optional Telefon, Bestätigung der Vertretungsbefugnis | Vorstandsmitglied | Edufy; künftig die Schulleitung (Zustimmungslink mit Vereins- und Ansprechpersonendaten) | umgesetzt, nicht live; Rechtsgrundlage Art. 6 Abs. 1 lit. b DSGVO (Konto) und lit. f DSGVO (Kommunikation, freiwillige Telefonnummer), ohne Einwilligungs-Checkbox |
| **Schülerkonto**: geplant u. a. E-Mail, Schule, Klassenstufe/Alter, Noten, Zielberuf, Interessen; bei unter 16-Jährigen E-Mail eines Elternteils | Schüler/in | Edufy; Schüler/in selbst | in Planung |
| **Statistiken je Schule**: z. B. Interesse an Berufsfeldern, aggregiert | Edufy | Unternehmen, Förderverein der Schule | geplant; Mindestgröße je Auswertungszelle (z. B. 10 Personen) vorgesehen |
| **Kontaktanfrage** an ein Unternehmen: die Angaben, die die Schülerin oder der Schüler freigibt | Schüler/in | nur das angefragte Unternehmen | geplant |

Festgelegte Grundsätze:
- Unternehmen sehen **nur Statistiken je Schule**. Personenbezogene Daten erhalten sie erst, wenn eine Schülerin oder ein Schüler **selbst aktiv Kontakt** zu einem Unternehmen aufnimmt.
- **Unter 16 Jahren:** Das Konto bleibt eingeschränkt (keine Unternehmenskontakte), bis ein Elternteil über einen **Freigabelink per E-Mail** zustimmt. Vorgesehene Zusatzmaßnahmen:
  - Eltern-Adresse ungleich Schüler-Adresse,
  - ausdrückliche Bestätigung der Sorgeberechtigung mit Namen,
  - Protokoll mit Zeitpunkt und Textversion,
  - Info-Mail an die Eltern bei der ersten Kontaktaufnahme des Kindes,
  - Widerruf jederzeit.
- Der Förderverein hat **keinen Zugriff auf Schülerdaten**, sondern nur auf aggregierte Statistiken seiner Schule.
- Daten werden nicht verkauft. Es gibt keine Analyse- oder Werbe-Cookies. Alle Bibliotheken und Schriften werden vom eigenen Server ausgeliefert, nicht über ein externes CDN. Im Browser wird nur ein technisch erforderliches Anmelde-Token gespeichert (§ 25 Abs. 2 Nr. 2 TDDDG).
- Geplant ist ein **Matching** („Fit-Score“) zwischen Notenprofil und Berufen bzw. Angeboten. Daran knüpft keine automatisierte Entscheidung mit Rechtswirkung an.

### 2.4 Rolle der Schulleitung
Bevor ein Förderverein aktiv wird, stimmt die Schulleitung formal zu, und zwar über einen Link, den Edufy ihr schickt. Die Zustimmung soll Folgendes umfassen:
- Kenntnis des Angebots,
- **Kenntnis, dass der Verein an den Einnahmen von Edufy beteiligt wird**,
- Einverständnis, dass der Verein Edufy an der Schule bekannt macht.

Vertragliche Pflichten der Schule gegenüber Edufy entstehen nicht. Daten der Schule an Edufy sind nicht vorgesehen. Wir wissen, dass je nach Land weitere Gremien beteiligt werden müssen (z. B. Schulkonferenz und Schulträger in NRW nach § 99 SchulG NRW) und dass Bayern restriktiv ist (Art. 84 BayEUG). Ein länderspezifisches Infoschreiben für Schulleitungen wollen wir erst nach Ihrer Stellungnahme erstellen.

### 2.5 Pilotphase und Vertragsarchitektur
- **Unternehmen:** Die Pilotphase dauert **6 Monate**, ist **kostenlos** und auf **höchstens 20 Pilotunternehmen** begrenzt. Sie verlängert sich nicht automatisch in einen kostenpflichtigen Vertrag. Die Preise danach legen wir anhand des Feedbacks fest. Nur Unternehmer (§ 14 BGB).
- **Förderverein in der Pilotphase:** eine kurze, **jederzeit kündbare Pilotvereinbarung** ohne Vergütung. Werbematerial stellt Edufy auf eigene Kosten, damit der Verein keine Vereinsmittel für Edufy einsetzt.
- **Jahresvereinbarung Förderverein:** Sie beginnt **erst nach der Pilotphase**, und zwar mit dem ersten zahlenden Unternehmen. Laufzeit 12 Monate. Die Eckpunkte stehen fest, ein Vertragstext existiert noch nicht:
  - Wirksamkeit erst mit der Zustimmung der Schulleitung bzw. der Gremien,
  - Leistungsbeschreibung des Vereins,
  - Vergütung 30 % netto zuzüglich USt, soweit der Verein nicht Kleinunternehmer ist,
  - Gutschriftverfahren,
  - Ausschluss von Zuwendungsbestätigungen,
  - Sonderkündigungsrechte (u. a. Widerruf der Zustimmung der Schulleitung),
  - ein Verein je Schule.
- **Nachwirkung:** Für Unternehmensverträge, die während der Laufzeit geschlossen wurden, wird die Beteiligung **bis zu deren aktuellem Laufzeitende** weitergezahlt, nicht für Verlängerungen.
- **Hinweis:** Die Website-Texte zum Ablauf für Fördervereine beschreiben noch den Stand vor dieser Entscheidung („Jahresvereinbarung, erst dann wird Ihr Verein aktiv“). Die Pilotvereinbarung wird nachgetragen.

### 2.6 Rechtsform und Zeitplan
1. **Jetzt:** ausschließlich interner Test. Keine echten Nutzerinnen und Nutzer, kein öffentlicher Livegang, keine echten personenbezogenen Daten. Getestet wird nur mit Testdaten.
2. **Danach:** Gründung einer **GmbH**, sobald Dokumente und Technik stehen. Erst dann werden Impressum und Datenschutzerklärung mit den Angaben der Gesellschaft vervollständigt.
3. **Danach:** Website-Livegang und Pilotstart (Fördervereine, Schulleitungen, bis zu 20 Unternehmen; ob Schülerkonten schon im Pilot freigeschaltet werden, ist noch offen – wir haben die Minderjährigen-Fragen vorsorglich vorgezogen).
4. **Nach 6 Monaten:** entgeltliche Unternehmensverträge, Jahresvereinbarungen mit Fördervereinen, Zahlungsabwicklung über Stripe.

**Datenschutzbeauftragte/r:** Wir wollen eine **interne Person** benennen, die nicht der Geschäftsführung angehört, und sie fachlich schulen lassen. Wir gehen davon aus, dass eine Datenschutz-Folgenabschätzung (DSFA) Pflicht ist und daraus die Pflicht zur Benennung nach § 38 Abs. 1 S. 2 BDSG folgt.

### 2.7 Technische Dienstleister
| Dienstleister | Zweck | Übermittlungsgrundlage (vorläufig) |
|---|---|---|
| **Vercel Inc.** (USA) | Hosting und Auslieferung der Website | EU-US Data Privacy Framework; Standardvertragsklauseln laut Vercel-DPA; DPF-Eintrag vor Abschluss zu prüfen |
| **Supabase, Inc.** (USA) | Datenbank (Postgres mit zeilenbasierter Zugriffskontrolle), Authentifizierung, E-Mail-Bestätigung | Region EU (Frankfurt) vorgesehen; Standardvertragsklauseln (Modul 2) laut Supabase-DPA; eine DPF-Zertifizierung haben wir nicht gefunden |
| **Stripe** (Stripe Payments Europe Ltd., Irland; Konzern USA) | ab dem Ende des Pilots: Abrechnung mit Unternehmen (Billing, SEPA, Rechnung); Gutschriften an Vereine | Rolle (Auftragsverarbeiter oder eigener Verantwortlicher) offen; nur Unternehmensdaten, keine Schülerdaten |
| E-Mail-Postfach / Versanddienst | Kontakt, Bestätigungs- und Freigabe-E-Mails | Anbieter noch nicht festgelegt |

Die Auftragsverarbeitungsverträge sind noch **nicht abgeschlossen**. Ein Verzeichnis der Verarbeitungstätigkeiten wird angelegt.

---

## 3. Bereits getroffene Entscheidungen

1. Marke **„Edufy“**, Domain edufy.world. Die frühere Arbeitsbezeichnung wird aufgegeben.
2. Rechtsträger **GmbH**. Gegründet wird erst nach Abschluss des internen Tests, bis dahin gibt es keine echten Nutzer und keine echten Daten.
3. Förderverein-Beteiligung **30 % fix**. **Öffentlich wird kein Prozentsatz genannt.** Die Zahlung ist eine Vergütung, keine Spende.
4. **Formale Zustimmung der Schulleitung**, bevor ein Verein aktiv wird. Die Schule übernimmt keine Pflichten gegenüber Edufy.
5. Unternehmen sehen **nur Statistiken je Schule**. Schülerdaten erhalten sie erst nach **aktiver Kontaktaufnahme** durch die Schülerin oder den Schüler.
6. Unter 16 Jahren: **Eltern-Freigabe per E-Mail-Link**, bis dahin ein eingeschränktes Konto ohne Unternehmenskontakte.
7. Pilotphase für Unternehmen: **6 Monate kostenlos, höchstens 20 Unternehmen**, keine automatische Verlängerung in einen kostenpflichtigen Vertrag.
8. Förderverein: im Pilot eine **jederzeit kündbare Pilotvereinbarung**. Die **Jahresvereinbarung** beginnt erst mit dem ersten zahlenden Unternehmen nach dem Pilot. Registrierung kostenlos und unverbindlich.
9. **Nachwirkung** der Beteiligung bis zum aktuellen Laufzeitende der während der Vereinbarung geschlossenen Unternehmensverträge, nicht für Verlängerungen.
10. **Interne Person als Datenschutzbeauftragte/r**, nicht aus der Geschäftsführung, mit Fachkundeschulung.
11. Zahlungen über **Stripe**. Auszahlung an Vereine per **Gutschrift**.
12. Website-Aussagen wurden vorsorglich entschärft:
    - keine Werbeflächen an Schulen,
    - keine „Spendennennung“,
    - keine Aussage „rechtssicher in allen Bundesländern“,
    - keine Preistabellen,
    - keine fremden Marken,
    - Förderbeträge und Statistiken mit Quelle und Stand,
    - Funktionen als „geplant“ gekennzeichnet.

---

## 4. Fragen an die Kanzlei (priorisiert)

Zu jeder Frage steht unsere vorläufige Einschätzung. Bitte bestätigen oder korrigieren Sie sie.

### Gruppe I – vor Pilotstart zwingend (Go/No-Go)

**Frage 1 – Strafrecht: Vorteilsannahme durch Zustimmung der Schulleitung (§§ 331, 333 StGB)**
Die Schulleitung (Amtsträgerin bzw. Amtsträger) stimmt formal zu, und der Förderverein ihrer Schule wird dadurch an Einnahmen beteiligt. Liegt darin ein Drittvorteil im Sinne des § 331 Abs. 1 StGB, der mit der Dienstausübung verknüpft ist? Genügt der geplante Zustimmungsinhalt (Kenntnis der Beteiligung, Einverständnis mit dem Bekanntmachen, Hinweis auf Gremien) als Transparenzgrundlage? Oder braucht es eine ausdrückliche Genehmigung durch Schulträger bzw. Schulaufsicht im Sinne des § 331 Abs. 3 StGB, eine Meldung oder einen Gremienbeschluss? Gibt es Unterschiede je Land?
*Vorläufige Einschätzung:* Ein Risiko besteht, weil seit 1997 Vorteile für Dritte erfasst sind. Wir halten es für beherrschbar, wenn die Zustimmung als offene Genehmigung nach dem jeweiligen Landes-Sponsoringrecht ausgestaltet ist, der Geldfluss offengelegt wird, nur an den Verein geht und keinerlei Vorteile an Personen fließen. Ob die Zustimmung der Schulleitung allein ausreicht, bezweifeln wir.

**Frage 2 – Schulrecht der Länder: Zulässigkeit und Zuständigkeiten**
Ist das Modell in den einzelnen Ländern Werbung oder Sponsoring „an der Schule“? Das Modell: Der Förderverein macht eine Online-Plattform bekannt, auf der sich Unternehmen präsentieren, und der Verein wird an den Einnahmen beteiligt. Unter welchen Bedingungen ist es zulässig, und wer muss zustimmen (Schulleitung, Schulkonferenz, Schulträger, Schulaufsicht)? Konkret:
- (a) Ist ein Start in Bayern trotz Art. 84 BayEUG möglich?
- (b) Welche Gremien sind in NRW nach § 99 SchulG nötig?
- (c) Welche Verteilwege für Einladungslinks sind zulässig: Elternbrief über die Schule, Aushang, Schul-Messenger, Unterricht, Vereins-Newsletter?
- (d) Mit welchen Ländern würden Sie den Pilot beginnen?

*Vorläufige Einschätzung:* Solange die Schule selbst keine Gegenleistung erbringt und Unternehmen nur auf der Plattform erscheinen, liegt nach unserer Einschätzung kein Sponsoring der Schule vor. Sobald Schulkanäle genutzt werden, greift das Landesrecht. Bayern und Sachsen halten wir für restriktiv, NRW und Hessen für gremienpflichtig, die übrigen Länder sind ungeprüft. Wir würden mit einem bis zwei Ländern starten, die Sie für unproblematisch halten.

**Frage 3 – Eltern-Freigabe bei unter 16-Jährigen (Art. 8 DSGVO)**
Genügt die Freigabe per E-Mail-Link mit den Zusatzmaßnahmen aus 2.3 den „angemessenen Anstrengungen“ nach Art. 8 Abs. 2 DSGVO? Ist für die Freischaltung der Kontaktaufnahme zu Unternehmen eine stärkere Verifikation nötig?
*Vorläufige Einschätzung:* Mit den genannten Zusatzmaßnahmen halten wir das für vertretbar. Ein E-Mail-Double-Opt-In allein wäre wegen des Kontakts Minderjähriger zu Unternehmen zu schwach.

**Frage 4 – Rechtsgrundlage des Schülerkontos und Geschäftsfähigkeit (Art. 6 DSGVO, §§ 106 ff. BGB)**
Soll das Schülerkonto auf Art. 6 Abs. 1 lit. b DSGVO (Nutzungsvertrag) oder lit. a (Einwilligung) gestützt werden? Brauchen 16- und 17-Jährige für die Nutzungsbedingungen die Zustimmung der Eltern, oder sind kostenlose Nutzungsbedingungen ohne Pflichten „lediglich rechtlich vorteilhaft“ (§ 107 BGB)? Welche Folgen hat das für die Noten, die als besonders sensibel gelten?
*Vorläufige Einschätzung:* Für den Kerndienst halten wir lit. b für passend. Nutzungsbedingungen ohne Pflichten und Kosten für Schülerinnen und Schüler senken das Risiko nach § 107 BGB. Bei 16- und 17-Jährigen würden wir die Eltern informieren, aber keine Zustimmung einholen. Die Einwilligung nach Art. 8 betrifft nur Verarbeitungen auf Grundlage von lit. a.

**Frage 5 – DSFA und Datenschutzbeauftragte/r (Art. 35, 37, 38 DSGVO; § 38 BDSG)**
Ist eine DSFA für Notenprofil, Matching und Kontaktaufnahme Minderjähriger Pflicht, und zwar schon für den Pilot? Folgt daraus die Pflicht, unabhängig von der Mitarbeiterzahl eine Datenschutzbeauftragte oder einen Datenschutzbeauftragten zu benennen? Welche Anforderungen gelten für eine **interne** Person: Fachkunde, Interessenkonflikte (Art. 38 Abs. 6 DSGVO), Kündigungsschutz, Ressourcen? Welche Funktionen schließen eine Benennung aus?
*Vorläufige Einschätzung:* Ja zur DSFA, weil mehrere Kriterien der DSK-Muss-Liste erfüllt sind (schutzbedürftige Betroffene, Bewertung bzw. Scoring, Zusammenführung von Daten). Daraus folgt die Benennungspflicht nach § 38 Abs. 1 S. 2 BDSG. Eine interne Person außerhalb der Geschäftsführung und ohne Entscheidungsverantwortung für die Verarbeitung halten wir für zulässig.

**Frage 6 – Vertragsarchitektur Förderverein in der Pilotphase**
Ist es zulässig und sinnvoll, im Pilot nur eine jederzeit kündbare Pilotvereinbarung ohne Vergütung zu schließen und die Jahresvereinbarung erst mit dem ersten zahlenden Unternehmen beginnen zu lassen? Wie ist der Übergang zu gestalten: gesondertes Angebot, Annahme durch den Vorstand, aufschiebende Bedingung? Welche Informationen müssen dem Verein vor dem Abschluss der Pilotvereinbarung gegeben werden (§ 5a UWG), insbesondere zur späteren Jahresbindung und zu steuerlichen Folgen? Ist das gemeinnützigkeitsrechtlich unbedenklich, wenn der Verein im Pilot ohne Entgelt für ein gewerbliches Unternehmen tätig ist (§ 55 Abs. 1 Nr. 3 AO, mit dem Steuerberater abzustimmen)?
*Vorläufige Einschätzung:* Wir halten das für zulässig und gegenüber einer Jahresbindung ohne Vergütung für vorzugswürdig. Voraussetzungen: Der Verein setzt keine eigenen Sachmittel ein, und die spätere Jahresvereinbarung kommt nur durch eine ausdrückliche Annahme zustande.

**Frage 7 – Drittlandübermittlung und Auftragsverarbeitung (Art. 28, 44 ff. DSGVO)**
Reichen DPF (Vercel) und Standardvertragsklauseln mit Transfer-Folgenabschätzung (Supabase, Region EU) für einen Dienst mit Daten Minderjähriger aus? Oder empfehlen Sie eine Konfiguration nur in der EU bzw. andere Anbieter? Was ist bei den Standard-DPAs der Anbieter zu prüfen (Unterauftragsverarbeiter, Supportzugriffe aus den USA)?
*Vorläufige Einschätzung:* Wir halten das für rechtlich tragfähig, wenn die DPAs abgeschlossen, die Region EU festgelegt und eine kurze Transfer-Folgenabschätzung dokumentiert sind. Wegen der Zielgruppe kann eine EU-Alternative aber ein Vertrauensargument gegenüber Schulen sein.

### Gruppe II – vor dem ersten Vertrag bzw. vor Veröffentlichung der Website

**Frage 8 – Jahresvereinbarung Förderverein: AGB-Kontrolle (§§ 305 ff. BGB)**
Halten die Eckpunkte aus 2.5 einer Inhaltskontrolle nach § 307 BGB gegenüber einem eingetragenen Verein stand? Die Eckpunkte: 12 Monate Laufzeit, Verlängerung um jeweils 12 Monate bei Kündigungsfrist von 3 Monaten, Sonderkündigung bei Widerruf der Zustimmung der Schulleitung, Wegfall der Gemeinnützigkeit oder Schulschließung, Haftungsbegrenzung, ein Verein je Schule. Wie formuliert man die beschlossene Nachwirkung (bis zum aktuellen Laufzeitende bestehender Unternehmensverträge, nicht für Verlängerungen) klar und streitfest? Welcher Vertretungsnachweis des Vorstands (§ 26 BGB) ist ausreichend?
*Vorläufige Einschätzung:* Mit kurzer Kündigungsfrist und den genannten Sonderkündigungsrechten halten wir die Eckpunkte für AGB-fest. Wir orientieren uns am Rechtsgedanken des § 309 Nr. 9 BGB, obwohl der Verein kein Verbraucher ist. Für die Nachwirkung braucht es eine eindeutige Zuordnung von Unternehmensverträgen zur Schule und eine Definition von „Verlängerung“.

**Frage 9 – Pilotbedingungen Unternehmen und Website-Angabe zum Pilot (UWG, §§ 305 ff. BGB)**
Die Website nennt: „kostenlos, 6 Monate, für bis zu 20 Pilotunternehmen – Details in der Pilotvereinbarung“. Ist das ausreichend, wenn die Pilotvereinbarung die vollständigen Bedingungen vor Vertragsschluss nennt? Was muss die Pilotvereinbarung regeln? Unsere Eckpunkte:
- keine automatische Umstellung, Preise mindestens 4 Wochen vor Pilotende,
- keine Zusage zu Reichweite oder Bewerberzahl,
- Beta-Status,
- Datenschutzpflichten des Unternehmens als eigener Verantwortlicher für Kontaktanfragen (Zweckbindung, Löschfrist, keine Ansprache außerhalb der Plattform),
- Jugendschutz (JArbSchG) und AGG-konforme Angebote,
- Hinweis, dass Fördervereine an späteren Einnahmen beteiligt werden und Unternehmenszahlungen keine Spenden sind,
- Gerichtsstand.

*Vorläufige Einschätzung:* Gegenüber Unternehmern halten wir die Website-Angabe für ausreichend, wenn die Obergrenze intern tatsächlich eingehalten wird. Die genannten Eckpunkte halten wir für vollständig, bitten aber um Ergänzung.

**Frage 10 – Werbeaussagen der Website (§§ 3, 5, 5a, 6 UWG)**
Bitte prüfen Sie die überarbeiteten Texte (Anlage 1), insbesondere:
- den Verdienstvergleich nach Bildungsabschluss (Destatis, Vollzeitbeschäftigte, April 2025),
- die Angaben zu Förderungen (Kindergeld, BAB, Aufstiegs-BAföG, Weiterbildungsstipendium, Meisterprämien, Deutschlandstipendium), jeweils mit Stand und „ohne Gewähr“,
- die Kennzeichnung von Funktionen als „geplant“ und das Mockup mit Bildunterschrift,
- die Hero-Statistiken mit Quellenzeile,
- die Aussage „Wir verkaufen keine Daten“.

Bitte bestätigen Sie außerdem, dass Unternehmenszahlungen an Edufy nicht als „Spende“ bezeichnet werden dürfen und dafür keine Zuwendungsbestätigungen ausgestellt werden dürfen.
*Vorläufige Einschätzung:* Die Texte halten wir jetzt für vertretbar. Das gilt unter der Bedingung, dass jede Zahl unmittelbar vor der Veröffentlichung an der amtlichen Quelle geprüft und turnusmäßig aktualisiert wird. Bei der Zielgruppe Jugendliche (§ 3 Abs. 4 UWG) ist der Maßstab streng. Eine „Spendennennung“ ist ausgeschlossen.

**Frage 11 – Förderverein-Registrierung ohne Einwilligung (Art. 6, 13 DSGVO)**
Tragen Art. 6 Abs. 1 lit. b DSGVO (Konto) und lit. f DSGVO (Kommunikation mit der Ansprechperson als Vertreterin des künftigen Vertragspartners, freiwillige Telefonnummer) die Registrierung ohne Einwilligungs-Checkbox? Genügt ein Datenschutzhinweis mit Link direkt im Formular für Art. 13 DSGVO? Ist ein Telefonanruf zu dem angegebenen Zweck mit § 7 Abs. 2 Nr. 1 UWG vereinbar?
*Vorläufige Einschätzung:* Ja zu allen drei Fragen, soweit die Datenschutzerklärung vollständig ist und die Telefonnummer nur für das genannte Gespräch genutzt wird.

**Frage 12 – Allgemeiner Steuerhinweis an Vereine (§§ 2, 5 StBerG)**
Ist folgender Hinweis auf der Website und in Unterlagen für Vereine zulässig: „Die Beteiligung ist keine Spende, sondern eine Vergütung. Sie kann für Ihren Verein steuerliche Folgen haben, zum Beispiel bei der Körperschaft- oder Umsatzsteuer. Bitte klären Sie das vor der Jahresvereinbarung mit Ihrer Steuerberatung oder Ihrem Finanzamt.“ Darf ein Hinweisblatt allgemeine Grenzwerte nennen (Freigrenze § 64 Abs. 3 AO, Kleinunternehmergrenzen § 19 UStG), ohne dass das unbefugte Hilfeleistung in Steuersachen ist?
*Vorläufige Einschätzung:* Den allgemeinen Hinweis halten wir für zulässig. Ein Hinweisblatt mit Grenzwerten wäre zulässig, wenn es allgemein informiert, nicht auf den Einzelfall eingeht und vom Steuerberater freigegeben ist.

**Frage 13 – Impressum, Gründungsphase, VSBG (§ 5 DDG, § 18 Abs. 2 MStV, § 36 VSBG)**
Welche Angaben sind nach der Gründung Pflicht? Ist wegen der Berufs- und Studiumsbibliothek eine verantwortliche Person nach § 18 Abs. 2 MStV zu benennen? Braucht es eine Erklärung nach § 36 VSBG, wenn Nutzungsbedingungen gegenüber Schülerinnen und Schülern als Verbrauchern verwendet werden und wir anfangs höchstens 10 Beschäftigte haben? Dürfen Pilotvereinbarungen schon von der GmbH in Gründung geschlossen werden, und was ist dabei zu beachten (Handelndenhaftung)?
*Vorläufige Einschätzung:* Vollständige Angaben nach § 5 DDG einschließlich zweitem Kontaktweg und Register. Die Angabe nach MStV würden wir vorsorglich aufnehmen. Eine VSBG-Erklärung ist bei höchstens 10 Beschäftigten nicht verpflichtend. Verträge erst nach Eintragung schließen.

**Frage 14 – Marke „Edufy“ (MarkenG, UMV)**
Wir bitten um eine Identitäts- und Ähnlichkeitsrecherche für „Edufy“ in DPMA, EUIPO und WIPO, Klassen 9, 35, 41, 42, ggf. 36. Bitte schätzen Sie die Kollisionsrisiken ein, insbesondere mit einer gleichnamigen Lern-App im Apple App Store („Edufy Publications“) und der US-Anmeldung „EDUFYI“ (Serial 99514401, Kl. 9/42). Empfehlen Sie eine DE- oder eine EU-Marke, als Wort- oder Wort-/Bildmarke?
*Vorläufige Einschätzung:* Für die exakte Wortmarke in DE/EU haben wir bei einer eigenen Websuche keinen Treffer gefunden. Diese Suche ist aber nicht belastbar. Wir würden vor größerem Marketing eine EU-Wortmarke anmelden.

### Gruppe III – vor dem Start des Schüler- bzw. Unternehmensmoduls

**Frage 15 – Digital Services Act (Art. 19, 28 DSA)**
Ist Edufy eine Online-Plattform im Sinne des DSA? Ist das Ausspielen passender Unternehmensangebote auf Basis des Notenprofils „Werbung auf Grundlage von Profiling“ gegenüber Minderjährigen (Art. 28 Abs. 2 DSA)? Gilt die Ausnahme für Klein- und Kleinstunternehmen (Art. 19 DSA), und wie lange? Welche Pflichten bleiben in jedem Fall, z. B. das Melde- und Abhilfeverfahren nach Art. 16?
*Vorläufige Einschätzung:* Edufy ist voraussichtlich eine Online-Plattform. Ausbildungs- und Praktikumsangebote in einem Matching sehen wir eher als Kerninhalt des Dienstes und nicht als Werbung. Das ist aber nicht gesichert. Bis zur Klärung würden wir Unternehmensangebote für Minderjährige nicht nach dem Notenprofil sortieren.

**Frage 16 – Datenschutzrechtliche Rolle des Fördervereins (Art. 4 Nr. 7, 26, 28 DSGVO)**
Ist der Förderverein Auftragsverarbeiter, gemeinsam Verantwortlicher oder Dritter, wenn er Einladungslinks verteilt und aggregierte Statistiken seiner Schule sieht? Welche Vereinbarung ist erforderlich?
*Vorläufige Einschätzung:* Wenn der Verein nur Links verteilt und ausschließlich wirklich anonyme Statistiken mit einer Mindestgröße je Zelle sieht, verarbeitet er keine personenbezogenen Daten aus der Plattform. Eine Vereinbarung nach Art. 26 oder 28 wäre dann nicht nötig, eine Verschwiegenheitsklausel genügt.

**Frage 17 – Matching, Statistiken und Übermittlung an Unternehmen (Art. 5, 6, 9, 22, 25 DSGVO)**
- (a) Welche Transparenz- und Widerspruchsmöglichkeiten sind für das Matching aus Noten und Interessen nötig?
- (b) Ab welcher Mindestgröße gelten Statistiken je Schule bzw. Jahrgang als anonym (Erwägungsgrund 26)?
- (c) Ist die Übermittlung an ein Unternehmen nach aktiver Kontaktaufnahme durch Art. 6 Abs. 1 lit. b oder lit. a DSGVO gedeckt, und was muss der Schülerin oder dem Schüler vor dem Absenden angezeigt werden?
- (d) Was gilt für eine kindgerechte Fassung der Datenschutzinformationen (Art. 12 Abs. 1 DSGVO)?

*Vorläufige Einschätzung:* Für (c) sehen wir lit. b, weil die Weitergabe auf ausdrücklichen Wunsch zur Durchführung der Anfrage erfolgt. Vor dem Absenden zeigen wir an, welche Daten das Unternehmen erhält. Ab der Übermittlung ist das Unternehmen eigener Verantwortlicher. Als Mindestgröße für die Statistiken planen wir 10 Personen je Auswertungszelle. Eine automatisierte Entscheidung nach Art. 22 liegt nicht vor.

**Frage 18 – Stripe und Gutschriftverfahren (Art. 28 DSGVO; Vertragsrecht)**
Ist Stripe für Abrechnung und Betrugsprävention Auftragsverarbeiter oder eigener Verantwortlicher? Was muss für das Gutschriftverfahren an Vereine zivilrechtlich vereinbart werden: vorherige Vereinbarung, Widerspruch, Einwendungsfrist, Einsichtsrecht in die Abrechnungsgrundlagen? Die umsatzsteuerlichen Fragen klären wir mit dem Steuerberater.
*Vorläufige Einschätzung:* Stripe ist teils Auftragsverarbeiter und teils eigener Verantwortlicher. Das ist in der Datenschutzerklärung entsprechend darzustellen. Die Gutschriftregeln gehören in die Jahresvereinbarung.

---

## 5. Gewünschte Liefergegenstände

1. **Schriftliche Stellungnahme zu den Fragen 1–18.** Die Fragen 1–7 benötigen wir vorrangig, weil sie über den Pilotstart entscheiden, und bei Frage 2 möglichst mit einer Empfehlung, in welchen Ländern wir starten.
2. **Prüfung der Website-Texte** (Landingpage, Förderverein-Registrierung, Bestätigungsseite) mit konkreten Änderungsvorschlägen.
3. **Datenschutzerklärung und Impressum** in finaler Fassung nach der Gründung; zusätzlich eine kindgerechte Kurzfassung der Datenschutzinformationen für Schülerinnen und Schüler.
4. **Vertragsentwürfe:**
   - Pilotvereinbarung Förderverein (jederzeit kündbar, ohne Vergütung),
   - Jahresvereinbarung Förderverein (einschließlich Vergütung, Gutschriftverfahren, Nachwirkung, Sonderkündigung),
   - Pilotvereinbarung Unternehmen (6 Monate, kostenlos),
   - Nutzungsbedingungen für Schülerinnen, Schüler und Eltern.
5. **Text der Zustimmungserklärung der Schulleitung** und Eckpunkte für ein länderspezifisches Infoschreiben (auf Grundlage der Fragen 1 und 2).
6. **Prüfung der Auftragsverarbeitungsverträge** Vercel und Supabase (später Stripe) sowie Hinweise zur Transfer-Folgenabschätzung.
7. **Unterstützung bei der DSFA** (Prüfung unseres Entwurfs) und Hinweise zur Benennung der internen Datenschutzbeauftragten (Benennungsschreiben, Aufgabenbeschreibung).
8. **Markenrecherche „Edufy“** und gegebenenfalls Anmeldung.

**Bitte um Kostenschätzung:** Wir bitten um eine Schätzung je Liefergegenstand, alternativ um ein Pauschalangebot für die Pakete 1–2 (vorrangig) und 3–8. Bitte teilen Sie uns auch mit, welche Punkte Sie selbst übernehmen würden und für welche Sie andere Kolleginnen oder Kollegen empfehlen, z. B. Strafrecht oder Markenrecherche. Die Abstimmung mit unserem Steuerberater zu Frage 6, 12 und 18 koordinieren wir.

---

## 6. Anlagen

| Nr. | Anlage | Hinweis |
|---|---|---|
| 1 | Landingpage `index.html` (aktueller Entwurf, als PDF bzw. Datei) | noch nicht öffentlich |
| 2 | Förderverein-Registrierung `registrierung-foerderverein.html` | Formularablauf in 4 Schritten |
| 3 | Bestätigungsseite Förderverein `foerderverein-bestaetigung.html` | enthält eine Vorlage für den Vorstand und Hinweise zur Zustimmung der Schulleitung |
| 4 | Datenschutzerklärung `datenschutz.html` (Entwurf mit Platzhaltern) | Platzhalter werden nach der Gründung gefüllt |
| 5 | Impressum `impressum.html` (Entwurf mit Platzhaltern) | wie Anlage 4 |
| 6 | Datenbankschema Fördervereine/Schulen (`supabase_schulen_foerdervereine.sql`) und Warteliste (`sql/landing_waitlist.sql`), alternativ eine Liste der Datenfelder | zum Abgleich der Datenkategorien |
| 7 | Interne rechtliche Vorprüfung vom 25.11.2026 (Landingpage, Rechtsseiten, Onboarding, Geschäftsmodell) | KI-gestützte Vorarbeit, keine Rechtsberatung; enthält Eckpunkte zu Jahresvereinbarung und Pilotbedingungen, einen Länderüberblick zum Schulrecht und Quellen |
| 8 | Interne Prüfung der überarbeiteten Website-Texte vom 25.11.2026 | KI-gestützte Vorarbeit, Stand nach den Korrekturen |
| 9 | Interne steuerliche Vorprüfung Fördervereinsmodell vom 25.11.2026 | zur Information; geht parallel an den Steuerberater |
| 10 | Übersicht der Zahlen und Quellen auf der Website | Prüfliste mit amtlichen Quellen und Stand |

Für Rückfragen und ein kurzes Erstgespräch stehen wir gern zur Verfügung: [Name], hallo@edufy.world, [Telefon].
