# Vorlagen und Kategorien im Deckenmalerei-Lab

Die Vorlagenparameter sind oft die präziseste Quelle für Band, Seiten, AutorInnen, IDs und Bildrechte. `get-page` liefert den Quelltext — die Parameter mitlesen.

## Korpus-Test

| | CBD (gedruckt) | CbDD (online) |
|---|---|---|
| Kopfvorlage | `Artikel` | `Artikel-modern` |
| Textvorlagen | `Abk`, `Entität` (bereinigte Artikel) | — |
| Strukturverknüpfung | `qid=` in `Entität` (soweit gesetzt) | `Strukturdaten` (`entity_id`, `wikidata_qid`) |
| Bildvorlage | `BildQuelle` | `BildMeta` |
| Markerkategorie | `CBD` | `CbDD` |
| weitere Kategorien | Band, Ort, AutorIn, Typ, Meta | Ort, AutorIn |
| Primärquelle | Druckband (Band + Seite) | deckenmalerei.eu (UUID) |
| Bildrechte | geschützt | je `lizenz`/`cc` |

Suche über die Vorlage: `hastemplate:Artikel` bzw. `hastemplate:Artikel-modern`.

---

## CBD

### `Vorlage:Artikel` — Kopf jedes CBD-Artikels

| Parameter | Bedeutung |
|---|---|
| `Band` | Bandnummer; Teilbände `31` (3/1), `32` (3/2), `121` (12/1), `122` (12/2) |
| `Originalseitenvon`, `Originalseitenbis` | Seitenspanne im Druckband — Grundlage der Seitenzitierung |
| `Lemma` | Artikeltitel (`Ort, Bauwerk`) |
| `Ort` | Ort (→ Ortskategorie) |
| `Typ` | `Sakral` oder `Profan` |
| `Meta` | nur bei Register-/Verzeichnisseiten, s. u. |
| `AutorIn1` … `AutorIn6` | BearbeiterInnen (Nachname, Vorname) |
| `davor`, `danach` | Nachbarartikel in der Druckreihenfolge |
| `Chunk`, `Chunkseite` | interne PDF-Navigation |

Die Vorlage zeigt eine Herkunftsbox mit voller Bandangabe; für Band 4 verlinkt sie die freie Heidelberger Digitalisierung (`digi.ub.uni-heidelberg.de/diglit/cbdd_bd4`).

### Register- und Verzeichnisseiten

Erkennbar am Titel und an `|Meta=…`: `Personenregister (Band N)`, `Ortsregister (Band N)`, `Ikonographisches Register (Band N)`, `Embleme-Register (Band 3-I/3-II)`, Malerlisten (`Meta=Malerliste`, Titel wie „Im 18. Jh. im Bereich des Landkreises Altötting tätige Maler“, nur Bd. 8–14). Nur Verweise auf Druckseiten — als Quelle wertlos, als Index für Vollständigkeitsfragen nützlich.

### `Vorlage:Abk` / `Modul:Abk` / `Modul:Abk/Daten`

`{{Abk|Kürzel}}` oder `{{Abk|Kürzel|angezeigt}}`; `typ=Bildfeld` für Bildfeld-Kürzel. Gibt `<abbr title="Auflösung">` aus; bibliographische Kurztitel verlinken auf *Zur Benutzung*. Die Tabelle steht in `Modul:Abk/Daten` (Felder `voll`, `typ` = `allg`/`bibel`/`bibl`, `generisch`). Unbekannte Kürzel → `Kategorie:Unbekannte Abkürzung`.

### `Vorlage:Entität` / `Modul:Entität`

`{{Entität|Text|rolle=…|titel=…|bild=…|qid=…|id=…}}` — markiert Bau, Räume, Personen und Deckenbilder, jede Entität einmal; `id` ist intern (ignorieren); Rollen und Regeln in `page-schema.md`. Zeigt `Text` (mit Link auf `bild`, falls gesetzt) und beim Überfahren ein Popover mit Titel, Rolle, Bild und — bei gesetztem `qid` — Bezeichnung und Beschreibung aus Wikidata (über UnlinkedWikibase). Nicht zu verwechseln mit `Vorlage:Strukturdaten` (CbDD).

### `Vorlage:BildQuelle` — CBD-Abbildungen

Auf jeder Dateibeschreibungsseite: `Band`, `Chunk`, `Chunkseite`, `Originalseitenvon`, `Originalseitenbis`; FotografInnen je Band per `#switch` (u. a. Wolf-Christian von der Mülbe, Kai-Uwe Nielsen). „Dieses Bild ist urheberrechtlich geschützt“ — keine freie Lizenz. Dateinamen: `Band01_chunk001_p011_img002.jpg` (Band, PDF-Abschnitt, PDF-Seite, Bild).

### Kategorien

`Vorlage:Artikel` setzt: `CBD`, Band (`Band 1` … `Band 14`, `Band 3-I`, `Band 3-II`, `Band 12-I`, `Band 12-II`), Ort, je AutorIn eine, `Sakral`/`Profan`, ggf. Meta.

---

## CbDD

### `Vorlage:Artikel-modern` — Kopf jedes CbDD-Artikels

| Parameter | Bedeutung |
|---|---|
| `Titel` | Artikeltitel |
| `Ort` | Ort (→ Ortskategorie) |
| `Jahr` | Erscheinungs-/Bearbeitungsjahr |
| `ID` | UUID → `https://www.deckenmalerei.eu/{ID}` |
| `AutorIn1` … `AutorIn6` | AutorInnen |

Text unter CC BY 4.0 (Abbildungen ausgenommen).

### `Vorlage:Strukturdaten`

Oft mehrfach pro Artikel, je Datensatz (Bau, einzelnes Bild):

| Parameter | Bedeutung |
|---|---|
| `entity_id` | UUID → `https://www.deckenmalerei.eu/{entity_id}` (= Wikidata `P10626`) |
| `wikidata_qid` | optional → `https://www.wikidata.org/wiki/{Qid}` |

### `Vorlage:BildMeta` — CbDD-Abbildungen

| Parameter | Bedeutung |
|---|---|
| `beschreibung` | Bildinhalt |
| `urheber`, `rechteinhaber` | Fotograf, Rechteinhaber |
| `lizenz` | z. B. `CC BY-ND 4.0` |
| `cc` | `ja`/`nein` |
| `quelle` | Link zum Originalbild |

### Kategorien

`Vorlage:Artikel-modern` setzt: `CbDD`, Ort, je AutorIn eine. Keine Bandkategorie.
