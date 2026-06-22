# Vorlagen und Kategorien im Deckenmalerei-Lab

Das Lab-Wiki enthält **zwei** Korpora, die sich an ihren Vorlagen (Templates) und Kategorien zuverlässig auseinanderhalten lassen:

- **CBD** — der gedruckte *Corpus der barocken Deckenmalerei*, 14 Bände (Bauer/Rupprecht, Hirmer 1976–2010), Oberbayern. Festes Editionsschema, urheberrechtlich geschützte Abbildungen.
- **CbDD** — das moderne Online-Korpus *Corpus der barocken Deckenmalerei in Deutschland*, ganz Deutschland, publiziert auf [deckenmalerei.eu](https://www.deckenmalerei.eu/) und ins Lab kopiert. Lockerere Artikelstruktur, Text unter CC BY 4.0.

Die Vorlagenparameter sind oft die präziseste Quelle für strukturierte Sachdaten (Band, Seitenzahl, AutorIn, deckenmalerei.eu-ID, Wikidata-Qid, Bildrechte). Beim Lesen des Wikitexts (`get-page` liefert Quelltext) sollten diese Parameter mit ausgewertet werden.

---

## CBD — gedruckter Korpus

### `Vorlage:Artikel` — Kopf jedes CBD-Artikels

Enthält die bibliografischen Strukturdaten des Eintrags und steuert die Kategorisierung.

| Parameter | Bedeutung | Pflicht |
|-----------|-----------|---------|
| `Band` | Bandnummer; mehrteilige Bände als `31` (3/1), `32` (3/2), `121` (12/1), `122` (12/2) | ja |
| `Originalseitenvon` | erste Seite des Artikels im Druckband | ja |
| `Originalseitenbis` | letzte Seite des Artikels im Druckband | ja |
| `Lemma` | vollständiger Artikeltitel (`Ort, Bauwerk`) | ja |
| `Ort` | Ortsname (→ Ortskategorie) | – |
| `Typ` | `Sakral` oder `Profan` | – |
| `Meta` | kennzeichnet Register-/Verzeichnisseiten statt Objektartikel (s. u.) | – |
| `AutorIn1` … `AutorIn6` | AutorInnen (Nachname, Vorname); je eigene Kategorie | – |
| `Chunk`, `Chunkseite` | PDF-Chunk und Seite darin (interne Navigation) | – |
| `davor`, `danach` | Vorgänger-/Nachfolger-Lemma (Navigation) | – |

**Nutzen für Antworten:** `Originalseitenvon`/`-bis` liefern die exakte Seitenspanne im Druckband — damit lässt sich die Zitierung mit Seitenzahl belegen, ohne zu raten. `Band` ergibt direkt die Bandzuordnung (siehe `corpus-volumes.md`), `AutorIn1…6` die BearbeiterInnen.

### Register-Seiten erkennen und überspringen

Neben den Objektartikeln enthält das CBD reine **Register-/Verzeichnisseiten**. Sie sind doppelt erkennbar: am Titelpräfix (z. B. „Ortsregister …") und am Feld `|Meta=…` in `{{Artikel}}`. Mögliche Werte:

- `Meta=Embleme-Register`
- `Meta=Ikonographisches Register`
- `Meta=Personenregister`
- `Meta=Ortsregister`
- `Meta=Malerliste`

Diese Seiten enthalten nur Verweise mit Druckseitenzahlen, **keine** inhaltlichen Sachangaben — für fast alle Recherchen wertlos. In Trefferlisten überspringen und stattdessen den eigentlichen Objektartikel ansteuern. (Sie können umgekehrt als Index dienen, wenn man eine vollständige Liste aller Maler oder aller Orte braucht.)

### `Vorlage:BildQuelle` — Quellennachweis für CBD-Abbildungen

Sitzt auf der Dateibeschreibungsseite jeder CBD-Abbildung. Parameter `Band`, `Chunk`, `Chunkseite`, `Originalseitenvon`, `Originalseitenbis` (Provenienz aus dem Druckband). Die Vorlage weist je nach Band per `#switch` die FotografInnen zu (u. a. Wolf-Christian von der Mülbe, Kai-Uwe Nielsen). **Wichtig:** CBD-Abbildungen sind urheberrechtlich geschützt („Dieses Bild ist urheberrechtlich geschützt") — keine freie Lizenz; nicht als frei nutzbar darstellen.

### Kategorien eines CBD-Artikels

Automatisch durch `Vorlage:Artikel` gesetzt:

- **`Kategorie:CBD`** — markiert die Zugehörigkeit zum gedruckten Korpus (zuverlässigster Filter).
- **Bandkategorie** — z. B. `Kategorie:Band 1`, `Kategorie:Band 3-I`.
- **Ortskategorie** — eine, aus `Ort`.
- **AutorInnenkategorie(n)** — eine je `AutorIn1…6`.
- ggf. **Typ** (`Sakral`/`Profan`) und **Meta**.

---

## CbDD — modernes Online-Korpus

### `Vorlage:Artikel-modern` — Kopf jedes CbDD-Artikels

| Parameter | Bedeutung |
|-----------|-----------|
| `Titel` | Artikeltitel |
| `Ort` | Ort (→ Ortskategorie) |
| `Jahr` | Erscheinungs-/Bearbeitungsjahr |
| `ID` | **UUID des Eintrags** → wird zum Link `https://www.deckenmalerei.eu/{ID}` |
| `AutorIn1` … `AutorIn6` | AutorInnen; je eigene Kategorie |

**Nutzen für Antworten:** Die `ID` ist der Schlüssel zur Originaldatenbank — sie liefert die zweite Quell-URL (deckenmalerei.eu) neben dem Wiki-Lemma. `Jahr` und `AutorIn` belegen Bearbeitung und Urheberschaft. Der Artikeltext steht unter CC BY 4.0 (Abbildungen ausgenommen).

### `Vorlage:Strukturdaten` — Verknüpfung zu Datensätzen

Steht (oft **mehrfach** pro Artikel — je ein Aufruf pro Datensatz: Bauwerk, einzelne Malerei, …) im CbDD-Artikel und verknüpft den jeweiligen Datensatz mit externen Datenbanken.

| Parameter | Bedeutung |
|-----------|-----------|
| `entity_id` | UUID des Datensatzes → `https://www.deckenmalerei.eu/{entity_id}` |
| `wikidata_qid` | optionale Wikidata-Qid → `https://www.wikidata.org/wiki/{Qid}` |

**Nutzen für Antworten:** Über `entity_id` lässt sich gezielt auf einen einzelnen Datensatz (z. B. ein bestimmtes Deckenbild) bei deckenmalerei.eu verweisen, nicht nur auf den Gesamteintrag. `wikidata_qid` erlaubt die Verknüpfung mit Wikidata (Normdaten, weitere Identifikatoren).

### `Vorlage:BildMeta` — Metadaten für CbDD-Abbildungen

Auf der Dateibeschreibungsseite jeder CbDD-Abbildung. Anders als bei CBD oft mit **freier Lizenz**:

| Parameter | Bedeutung |
|-----------|-----------|
| `beschreibung` | Beschreibung des Bildinhalts |
| `urheber` | Urheber / Fotograf |
| `rechteinhaber` | Inhaber der Bildrechte |
| `lizenz` | Lizenz, z. B. `CC BY-ND 4.0` |
| `cc` | `ja`/`nein` — ob es eine Creative-Commons-Lizenz ist |
| `quelle` | Link zum Originalbild beim Anbieter |

**Nutzen für Antworten:** `lizenz`/`cc` klären, ob eine Abbildung nachgenutzt werden darf; `urheber`/`rechteinhaber`/`quelle` liefern den korrekten Bildnachweis.

### Kategorien eines CbDD-Artikels

Automatisch durch `Vorlage:Artikel-modern` gesetzt:

- **`Kategorie:CbDD`** — markiert die Zugehörigkeit zum modernen Online-Korpus (zuverlässigster Filter, klar getrennt von `Kategorie:CBD`).
- **Ortskategorie** — eine, aus `Ort`.
- **AutorInnenkategorie(n)** — eine je `AutorIn1…6`.

Eine Bandkategorie gibt es nicht — CbDD ist nicht nach Druckbänden gegliedert.

---

## CBD vs. CbDD auf einen Blick

| | CBD (gedruckt) | CbDD (online) |
|---|---|---|
| Kopfvorlage | `Artikel` | `Artikel-modern` |
| Strukturverknüpfung | — | `Strukturdaten` (`entity_id`, `wikidata_qid`) |
| Bildvorlage | `BildQuelle` | `BildMeta` |
| Markerkategorie | `CBD` | `CbDD` |
| weitere Kategorien | Band, Ort, AutorIn(nen), ggf. Typ/Meta | Ort, AutorIn(nen) |
| Geltungsbereich | Oberbayern | ganz Deutschland |
| Externe Quelle | Druckband (Band + Seite) | deckenmalerei.eu (UUID), ggf. Wikidata |
| Artikelschema | fest (siehe `page-schema.md`) | locker, beschreibende Überschriften |
| Bildrechte | geschützt | je `lizenz`/`cc`, oft CC |

**Schneller Korpus-Test:** `Kategorie:CBD` vs. `Kategorie:CbDD`, oder das Vorhandensein von `{{Artikel-modern}}`/`{{Strukturdaten}}` (→ CbDD) gegenüber `{{Artikel}}`/`{{BildQuelle}}` (→ CBD). Mit `get-category-members` lassen sich beide Bestände gezielt getrennt durchsuchen.
