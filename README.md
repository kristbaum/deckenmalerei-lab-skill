# Deckenmalerei-Lab Skill

Skill für die Nutzung des [Deckenmalerei-Lab](https://badwcbd-lab.srv.mwn.de/).

## Installation

### Claude.ai

Der Skill braucht den Connector **Deckenmalerei-Lab**. Ein Skill kann Connectoren nicht selbst installieren, daher zuerst den Connector einrichten:

1. In Claude.ai unter *Connectors* einen benutzerdefinierten Connector hinzufügen: Name `Deckenmalerei-Lab`, URL `https://badwcbd-lab.srv.mwn.de/mcp`
2. Optional für Ikonographie: den Iconclass-Connector hinzufügen

Dann den Skill einrichten:

1. [claude.ai/customize/skills](https://claude.ai/customize/skills) öffnen
2. Auf „+" → „+ Skill" → „Skill hochladen" klicken
3. Die Datei `deckenmalerei-lab-skill.skill` hochladen (neu bauen mit `./build.sh`)

### ChatGPT

Den Skill als **Custom GPT** einrichten (erfordert Plus oder Pro):

1. [chatgpt.com/gpts](https://chatgpt.com/gpts) öffnen
2. Auf „+ Create" klicken
3. Custom GPT mit den Skill-Dateien einrichten und speichern
