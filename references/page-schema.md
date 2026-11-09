# Seitenschema der CBD-Artikel

Gilt nur für den **gedruckten** Korpus (CBD, Kopfvorlage `{{Artikel}}`). CbDD-Artikel (`{{Artikel-modern}}`) haben keine festen Labels — siehe SKILL.md.

## Lemma

`Ort, Bauwerk` mit Patrozinium: `Wessobrunn, Pfarrkirche St. Johann Baptist`, `Iffeldorf, Pfarrkirche Hll. Vitus und Margareta`. Maßgeblich ist der **historische** Ortsname, nicht die heutige Gemeinde; Ortsteile oft mit Klammerzusatz: `Adelshausen (Weil), Kapelle St. Martin`.

Die Artikel folgen der Reihenfolge des Drucks: Landkreis, darin Ort alphabetisch, innerhalb eines Ortes nach Rang (Pfarrkirche vor Filialkirche vor Kapelle). `davor`/`danach` in `{{Artikel}}` verlinken die Nachbarartikel.

## Aufbau

Formale Sektionen (`==…==`, in der Outline sichtbar) und fette Labels (`'''…:'''`, **nicht** in der Outline) überlagern sich:

| Ort | Label | Inhalt |
|---|---|---|
| Lead (Sektion 0) | — | Bestimmung des Baus, weltliche und kirchliche Zugehörigkeit, Rechtsstatus zur Zeit der Ausmalung |
| | `Patrozinium:` | Weihetitel — ikonographisch zentral |
| | `Zur Geschichte:` | (nur bei manchen Artikeln) |
| | `Zum Bauwerk:` | Baugeschichte, Raumform, Abweichung von der Ostung |
| | `Auftraggeber:` | namentlich, soweit durch Wappen, Rechnungen oder Rechtsstellung belegt |
| | `Autor und Entstehungszeit:` | Signaturen, Quellen; stilkritische Zuschreibungen mit Begründung; unsichere als solche gekennzeichnet |
| `== Befund ==` | `Träger der Deckenmalerei:` | Gewölbeform, Raumteil |
| | `Rahmen:` | Stuck- oder gemalte Rahmung |
| | `Technik:` | Fresko, Secco, Öl auf Leinwand; polychrom/monochrom |
| | `Maße:` | oft als Tabelle (Bereich – Höhe – Maße) |
| | `Erhaltungszustand und Restaurierungen:` | Schäden, Übermalungen, Restaurierungsdaten |
| `== Beschreibung ==` | — | je Bild ein Absatz: Kürzel + Titel in Versalien, z. B. `B '''TRIUMPH MICHAELS''' …` |
| `== Ikonographie ==` | — | Deutung, Quellenbezug, Programm; ikonographische Literatur im Text |
| `== Quellen und Literatur ==` | — | Aufzählung; ungedruckte Quellen vor der Literatur |

Varianten: *Beschreibung und Ikonographie* als eine Sektion; ältere Artikel mit `Erhaltungszustand:` statt des langen Labels; noch nicht bereinigte Artikel mit Labels ohne Doppelpunkt oder mit fehlendem Fettdruck.

**Konsequenz:** Für Auftraggeber, Maler, Datierung immer Sektion 0 lesen; `section=N` allein verliert diese Angaben. Für das Bildprogramm Sektion 0 (Intention des Auftraggebers) **und** *Ikonographie*.

## Markup bereinigter Artikel

Bisher in Band 1; ältere Artikel haben es nicht.

### `{{Abk|…}}` — Abkürzungen

`{{Abk|LHs}}` zeigt „LHs“ mit Tooltip „Langhaus“; `{{Abk|Bd|Bde.}}` zeigt „Bde.“. Bibliographische Kurztitel verlinken zusätzlich auf *Zur Benutzung#Bibliographische Abkürzungen*. In Antworten nur den angezeigten Text wiedergeben.

