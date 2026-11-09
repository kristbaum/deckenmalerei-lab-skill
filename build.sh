#!/bin/sh
# Prüft den Skill und packt ihn als deckenmalerei-lab-skill.skill
# (Zip mit Skill-Ordner als Wurzel).
set -e
cd "$(dirname "$0")"

fail=0
files="SKILL.md README.md SMALL_MODELS_SYSTEM_PROMPT.md references/*.md"

# 1. Alter Hostname: Zitier- und Connector-URLs laufen über deckenmalerei-lab.badw.de
if grep -n "badwcbd-lab" $files; then
	echo "FEHLER: alter Hostname badwcbd-lab.srv.mwn.de (→ deckenmalerei-lab.badw.de)" >&2
	fail=1
fi

# 2. Jede in SKILL.md genannte Referenzdatei muss existieren
for ref in $(grep -o 'references/[A-Za-z0-9_-]*\.md' SKILL.md | sort -u); do
	[ -f "$ref" ] || { echo "FEHLER: SKILL.md verweist auf fehlende Datei $ref" >&2; fail=1; }
done

# 3. Kernregeln in beiden Prompts (SKILL.md und Kurzfassung für kleine Modelle)
for needle in "Artikel-modern" "Modul:Abk/Daten" "Entität" "deckenmalerei-lab.badw.de/index.php" "deckenmalerei-lab.badw.de/mcp" "deckenmalerei-lab.badw.de/api.php"; do
	for f in SKILL.md SMALL_MODELS_SYSTEM_PROMPT.md; do
		grep -q "$needle" "$f" || { echo "FEHLER: $f erwähnt »$needle« nicht" >&2; fail=1; }
	done
done

# 4. Beschreibung kurz halten (Trigger-Text, wird bei jeder Anfrage geladen)
desc_len=$(sed -n 's/^description: //p' SKILL.md | wc -c)
[ "$desc_len" -le 1024 ] || { echo "FEHLER: description hat $desc_len Zeichen (max. 1024)" >&2; fail=1; }

[ "$fail" -eq 0 ] || exit 1

cd ..
name=deckenmalerei-lab-skill
rm -f "$name/$name.skill"
zip -r "$name/$name.skill" "$name/SKILL.md" "$name/README.md" "$name/LICENSE" "$name/references" -x '*.DS_Store'
