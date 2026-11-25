# Steuerliche Vorprüfung: Fördervereinsmodell (30 % Beteiligung)

> **Vorprüfung durch KI – keine Steuerberatung, Bestätigung durch Steuerberater erforderlich.**
> Erstellt vom Agenten edufy-steuer am 2026-11-25 zu Ticket T-001. Diese Unterlage ersetzt keine Beratung nach § 2 StBerG. Sie soll einem Steuerberater ermöglichen, die Punkte schnell zu bestätigen oder zu korrigieren.
>
> **Hinweis zur Quellenlage:** Die Primärquellen (gesetze-im-internet.de, BMF-AO-Handbuch/AEAO, UStAE) konnten in dieser Arbeitsumgebung nicht direkt aufgerufen werden, weil die Hosts im Netzwerk gesperrt sind. Gesetzesstände und Werte sind über Suchergebnisse aus Sekundärquellen (Bundestag, Landesfinanzministerien, Kanzleien, Kammern) abgeglichen. Wörtliche Zitate und die genaue Nummerierung im AEAO sind daher **zu prüfen**. Wo ich mich auf eigenes Fachwissen ohne abgeglichene Quelle stütze, steht „(ungeprüft)“.

---

## 1. Kurzfazit

1. **Die 30 %-Zahlung ist beim Förderverein mit hoher Wahrscheinlichkeit eine Einnahme aus einem steuerpflichtigen wirtschaftlichen Geschäftsbetrieb (wGb, §§ 14, 64 AO).** Der Grund: Der Verein erbringt nach dem geplanten Modell eine **aktive Leistung**. Er bringt die Schule auf die Plattform, holt die Zustimmung der Schulleitung ein, gewinnt Schüler und schließt einen Jahresvertrag mit Leistungspflichten. Die Vergütung hängt erfolgsabhängig vom Umsatz ab. Das spricht für eine vertriebs- bzw. vermittlungsähnliche Tätigkeit und nicht für eine bloße Duldung. Ideeller Bereich, Vermögensverwaltung oder Zweckbetrieb scheiden nach meiner Einschätzung weitgehend aus. Risiko einer Fehleinordnung durch den Verein: **mittel bis hoch**.
2. **Für die meisten Schulfördervereine ist das trotzdem beherrschbar.** Ertragsteuern fallen erst an, wenn die **Bruttoeinnahmen aus allen wGb des Vereins** (inkl. USt, auch Kuchenverkauf, Schulfest-Gastro, aktives Sponsoring) **50.000 € im Jahr** übersteigen (§ 64 Abs. 3 AO in der Fassung des StÄndG 2025, erstmals für VZ 2026; vorher 45.000 €). Bei den bisher angedachten Preisen (500–15.000 € pro Unternehmen und Jahr) bleibt der Anteil eines Vereins meist im niedrigen fünfstelligen Bereich. **Gefährdung der Gemeinnützigkeit:** **niedrig**, solange die Überschüsse satzungsgemäß verwendet werden und der wGb das Vereinsleben nicht prägt.
3. **Umsatzsteuer ist der praktisch wichtigste Punkt.** Der Verein erbringt an Edufy eine steuerbare sonstige Leistung (Regelsatz 19 %, **nicht** ermäßigt nach § 12 Abs. 2 Nr. 8 a UStG). Viele Vereine sind Kleinunternehmer (§ 19 UStG: Vorjahr ≤ 25.000 €, laufendes Jahr ≤ 100.000 €). **Die Gutschrift von Edufy muss den USt-Status des einzelnen Vereins richtig abbilden.** Ein falscher USt-Ausweis löst beim Verein eine Steuerschuld nach § 14c UStG aus, und Edufy verliert den Vorsteuerabzug. Risiko: **mittel**, gut beherrschbar durch Datenfelder und Vertrag.
4. **Bei Edufy** ist die Zahlung eine **Betriebsausgabe** (Vergütung für eine Leistung) und **keine Spende**. Der Verein darf dafür **keine Zuwendungsbestätigung** ausstellen. Edufy hat Vorsteuerabzug, sofern der Verein regelbesteuert ist und die Gutschrift ordnungsgemäß ist. Risiko: **niedrig**.
5. **Die Website-Formulierungen „Öffentliche Spendennennung“ und „Rechtssicher über den Schulförderverein abgewickelt“ sollten entfallen.** Es handelt sich nicht um Spenden, und „rechtssicher“ ist ohne Prüfung durch einen Berater nicht belegbar. Auch Begriffe wie „Provision“ sollten in Außentexten vermieden werden. Risiko: **mittel** (irreführend, Erwartung einer Spendenquittung bei Unternehmen).
6. **Ein „Duldungsmodell“ (nur Namensnennung) würde den wGb vermeiden, passt aber nicht zum tatsächlichen Geschäftsmodell.** Entscheidend ist die tatsächliche Durchführung, nicht das Vertragswort. Ich empfehle, den wGb **offen anzunehmen und sauber abzuwickeln**, statt ihn wegzuformulieren. Das ist mit dem Steuerberater zu bestätigen.

---

## 2. Sachverhalt

### 2.1 Beteiligte und Beziehungen (laut Entscheidungen Marcus vom 2026-11-25, `CLAUDE.md`, `docs/BACKLOG.md`)

| Beteiligter | Rolle | Annahme / Stand |
|---|---|---|
| **Edufy** | Plattformbetreiber (edufy.world) | Rechtsform offen. **Annahme: GmbH oder UG (haftungsbeschränkt)**, regelbesteuert, im Inland ansässig. |
| **Unternehmen** | Zahlende Kunden von Edufy | Zahlen Edufy für Zugang zu Schulen/Schülern: Profil, Angebote, Events, Schulstatistiken. Ggf. kommen „Werbeflächen an Partnerschulen (physisch + digital)“ und „öffentliche Spendennennung“ hinzu (so noch auf `index.html`, Abschnitte `#ziele` und `#verguetung`). Pilotphase kostenlos, danach Zahlung über Stripe. |
| **Schul-Förderverein** | Go-to-Market-Partner | Eingetragener, gemeinnütziger Verein (Annahme; im Formular wird „gemeinnützig ja / nein / weiß nicht“ abgefragt, `registrierung-foerderverein.html`). Bringt seine Schule auf die Plattform, holt die formale Zustimmung der Schulleitung ein und schließt bei Aktivierung einen **Jahresvertrag** mit Edufy. |
| **Schule / Schulträger** | Bildungseinrichtung | Kein Vertragspartner von Edufy im Zahlungsfluss. Die Schulleitung stimmt formal zu. |
| **Schüler / Eltern** | Nutzer | Kostenlos. Unternehmen sehen nur Statistiken je Schule. |

### 2.2 Geldflüsse

```
Unternehmen ──(Entgelt für Plattformleistung, über Stripe)──▶ Edufy
Edufy ──(30 % der Einnahmen „über die Schule“, per Gutschrift)──▶ Förderverein
Förderverein ──(satzungsgemäße Mittelweitergabe, § 58 Nr. 1 AO)──▶ Schule / Schulträger
```

