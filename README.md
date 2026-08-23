# Tag 16 — Container Teil 2

> **Projektauftrag TechStyle Online Shop.** Dieses Repository ist dein
> Startpunkt fuer Tag 16 und enthaelt den Stand nach Tag 15.

## Ausgangslage

Nach der erfolgreichen Containerisierung der Applikation geht das Team zum
naechsten Schritt ueber: der Orchestrierung mit Docker Compose. Es bereitet
einen Server vor, definiert Deployments und Services und baut eine
automatisierte Pipeline auf, die neue Container-Versionen testet und
bereitstellt.

## Ziel

Der TechStyle-Webshop wird als Container mit Docker Compose automatisiert auf
eine EC2-Instanz deployed.

## Aufgaben

### 1. Automatisierte CI/CD-Pipeline

Erstelle einen GitHub Actions Workflow fuer das Container-Deployment mit
diesen Stages:

1. Container build und Container push auf ECR (Registry)
2. Setup der EC2-Instanz (darf auch manuell erstellt werden)
3. Deployment des Containers

Kopiert die Secrets aus dem AWS-Lab in die GitHub Secrets.

### 2. Dokumentation

- Dokumentiere die Pipeline-Architektur.
- Erstelle eine Bedienungsanleitung fuer Entwickler.
- Fuehre eine Team-Schulung zur neuen Pipeline durch.

## Abnahmekriterien

Tag 16 ist ein **Sammelcheck**: die automatische Pruefung verifiziert, dass
die Artefakte der vorangegangenen Container- und Betriebs-Tage im Repository
vorhanden sind.

- [ ] Monitoring-Konfiguration vorhanden (Tag 9-10) — Prometheus-Konfiguration
      im Repo-Stamm oder unter `monitoring/`
- [ ] Security-Workflow vorhanden (Tag 11) — `.github/workflows/security*.yml`
- [ ] `Dockerfile` vorhanden (Tag 14)
- [ ] Container-Pipeline vorhanden (Tag 15) —
      `.github/workflows/container*.yml`, `build*.yml` oder `docker*.yml`

> ⚠️ **Hinweis:** Der heutige Projektauftrag (Deployment auf EC2/ECR) wird
> von diesen automatischen Checks nicht abgedeckt und durch die Lehrperson
> manuell abgenommen.

Manuell abgenommen wird:

- [ ] CI-Pipeline fuer automatisierten Container-Build eingerichtet
- [ ] Docker-Image in AWS ECR gepusht
- [ ] Automatisches Deployment konfiguriert
- [ ] End-to-End Pipeline (Code → Build → Push → Deploy) getestet

## Abnahmekriterien selber pruefen

**Lokal** — jederzeit, ohne Push:

```bash
bash .github/classroom/grade.sh
```

Das Skript liest die Tagesnummer aus `.classroom50.yaml`. Du kannst sie auch
erzwingen:

```bash
CLASSROOM_DAY=16 bash .github/classroom/grade.sh
```

Die Ausgabe listet jedes Kriterium mit ✅ oder ❌ und nennt bei jedem ❌ den
konkreten Loesungshinweis. Sobald ein Kriterium fehlt, endet das Skript mit
Exit-Code 1.

**In GitHub** — bei jedem Push:

Der Workflow **🎓 Classroom Autograding** laeuft automatisch. Ergebnis im Tab
**Actions** → letzter Run → Job *Abnahmekriterien pruefen*.

## Anwendung lokal starten

```bash
./run_dev.sh
```

Legt ein venv an, installiert die Abhaengigkeiten, seedet die Datenbank und
startet den Dev-Server auf http://localhost:5000. Admin-Panel unter `/admin`.

Hinweise zur Anwendung:

- Die Datenbank liegt unter `/tmp/techstyle.db`.
- `python seed_data.py` (im aktivierten venv) setzt die Produkte zurueck.
- Das Admin-Panel hat noch kein Login — das ist zum jetzigen Zeitpunkt so gewollt.
