# Test-Feedback Förderverein-Onboarding – Runde 2 (nach F-001b und F-008) – 2026-11-25

Getestet: `registrierung-foerderverein.html` und `foerderverein-bestaetigung.html` (ohne Parameter, `?status=email` im selben Tab und ohne Session, `#anmelden`, abgelaufener Link, Login „Email not confirmed“, Erfolg, Dublette spät per RPC, technischer RPC-Fehler). Außerdem `datenschutz.html#registrierung-foerderverein` und der Abschnitt zu den RPCs in `supabase_schulen_foerdervereine.sql`.

So habe ich getestet: lokaler Server, Playwright/Chromium bei 390 px und 1280 px. Einmal lief der Test unkonfiguriert (Ist-Stand). Einmal lief er mit einem Stub für `supabase.createClient`, dafür habe ich per Route `js/vendor/supabase-js-2.45.4.js` und `js/supabase-config.js` ersetzt. Der Stub deckte ab: `check_school_registered` = true, `signUp` ohne Session, „User already registered“, Session mit Metadaten, RPC-Fehler `EDUFY:SCHULE_BEREITS_REGISTRIERT` bzw. „Failed to fetch“.

Technisch: keine JS-Fehler und kein horizontales Scrollen in irgendeinem Zustand. Fehlerliste und Feldfehler sind unverändert gut. Touchflächen haben mindestens 44–48 px.

## Kurzfazit Petra (58, Kassenwartin) – Note 3 (Runde 1: 3)
Petra versteht jetzt ehrlich, was auf sie zukommt. Die Registrierung ist kostenlos, in der Pilotphase fließt kein Geld, verbindlich wird es erst mit der Jahresvereinbarung, und die Schulleitung muss zustimmen. Damit fühlt sie sich nicht mehr überrumpelt. Ihre beiden Kernsorgen bleiben aber unbeantwortet. Sie weiß nicht, was das Geld steuerlich für den gemeinnützigen Verein bedeutet. Und was steht in der Vereinbarung, die „der Vorstand abschließt“ (Laufzeit, Kündigung, Pflichten)? Klickt sie auf „Datenschutzerklärung“, sieht sie weiterhin gelb markierte „[BITTE AUSFÜLLEN]“-Lücken, ausgerechnet im Abschnitt zu ihrer Registrierung.

## Kurzfazit Thomas (45, Vorsitzender) – Note 2–3 (Runde 1: 3–4)
Für 2 Minuten vor dem Vorstand reicht es jetzt fast. Die Kopiervorlage deckt Kosten, Pilotphase ohne Vergütung, Schulleitung, Jahresvereinbarung und Schülerdaten in einem Absatz ab, und der Dublettenfall ist sauber gelöst. Vor der Schulleitung steht er dagegen mit leeren Händen da. Das Infoschreiben ist „kommt bald“. Ob neben der Schulleitung auch Schulkonferenz oder Schulträger zustimmen müssen, erfährt er nicht. Den Satz der Vorlage „keine Daten einzelner Schülerinnen und Schüler“ müsste er bei Nachfragen relativieren.