- **Bemessungsgrundlage:** „30 % der Unternehmenseinnahmen, die über seine Schule laufen“. **Offen und zu klären:** netto oder brutto, vor oder nach Stripe-Gebühren, Erstattungen und Storni, Zuordnung bei Unternehmen mit mehreren Schulen oder Regionen.
- **Abrechnung:** Gutschrift durch Edufy (§ 14 Abs. 2 Satz 2 UStG), Auszahlung auf die IBAN des Vereins.
- **Pilotphase:** Unternehmen zahlen nichts, also fließen auch keine 30 % an die Vereine.

### 2.3 Gegenleistungen des Fördervereins (Annahme aus Geschäftsmodell und Website)

Nach `CLAUDE.md` sind die Fördervereine „der primäre Go-to-Market-Kanal“. Die Netzwerkeffekt-Grafik auf `index.html` beschreibt den Kreislauf so: „Fördervereine gewinnen Schüler — Schüler machen die Plattform wertvoll für Unternehmen — Unternehmen zahlen — Schulen profitieren“. Daraus leite ich ab, dass der Verein typischerweise Folgendes tut:

- a) die Schule registrieren und die Zustimmung der Schulleitung einholen,
- b) Schüler und Eltern zur Nutzung bewegen (Einladungslink/QR-Code, Ticket F-002),
- c) ggf. Unternehmen ansprechen oder vermitteln,
- d) ggf. Werbeflächen bzw. Präsenz an der Schule ermöglichen („Werbeflächen an Partnerschulen“),
- e) ggf. die Nennung von Unternehmen als Unterstützer dulden oder selbst vornehmen („öffentliche Spendennennung“),
- f) ggf. Edufy die Nutzung von Name und Logo des Vereins bzw. der Schule gestatten.

**Wichtig:** Welche dieser Leistungen der Jahresvertrag (F-007) tatsächlich vorsieht, ist noch nicht festgelegt. Die steuerliche Einordnung hängt maßgeblich davon ab (siehe Abschnitt 4.1).

### 2.4 Datenstand im Schema (`supabase_schulen_foerdervereine.sql`)

- `foerdervereine`: `vereinsname`, `vereinsregister_nr`, `registergericht`, `gemeinnuetzig` (boolean), `iban`, `status`. **Es fehlen:** Anschrift des Vereins, Steuernummer, USt-IdNr., Kleinunternehmer-Status, Finanzamt, Datum des Freistellungs- bzw. Feststellungsbescheids und die Gutschriftvereinbarung.
- `provisions`: `foerderverein_id`, `contract_id`, `betrag`, `status` (offen/freigegeben/ausgezahlt/storniert). **Es fehlen:** Netto/USt/Brutto, Steuersatz, Leistungszeitraum, Gutschriftnummer und -datum, Bemessungsgrundlage und Bezug zur Korrektur bzw. Storno-Gutschrift.

---

## 3. Fragen

1. Wie ist die 30 %-Zahlung beim Förderverein einzuordnen (ideeller Bereich, Vermögensverwaltung, Zweckbetrieb oder wGb), abhängig von seiner Gegenleistung? Welche Folgen hat das für Freigrenze und Gemeinnützigkeit?
2. Welche Umsatzsteuerfolgen ergeben sich beim Förderverein und bei Edufy (Gutschrift, Vorsteuer, Kleinunternehmer)?
3. Wie behandelt Edufy die Zahlung ertragsteuerlich, und wie grenzt sie sich von einer Spende ab? Was bedeutet das für den Begriff „Spendennennung“?
4. Können Unternehmen ihre Zahlungen an Edufy als Betriebsausgaben abziehen, und wie verhält es sich mit Sponsoring-Aufwand?
5. Welche Gestaltungen minimieren das Risiko für die Vereine? Welche Folgen ergeben sich für Website-Texte und Datenfelder?
6. Welche Fragen gehen an den Steuerberater?

---

## 4. Prüfung je Frage

### 4.1 Einordnung der 30 %-Zahlung beim Förderverein

#### Normen
- **§ 14 AO:** Ein wirtschaftlicher Geschäftsbetrieb ist eine selbständige, nachhaltige Tätigkeit, durch die Einnahmen oder andere wirtschaftliche Vorteile erzielt werden und die über den Rahmen einer Vermögensverwaltung hinausgeht. Eine Gewinnerzielungsabsicht ist nicht erforderlich.
- **§ 64 Abs. 1 AO:** Die Steuervergünstigung entfällt für den wGb, soweit er kein Zweckbetrieb (§§ 65–68 AO) ist.
- **§ 64 Abs. 3 AO:** Freigrenze. Übersteigen die Einnahmen **einschließlich Umsatzsteuer** aus allen wGb, die keine Zweckbetriebe sind, insgesamt nicht **50.000 €** im Jahr, unterliegen die Besteuerungsgrundlagen nicht der KSt und GewSt. Anhebung von 45.000 € auf 50.000 € durch das **Steueränderungsgesetz 2025** (Bundestag 04.12.2025, Bundesrat 19.12.2025, BGBl. 2025 I Nr. 363), **erstmals für den Veranlagungszeitraum 2026**. Nach Sekundärquellen ist zusätzlich ein neuer Satz 2 eingeführt worden: Unterhalb der Grenze entfällt die Pflicht zur Sphärenzuordnung zwischen Vermögensverwaltung und wGb. **Genauer Wortlaut und Übergangsregel in Art. 97 § 1b EGAO sind zu prüfen.**
- **§ 64 Abs. 6 Nr. 1 AO:** Bei Werbung für Unternehmen, die im Zusammenhang mit der steuerbegünstigten Tätigkeit einschließlich Zweckbetrieben stattfindet, kann der Gewinn pauschal mit **15 % der Einnahmen** angesetzt werden (ungeprüft im aktuellen Wortlaut).
- **§ 65 AO:** Ein Zweckbetrieb setzt voraus, dass der Betrieb dazu dient, die satzungsmäßigen Zwecke **unmittelbar** zu verwirklichen, dass die Zwecke nur durch ihn erreichbar sind und dass er nicht in größerem Umfang als unvermeidbar in Wettbewerb tritt.
- **BMF-Sponsoringerlass vom 18.02.1998** (BStBl I 1998, 212) und **AEAO zu § 64 Abs. 1 Nrn. 7–10 (bzw. 7–11)**. Nach der Verwaltungsauffassung können Sponsoringleistungen beim Empfänger steuerfreie Einnahmen im ideellen Bereich, steuerfreie Einnahmen aus der Vermögensverwaltung oder steuerpflichtige Einnahmen eines wGb sein. Die Behandlung beim Empfänger hängt nicht davon ab, wie der Sponsor die Aufwendungen behandelt.
  - **Kein wGb** liegt vor, wenn die Körperschaft dem Sponsor nur gestattet, ihren Namen zu Werbezwecken zu nutzen, sodass der Sponsor **selbst** auf seine Unterstützung hinweist. Ebenso, wenn die Körperschaft auf Plakaten, Veranstaltungshinweisen, in Katalogen o. ä. **lediglich auf die Unterstützung hinweist**. Das darf mit Name, Emblem oder Logo des Sponsors geschehen, **jedoch ohne besondere Hervorhebung**.
  - **Ein wGb liegt vor**, wenn die Körperschaft **an den Werbemaßnahmen aktiv mitwirkt**.
  - **Nummerierung zu prüfen:** Je nach AEAO-Fassung steht die Duldungsaussage in Nr. 9 oder Nr. 10. Die Zuordnung der Duldungseinnahmen zum ideellen Bereich oder zur Vermögensverwaltung wird in den Fassungen unterschiedlich zitiert.

