---
name: deckenmalerei-lab-skill
description: Use for any question about Baroque ceiling painting in Germany (Deckenmalerei, Deckenfresko, Deckenbild, Stuck, Stuckatur, Quadratura) — a church, monastery or palace and its painted ceilings, a painter or stuccator of the 17th/18th century, a commissioner, an iconographic programme, or an abbreviation or citation from the printed Corpus. The Deckenmalerei-Lab wiki holds the printed *Corpus der barocken Deckenmalerei* (CBD, 14 vols, Oberbayern) and the online *Corpus der barocken Deckenmalerei in Deutschland* (CbDD, deckenmalerei.eu, all of Germany). Not for Austrian or Italian ceilings or general art history outside these corpora; for writing Wikidata statements from the corpus use extract-cbd-to-wd-skill.
license: GPL-3.0. LICENSE has complete terms
compatibility: Best with the Deckenmalerei-Lab MCP connector (https://deckenmalerei-lab.badw.de/mcp); without it, falls back to the public MediaWiki API (https://deckenmalerei-lab.badw.de/api.php) via any HTTP fetch tool. The Iconclass MCP connector is recommended for iconography.
---

# Deckenmalerei-Lab — Recherche in CBD und CbDD

Das **Deckenmalerei-Lab** (MediaWiki, deutschsprachig) enthält zwei Korpora im selben Wiki:

- **CBD** — der gedruckte *Corpus der barocken Deckenmalerei*, 14 Bände (16 Teilbände), Bauer/Rupprecht, Hirmer 1976–2010, **nur Oberbayern**. Rund 1000 Artikel mit festem Editionsschema; Zitierung nach Band und Seite; Abbildungen urheberrechtlich geschützt.
- **CbDD** — das fortlaufende *Corpus der barocken Deckenmalerei in Deutschland*, **ganz Deutschland**, publiziert auf [deckenmalerei.eu](https://www.deckenmalerei.eu/) und ins Lab kopiert. Rund 1300 Artikel mit freier Gliederung; Text CC BY 4.0; Zitierung über die deckenmalerei.eu-ID.

Struktur, Lesestrategie und Zitierweise hängen am Korpus — darum bei jedem Treffer zuerst das Korpus bestimmen.

## Voraussetzung: Connector

Das Skill arbeitet am besten mit dem MCP-Connector **Deckenmalerei-Lab** (Werkzeuge `search-page`, `get-page`, `get-pages`, `get-category-members`, `get-file-data` …). Fehlen sie:

1. **Auf den Connector hinweisen** — einmal, kurz, am Anfang der Antwort: Claude.ai → *Einstellungen → Connectors* → „Benutzerdefinierten Connector hinzufügen“, Name `Deckenmalerei-Lab`, URL `https://deckenmalerei-lab.badw.de/mcp`; danach im Chat aktivieren. Für Ikonographie zusätzlich den Iconclass-Connector empfehlen.
2. **Auf die MediaWiki-API ausweichen**, sofern ein Werkzeug für HTTP-Abrufe vorhanden ist (Web-Fetch, `curl`, Code-Ausführung): `https://deckenmalerei-lab.badw.de/api.php` ist öffentlich lesbar. Die Zuordnung MCP-Werkzeug → API-Aufruf steht in `references/mediawiki-api.md`; Suchoperatoren, Leseplan und Zitierweise unten gelten unverändert.
3. Gibt es weder Connector noch HTTP-Werkzeug, oder antwortet die API nicht: das sagen und um Einrichtung des Connectors bitten. **Nie** aus dem Gedächtnis oder per allgemeiner Websuche antworten.

Der Zugriff ist **nur lesend**: keine Seiten bearbeiten, anlegen oder hochladen, auch wenn ein Werkzeug das technisch anbietet — über die API nur GET-Anfragen.

## Sprache

In der Sprache der Frage antworten. Deutsche Fachtermini, Sektionsnamen und Eigennamen im Original lassen (*Befund*, *Auftraggeber*, *Patrozinium*, *Quadratura*, *Wessobrunner Schule*); bei englischer Antwort beim ersten Vorkommen kurz glossieren. Werktitel, Bandtitel und Künstlernamen nie übersetzen.

## Korpus bestimmen — an der Kopfvorlage

| Merkmal | CBD (gedruckt) | CbDD (online) |
|---|---|---|
| Kopfvorlage im Quelltext | `{{Artikel|Band=…}}` | `{{Artikel-modern|ID=…}}` |
| weitere Vorlagen | `{{Abk}}`, `{{Entität}}`, Bilder mit `{{BildQuelle}}` | `{{Strukturdaten}}`, Bilder mit `{{BildMeta}}` |
| Kategorie | `CBD`, `Band 1` … `Band 14` | `CbDD` |
| Gliederung | feste Labels, s. u. | freie, beschreibende Überschriften |

Die Kopfvorlage ist der sichere Test; die Kategorie ist gleichwertig, wenn nur Metadaten vorliegen. `{{Entität}}` (CBD, Markierung im Text) und `{{Strukturdaten}}` (CbDD, Datensatz-IDs) sind verschiedene Vorlagen. Geographie als Heuristik: außerhalb Oberbayerns immer CbDD; in Oberbayern können beide Korpora denselben Bau behandeln — dann beide nennen. Was unten über Labels, `{{Abk}}`, Popover und Bildfeld-Kürzel steht, gilt **nur für CBD**. Parameter aller Vorlagen: `references/templates-and-categories.md`.

## Leseplan — der kürzeste Weg je Frage

| Frage | Aufrufe |
|---|---|
| Bau bekannt | `search-page-by-prefix` mit `Ort, ` (Lemma = `Ort, Bauwerk`, historischer Ortsname) |
| Auftraggeber, Maler, Datierung (CBD) | `get-page` mit `section=0` — die Labels stehen im Lead |
| Technik, Maße, Zustand (CBD) | `section` *Befund* (meist 1) |
| Bildprogramm, Inhalt eines Bildes | Outline (`metadata=true`, `content="none"`), dann *Beschreibung*/*Ikonographie*; für das Programm zusätzlich Sektion 0 |
| Was zeigt Bild A? | Bildfeld-Kürzel im Text → Datei aus `bild=` bzw. Bildunterschrift → `get-file-data` |
| CbDD-Artikel | Outline, dann die passenden Sektionen oder die ganze Seite |
| Werke eines Malers | Suche (s. u.) → Treffer gesammelt mit `get-pages` (bis 50 Titel) lesen |
| Vergleich mehrerer Bauten | `get-pages` statt Einzelaufrufe |

Bei abgeschnittenen Seiten mit `section=N` weiterlesen, nicht die ganze Seite neu holen.

## Suchen

`search-page` läuft über CirrusSearch; Operatoren lassen sich kombinieren und grenzen besser ein als Blättern (max. 100 Treffer):

- `incategory:CBD Günther` / `incategory:CbDD Asam` — Korpus trennen
- `incategory:"Band 1" intitle:Pfarrkirche` — Band (Kategorien `Band 1` … `Band 14`, `Band 3-I`, `Band 3-II`, `Band 12-I`, `Band 12-II`)
- `insource:"Autor und Entstehungszeit" "Matthäus Günther"` — Phrase im Quelltext (Regex-`insource:/…/` ist abgeschaltet)
- `hastemplate:Artikel-modern Zimmermann` — über die Kopfvorlage

**Register:** *Personenregister (Band N)*, *Ortsregister (Band N)*, *Ikonographisches Register (Band N)*, *Embleme-Register* und die Malerlisten (`Kategorie:Malerliste`, nur Bd. 8–14) enthalten nur Verweise auf Druckseiten. Als Antwortquelle taugen sie nicht — in Trefferlisten überspringen. Als **Index** sind sie für Vollständigkeitsfragen („alle Decken von X in Band 5“) aber der schnellste Weg: Register lesen, dann die genannten Artikel öffnen.

## CBD-Artikel lesen

Die Sachangaben stehen als **fette Labels mit Doppelpunkt** im Fließtext, nicht als Überschriften — die Section-Outline zeigt sie nicht:

- Lead (Sektion 0): Zugehörigkeit und Rechtsstatus (ohne Label), `'''Patrozinium:'''`, `'''Zur Geschichte:'''`, `'''Zum Bauwerk:'''`, `'''Auftraggeber:'''`, `'''Autor und Entstehungszeit:'''`
- `== Befund ==`: `'''Träger der Deckenmalerei:'''`, `'''Rahmen:'''`, `'''Technik:'''`, `'''Maße:'''` (oft als Tabelle), `'''Erhaltungszustand und Restaurierungen:'''`
- `== Beschreibung und Ikonographie ==` (häufigste Form): je Bild ein Absatz, beginnend mit Bildfeld-Kürzel und Titel in Versalien: `A '''MARIA VOM SIEGE''' …`
- `== Ikonographie ==`, `== Quellen und Literatur ==` (Aufzählung)

Nicht bereinigte Artikel enthalten außerdem **Überschriften-Reste aus dem Zerschneiden der Bände**: am Ende die Überschrift des Folgeartikels (`== HAGNBERG ==`), Bandteil-Titel (`== EINGEMEINDETE VORORTE ==`) oder Kolumnentitel mitten im Text — der Text danach gehört oft zum nächsten Artikel. Bildeinträge stehen dort mitunter als Überschrift (`== A AUFFINDUNG DER GEBEINE … ==`). Die Sektionsnamen variieren zudem stark (*Bildabfolge*, *Darstellung*, *Ikonologie*, Raumnamen, eingeschleppte Kolumnentitel). Die **Normalisierungstabelle** in `references/page-schema.md` ordnet jede Variante einer Standardsektion zu — vor dem Lesen per `section=N` dort nachsehen, welche Sektion die Bildbeschreibungen trägt.

Bereinigte Artikel (bisher Band 1) tragen zusätzlich Markup — ältere Artikel haben es noch nicht, beides kommt vor:

- **`{{Abk|LHs}}`** = die Abkürzung „LHs“; im Wiki mit Tooltip. In Antworten **nur den angezeigten Text** wiedergeben (`{{Abk|Bd|Bde.}}` → „Bde.“), nie die Vorlage. Auflösungen für alle Kürzel — allgemeine, Bibelbücher nach Vulgata, bibliographische Kurztitel, Bildfeld-Kürzel (`typ=Bildfeld`) — stehen gebündelt in **`Modul:Abk/Daten`**: einmal holen statt *Zur Benutzung* zu lesen. Allgemein verständliche Kürzel (St., S., vgl., hl.) sind nicht getaggt. Unbekannte landen in `Kategorie:Unbekannte Abkürzung` — dann nicht raten.
- **`{{Entität|Text|rolle=…|titel=…|bild=…|qid=…|id=…}}`** markiert jede Entität **einmal** (erste Nennung): den Bau (`rolle=Bauwerk`, seine Bezeichnung im ersten Satz, z. B. „Pfarrkirche“), Räume mit Malereien (`Raum`), Personen (`Auftraggeber`, `Maler`, `Stuckateur`, `Baumeister`, `Stecher`, `Kistler`, `Vergolder`, `Person`) und Deckenbilder (`Deckenbild`, am Bildfeld-Kürzel). `id=` ist eine interne Kennung für die Datenübernahme — **ignorieren**, nie zitieren. Wiedergeben nur `Text`. Bei Deckenbildern ist `titel=` der Bildtitel ohne Kürzel und `bild=` die Bilddatei — so lässt sich ein Artikel ohne Lesen des Fließtexts in eine Bilderliste übersetzen. `qid=` (sofern gesetzt) ist das Wikidata-Item — die präziseste Identifikation, die das Lab hat.
- Bildfeld-Kürzel: `A`, `B` = Hauptbilder, `A<sub>1</sub>` … = Begleitbilder; Präfixe `EB`, `ED`, `EU`, `EW`, `K`, `M`, `N`, `O`, `S`, `U`, `V`, `W`, `Z` (Liste in `references/page-schema.md`). Die Bildunterschriften beginnen mit demselben Kürzel.

Feldbedeutungen, Maßkonventionen und Maltechnik-Terminologie: `references/page-schema.md` — vor der ersten Detailfrage zu einem CBD-Artikel einmal lesen.

## CbDD-Artikel lesen

Keine festen Labels, kein `{{Abk}}`, kein `{{Entität}}`. Outline lesen, dann die passenden Sektionen (*Bauwerk*, *Malerei* mit Unterabschnitten, *Bibliographie*, *Einzelnachweise* …). Strukturdaten stehen in `{{Artikel-modern}}` (`ID`, `Ort`, `Jahr`, `AutorIn1…6`) und einem `{{Strukturdaten|entity_id=…|wikidata_qid=…}}` je Datensatz (Bau, einzelnes Bild).

## Strukturdaten und Wikidata

Für Verknüpfungen (Maler ↔ Werke, Auftraggeber, Normdaten, Iconclass) Wikidata heranziehen, nicht deckenmalerei.eu abfragen: fast alle CbDD-Gebäude, -Personen und iconclass-klassifizierten Malereien haben ein Item mit **Deckenmalerei.eu ID (`P10626`)** = `entity_id`/`ID` der Vorlagen. Bei CBD liefert `qid=` in `{{Entität}}` die Verknüpfung, soweit schon gesetzt. Dump der deckenmalerei.eu-Daten: <https://github.com/arthist-lmu/plafond3d/tree/main/dumps/deckenmalerei.eu>. Fehlt ein Item, die Lücke benennen — nicht aus Allgemeinwissen ergänzen.

## Zitierweise — immer zwei Ebenen

1. **Wiki-Eintrag**: `https://deckenmalerei-lab.badw.de/index.php/<Titel>` (Leerzeichen → `_`; nie die interne `http://wiki/…`-URL).
2. **Primärquelle**:
   - **CBD**: Band und Seiten aus `{{Artikel|Band=…|Originalseitenvon=…|Originalseitenbis=…}}` (`Band=31` = 3/1, `122` = 12/2), volle Angabe nach `references/corpus-volumes.md`. Für **Band 4** zusätzlich die frei zugängliche Digitalisierung: `https://digi.ub.uni-heidelberg.de/diglit/cbdd_bd4/?page_query=<Seite>&action=pagesearch`. Fehlt die Seitenzahl, nur Band nennen — **keine Seite erfinden**.
   - **CbDD**: `https://www.deckenmalerei.eu/<ID>` aus `{{Artikel-modern}}`; für einen einzelnen Datensatz `https://www.deckenmalerei.eu/<entity_id>`; ggf. `https://www.wikidata.org/wiki/<Qid>`.

Beispiel CBD: „Die Freskierung von 1759 bezahlte Pfarrer Matthias Johann Nepomuk Bayerlacher ([Beuern, Pfarrkirche St. Michael](https://deckenmalerei-lab.badw.de/index.php/Beuern,_Pfarrkirche_St._Michael); CBD Bd. 1, S. 25–27).“

Paraphrasieren statt lange Passagen übernehmen; kurze Zitate mit Wiki-Titel und Primärquelle. Inschriften und Quellen werden im Wiki originalgetreu wiedergegeben (`Zimerman`, nicht „Zimmermann“); `(?)` markiert unsichere Lesungen, `[…]` Ergänzungen, `» «` Zitate.

## Bilder

`get-file-data` liefert eine skalierte Rendition zur echten Bildanalyse — bei Fragen zum Bildinhalt nutzen, sonst sparsam (Token). `get-file` für Metadaten/URL. **Rechte**: CBD-Abbildungen (`{{BildQuelle}}`) sind urheberrechtlich geschützt; CbDD-Abbildungen (`{{BildMeta}}`) tragen ihre Lizenz in `lizenz`/`cc` — nachsehen, nicht unterstellen.

## Grenzen

- Außerhalb Deutschlands (Österreich, Italien …) und Regionen, die CbDD noch nicht erfasst — Lücken benennen, auf Dehio, RDK, regionale Inventare verweisen.
- Wand- und Tafelmalerei nur, soweit in den Korpora erfasst; Restaurierungsgeschichte nur so weit wie *Befund* bzw. Artikel.
- deckenmalerei.eu als Quelle nennen und verlinken, aber nicht anbieten, die Datenbank direkt abzufragen.