## Abgleich mit Runde 1
| Befund Runde 1 | Status | Anmerkung |
|---|---|---|
| [P0] Datenschutzerklärung mit Platzhaltern, Einwilligung in unfertigen Text | **teilweise** | Die Checkbox ist durch einen Hinweis ersetzt (lit. b), und Abschnitt „Registrierung als Förderverein“ nennt jetzt alle Felder und den Umgang mit Metadaten. Weiterhin stehen 16 sichtbare Platzhalter in `datenschutz.html` (11 im Impressum), davon 4 im Registrierungs-Abschnitt: Weitergabe an Unternehmen, Löschfrist, Rechtsgrundlage der freiwilligen Angaben, IP-Logs |
| [P1] Bestätigungsseite im Dublettenfall widersprüchlich | **behoben** | Eigene H1 „Für Ihre Schule ist schon ein Förderverein registriert“, keine Schritte und keine Vorlage, mailto mit Schule und PLZ, Hinweis auf gelöschte Metadaten |
| [P1] Keine zweite Ansprechperson möglich | **teilweise** | Es gibt einen mailto-Button mit vorausgefüllter Schule/PLZ (früh und spät). Ein echtes „Zugang anfragen“ fehlt weiter, und die Erstregistrierende wird nicht benachrichtigt |
| [P1] Dublette fällt erst ganz am Ende auf / unscharfe Schreibweise | **teilweise** | Die Prüfung läuft jetzt nach Schritt 1 (getestet: Hinweis erscheint, Weiter blockiert), serverseitig mit Normalisierung (`edufy_schulname_key`, `edufy_schule_passt`). Schulnummer bzw. Schulauswahl fehlt (F-005 offen) |
| [P1] Höhe/Herkunft des Geldes | **teilweise (gewollt)** | Laut Entscheidung bewusst ohne Prozentsatz. Herkunft ist jetzt klar („Einnahmen, die Edufy mit Unternehmen über Ihre Schule erzielt“), Pilotphase ohne Vergütung ehrlich benannt. Wann und wie ausgezahlt wird, fehlt weiter |
| [P1] Gemeinnützigkeit/Steuer | **offen** | Auf beiden Seiten kein Wort dazu, obwohl die Vorprüfung (T-001) einen wirtschaftlichen Geschäftsbetrieb und ggf. USt beim Verein für wahrscheinlich hält |
| [P1] Schulleitung und Schülerdaten | **weitgehend behoben** | Schulleitung steht vor dem Absenden und in den nächsten Schritten. Schülerdaten stehen nur in der Kopiervorlage, nicht auf der Registrierungsseite. Infoschreiben für die Schulleitung „kommt bald“ |
| [P1] Erneut senden nur im selben Tab | **behoben** | Karte „Keine Bestätigungs-E-Mail bekommen?“ mit E-Mail-Feld auf jedem Gerät. Nach „Email not confirmed“ erscheint direkt ein Resend-Button (getestet) |
| [P2] Marke edu-connect / EduConnect | **behoben** | Durchgehend Edufy und hallo@edufy.world, auch in Datenschutz/Impressum keine Altmarke gefunden |
| [P2] „Vielen Dank“ ohne Registrierung | **behoben** | Unkonfiguriert und ohne Session ist die H1 neutral („Stand Ihrer Registrierung“ bzw. „Anmelden oder Registrierung abschließen“) |
| [P2] Formular ausfüllbar, obwohl nicht freigeschaltet | **teilweise** | Der Hinweis steht jetzt mit E-Mail-Adresse über dem Formular. Die Arbeit geht beim Absenden aber weiter verloren, es gibt keinen mailto mit den Angaben |
| [P2] „E-Mail schon vergeben“ ohne Link | **behoben** | Links „Zur Anmeldung“ und „Passwort vergessen?“ sind da, Passwort-Reset ist vorhanden |
| [P2] „kein Vertrag“ / „jederzeit austreten“ | **teilweise** | Jetzt ehrlich formuliert: „Verbindlich wird es erst mit der Jahresvereinbarung“. Laufzeit, Kündigung und Austritt aus der Vereinbarung erklärt aber keiner |
| [P2] Vertretungsbefugnis / Vorstandsbeschluss | **behoben** | E-F6-Hinweis (§ 26 BGB) steht unter der Checkbox |
| [P2] Metadaten bleiben liegen | **teilweise** | Werden bei endgültigem Fehler gelöscht (getestet). Unbestätigte bzw. verwaiste Konten werden nicht gelöscht (F-004 offen), die Frist in der Datenschutzerklärung ist ein Platzhalter |
| [P2] Vorlage ohne Link/Schulleitung/Schülerdaten | **teilweise** | Schulleitung, Schülerdaten und Pilotphase sind drin. Ein Link zum Nachlesen fehlt weiter |
| [P3] „weiß ich nicht“ wird zu false | **offen** | `gemeinnuetzig: radioValue(...) === 'ja'` |
| [P3] Hinweis „keine Bankdaten nötig“ | **offen** | |
| [P3] Fortschritt mobil nur Ziffern | **offen** | Akzeptabel |
| [P3] Passwort-Hinweis/Reset | **behoben** | Reset vorhanden, Merkhilfe im Hinweis |

## Kann Thomas es in 2 Minuten erklären?
| Frage von Vorstand/Schulleitung | Steht da? |
|---|---|
| Kostet es etwas, ist es verbindlich? | Ja, klar: kostenlos, verbindlich erst mit Jahresvereinbarung |
| Woher kommt das Geld, wie viel? | Herkunft ja. Höhe bewusst „im Gespräch“ |
| Wann fließt Geld? | „Pilotphase: keine Vergütung“, aber ohne Dauer und Enddatum |
| Was steht in der Jahresvereinbarung (Laufzeit, Kündigung, Pflichten des Vereins)? | Nein, nur „erklären wir im Gespräch“ |
| Steuerliche Folgen für die Gemeinnützigkeit? | Nein |
| Welche Schülerdaten sehen Unternehmen? | Nur in der Vorlage, und dort zu absolut formuliert (s. u.) |
| Was muss die Schulleitung tun, wer muss noch zustimmen? | Schulleitung ja, „keine Pflichten für die Schule“. Gremien (Schulkonferenz, Schulträger) fehlen, Infoschreiben fehlt |
| Wie kommen wir wieder raus? | Nein |

