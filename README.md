# Tag 16 Projekt — DORA-Metriken für TechStyle

> **Projektauftrag TechStyle Online Shop.** Dieses Repository ist eure Abgabe
> für Tag 16. Es enthält den Stand von
> [`day_15_solution`](https://github.com/tbzdevops/techstyle/tree/day_15_solution):
> den containerisierten Shop mit Deployment auf AWS und Security-Pipeline,
> dazu die Vorlage `DORA.md` für eure Auswertung.

## Story

Seit Tag 01 baut ihr TechStyle um: CI, Tests, Container, Deployment auf AWS,
Security-Pipeline. Die Geschäftsleitung fragt: **«Hat sich das gelohnt? Zeigt
es uns mit Zahlen.»** Bisher kann niemand sagen, wie oft der Shop deployt wird,
wie lange eine Änderung bis in Produktion braucht oder wie oft dabei etwas
kaputtgeht.

Euer Team macht die Lieferung heute messbar: Ihr legt fest, was gezählt wird,
baut eine Messpipeline auf eurem Rechenkern aus der Praxis, erzeugt eine kleine
Lieferhistorie und leitet aus den Zahlen eine Massnahme für die Retro an Tag 17
ab. Die Zahlen nehmt ihr in die Abschlusspräsentation an Tag 22 mit.

## Ausgangsstand

- **Eigenes Projekt nach Tag 15:** Übernehmt euren Stand wie an Tag 14 (Weg A):

  ```bash
  git remote add team <URL eures Team-Repos>
  git fetch team
  git rm -r -q .                                   # Stand von day_15_solution entfernen
  git checkout team/<euer-Branch> -- .             # euren Projektstand übernehmen
  git checkout HEAD -- README.md DORA.md .github/classroom .github/workflows/classroom.yml
  git commit -m "Eigenen Projektstand nach Tag 15 übernommen"
  git push
  ```

  Heisst euer Deployment-Workflow anders als `deploy-aws.yml`, setzt ihr die
  Repository-Variable `DORA_WORKFLOW` auf euren Dateinamen.

- **`day_15_solution`:** Ihr müsst nichts tun, dieses Repository enthält genau
  diesen Stand.

## Aufgaben

**Zeit:** 60 Min, timeboxed | **Format:** Gruppen à 3–4

Die Vorlagen für die Issue-Vorlage, `dora_collect.py` und `dora.yml` stehen in
der Tagesplanung von Tag 16, Abschnitt **Projekt**.

| Zeit | Was |
|------|-----|
| 10 Min | Auftrag 1: Messbar machen |
| 20 Min | Auftrag 2: Messpipeline bauen |
| 15 Min | Auftrag 3: Lieferhistorie erzeugen |
| 15 Min | Auftrag 4: Auswerten in `DORA.md` |

1. **Auftrag 1 – Messbar machen:** Im Deploy-Job von `deploy-aws.yml`
   `environment: production` ergänzen. Issue-Vorlage
   `.github/ISSUE_TEMPLATE/incident.yml` mit Label `incident` anlegen und das
   Label im Repository erstellen. In `DORA.md` die drei Definitionen
   schreiben, gestützt auf eure Streitfälle aus der Praxis.
2. **Auftrag 2 – Messpipeline:** Euren Rechenkern aus der Praxis nach
   `scripts/dora.py` kopieren, `scripts/dora_collect.py` aus der Vorlage
   übernehmen und `.github/workflows/dora.yml` anlegen: wöchentlich und auf
   Knopfdruck, nur Leserechte, Bericht in die Zusammenfassung des Laufs.
   Läuft euer AWS-Deployment heute nicht, setzt ihr die Repository-Variable
   `DORA_WORKFLOW` auf `ci.yml` (**Settings** → **Secrets and variables** →
   **Actions** → **Variables**).
3. **Auftrag 3 – Lieferhistorie:** Jede Person liefert mindestens eine kleine
   Änderung über einen Pull Request auf `main` aus. Eine davon baut absichtlich
   einen sichtbaren Fehler ein. Dafür eröffnet ihr ein Issue mit der Vorlage
   «Vorfall» und behebt es mit einem Hotfix-Commit `… (Fixes #<Nummer>)`.
4. **Auftrag 4 – Auswerten:** «DORA-Metriken» unter **Actions** von Hand
   starten, Werte und Link zum Lauf in `DORA.md` eintragen, die Grenzen der
   Daten beschreiben und eine Massnahme für die Retro an Tag 17 ableiten.

> ℹ️ **Tag 14 - Deployment auf AWS** und **Security** laufen bei jedem Push
> auf `main` mit und werden rot, solange die AWS-Secrets von Tag 14 bzw.
> `SNYK_TOKEN` fehlen. Ein roter Deployment-Lauf zählt für die Messung nicht
> als Deployment: `dora_collect.py` liest nur erfolgreiche Läufe.

## Abnahmekriterien

Diese Kriterien prüft die Pipeline bei jedem Push automatisch. **Die Haken
setzt die Pipeline selbst:** Ein erfülltes Kriterium wird abgehakt, und
sobald eine Änderung es wieder bricht, verschwindet der Haken. Du musst hier
nichts von Hand pflegen, beim nächsten Push wird die Liste überschrieben.

<!-- c50:progress -->
**Fortschritt: 0 / 14 Kriterien erfüllt** ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜
<!-- /c50:progress -->

- [ ] ⬜ Auftrag 1: Deploy-Job meldet die Umgebung production
- [ ] ⬜ Auftrag 1: Issue-Vorlage für Vorfälle mit Label incident
- [ ] ⬜ Auftrag 1: DORA.md definiert Deployment, fehlgeschlagenes Deployment und Beginn der Lead Time
- [ ] ⬜ Auftrag 2: scripts/dora.py berechnet alle fünf Metriken korrekt
- [ ] ⬜ Auftrag 2: scripts/dora_collect.py liest Workflow-Läufe und Vorfälle über die GitHub-API
- [ ] ⬜ Auftrag 2: dora.yml läuft wöchentlich und auf Knopfdruck
- [ ] ⬜ Auftrag 2: dora.yml hat nur Leserechte
- [ ] ⬜ Auftrag 2: dora.yml ruft dora_collect.py und dora.py auf
- [ ] ⬜ Auftrag 2: dora.yml schreibt den Bericht in die Zusammenfassung des Laufs
- [ ] ⬜ Auftrag 4: DORA.md enthält Messwerte für alle fünf Metriken
- [ ] ⬜ Auftrag 4: DORA.md ordnet die Werte nach Stufen ein
- [ ] ⬜ Auftrag 4: DORA.md verlinkt einen Lauf von «DORA-Metriken»
- [ ] ⬜ Auftrag 4: DORA.md beschreibt die Grenzen der Daten
- [ ] ⬜ Auftrag 4: DORA.md leitet eine Massnahme für die Retro an Tag 17 ab

Zusätzlich manuell abgenommen (nicht automatisch geprüft): Im Repository gibt
es mindestens vier Deployments und ein Issue mit Label `incident`, das mit
einem Hotfix-Commit geschlossen wurde, und der Lauf «DORA-Metriken» ist grün.

## Abnahmekriterien selber prüfen

**Lokal**, jederzeit und ohne Push:

```bash
bash .github/classroom/grade.sh
```

Das Skript liest die Tagesnummer aus `.classroom50.yaml`. Ihr könnt sie auch
erzwingen:

```bash
CLASSROOM_DAY=16 bash .github/classroom/grade.sh
```

Die Ausgabe listet jedes Kriterium mit ✅ oder ❌ und nennt bei jedem ❌ den
konkreten Lösungshinweis.

**In GitHub**, bei jedem Push: Der Workflow **🎓 Classroom Autograding** hakt
die erfüllten Kriterien oben im README ab. Jedes erfüllte Kriterium zählt einen
Punkt (z. B. `Points 9/14`).

## Musterlösung

Nach dem Unterricht findet ihr die Musterlösung im Repository
[`tbzdevops/techstyle`](https://github.com/tbzdevops/techstyle/tree/day_16_solution)
auf dem Branch `day_16_solution`.