#### Anwendung

**a) Ideeller Bereich.** Dieser setzt voraus, dass die Zahlung keine Gegenleistung für eine Leistung des Vereins ist (echter Zuschuss oder Spende) oder dass es sich allenfalls um eine bloße Danke-Nennung handelt. Hier zahlt Edufy aufgrund eines **Jahresvertrags**, erfolgsabhängig und in Höhe von 30 % des Umsatzes. Das ist ein klassischer Leistungsaustausch, daher **scheidet der ideelle Bereich aus**.

**b) Vermögensverwaltung.** Denkbar wäre sie nur, wenn sich die Leistung des Vereins auf eine **passive Rechteüberlassung** beschränkt, z. B. eine Lizenz an Name und Logo oder die Duldung der Nennung als „Partnerverein“. Ich halte das für **nicht tragfähig**, weil:
- Edufy den Verein ausdrücklich als **Vertriebskanal** einsetzt (Schule gewinnen, Schulleitung überzeugen, Schüler aktivieren),
- die Vergütung **umsatzabhängig** ist, was typisch für Vermittlungs- bzw. Vertriebsprovisionen ist,
- die Finanzverwaltung auf die **tatsächliche Durchführung** abstellt. Ein Vertrag, der nur „Duldung“ nennt, während der Verein faktisch aktiv wirbt, hilft nicht und erhöht eher das Risiko (Fehleinordnung, ggf. Haftung des Vorstands).

**c) Zweckbetrieb (§ 65 AO).** Die Förderung von Erziehung und Bildung (§ 52 Abs. 2 Nr. 7 AO) wird beim Förderverein in der Regel durch **Mittelweitergabe** an die Schule verwirklicht (§ 58 Nr. 1 AO), nicht durch eigene Tätigkeit. Die Mitwirkung am Vertrieb einer kommerziellen Plattform verwirklicht den Satzungszweck nicht unmittelbar, sondern beschafft Mittel. Außerdem stünde der Verein im Wettbewerb mit gewerblichen Vertriebspartnern und Agenturen. Ein **Zweckbetrieb scheidet aus**. Denkbar, aber zu prüfen: Organisiert der Verein **selbst** Berufsorientierungsveranstaltungen als satzungsmäßige Tätigkeit (falls die Satzung das trägt) und erzielt dabei Werbeeinnahmen, könnte § 64 Abs. 6 Nr. 1 AO (pauschal 15 %) greifen. Das betrifft aber nur einen Teil der Einnahmen und passt nicht auf die 30 %-Beteiligung insgesamt.

**d) Steuerpflichtiger wGb.** Die Merkmale des § 14 AO sind erfüllt: selbständig, nachhaltig (Jahresvertrag, wiederkehrend), Einnahmeerzielung, über Vermögensverwaltung hinaus (aktive Mitwirkung). **Ergebnis: wGb wahrscheinlich.**

**Abhängigkeit von der Gegenleistung (Übersicht):**

| Leistung des Vereins | Einordnung (Verwaltungsauffassung) | Einschätzung |
|---|---|---|
| Nur Duldung: Edufy darf öffentlich nennen, dass Verein X Partner ist; Verein tut nichts weiter | ideeller Bereich bzw. Vermögensverwaltung, kein wGb (Sponsoringerlass, AEAO zu § 64) | passt nicht zum Geschäftsmodell |
| Verein nennt Unternehmen auf seiner Website oder im Newsletter „ohne besondere Hervorhebung“ als Unterstützer | kein wGb, solange es eine schlichte Danke-Nennung ist | unproblematisch, aber nicht der Kern |
| Verein bewirbt Edufy bei Schülern/Eltern, verteilt Einladungs-Codes, akquiriert die Schulleitung | **wGb** (aktive Mitwirkung, vertriebsähnlich) | **Kernleistung im Modell** |
| Verein stellt Werbeflächen an der Schule bereit oder hebt Unternehmen hervor (Logo groß, Verlinkung, Werbebotschaft) | **wGb** (aktive Werbeleistung) | zusätzlich **schulrechtliches Werbeverbot prüfen** (→ edufy-legal); der Verein ist meist nicht Inhaber der Flächen |
| Verein vermittelt Unternehmen an Edufy | **wGb** (Vermittlungsleistung) | wGb |

#### Folgen beim wGb

- **Unterhalb der Freigrenze (≤ 50.000 € Bruttoeinnahmen aus allen wGb, ab VZ 2026):** keine KSt und keine GewSt auf den wGb. Gezählt werden alle wGb-Einnahmen des Vereins zusammen (z. B. Schulfest-Verpflegung, Basare mit Zukauf, aktives Sponsoring, Edufy). **Dazu zählt auch die USt.**
- **Bei Überschreitung:** Der Gewinn aus allen wGb unterliegt der KSt (15 % zzgl. SolZ) und GewSt. Bei Körperschaften wie Vereinen gelten Freibeträge von **5.000 €** (§ 24 KStG, § 11 Abs. 1 Satz 3 Nr. 2 GewStG; ungeprüft im aktuellen Wortlaut). Weil der Verein für die 30 % kaum Kosten hat, wäre der Gewinn nahezu gleich der Einnahme. Hinzu kommen Erklärungs- und ggf. Buchführungspflichten. Die Gemeinnützigkeit ist durch das Überschreiten allein **nicht** gefährdet.
- **Größenordnung:** Beispiel mit 10 Unternehmen à 2.500 € netto an einer Schule: 25.000 € netto, davon 30 % = 7.500 € netto. Bei Regelbesteuerung sind das 8.925 € brutto. Das liegt deutlich unter der Freigrenze, solange der Verein keine weiteren großen wGb hat. Bei großen Schulen mit vielen Enterprise-Kunden ist eine Überschreitung aber denkbar. **Edufy sollte Vereinen eine Jahresübersicht der Bruttozahlungen liefern.**

#### Gemeinnützigkeit (Selbstlosigkeit, Mittelverwendung, Gepräge)