## Befunde
- [P0] datenschutz.html:Abschnitt „Registrierung als Förderverein“ (verlinkt aus Schritt 3) — Weiterhin sichtbare Platzhalter, gelb hervorgehoben, darunter „Weitergabe an Unternehmen: [BITTE AUSFÜLLEN … ob Unternehmen den Namen des Vereins sehen]“ und „löschen wir nach [BITTE AUSFÜLLEN: Frist …]“. Insgesamt 16 in der Datenschutzerklärung und 11 im Impressum. Ohne Checkbox blockiert das nicht mehr den Klick, aber die Art.-13-Information und das Impressum sind unvollständig, und Petra verliert hier das Vertrauen. Go-live-Blocker. — Platzhalter vor dem Go-live schließen (G-007, Marcus/Anwalt), vor allem Weitergabe, Löschfrist und Rechtsgrundlage der freiwilligen Felder.
- [P1] beide Seiten:Steuer/Gemeinnützigkeit — Laut T-001 ist ein wirtschaftlicher Geschäftsbetrieb beim Verein wahrscheinlich, ggf. mit USt. Für eine Kassenwartin ist das die wichtigste Information vor einer Jahresvereinbarung, und die Seiten schweigen dazu. Erfährt Petra das erst im Gespräch oder nach dem Beschluss, fühlt sie sich getäuscht. — Einen Satz in „Erst später verbindlich“ und unter „Jahresvereinbarung abschließen“ ergänzen, etwa: „Die Beteiligung kann für Ihren Verein steuerliche Folgen haben (z. B. wirtschaftlicher Geschäftsbetrieb). Wir sprechen das im Gespräch an. Bitte stimmen Sie sich mit Ihrem Steuerberater ab.“ Wortlaut mit edufy-steuer/edufy-legal abstimmen.
- [P1] foerderverein-bestaetigung.html:Schritt „Zustimmung der Schulleitung einholen“ — Das Infoschreiben ist „kommt bald“. Thomas soll die Zustimmung einholen, hat aber nichts zum Weitergeben, und die Registrierungsseite selbst erklärt Edufy nicht. In NRW u. a. reicht die Schulleitung laut Legal M14 evtl. nicht (Schulkonferenz/Schulträger). Der Satz „Pflichten für die Schule entstehen dadurch nicht“ könnte dann falsch sein. — Vor dem Go-live ein einseitiges Infoblatt bzw. eine Infoseite für Vorstand und Schulleitung bereitstellen (Was ist Edufy, Datenschutz Schüler, Pilotphase, Ablauf der Zustimmung). „Je nach Bundesland können weitere Gremien beteiligt sein“ ergänzen (F-006).
- [P1] beide Seiten:Jahresvereinbarung — Der Vorstand soll eine Vereinbarung „beschließen“, von der weder Laufzeitbeginn, Kündigung, Pflichten des Vereins noch das Verhältnis zur Pilotphase bekannt sind. Warum sollte man sich ein Jahr binden, wenn es in der Pilotphase keine Vergütung gibt? Petra und der Vorstand vertagen das. — 3 Stichpunkte direkt auf der Seite: Laufzeit 12 Monate ab Aktivierung (oder ab Ende der Pilotphase), Kündigung wie, was der Verein konkret tun soll (z. B. Schülerinnen und Schüler einladen). Musterentwurf zum Nachlesen verlinken, sobald F-007 vorliegt.
- [P2] foerderverein-bestaetigung.html:Kopiervorlage — „Unternehmen sehen dabei nur anonyme Statistiken, keine Daten einzelner Schülerinnen und Schüler“ ist absolut formuliert. Laut Entscheidung sehen Unternehmen Schülerdetails, sobald ein Schüler aktiv Kontakt aufnimmt. Thomas würde der Schulleitung so etwas Falsches zusagen. — Präzisieren: „… Daten einzelner Schülerinnen und Schüler nur, wenn diese selbst Kontakt aufnehmen (unter 16 nur mit Freigabe der Eltern).“ Mit edufy-legal abstimmen (E-F3), dieselbe Aussage auch auf die Registrierungsseite.
- [P2] beide Seiten:Pilotphase — Es gibt keine Angabe, wie lange die Pilotphase dauert bzw. ab wann frühestens Geld fließen kann. „Kostenlose Pilotphase für Unternehmen“ liest Petra zunächst als etwas, das ihren Verein betrifft. Der Satz steht auf der Registrierungsseite 2-mal und auf der Bestätigungsseite 2-mal. — Formulieren: „Unternehmen testen Edufy bis voraussichtlich [Datum] kostenlos. Bis dahin gibt es keine Einnahmen und damit auch keine Beteiligung für Ihren Verein.“ Je Seite einmal reicht.
- [P2] foerderverein-bestaetigung.html:Dublettenfall (spät) — „Ihr Konto wurde angelegt, ist aber keinem Verein zugeordnet“. Es gibt keinen Weg, das Konto selbst zu löschen, und die automatische Löschung fehlt (F-004). — Den Satz „Wenn Sie das Konto nicht brauchen, löschen wir es nach X Tagen automatisch“ bzw. einen Button „Konto löschen“ ergänzen.
- [P2] registrierung-foerderverein.html:Dublettenhinweis Schritt 1 — Nur mailto. Wer kein Mailprogramm am Gerät hat (Smartphone-Browser, Webmail), dem passiert beim Klick nichts. — Die Adresse zusätzlich als kopierbaren Text zeigen. Mittelfristig „Zugang zum bestehenden Verein anfragen“ als Funktion.
- [P2] registrierung-foerderverein.html:unkonfiguriert — Der Hinweis steht jetzt oben, trotzdem kann man 5 Minuten ausfüllen und verliert beim Absenden alles. — Beim Absenden ohne Backend einen mailto mit Zusammenfassung anbieten oder das Formular bis zum Go-live ausblenden.
- [P2] datenschutz.html:Registrierung, Punkt „Pflichtangaben“ — „Ohne die Pflichtangaben ist eine Registrierung nicht möglich. Die Angabe ist freiwillig …“ widerspricht sich für Laien. — Umformulieren: „Sie sind nicht gesetzlich verpflichtet, uns diese Daten zu geben. Ohne die Pflichtangaben können wir Ihren Verein aber nicht registrieren.“
- [P2] beide Seiten:Austritt — Seit „jederzeit austreten“ entfernt wurde, steht nirgends, wie man die Registrierung zurückzieht (vor der Vereinbarung) bzw. kündigt. — Einen Satz ergänzen: „Bis zur Jahresvereinbarung genügt eine E-Mail an hallo@edufy.world, dann löschen wir Ihre Daten.“
- [P3] registrierung-foerderverein.html:Datenschutzhinweis Schritt 3 — Klein und grau unter der Checkbox, leicht zu übersehen. Rechtlich genügt das, für Petra wäre er an prominenterer Stelle beruhigender. — Optional auch in Schritt 4 unter „So geht es nach dem Absenden weiter“ wiederholen.
- [P3] registrierung-foerderverein.html:„Nein / weiß ich nicht“ — Wird weiterhin als `false` gespeichert. — Dritten Wert „unbekannt“ (null).
- [P3] registrierung-foerderverein.html:Trust-Liste — Weiterhin fehlt „Bankverbindung brauchen wir jetzt noch nicht“. — Ergänzen.
- [P3] foerderverein-bestaetigung.html:Erfolgsansicht — Die Reihenfolge der Schritte ist schlüssig, aber „Vorstand informieren“ steht vor „Persönliches Gespräch“. Thomas würde den Vorstand lieber nach dem Gespräch mit konkreten Zahlen informieren. — Optional die Vorlage als „Kurzinfo jetzt, Details nach dem Gespräch“ kennzeichnen.

## Positiv (neu in Runde 2)
- Die Seiten sind ehrlich zu Pilotphase, Jahresvereinbarung und Schulleitung, kein „kein Vertrag“ mehr. Der Ablauf in 4 Schritten ist auf beiden Seiten gleich.
- Der Dublettenfall ist früh und spät sauber gelöst, die Metadaten werden gelöscht und das dem Nutzer gesagt.
- Erneut senden und Passwort vergessen funktionieren geräteübergreifend. Die Fehlertexte bei abgelaufenem Link, nicht bestätigter E-Mail und vorhandenem Konto bieten jeweils den passenden nächsten Schritt an.
- Einheitliche Marke und Kontaktadresse.

---
Hinweis: Dies ist ein simulierter Test mit fiktiven Personas und einem Supabase-Stub. Er ersetzt keine echten Nutzertests. Vor allem die Fragen zu Steuer, Jahresvereinbarung und Schulleitungszustimmung sollten mit 3–5 echten Fördervereinen (Kassenwart/in und Vorsitz) und, wenn möglich, einer Schulleitung geprüft werden.
