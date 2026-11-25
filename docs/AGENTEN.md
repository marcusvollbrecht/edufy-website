# Edufy Agentensystem

```
                         ┌──────────────┐
                         │  edufy-pm    │  plant · delegiert · priorisiert
                         └──────┬───────┘
          ┌─────────────────────┼─────────────────────┐
  ┌───────▼────────┐   ┌────────▼────────┐   ┌────────▼────────┐
  │ dev-schueler   │   │ dev-foerderverein│   │ dev-unternehmen │   bauen (parallel)
  └───────┬────────┘   └────────┬────────┘   └────────┬────────┘
  ┌───────▼────────┐   ┌────────▼────────┐   ┌────────▼────────┐
  │ test-schueler  │   │ test-foerderverein│  │ test-unternehmen│   testen (parallel)
  └───────┬────────┘   └────────┬────────┘   └────────┬────────┘
          └──────── feedback/<rolle>/ ──► edufy-pm ──► docs/BACKLOG.md
```

## Installation
1. Inhalt dieses Pakets in den Edufy-Projektordner (Repo-Root) kopieren.
   Existiert dort schon eine `CLAUDE.md`, den Inhalt zusammenführen statt überschreiben.
2. `chmod +x docs/validate.sh`
3. Claude Code im Projektordner starten.

## Nutzung
| Ziel | Befehl |
|---|---|
| Kompletter Zyklus | `claude --agent edufy-pm` und dann `/sprint Förderverein-Onboarding fertigstellen` |
| Alternativ in normaler Session | `/sprint <Ziel>` |
| Nur Testrunde | `/feedback registrierung-unternehmen.html` |
| Einzelnen Agenten direkt | „Nutze edufy-dev-unternehmen für U-001“ |
| Agenten anzeigen/bearbeiten | `/agents` |

Hinweis: Subagenten können keine weiteren Subagenten starten. Darum läuft der PM am besten als
Haupt-Session (`--agent edufy-pm`) oder über `/sprint` – dann kann er die anderen sechs starten.

## Rollen
| Agent | Rolle | Schreibt in |
|---|---|---|
| edufy-pm | Planung, Delegation, Integration, Bericht an Marcus | `docs/` |
| edufy-dev-schueler | Schüler-Account, Bibliotheken, Content | Schüler-Dateien |
| edufy-dev-foerderverein | Förderverein/Schule, Onboarding, Provisionen | Förderverein-Dateien |
| edufy-dev-unternehmen | Firmenprofil, Angebote, Buchung, Reporting | Unternehmens-Dateien |
| edufy-test-schueler | Personas Lena (15) & Jonas (18) | `feedback/schueler/` |
| edufy-test-foerderverein | Personas Petra (Kassenwartin) & Thomas (Vorsitzender) | `feedback/foerderverein/` |
| edufy-test-unternehmen | Personas Sandra (Ausbildungsleitung) & Mehmet (Handwerk) | `feedback/unternehmen/` |

## Was bei Marcus bleibt
- SQL-Dateien in Supabase einspielen
- Deployment (GitHub → Vercel)
- Entscheidungen zu Preisen, Provisionen, Recht/Steuern, Zahlungsanbieter

## Grenzen der Test-User
Die Test-Agenten simulieren Nutzer anhand von Code und Texten (und eines lokalen Servers, falls
vorhanden). Sie ersetzen keine echten Nutzertests – vor dem Launch mit 2–3 echten Fördervereinen,
Schülern und Unternehmen gegenprüfen.