- **Selbstlosigkeit (§ 55 AO):** Ein wGb zur Mittelbeschaffung ist zulässig, solange er **nicht Selbstzweck** wird und die Überschüsse für satzungsmäßige Zwecke verwendet werden. Bei einer reinen Umsatzbeteiligung entstehen keine Verluste. Das wichtigste Risiko (Verlustausgleich aus ideellen Mitteln) **entfällt daher weitgehend**.
- **Mittelverwendung:** Überschüsse aus dem wGb sind Mittel des Vereins und zeitnah für die Satzungszwecke zu verwenden (§ 55 Abs. 1 Nr. 5 AO). Nach dem StÄndG 2025 entfällt die Pflicht zur zeitnahen Mittelverwendung für Körperschaften mit jährlichen Einnahmen bis **100.000 €** (vorher 45.000 €). Quellen dazu: Paritätischer Gesamtverband, Curacon. **Wortlaut zu prüfen.** Die Mittelweitergabe an die Schule bzw. den Schulträger (juristische Person des öffentlichen Rechts) ist nach § 58 Nr. 1 AO zulässig, wenn die Satzung den Förderzweck trägt.
- **Gepräge / Hauptzweck:** Werden die Edufy-Einnahmen und der Vertriebsaufwand im Verhältnis zur ideellen Tätigkeit sehr groß, könnte das Finanzamt fragen, ob die wirtschaftliche Tätigkeit das Gepräge gibt. Bei einem Schulförderverein, dessen Vorstand ehrenamtlich ein paar Einladungen verteilt, ist das **unwahrscheinlich (Risiko niedrig)**.
- **Begünstigung Dritter (§ 55 Abs. 1 Nr. 3 AO):** Der Verein darf Edufy (einem gewerblichen Unternehmen) keine unentgeltlichen Vorteile aus Vereinsmitteln gewähren. Ein Beispiel wäre, wenn der Verein während der Pilotphase auf eigene Kosten (Druck, Porto, bezahlte Kräfte) für Edufy wirbt, ohne dass ihm ein Entgelt zusteht. Die ehrenamtliche Zeit des Vorstands ist unkritisch, Sachausgaben sind es nicht. **Empfehlung:** Werbematerial stellt Edufy auf eigene Kosten. **Risiko: niedrig.**
- **Satzung:** Ein wGb muss in der Satzung nicht genannt sein. Er darf aber nicht dem Satzungszweck widersprechen, und die Satzung sollte keine „ausschließlich ideelle“ Mittelbeschaffung festlegen. Prüfen sollte der Verein (ungeprüft, Praxisempfehlung):
  - ob der Förderzweck die Mittelweitergabe an die konkrete Schule abdeckt,
  - ob die Satzung wirtschaftliche Tätigkeit zur Mittelbeschaffung ausschließt,
  - ob der Vorstand zum Abschluss eines Jahresvertrags befugt ist (Vertretung nach § 26 BGB, ggf. Zustimmungsvorbehalt der Mitgliederversammlung).

**Risiko 4.1 insgesamt:** Die Fehleinordnung durch den Verein (z. B. als Spende oder „steuerfrei“) ist **mittel bis hoch**. Das Steuerrisiko bei korrekter Einordnung als wGb ist **niedrig**, solange die Freigrenze nicht überschritten wird. Ein Risiko für die Gemeinnützigkeit sehe ich als **niedrig**.

### 4.2 Umsatzsteuer

#### Beim Förderverein
- **Unternehmer (§ 2 UStG):** Mit dem wGb ist der Verein Unternehmer. Die Leistung an Edufy ist eine **steuerbare sonstige Leistung** (§ 1 Abs. 1 Nr. 1, § 3 Abs. 9 UStG), Leistungsort ist das Inland (§ 3a Abs. 2 UStG, Empfänger Edufy).
- **Kein Leistungsaustausch** besteht nur bei bloßer Duldung bzw. Danke-Nennung ohne besondere Hervorhebung (UStAE 1.1 Abs. 23; Wortlaut zu prüfen). Nach NWB- und Haufe-Kommentierungen liegt ein Leistungsaustausch vor, wenn konkrete Leistungen vereinbart sind. Das ist hier der Fall.
- **Steuerbefreiung:** Ich sehe keine. § 4 Nr. 8 UStG (Finanzumsätze) und § 4 Nr. 21/22 UStG (Bildungsleistungen) passen nicht, denn der Verein erbringt keine Bildungsleistung an Edufy (ungeprüft, mit StB zu bestätigen).
- **Steuersatz:** **19 %.** Der ermäßigte Satz nach **§ 12 Abs. 2 Nr. 8 Buchst. a UStG** gilt für gemeinnützige Körperschaften **nicht für Leistungen im wGb** (nur ideeller Bereich, Vermögensverwaltung, Zweckbetrieb). Sekundärquellen bestätigen das, Gesetzeswortlaut zu prüfen.
- **Kleinunternehmerregelung (§ 19 UStG, seit 01.01.2025, JStG 2024):** Der Verein ist Kleinunternehmer, wenn der Gesamtumsatz im Vorjahr ≤ **25.000 €** war und im laufenden Jahr ≤ **100.000 €** bleibt. Wird die 100.000 € im laufenden Jahr überschritten, endet die Regelung **sofort**, also ab dem überschreitenden Umsatz. Quellen: Finanzamt BW, IHK München. Zum Gesamtumsatz zählen alle steuerbaren Umsätze des Vereins aus seiner unternehmerischen Tätigkeit, nicht nur die von Edufy. **Viele Schulfördervereine werden Kleinunternehmer sein.** Dann zahlt Edufy 30 % **ohne USt**, und Edufy hat keinen Vorsteuerabzug.
- **Option zur Regelbesteuerung (§ 19 Abs. 3 UStG):** Der Verein kann optieren, ist dann aber 5 Jahre gebunden. Für Vereine lohnt das nur bei relevanten Vorsteuerbeträgen, was hier kaum der Fall ist.
- **Falscher Ausweis (§ 14c UStG):** Weist Edufy in der Gutschrift USt aus, obwohl der Verein Kleinunternehmer ist, **schuldet der Verein diese USt nach § 14c Abs. 2 UStG**, sofern er der Gutschrift nicht widerspricht. Edufy hat dann keinen Vorsteuerabzug. Umgekehrt muss ein regelbesteuerter Verein bei einer Gutschrift ohne USt die Steuer aus dem Betrag herausrechnen und abführen, verliert also 19 % seiner Beteiligung. **Der USt-Status je Verein ist daher abrechnungsrelevant.**

#### Bei Edufy
- **Ausgangsumsatz:** Edufy erbringt an die Unternehmen eine steuerpflichtige sonstige Leistung (19 %) über das **volle Entgelt**. Die 30 % mindern Edufys Umsatz nicht, sie sind ein Eingangsleistungsbezug. Eine „Durchreichung im fremden Namen“ ist nach dem Modell nicht vorgesehen. Würde Edufy im eigenen Namen für Rechnung des Vereins verkaufen, gälte § 3 Abs. 11 UStG (Leistungskommission) mit derselben Leistungskette.
- **Gutschrift (§ 14 Abs. 2 Satz 2 UStG):** Zulässig, wenn es **vorher vereinbart** ist (im Jahresvertrag). Die Gutschrift verliert ihre Wirkung als Rechnung, sobald der Verein **widerspricht** (§ 14 Abs. 2 Satz 3 UStG).
- **Pflichtangaben (§ 14 Abs. 4 UStG, ungeprüft im Wortlaut):**
  - vollständiger Name und Anschrift des **Vereins (leistender Unternehmer)** und von Edufy,
  - **Steuernummer oder USt-IdNr. des Vereins**,
  - Ausstellungsdatum, fortlaufende Nummer (Edufy-Nummernkreis),
  - Leistungsbeschreibung, **Leistungszeitraum**,
  - Nettoentgelt, Steuersatz, Steuerbetrag bzw. Hinweis auf Steuerbefreiung / **Kleinunternehmer nach § 19 UStG**,
  - die Angabe **„Gutschrift“** (§ 14 Abs. 4 Satz 1 Nr. 10 UStG).
