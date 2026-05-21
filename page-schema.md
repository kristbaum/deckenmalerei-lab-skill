# Seitenschema der CbDD-Einträge

Diese Datei beschreibt den Aufbau eines typischen Eintrags. Vor der ersten gezielten Sachfrage einmal lesen; danach reichen die Verweise aus dem SKILL.md.

## Lemma-Konvention

Titelschema: `Ort, Bauwerk` — Komma als Trenner, anschließend die kirchliche Bezeichnung mit Patroziniums-Element.

Beispiele:

- `Wessobrunn, Pfarrkirche St. Johann Baptist`
- `Wessobrunn, Kreuzbergkapelle Hl. Kreuz`
- `Iffeldorf, Pfarrkirche Hll. Vitus und Margareta`
- `Moorenweis, Pfarrkirche St. Sixtus`

Maßgeblich ist der **alte Ortsname**, nicht die heutige Gemeindebezeichnung — das entspricht der Editionspraxis des gedruckten Korpus. Bei Auflösungsproblemen ggf. nach historischem Ortsnamen suchen.

## Reihenfolge im Wiki — und warum sie wichtig ist

Das gedruckte CbDD ordnet die Objekte alphabetisch nach Landkreis, innerhalb eines Ortes nach historischem Rang bzw. räumlicher Abfolge. Das Wiki übernimmt diese Reihenfolge. Eine Anfrage „die wichtigste Kirche in Ort X“ bekommt man also nicht direkt — aber die alphabetisch erste Kirche eines Ortes ist meist auch die ranghöchste (Pfarrkirche > Filialkirche > Kapelle).

## Zwei-Ebenen-Struktur einer Seite

Eine CbDD-Seite hat **zwei** Strukturebenen, die sich nicht decken:

### Ebene 1 — formale Sektionen (`==…==`)

Sind in der MCP-Outline sichtbar (über `get-page metadata=true`). Typischerweise:

| Sektion              | Inhalt |
|----------------------|--------|
| (Lead, Sektion 0)    | Sammelt **alle Sachangaben** zum Objekt (siehe Ebene 2) |
| `Befund`             | Träger, Rahmung, Maltechnik, Maße, Erhaltungszustand, Restaurierungen |
| `Beschreibung`       | Bildbeschreibung mit gattungsspezifischem Vokabular |
| `Ikonographie`       | Ikonographische Auflösung, Quellenbezug, programmatische Lesart |
| `Literatur`          | Bibliographie zum Bauwerk (am Ende) |

Manche Seiten haben zusätzlich `Beschreibung und Ikonographie` zusammengefasst, oder einen abweichenden Zuschnitt — die Schemata variieren leicht zwischen den Bänden.

### Ebene 2 — Fett-Marker im Lead (`'''…'''`)

**Diese sind in keiner Section-Outline sichtbar.** Sie sind aber die kunsthistorisch wichtigsten Felder:

| Fett-Marker                      | Was steht darunter |
|----------------------------------|--------------------|
| `'''Patrozinium'''`              | Weihetitel der Kirche/Kapelle — ikonographisch zentral |
| `'''Zum Bauwerk'''`              | Summarische Baugeschichte und Raumform; bei Sakralräumen Abweichung von der Ostung |
| `'''Auftraggeber'''`             | Namentlich, soweit durch Wappen/Belege/Rechtsstellung dokumentiert |
| `'''Autor und Entstehungszeit'''`| Signaturen, schriftliche Belege; stilkritische Zuschreibungen kurz begründet; unsichere als solche gekennzeichnet |
| `'''Befund'''`                   | (auch als Sektionsüberschrift möglich) |
| `'''Beschreibung und Ikonographie'''` | (auch als Sektionsüberschrift möglich) |
| `'''Literatur'''`                | (auch als Sektionsüberschrift möglich) |
| `'''Ikonographische Literatur'''`| Wird **im Text** zitiert, nicht im Literaturverzeichnis am Ende |

Der konstante Vorspann zur eigentlichen Sachangabe nennt zusätzlich **Bestimmung des Bauwerks, administrative (weltliche und kirchliche) Zugehörigkeit, rechtlichen Status zur Zeit der Ausmalung** — ohne Fett-Marker, einfach im ersten Absatz.

## Praktische Konsequenz für Werkzeugaufrufe

- **Sachfrage zu Auftraggeber/Datierung/Maler:** Sektion 0 mitlesen (oder ganze Seite holen). `section=2` für *Beschreibung* allein nützt nichts.
- **Reine Beschreibungs-/Ikonographie-Frage:** Outline holen, dann gezielt die entsprechende Sektion. Das spart Kontext bei langen Einträgen (Moorenweis etwa 34 KB).
- **Frage zum Bildprogramm gesamt:** Sektion 0 (für die Auftraggeber-Intention) **und** Sektion *Ikonographie* — die Programmlogik entfaltet sich oft erst aus beidem zusammen.

