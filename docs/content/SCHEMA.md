# Content-Datenformat Schülerbereich (Sprint 3)

Alle Inhalte liegen als statisches JSON unter `data/` (kein Login nötig, keine Schülerdaten → datensparsam).
Jede Datei hat einen Kopf mit `stand` und `quellen`; jeder Zahlenwert ist belegt oder ausdrücklich `"geprueft": false`.

Gemeinsame Felder:
- `quelle`: `{ "titel": "...", "herausgeber": "...", "url": "...", "stand": "JJJJ-MM" }`
- `geprueft`: `true` nur, wenn der Wert an der Primärquelle abgelesen wurde; sonst `false` + `hinweis`.

## data/berufe.json
```json
{
  "stand": "2026-11",
  "quellen": [ { "titel": "...", "herausgeber": "BIBB", "url": "...", "stand": "2025-10" } ],
  "berufe": [
    {
      "id": "kaufmann-buero",                // kebab-case, eindeutig
      "name": "Kaufmann/-frau für Büromanagement",
      "bereich": "Kaufmännisch",             // feste Liste: Kaufmännisch, Handwerk, Industrie/Technik, IT, Gesundheit/Soziales, Gastro/Tourismus, Handel, Bau, Logistik, Medien/Gestaltung, Öffentlicher Dienst, Landwirtschaft/Umwelt
      "kurz": "1–2 Sätze, Du-Ansprache, Klasse-9-verständlich",
      "taetigkeiten": ["3–5 Stichpunkte"],
      "dauer_monate": 36,
      "schulabschluss_typisch": "mittlerer Schulabschluss",   // rechtlich meist keiner vorgeschrieben → so formulieren
      "verguetung": { "jahr1": 0, "jahr2": 0, "jahr3": 0, "jahr4": null, "einheit": "EUR brutto/Monat, tariflicher Durchschnitt", "quelle": {}, "geprueft": false },
      "staerken": ["3 Stichpunkte"],
      "aufstieg": [ { "abschluss": "Fachwirt/-in (IHK)", "dqr": 6 } ],
      "aehnlich": ["id", "id"]
    }
  ]
}
```

## data/studium.json
`studiengaenge[]`: `id, name, art ("Studium"|"Duales Studium"), bereich, kurz, dauer_semester, zugang (z. B. "Abitur / Fachhochschulreife / beruflich Qualifizierte"), nc_hinweis (Text, keine erfundenen NC-Werte), perspektiven[], aehnlich[]`.

## data/foerderungen.json
`foerderungen[]`: `id, name, fuer (z. B. "Azubis, die nicht bei den Eltern wohnen"), art ("Zuschuss"|"Darlehen"|"Stipendium"|"Prämie"), betrag_text (z. B. "bedarfsabhängig" oder "bis zu 9.135 € über 3 Jahre"), voraussetzungen[], selbstcheck[] (Ja/Nein-Fragen für unverbindliche Ersteinschätzung), antrag_bei, link, quelle, geprueft`.

## data/bildungswege.json
`schulformen[]` (Hauptschule/Mittelschule, Realschule, Gesamtschule, Gymnasium …) und `wege[]`:
`{ id, von: {schulform, klasse_min}, schritte: [ {titel, dauer_monate, abschluss} ], ziel_dqr, ziel_beispiele: [beruf/studium-ids], hinweis_laender }`.
Länderunterschiede nur allgemein benennen („je nach Bundesland“), nichts erfinden.

## Ergänzungen (PM, nach S-004)
- `hinweis` ist **intern** (Prüfvermerke, Quellenprobleme) und wird nie angezeigt.
- Neues optionales Feld `hinweis_oeffentlich` (Text für Schüler, z. B. „Betriebe ohne Tarif dürfen bis zu 20 % darunter liegen“) – wird auf den Seiten angezeigt.
- Selbstcheck: `selbstcheck` ist ein Array aus Strings **oder** Objekten `{ "frage": "...", "erwartet": "ja"|"nein" }`. Konvention: Antwort = `erwartet` (Default „ja“) bedeutet „Voraussetzung erfüllt“. Keine Wissensfragen („Weißt du, ob …“) – nur Fragen zur eigenen Situation.
- `schulabschluss_typisch` bleibt Freitext, soll aber mit einer der Stufen beginnen: „ohne Abschluss möglich“, „Hauptschulabschluss“, „mittlerer Schulabschluss“, „Fachhochschulreife“, „Abitur“.