- **Kleinunternehmer-Rechnungen:** Seit 2025 gibt es vereinfachte Rechnungsanforderungen in § 34a UStDV (ungeprüft, ob und wie das bei einer Gutschrift durch den Empfänger gilt; zu klären).
- **E-Rechnung:** Gutschriften unterliegen ebenfalls den E-Rechnungsregeln (§ 14 Abs. 2 Satz 5 UStG). Übergang: Bis 31.12.2026 dürfen allgemein „sonstige Rechnungen“ ausgestellt werden. Bis 31.12.2027 gilt das für Aussteller mit einem Vorjahresumsatz (2026) ≤ 800.000 €. **Bei Gutschriften kommt es auf den Umsatz des Gutschriftausstellers an, also Edufy.** Ab 2028 gilt die Pflicht für alle außer Kleinunternehmern. Das **dritte BMF-Schreiben zur E-Rechnung vom 15.10.2026** konkretisiert u. a. Berichtigungen per Gutschrift. Ob eine Gutschrift an einen **Kleinunternehmer-Verein** als E-Rechnung ausgestellt werden muss, ist **zu prüfen**. Empfehlung: Gutschriften von Anfang an als E-Rechnung (ZUGFeRD/XRechnung) erzeugen, das ist unschädlich.
- **Vorsteuerabzug:** Edufy hat Vorsteuerabzug aus der Gutschrift, wenn der Verein regelbesteuert ist und die Gutschrift ordnungsgemäß ist (§ 15 Abs. 1 Nr. 1 UStG).
- **Reverse Charge (§ 13b UStG):** **Im Verhältnis zum Verein nicht relevant**, beide sind im Inland ansässig. Am Rande: Edufy bezieht Stripe-Leistungen von einem ausländischen Unternehmen (Stripe Payments Europe Ltd., Irland). Für diese Gebühren ist § 13b UStG bzw. eine Steuerbefreiung nach § 4 Nr. 8 UStG beim Steuerberater zu klären (ungeprüft).

**Risiko 4.2:** **mittel.** Es liegt in der Abrechnung (falscher USt-Ausweis, fehlende Pflichtangaben) und ist durch Datenfelder und Prozesse gut beherrschbar.

### 4.3 Edufy: Ertragsteuern und Abgrenzung zur Spende

- **Betriebsausgabe:** Die 30 % sind ein betrieblich veranlasstes Entgelt für Leistungen des Vereins (Vertrieb, Zugang, Nutzungsrechte) und damit **voll abziehbare Betriebsausgaben** (§ 4 Abs. 4 EStG i. V. m. § 8 Abs. 1 KStG). Bei der GewSt ist mir keine Hinzurechnung ersichtlich (ungeprüft). Die Höchstbeträge für Spenden (§ 9 Abs. 1 Nr. 2 KStG) gelten nicht.
- **Keine Spende:** Eine Zuwendung im Sinne von § 10b EStG bzw. § 9 Abs. 1 Nr. 2 KStG setzt **Unentgeltlichkeit** voraus. Bei einem Jahresvertrag mit Gegenleistung darf der Verein **keine Zuwendungsbestätigung** ausstellen. Stellt er eine aus, droht Haftung nach § 10b Abs. 4 EStG (unrichtige Bestätigung). Das sollte der Vertrag ausdrücklich ausschließen.
- **Angemessenheit / Fremdvergleich:** 30 % sind hoch, aber ein Geschäftsmodell-Parameter für alle Vereine gleich. Unproblematisch, solange zwischen Gesellschaftern bzw. Geschäftsführung von Edufy und dem Vorstand eines Vereins **keine Nähebeziehung** besteht. Andernfalls sind eine verdeckte Gewinnausschüttung bei Edufy bzw. § 55 Abs. 1 Nr. 3 AO beim Verein zu prüfen. **Empfehlung:** einheitliche Konditionen für alle Vereine, keine Sonderdeals.
- **Begriff „Spendennennung“ auf der Website** (`index.html`, Ziel-Karte „Schulen & Fördervereine“ und Premium-Tier): Er ist **irreführend**. Das Unternehmen zahlt an Edufy und spendet nicht an den Verein. Das Unternehmen kann dafür keine Spendenbescheinigung erhalten, und auch Edufy spendet nicht. Wird stattdessen gemeint, dass Unternehmen **direkt** an den Verein spenden und dafür genannt werden, ist das ein **eigener Sachverhalt** zwischen Unternehmen und Verein. Bei einer bloßen Danke-Nennung ohne Hervorhebung ist das unschädlich (Spende mit Dankeshinweis). Bei vereinbarter Werbeleistung ist es Sponsoring im wGb, dann gibt es keine Zuwendungsbestätigung.

**Risiko 4.3:** **niedrig** bei Edufy. Die Kommunikation („Spende“) birgt ein **mittleres** Risiko.

### 4.4 Unternehmensseite

- **Zahlungen an Edufy:** Das ist ein Entgelt für Recruiting-, Employer-Branding- und Werbeleistungen einer gewerblichen Plattform, also **Betriebsausgaben** (§ 4 Abs. 4 EStG). Die Vorsteuer aus der Edufy-Rechnung ist abziehbar (§ 15 UStG). Der Sponsoringerlass ist hier **nicht** einschlägig, weil das Unternehmen nicht an den Verein, sondern an Edufy zahlt.
- **Wenn ein Unternehmen zusätzlich direkt an den Verein zahlt** (Sponsoring): Nach dem BMF-Sponsoringerlass (Tz. 3 ff.) sind die Aufwendungen Betriebsausgaben, wenn der Sponsor wirtschaftliche Vorteile für sein Unternehmen erstrebt (z. B. öffentlichkeitswirksame Nennung). Andernfalls ist es eine Spende im Rahmen von § 10b EStG / § 9 KStG oder eine nicht abziehbare Zuwendung.
- **Kein „Doppelvorteil“:** Ein Unternehmen kann für denselben Betrag nicht zugleich Betriebsausgabe mit Vorsteuer **und** Spendenabzug geltend machen. Die Website darf das nicht suggerieren.

**Risiko 4.4:** **niedrig.**

### 4.5 Gestaltungsalternativen (Überblick)

| Variante | Steuerfolge Verein | Bewertung |
|---|---|---|
| **A. wGb offen annehmen** (empfohlen): Jahresvertrag beschreibt die aktiven Leistungen konkret; Vergütung 30 % des Nettoumsatzes **zzgl. gesetzlicher USt, soweit der Verein nicht Kleinunternehmer ist** | wGb, Freigrenze 50.000 €; USt 19 % oder § 19 | ehrlich, robust, für die meisten Vereine steuerfrei unterhalb der Freigrenze; Aufwand: Gutschrift mit korrektem USt-Status |
| **B. Reines Duldungsmodell** (Verein gestattet nur Namens- und Logonutzung und Nennung, Edufy macht alles selbst) | ideeller Bereich bzw. Vermögensverwaltung, nicht steuerbar | nur tragfähig, wenn der Verein **wirklich nichts** aktiv tut. Widerspricht „Go-to-Market über Fördervereine“; hohes Risiko der Umqualifizierung |
| **C. Aufspaltung** (Teil Lizenz/Duldung = Vermögensverwaltung, Teil aktive Leistung = wGb) | gemischt | hohe Abgrenzungsrisiken; bei einheitlichem Leistungsbündel droht die Behandlung als Ganzes; nur mit Steuerberater |
| **D. Edufy spendet** statt Vertragsvergütung | ideeller Bereich, Verein darf Zuwendungsbestätigung ausstellen | **nicht vereinbar** mit Jahresvertrag und Gegenleistung; Spende darf an keine Gegenleistung geknüpft sein. Nicht empfohlen |
| **E. Zahlung direkt an die Schule / den Schulträger** | nicht Thema dieser Prüfung (öffentliches Haushalts- und Schulrecht, Betrieb gewerblicher Art) | nicht empfohlen; wäre eigens zu prüfen |

