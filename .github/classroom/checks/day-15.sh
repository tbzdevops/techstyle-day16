#!/bin/bash
# PROJEKT Tag 15 — DevSecOps: Security-Pipeline für TechStyle.
# Geprüft werden nur security.yml und container-scan.yml. Der Ausgangsstand
# (day_14_solution) bringt viele weitere Workflows mit; ein generischer grep
# über .github/workflows/ würde sonst fremde Schritte als Lösung werten.
source .github/classroom/grade.sh

solution_for_id() {
  case "$1" in
    sec-wf) echo "Lege .github/workflows/security.yml nach der Vorlage in Tag15.md an (Rolle 1)" ;;
    sec-trigger) echo "Trigger: 'push: branches: [main]' und 'pull_request:'" ;;
    sec-token) echo "Lies den Token als Secret: 'SNYK_TOKEN: \${{ secrets.SNYK_TOKEN }}' und lege das Repository-Secret SNYK_TOKEN an" ;;
    sec-sca) echo "Füge einen Schritt mit 'snyk test' hinzu (SCA, Abhängigkeiten aus requirements.txt)" ;;
    sec-sast) echo "Füge einen Schritt mit 'snyk code test' hinzu (SAST, eigener Quellcode)" ;;
    sec-threshold) echo "Ergänze --severity-threshold=high, damit nur High und Critical den Build scheitern lassen" ;;
    sec-sarif) echo "Schreibe --sarif-file-output=... und lade die Datei mit github/codeql-action/upload-sarif (oder actions/upload-artifact) hoch" ;;
    ct-wf) echo "Lege .github/workflows/container-scan.yml nach der Vorlage in Tag15.md an (Rolle 2)" ;;
    ct-scan) echo "Baue das Image im Workflow (docker build -t techstyle:ci .) und scanne es mit 'snyk container test techstyle:ci --file=Dockerfile'" ;;
    ct-base) echo "Ersetze 'FROM python:3.11-slim' im Dockerfile durch das Base-Image, das Snyk im Log empfiehlt" ;;
    pitch-file) echo "Lege PITCH.md im Wurzelverzeichnis an" ;;
    pitch-parts) echo "Gliedere PITCH.md in vier Teile: Risiko, Lösung, Beweis, Nutzen" ;;
    pitch-proof) echo "Trage unter 'Beweis' den Link zum roten Pull-Request (…/pull/<nr>) oder Lauf (…/actions/runs/<nr>) ein oder bette einen Screenshot ein" ;;
    *) echo "Überprüfe die Aufgabenstellung im README" ;;
  esac
}

first_file() { for f in "$@"; do [ -f "$f" ] && { echo "$f"; return; }; done; echo /dev/null; }
SEC="$(first_file .github/workflows/security.yml .github/workflows/security.yaml)"
CT="$(first_file .github/workflows/container-scan.yml .github/workflows/container-scan.yaml)"
PITCH=PITCH.md

echo "🔍 Prüfe Abnahmekriterien für Tag 15 — DevSecOps (Security-Pipeline und Pitch)"
echo ""

echo "── Rolle 1: Gate – Snyk in der Pipeline ──"

check "sec-wf" \
  "Rolle 1: Security-Workflow vorhanden (.github/workflows/security.yml)" \
  "[ '$SEC' != /dev/null ]"

check "sec-trigger" \
  "Rolle 1: Läuft bei jedem Push auf main und bei jedem Pull-Request" \
  "grep -qE '^[[:space:]]*push[[:space:]]*:' $SEC && grep -qE '^[[:space:]]*pull_request[[:space:]]*:?' $SEC && grep -qE 'main' $SEC"

check "sec-token" \
  "Rolle 1: SNYK_TOKEN wird als GitHub Secret gelesen" \
  "grep -qE 'secrets\.SNYK_TOKEN' $SEC"

check "sec-sca" \
  "Rolle 1: SCA mit snyk test" \
  "grep -qE 'snyk[[:space:]]+test([[:space:]]|$)|uses:[[:space:]]*snyk/actions/python' $SEC"

check "sec-sast" \
  "Rolle 1: SAST mit snyk code test" \
  "grep -qE 'snyk[[:space:]]+code[[:space:]]+test|command:[[:space:]]*code[[:space:]]+test' $SEC"

check "sec-threshold" \
  "Rolle 1: Build scheitert nur bei High und Critical (--severity-threshold=high)" \
  "grep -qE -- '--severity-threshold[= ](high|critical)' $SEC"

check "sec-sarif" \
  "Rolle 1: Findings als SARIF im Security-Tab oder als Artefakt" \
  "grep -qE -- '--sarif-file-output' $SEC && grep -qE 'codeql-action/upload-sarif|actions/upload-artifact' $SEC"

echo ""
echo "── Rolle 2: Container – Image scannen ──"

check "ct-wf" \
  "Rolle 2: Container-Workflow vorhanden (.github/workflows/container-scan.yml)" \
  "[ '$CT' != /dev/null ]"

check "ct-scan" \
  "Rolle 2: Image wird im Workflow gebaut und mit snyk container test gescannt" \
  "grep -qE 'docker[[:space:]]+(build|buildx)|docker/build-push-action' $CT && grep -qE 'snyk[[:space:]]+container[[:space:]]+test|uses:[[:space:]]*snyk/actions/docker' $CT"

check "ct-base" \
  "Rolle 2: Base-Image im Dockerfile ist aktualisiert (nicht mehr python:3.11-slim)" \
  "grep -qiE '^FROM[[:space:]]' Dockerfile && ! grep -qiE '^FROM[[:space:]]+python:3\.11-slim([[:space:]]|$)' Dockerfile"

echo ""
echo "── Alle: Gate-Beweis und Pitch ──"

check_file_exists "pitch-file" \
  "Pitch: PITCH.md vorhanden" \
  "$PITCH"

check "pitch-parts" \
  "Pitch: PITCH.md enthält Risiko, Lösung, Beweis und Nutzen" \
  "grep -qi 'risiko' $PITCH && grep -qiE 'lösung|loesung' $PITCH && grep -qi 'beweis' $PITCH && grep -qi 'nutzen' $PITCH"

check "pitch-proof" \
  "Gate-Beweis: PITCH.md verlinkt den roten Pull-Request oder Lauf" \
  "grep -qE 'github\.com/[^/[:space:]]+/[^/[:space:]]+/(pull/[0-9]+|actions/runs/[0-9]+)|!\[[^]]*\]\([^)]+\.(png|jpe?g|gif|webp)\)' $PITCH"

summary 15