## Maßangaben

Das CbDD verwendet konventionelle Maßangaben, die für eine Antwort übernommen werden sollten:

- **Höhe** = Entfernung vom Fußboden zum höchsten Punkt des Deckenbildes
- **Stich** = zusätzliche Höhenangabe bei Kuppeln
- **Länge / Breite** = in der Flächenprojektion gemessen
- **Ansichtsrichtung** = bestimmt durch das Verhältnis von Bild und Raum (nicht durch Kompassrichtung)

## Bildfeld-Codes

Vollständige Liste der Spezialbezeichnungen für Begleitbilder:

| Code | Bedeutung |
|------|-----------|
| EB   | Bilder an Emporenbrüstungen |
| ED   | Bilder an Emporendecken |
| EU   | Bilder an Emporenunterseiten |
| EW   | Wandbilder an der Rückwand der Empore |
| K    | Deckenbilder in Kapellen |
| M    | Medaillons |
| N    | Deckenbilder in nördlichen Seitenschiffen |
| O    | Deckenbilder in Oratorien |
| S    | Deckenbilder in Seitenschiffen bzw. südlichen Seitenschiffen |
| U    | Deckenbilder in Umgängen |
| V    | Deckenbilder in Vorräumen oder -hallen |
| W    | Bilder an Wänden |
| Z    | Zwickelbilder |

Bei Hauptbildern: Großbuchstaben in Hauptreihenfolge zum Hauptaltar; Begleitbilder im Uhrzeigersinn mit Kleinbuchstaben/Ziffern. Eine ikonographische Logik kann das Schema überschreiben (z. B. wenn die Lesefolge der Programmlogik widerspricht).

## Maltechnik — terminologische Präzision

Das CbDD unterscheidet konsequent:

- **Fresko** = Kalkfarbmalerei „al fresco“ auf frischen Putz. Seccoaufmalungen, die in der Zeit zur Vollendung üblich waren, werden **nicht** eigens vermerkt.
- **Seccoübermalungen** späterer Restaurierungen werden, soweit feststellbar, genannt.
- **Deckenbild „al secco“** (Ölfarbe o. ä. auf trockenen Träger) wird vom Fresko abgegrenzt — diese Unterscheidung ist wichtig und sollte in Antworten gewahrt bleiben.

## Häufige bibliographische Sigel

Im Fließtext der *Ikonographie*-Sektion erscheinen Abkürzungen, die in der Wiki-Seite *Zur Benutzung* aufgelöst sind. Die wichtigsten:

| Sigel             | Steht für |
|-------------------|-----------|
| `LCI`             | Lexikon der christlichen Ikonographie (Kirschbaum/Braunfels) |
| `LThK`            | Lexikon für Theologie und Kirche |
| `RDK`             | Reallexikon zur deutschen Kunstgeschichte |
| `Thieme-Becker`   | Allgemeines Lexikon der Bildenden Künstler |
| `Dehio-Gall OB`   | Dehio-Handbuch Oberbayern (1964) |
| `LA-Benz` / `LA-Graesse` | Legenda aurea (deutsche / lateinische Ausgabe) |
| `Bibliotheca Sanctorum` | Lateran-Lexikon der Heiligen |
| `PL` / `PG`       | Patrologia Latina / Graeca (Migne) |
| `MGH`             | Monumenta Germaniae Historica |
| `Ripa 1603` u. a. | Cesare Ripa, *Iconologia* (in jeweils benutzter Ausgabe) |
| `KDB I OB`        | Die Kunstdenkmäler des Königreiches Bayern, Bd. Oberbayern |

Bei unbekannten Sigeln nicht raten — auf der Wiki-Seite *Zur Benutzung* unter „Bibliographische Abkürzungen“ nachschlagen. Das ist eine vollständige, autoritative Liste.

## Bibelzitate

Für lateinische Bibelzitate verwendet das CbDD die **Vulgata Clementina** (Madrider Neuausgabe 1965). Deutsche Übersetzungen folgen der **Jerusalemer Bibel** (1968). Bibelstellen werden mit den lateinischen Buchabkürzungen zitiert (`Mt`, `Lc`, `Io`, `Apoc` für Apokalypse, `Eccli` für Jesus Sirach usw.). Bei Antworten auf Deutsch oder Englisch ggf. das lateinische Sigel zusätzlich nennen, weil viele Sirach-/Weisheits-/Psalm-Verweise in den modernen Ausgaben verschoben numeriert sind.