---

## 5. Risiken (Zusammenfassung)

| # | Risiko | Einstufung | Begründung / Gegenmaßnahme |
|---|---|---|---|
| R1 | Verein ordnet die 30 % als Spende oder steuerfrei ein und erklärt sie falsch | **mittel–hoch** | Hinweisblatt für Vereine, klare Vertragsbezeichnung „Vergütung“, Jahresübersicht |
| R2 | Überschreiten der Freigrenze § 64 Abs. 3 AO (50.000 € brutto, alle wGb) | **niedrig** (große Schulen: mittel) | Jahresübersicht brutto; Hinweis, andere wGb mitzuzählen |
| R3 | Verlust der Gemeinnützigkeit | **niedrig** | keine Verluste im wGb; keine Sachausgaben des Vereins für Edufy-Werbung; Mittelverwendung satzungsgemäß |
| R4 | Falscher USt-Ausweis in der Gutschrift (§ 14c UStG beim Verein, Verlust Vorsteuer bei Edufy) | **mittel** | Datenfeld Kleinunternehmer-Status, jährliche Bestätigung, Widerspruchsweg |
| R5 | Fehlende Pflichtangaben / E-Rechnungsformat | **mittel** | Steuernummer/USt-IdNr. und Anschrift Pflicht vor erster Auszahlung; E-Rechnung ab Start |
| R6 | Ausstellung von Zuwendungsbestätigungen für vertragliche Zahlungen (Haftung § 10b Abs. 4 EStG) | **mittel** | Vertragsklausel, Hinweisblatt |
| R7 | Irreführende Website-Begriffe („Spendennennung“, „rechtssicher“, „Provision“) | **mittel** | Texte ändern (G-007/G-003), Abstimmung mit edufy-legal |
| R8 | Werbeflächen an Schulen: Verein nicht berechtigt, schulrechtliches Werbeverbot | **mittel** (rechtlich, nicht steuerlich) | an edufy-legal; im Vertrag keine physischen Werbeflächen zusagen, solange ungeklärt |
| R9 | Nähebeziehung Edufy ↔ Vereinsvorstand (vGA, Begünstigung) | **niedrig** | einheitliche Konditionen |

---

## 6. Empfehlungen

### 6.1 Jahresvertrag Förderverein (Input für F-007 / edufy-legal)
1. **Leistung des Vereins konkret und wahrheitsgemäß beschreiben**, z. B.: „Der Verein unterstützt die Einführung von Edufy an der Schule X, insbesondere durch Information von Schulleitung, Eltern und Schülern und Weitergabe von Einladungslinks.“ Keine Fiktion einer „reinen Duldung“.
2. **Vergütung als Entgelt bezeichnen** („Vergütung“, „Beteiligung an den Nettoerlösen“), **nicht als „Spende“ oder „Zuwendung“**. Die interne Bezeichnung „Provision“ ist steuerlich neutral, deutet aber auf eine Vermittlungsleistung. Ich empfehle durchgängig „Vergütung“.
3. **Bemessungsgrundlage exakt definieren:** 30 % der von Edufy für die Schule X vereinnahmten **Nettoentgelte** (ohne USt), nach Erstattungen und Storni. Festlegen, ob Stripe-Gebühren abgezogen werden. Zuordnungsschlüssel bei Unternehmen mit mehreren Schulen festlegen. Abrechnungszeitraum (z. B. quartalsweise) und Fälligkeit regeln.
4. **USt-Klausel:** „zzgl. gesetzlicher Umsatzsteuer, sofern der Verein nicht Kleinunternehmer nach § 19 UStG ist. Der Verein teilt Änderungen seines Status unverzüglich mit.“
5. **Gutschriftvereinbarung** (§ 14 Abs. 2 Satz 2 UStG) ausdrücklich aufnehmen, inkl. Widerspruchsrecht und Frist für Rückmeldung, sowie den Hinweis, dass Gutschriften elektronisch übermittelt werden.
6. **Keine Zuwendungsbestätigungen** für Zahlungen aus diesem Vertrag (Klausel).
7. **Kosten trägt Edufy:** Werbematerial, Druck und Porto stellt Edufy. Der Verein setzt keine Vereinsmittel für Edufy ein.
8. **Keine Zusage physischer Werbeflächen oder hervorgehobener Werbung durch den Verein**, solange das schulrechtlich ungeklärt ist (→ edufy-legal).
9. **Vertretungsnachweis:** Unterschrift durch vertretungsberechtigten Vorstand (§ 26 BGB). Im Schema existiert `vertretung_bestaetigt`; für den Vertrag ist ein belastbarer Nachweis nötig.

### 6.2 Hinweisblatt für Vereine (vor Vertragsschluss aushändigen, kein Steuerrat)
- Die Vergütung ist **keine Spende**, sondern in der Regel eine Einnahme im **steuerpflichtigen wirtschaftlichen Geschäftsbetrieb**.
- Steuerfrei bleibt sie in der Regel, solange **alle** wGb-Einnahmen des Vereins brutto **50.000 €/Jahr** (ab 2026) nicht übersteigen.
- **Umsatzsteuer:** Kleinunternehmer prüfen (Vorjahr ≤ 25.000 €, laufendes Jahr ≤ 100.000 €). Den Status Edufy mitteilen.
- Bitte mit Kassenprüfern bzw. Steuerberater des Vereins abstimmen; ggf. Satzung prüfen (Förderzweck, Vertretungsbefugnis).
- Edufy stellt jährlich eine Übersicht aller Zahlungen bereit.

### 6.3 Website-Texte (für G-007 / G-003, Umsetzung erst nach edufy-legal)
- **Entfernen:** „25–30 % der Unternehmenseinnahmen fließen in den Förderverein“ (zwei Stellen, entspricht auch der Entscheidung „kein Prozentsatz“).
- **Entfernen:** „Rechtssicher über den Schulförderverein abgewickelt“. Das ist nicht belegt, solange kein Steuerberater bestätigt hat.
- **Ersetzen:** „Öffentliche Spendennennung (als PR für Partnerunternehmen)“ durch z. B. „Sichtbarkeit als Partner der Schule auf Edufy“. Kein „Spende“, keine Aussage zur steuerlichen Abziehbarkeit als Spende.
- **Ersetzen:** „Förderverein erhält Provision“ (Netzwerk-Grafik) durch „Förderverein wird an den Einnahmen beteiligt“. Das ist konsistent mit `registrierung-foerderverein.html`, deren Formulierung („an den Einnahmen beteiligt … persönliches Gespräch“) steuerlich unbedenklich ist.
- **Prüfen:** „Werbeflächen an Partnerschulen (physisch + digital)“ hat steuerlich die Folge wGb beim Verein und ist schulrechtlich offen. Ich empfehle, das bis zur Klärung zu streichen oder auf „digitale Sichtbarkeit auf Edufy“ zu reduzieren.
- Für Unternehmen keine Aussagen wie „steuerlich absetzbar als Spende“. Zulässig wäre allenfalls neutral: „Rechnung mit ausgewiesener Umsatzsteuer“.

