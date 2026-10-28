#!/bin/sh
# Packt den Skill als deckenmalerei-lab-skill.skill (Zip mit Skill-Ordner als Wurzel).
set -e
cd "$(dirname "$0")/.."
name=deckenmalerei-lab-skill
rm -f "$name/$name.skill"
zip -r "$name/$name.skill" "$name/SKILL.md" "$name/README.md" "$name/LICENSE" "$name/references" -x '*.DS_Store'