Alle Auflösungen stehen in **`Modul:Abk/Daten`** (Lua-Tabelle, aus *Zur Benutzung* übernommen): `abk` mit `typ = "allg"` (allgemein), `"bibel"` (Vulgata-Sigel, z. B. `Eccli` = Jesus Sirach, `Apoc` = Apokalypse) und `"bibl"` (Kurztitel wie `LCI`, `Thieme-Becker`, `Dehio-Gall OB`, `Ripa 1603`, `KDB I OB`), dazu `bildfeld`. Einträge mit `generisch = true` (St., S., vgl., hl., Bd, Nr. …) werden im Text nicht getaggt, sind aber aufgelöst. Ein Kürzel, das dort fehlt, nicht raten.

### `{{DynamicInfoPopover|…}}` — Entitäten

```
{{DynamicInfoPopover|<Text>|rolle=<Rolle>|bild=<Datei>|qid=<Q…>}}
```

| Rolle | markiert |
|---|---|
| `Bauwerk` | den Text nach `Zum Bauwerk:` (der ganze Absatz) |
| `Auftraggeber` | Auftraggeber im Absatz *Auftraggeber* |
| `Maler`, `Stuckateur`, `Baumeister` | Künstler, v. a. in *Autor und Entstehungszeit* |
| `Person` | andere historische Personen dort (Vermittler, Lehrer, Grundherr) |
| `Deckenbild` | Bildfeld-Kürzel (`A`, `A<sub>2</sub>`) bzw. bei einem einzigen Bild dessen Titel |

`bild=` = Bilddatei des Deckenbilds (für `get-file-data`). `qid=` = Wikidata-Item, wird nach und nach von der Wikidata-Extraktion gesetzt — fehlt es, ist die Entität noch nicht verknüpft, nicht unbekannt. Zitierte Forscher (Schulten, Keim …), Signaturen und dargestellte Heilige sind nicht markiert.

## Bildfeld-Kürzel

Hauptbilder: Großbuchstaben in Richtung Hauptaltar (`A`, `B`, `C`). Begleitbilder: Index, im Uhrzeigersinn (`A<sub>1</sub>`, `C<sub>1–4</sub>`). Ein ikonographischer Zusammenhang kann die Reihenfolge überschreiben.

| Kürzel | Bedeutung |
|---|---|
| EB | Bilder an Emporenbrüstungen |
| ED | Bilder an Emporendecken |
| EU | Bilder an Emporenunterseiten |
| EW | Wandbilder an der Rückwand der Empore |
| K | Deckenbilder in Kapellen |
| M | Medaillons |
| N | Deckenbilder in nördlichen Seitenschiffen |
| O | Deckenbilder in Oratorien |
| S | Deckenbilder in Seitenschiffen bzw. südlichen Seitenschiffen |
| U | Deckenbilder in Umgängen |
| V | Deckenbilder in Vorräumen oder -hallen |
| W | Bilder an Wänden |
| Z | Zwickelbilder |

`(keine Abbildung)` hinter einem Kürzel: Bild beschrieben, aber nicht abgebildet. Bildunterschriften beginnen mit dem Kürzel (`A<sub>2</sub> Gericht`); Serien stehen in `<gallery>`.

## Maße

- **Höhe** = Fußboden bis höchster Punkt des Deckenbilds; **Stich** = zusätzliche Höhe bei Kuppeln
- **Länge × Breite** = in der Flächenprojektion
- **Ansichtsrichtung** = aus dem Verhältnis von Bild und Raum, nicht nach Kompass

## Maltechnik

- **Fresko** = Kalkfarbmalerei auf frischem Putz; zeitgenössische Secco-Ergänzungen werden nicht eigens vermerkt.
- **Seccoübermalungen** späterer Restaurierungen werden genannt, soweit feststellbar.
- **al secco** (Öl o. ä. auf trockenem Grund) wird vom Fresko unterschieden — in Antworten wahren.

## Bibelzitate

Latein nach der **Vulgata Clementina** (Madrid 1965), deutsch nach der **Jerusalemer Bibel** (1968), mit lateinischen Sigeln (`Mt`, `Lc`, `Io`, `Apoc`, `Eccli`). In Antworten das Sigel nennen; Psalmen und Weisheitsbücher sind in modernen Ausgaben teils anders gezählt.