### 6.4 Datenfelder (Input für U-003 / F-007, Abstimmung über PM; Schema-Änderung nicht durch mich)
**`foerdervereine`** (erst bei Aktivierung / vor erster Auszahlung abfragen, nicht bei Registrierung):
- `anschrift_strasse`, `anschrift_plz`, `anschrift_ort` (Pflichtangabe Gutschrift)
- `steuernummer` (text) und/oder `ust_idnr` (text), mindestens eines Pflicht vor der ersten Gutschrift
- `kleinunternehmer` (boolean) + `kleinunternehmer_bestaetigt_am` (date); jährliche Bestätigung anfordern
- `finanzamt` (text), `freistellungsbescheid_datum` (date) bzw. Bescheid nach § 60a AO (zur Plausibilisierung von `gemeinnuetzig`)
- `gutschrift_vereinbarung_akzeptiert_am` (timestamptz), `vertrag_beginn`, `vertrag_ende`
- `erechnung_adresse` (E-Mail/Kanal für E-Rechnung)

**`provisions`** (Umbenennung in z. B. `verguetungen` erwägen):
- `bemessungsgrundlage_netto`, `anteil_prozent` (30.00), `betrag_netto`, `ust_satz` (0 oder 19), `ust_betrag`, `betrag_brutto`
- `leistungszeitraum_von`, `leistungszeitraum_bis`
- `gutschrift_nr` (eindeutig, fortlaufend), `gutschrift_datum`, `gutschrift_dokument` (Ablage-Referenz)
- `kleinunternehmer_zum_zeitpunkt` (Snapshot), `steuernummer_snapshot`
- `korrektur_von` (Verweis bei Storno- oder Berichtigungsgutschrift; `status` 'storniert' reicht nicht für eine ordnungsgemäße Korrektur)
- Aufbewahrung: Gutschriften als Buchungsbeleg aufbewahren (Frist seit 2025 voraussichtlich 8 Jahre nach § 147 AO i. d. F. BEG IV, **zu prüfen**). Die RLS-Policy „Verein liest nur eigene“ ist sinnvoll.

### 6.5 Pilotphase
- Ohne Unternehmensumsatz fließt keine Vergütung, steuerlich entsteht nichts.
- Sachausgaben des Vereins für Edufy vermeiden (siehe 4.1, § 55 Abs. 1 Nr. 3 AO).
- **Keine** „Startprämien“ oder Pauschalen an Vereine ohne Abstimmung, denn auch das wäre Entgelt im wGb.

---

## 7. Fragenkatalog für den Steuerberater

**A. Förderverein – Ertragsteuern / Gemeinnützigkeit**
1. Teilen Sie die Einordnung der 30 %-Vergütung als Einnahme im **steuerpflichtigen wGb** (§§ 14, 64 AO), wenn der Verein die Einführung an der Schule aktiv unterstützt (Schulleitung, Eltern, Schüler informieren, Einladungslinks verteilen)?
2. Gibt es eine tragfähige Vertragsgestaltung, nach der die Vergütung ganz oder teilweise der **Vermögensverwaltung** (Überlassung von Namens- bzw. Logorechten, Duldung der Nennung) zugeordnet werden kann? Wie hoch schätzen Sie das Risiko einer Umqualifizierung ein, wenn der Verein faktisch aktiv mitwirkt?
3. Kommt für einen Teil der Einnahmen (z. B. vom Verein selbst organisierte Berufsorientierungsveranstaltung mit Unternehmenspräsenz) **§ 64 Abs. 6 Nr. 1 AO** (pauschal 15 %) in Betracht?
4. Bestätigen Sie die **Freigrenze von 50.000 € (§ 64 Abs. 3 AO n. F.) ab VZ 2026**, die Einbeziehung der USt sowie den neuen Verzicht auf die Sphärenzuordnung unterhalb der Grenze? Gibt es eine relevante Übergangsregel (Art. 97 § 1b EGAO)?
5. Sehen Sie bei einem Schulförderverein mit diesen Einnahmen ein Risiko für **Selbstlosigkeit oder Gepräge**? Ab welchem Verhältnis von wGb-Einnahmen zu ideellen Einnahmen würden Sie warnen?
6. Ist es gemeinnützigkeitsrechtlich problematisch, wenn der Verein in der kostenlosen Pilotphase ohne Vergütung für Edufy tätig wird (§ 55 Abs. 1 Nr. 3 AO)? Wo verläuft die Grenze zwischen ehrenamtlicher Zeit und Mitteleinsatz?
7. Muss die **Satzung** eines typischen Schulfördervereins für diese Tätigkeit angepasst werden? Welche Satzungsklauseln sollten Vereine vorab prüfen?
8. Bestätigen Sie, dass für Gemeinnützige die Pflicht zur **zeitnahen Mittelverwendung** ab 2026 bei Jahreseinnahmen bis 100.000 € entfällt?

**B. Umsatzsteuer**
9. Ist die Leistung des Vereins an Edufy **steuerbar und steuerpflichtig mit 19 %**? Ist § 12 Abs. 2 Nr. 8 a UStG sicher ausgeschlossen, und kommt keine Steuerbefreiung in Betracht?
10. Wie ist die Vergütungsklausel zu formulieren („30 % der Nettoerlöse zzgl. USt, soweit nicht § 19 UStG“), damit Kleinunternehmer und regelbesteuerte Vereine korrekt abgerechnet werden?
11. Welche **Pflichtangaben** muss Edufys Gutschrift an (a) regelbesteuerte und (b) Kleinunternehmer-Vereine enthalten? Gilt § 34a UStDV bei Gutschriften?
12. Muss Edufy Gutschriften als **E-Rechnung** ausstellen? Gilt das auch gegenüber Kleinunternehmer-Vereinen? Welche Übergangsfrist gilt für Edufy (Umsatz Gutschriftaussteller), und was folgt aus dem BMF-Schreiben vom 15.10.2026 für Gutschriften und Storno-Gutschriften?
13. Wie ist zu verfahren, wenn ein Verein im laufenden Jahr die **100.000 €-Grenze** überschreitet oder seinen Status falsch gemeldet hat (Korrektur, § 14c UStG, Widerspruch)?
14. Wie sind die **Stripe-Gebühren** bei Edufy umsatzsteuerlich zu behandeln (§ 13b UStG / § 4 Nr. 8 UStG)?

**C. Edufy**
15. Bestätigen Sie die volle Abziehbarkeit der Vergütung als **Betriebsausgabe** (KSt/GewSt) ohne Hinzurechnungen?
16. Welche Rechtsform empfehlen Sie (UG/GmbH) im Hinblick auf das Modell? Gibt es Besonderheiten, falls Gesellschafter in Vereinsvorständen sitzen (vGA, Fremdvergleich)?
17. Welche Aufbewahrungs- und GoBD-Anforderungen gelten für die automatisiert erstellten Gutschriften (Frist, Unveränderbarkeit, Verfahrensdokumentation)?
18. Ist eine **Bescheinigung bzw. Jahresübersicht** an die Vereine sinnvoll oder sogar geboten? Welche Angaben sollte sie enthalten?

