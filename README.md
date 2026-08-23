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

Diese Kriterien prueft die Pipeline bei jedem Push automatisch. **Die Haken
setzt die Pipeline selbst:** ein erfuelltes Kriterium wird abgehakt, und
sobald eine Aenderung es wieder bricht, verschwindet der Haken. Du musst hier
nichts von Hand pflegen — beim naechsten Push wird die Liste ueberschrieben.

<!-- c50:progress -->
**Fortschritt: 0 / 10 Kriterien erfüllt** ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜ — Stand: 2026-08-23 22:08 UTC.
<!-- /c50:progress -->

- [ ] ⬜ Aufgabe 1: Deployment-Workflow vorhanden (.github/workflows/)
- [ ] ⬜ Aufgabe 1: Workflow definiert mindestens einen Job (jobs:)
- [ ] ⬜ Aufgabe 1: Stage 1 — Container-Image wird gebaut
- [ ] ⬜ Aufgabe 1: Stage 1 — Image wird in die Registry gepusht (ECR)
- [ ] ⬜ Aufgabe 1: Stage 2 — AWS-Credentials als GitHub Secrets referenziert
- [ ] ⬜ Aufgabe 1: Stage 3 — Deployment auf die EC2-Instanz
- [ ] ⬜ Aufgabe 1: docker-compose.yml für das Deployment vorhanden
- [ ] ⬜ Aufgabe 2: Deployment-Dokumentation vorhanden (DEPLOYMENT.md)
- [ ] ⬜ Aufgabe 2: Pipeline-Architektur und Bedienung dokumentiert
- [ ] ⬜ Aufgabe 2: Dokumentation hat ausreichend Inhalt (mind. 100 Wörter)

Zusaetzlich manuell abgenommen (nicht automatisch geprueft):

- End-to-End Pipeline (Code -> Build -> Push -> Deploy) getestet
- Bedienungsanleitung fuer Entwickler und Team-Schulung

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

Der Workflow **🎓 Classroom Autograding** laeuft automatisch und hakt die
erfuellten Kriterien oben im README ab. Ergebnis im Tab
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