**D. Unternehmen / Kommunikation**
19. Ist die Aussage „Sichtbarkeit als Partner der Schule“ für Unternehmen unbedenklich? Wie wäre eine echte Direktspende eines Unternehmens an den Verein mit Danke-Nennung von unserem Produkt sauber zu trennen?
20. Würden Sie Vereinen eine **verbindliche Auskunft** (§ 89 Abs. 2 AO) oder eine Abstimmung mit ihrem Finanzamt empfehlen? Sollte Edufy eine Musteranfrage bereitstellen?

---

## 8. Quellen

Stand der Recherche 2026-11-25. Primärquellen waren in dieser Umgebung nicht direkt abrufbar, die Inhalte sind über Sekundärquellen abgeglichen. **Wortlaut prüfen.**

**Gesetze und Verwaltungsanweisungen (Primärquellen zur Prüfung durch den StB)**
- Abgabenordnung §§ 14, 52, 55, 58, 64, 65 – https://www.gesetze-im-internet.de/ao_1977/
- AEAO zu § 64 (Sponsoring, Nrn. 7 ff.), BMF AO-Handbuch – https://ao.bundesfinanzministerium.de/ao/2026/Abgabenordnung/Zweiter-Teil/Dritter-Abschnitt/Paragraf-64/inhalt.html ; Fassung 2021: https://ao.bundesfinanzministerium.de/ao/2021/Abgabenordnung/Zweiter-Teil/Dritter-Abschnitt/Paragraf-64/ae-64.html
- BMF-Schreiben vom 18.02.1998 (Sponsoringerlass), BStBl I 1998, 212 – Abdruck: https://www.vku.de/fileadmin/user_upload/Verbandsseite/Sparten/Wasserwirtschaft/Ukraine_Wasserwirtschaft/220330_Anlage_Sponsoring-Erlass_BMF.pdf
- UStG § 19 – https://www.gesetze-im-internet.de/ustg_1980/__19.html ; §§ 12, 14, 14c, 15 UStG ebenda
- EGAO Art. 97 § 1b – https://www.gesetze-im-internet.de/aoeg_1977/BJNR033419976.html

**Steueränderungsgesetz 2025 (§ 64 Abs. 3 AO 50.000 €, Mittelverwendung 100.000 €, Pauschalen)**
- BT-Drucksache 21/1974 – https://dserver.bundestag.de/btd/21/019/2101974.pdf
- BT-Drucksache 21/3104 (Beschlussempfehlung) – https://dserver.bundestag.de/btd/21/031/2103104.pdf
- KPMG, Zustimmung Bundesrat / BGBl. 2025 I Nr. 363 – https://kpmg.com/de/de/themen/2025/12/staendg2025-zustimmung-br.html ; https://kpmg.com/de/de/themen/2025/12/staendg2025_bt-b.html
- PwC Blog – https://blogs.pwc.de/de/steuern-und-recht/article/252211/bundestag-verabschiedet-das-steueraenderungsgesetz-2025/
- CMS, Vereinfachungen im Gemeinnützigkeitsrecht zum Jahr 2026 – https://cms.law/de/deu/legal-updates/vereinfachungen-im-gemeinnuetzigkeitsrecht-zum-jahr-2026
- Der Paritätische – https://www.der-paritaetische.de/alle-meldungen/steueraenderungsgesetz-2025/
- Curacon Stiftungsbrief 01/2026 – https://www.curacon.de/fileadmin/user_upload/Curacon/Veroeffentlichungen/steueraenderungsgesetz_2025_das_sind_die_fuer_stiftungen_relevanten_aenderungen_sb_Stiftungsbrief_01_2026_patrick_doedt.pdf
- IHK Stuttgart – https://www.ihk.de/stuttgart/fuer-unternehmen/recht-und-steuern/steuerrecht/steuermeldungen/steueraenderungsgesetz-2025-6780060
- Finanzministerium M-V, FAQ Gemeinnützigkeit – https://regierung-mv.de/static/Regierungsportal/Finanzministerium/Steuerportal/Dateien/Downloads/FAQ_Gemeinn%C3%BCtzigkeit.pdf

**Kleinunternehmer (§ 19 UStG seit 2025)**
- Finanzamt Baden-Württemberg – https://finanzamt-bw.fv-bwl.de/Startseite/Service/Was+ist+die+sogenannte+Kleinunternehmerregelung_
- IHK München – https://www.ihk-muenchen.de/ratgeber/steuern/umsatzsteuer/kleinunternehmerregelung/

**Sponsoring / Umsatzsteuer**
- Haufe, Sponsoring Umsatzsteuer – https://www.haufe.de/id/rechtsquelle/sponsoring-umsatzsteuer-HI3647249.html
- NWB, AEAO zu § 64 – https://datenbank.nwb.de/Dokument/500001_64/
- DZI / Schomerus, „Mehr Mut zum Sponsoring“ (2026) – https://www.dzi.de/wp-content/uploads/2026/05/9.-Trotzki_Mehr-Mut-zum-Sponsoring-Schomerus.pdf
- Haufe, Reuber: Beschaffung von Mitteln durch Förderkörperschaften – https://www.haufe.de/id/kommentar/reuber-die-besteuerung-der-vereine-gemeinnuetzigkeit-534-beschaffung-von-mitteln-durch-foerderkoerperschaften-HI9276691.html

**E-Rechnung / Gutschrift**
- DATEV, gesetzliche Regelungen E-Rechnung – https://www.datev.de/web/de/aktuelles/e-rechnung-mit-datev/gesetzliche-regelungen/
- PwC, Drittes BMF-Schreiben zur E-Rechnung (15.10.2026) – https://blogs.pwc.de/de/steuern-und-recht/article/257709/drittes-schreiben-des-bundesfinanzministeriums-zur-elektronischen-rechnung/
- DIHK, Drittes BMF-Schreiben zur E-Rechnung – https://www.dihk.de/de/newsroom/drittes-bmf-schreiben-zur-e-rechnung-188996
- Ebner Stolz – https://www.ebnerstolz.de/de/unser-angebot/leistungen/steuerberatung/umsatzsteuer/drittes-bmf-schreiben-e-rechnung-114492.html

**Ungeprüft (Fachwissen, kein Quellenabgleich in dieser Sitzung):** Freibeträge § 24 KStG / § 11 GewStG (5.000 €), § 64 Abs. 6 AO (15 %), Pflichtangaben § 14 Abs. 4 UStG einschließlich „Gutschrift“, § 34a UStDV, § 10b Abs. 4 EStG (Haftung), Aufbewahrungsfrist 8 Jahre (BEG IV), Behandlung der Stripe-Gebühren.

**Projektdateien:** `CLAUDE.md`, `docs/BACKLOG.md` (Entschiedene Punkte, T-001), `index.html` (`#ziele`, `#netzwerk`, `#verguetung`), `registrierung-foerderverein.html`, `supabase_schulen_foerdervereine.sql` (Tabellen `foerdervereine`, `provisions`).
