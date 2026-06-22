---
name: deckenmalerei-lab-skill
description: Use whenever the user asks about Baroque ceiling paintings in Germany — Deckenmalerei, Deckenfresko, Stuckdekoration, 17th–18th-century painters and stuccators. The Deckenmalerei-Lab wiki holds TWO corpora: the printed *Corpus der barocken Deckenmalerei* (CBD, 14 vols, Bauer/Rupprecht, Hirmer 1976–2010, Oberbayern) AND the modern online *Corpus der barocken Deckenmalerei in Deutschland* (CbDD), covering all of Germany, published on deckenmalerei.eu. Also trigger on specific churches/monasteries/palaces with painted ceilings and on iconographic programs in Baroque interiors. Retrieve via the Deckenmalerei-Lab MCP server (`badwcbd-lab.srv.mwn.de/mcp`); pair with the Iconclass MCP server for iconography. Do NOT use for Italian or Austrian ceilings or generic art-history questions not tied to these corpora.
---

# Deckenmalerei-Lab — Recherche in CBD (gedruckt) und CbDD (online)

Dieses Skill steuert Anfragen an das MediaWiki des **Deckenmalerei-Lab**. Das Lab erschließt **zwei** Korpora, die im selben Wiki liegen und sauber auseinanderzuhalten sind:

- **CBD** — der gedruckte *Corpus der barocken Deckenmalerei*, 14 Bände (Bauer/Rupprecht, Hirmer 1976–2010), beschränkt auf **Oberbayern**. Festes Editionsschema, urheberrechtlich geschützte Abbildungen.
- **CbDD** — das moderne *Corpus der barocken Deckenmalerei in Deutschland*, das Deckenmalereien in **ganz Deutschland** erfasst. Es wird als Online-Datenbank auf [deckenmalerei.eu](https://www.deckenmalerei.eu/) publiziert und ins Lab kopiert. Lockerere Artikelstruktur, Text unter CC BY 4.0.

Die Inhalte sind durchgängig deutsch. Der wichtigste erste Schritt jeder Recherche ist zu erkennen, **welches der beiden Korpora** einen Treffer trägt — daran hängen Struktur, Zitierweise und Reichweite. Der zuverlässigste Test sind die Kategorien `CBD` bzw. `CbDD` und die verwendeten Vorlagen (siehe `references/templates-and-categories.md`).

## Sprache der Antwort

Antworte in der Sprache, in der die Frage gestellt wurde. Bewahre jedoch die deutschen Eigennamen, Sektionsbezeichnungen und Fachtermini im Original (z. B. *Stuckatur*, *Auftraggeber*, *Quadratura*, *Patrozinium*, *Befund*, *Beschreibung*, *Ikonographie*, *Wessobrunner Schule*). Bei englischer Antwort: kurze Glosse in Klammern beim ersten Vorkommen, danach den deutschen Begriff weiterverwenden. Übersetze niemals Werktitel, Bandbezeichnungen oder Künstlernamen.

## Welches Korpus? CBD und CbDD trennen

Bevor du einen Treffer auswertest, bestimme das Korpus — Struktur und Zitierweise unterscheiden sich:

- **Kategorie** `CBD` → gedruckter Korpus (Oberbayern); **Kategorie** `CbDD` → modernes Online-Korpus (ganz Deutschland). Mit `get-category-members` lassen sich beide Bestände gezielt getrennt durchsuchen.
- **Vorlagen** im Quelltext: `{{Artikel}}` + `{{BildQuelle}}` → CBD; `{{Artikel-modern}}` + `{{Strukturdaten}}` + `{{BildMeta}}` → CbDD.
- **Geographie als Heuristik:** Liegt der Ort außerhalb Oberbayerns, ist der Treffer praktisch immer CbDD. Innerhalb Oberbayerns können beide Korpora denselben Ort behandeln.

Die Vorlagen tragen strukturierte Sachdaten (Band/Seite, AutorIn, deckenmalerei.eu-UUID, Wikidata-Qid, Bildrechte) und sind oft die präziseste Informationsquelle — Parameterlisten und Kategorienlogik beider Korpora stehen in `references/templates-and-categories.md`. Bei der ersten Bearbeitung eines Eintrags einmal nachlesen.

## Wie eine Anfrage abläuft

Die meisten Anfragen folgen einem von drei Mustern. Wähle das passende, bevor du Werkzeuge aufrufst. Die Muster gelten für beide Korpora; bei CbDD-Treffern beachte die lockerere Seitenstruktur (s. u.).

**Muster 1 — Konkretes Objekt** („Was steht im Lab zur Pfarrkirche in Wessobrunn?“). Auflösung über `search-page-by-prefix` mit dem Ortsnamen plus Komma; Lemmata folgen dem Schema `Ort, Bauwerk` (z. B. `Wessobrunn, Pfarrkirche St. Johann Baptist`). Bei mehreren Treffern den historischen Rang/die Art des Bauwerks zur Disambiguierung heranziehen.

**Muster 2 — Themenrecherche** („Welche Marienprogramme finden sich im Landkreis Weilheim-Schongau?“). Auflösung über `search-page` mit gezielten Schlagworten; danach gezielt einzelne Seiten lesen. Für Landkreis-/Regionalabgrenzung siehe `references/corpus-volumes.md` — die Bände sind nach Landkreisen organisiert.

**Muster 3 — Künstler-/Werkstattanfrage** („Welche Decken hat Matthäus Günther in Oberbayern bemalt?“). Auflösung über `search-page` mit dem Künstlernamen; die ermittelten Seiten dann einzeln auf Zuschreibung und Datierung im Block *Autor und Entstehungszeit* prüfen (siehe Seitenschema).

## CBD-Seitenstruktur beachten — Sektionen UND Fettmarkierungen

**Dies ist die wichtigste Eigenheit des gedruckten Korpus (CBD):** Eine CBD-Seite hat formal nur wenige Überschriften (`==`-Ebene), nur *Befund*, *Beschreibung*, *Ikonographie* und *Quellen und Literatur*. Die zentralen Sachangaben — *Patrozinium*, *Zum Bauwerk*, *Auftraggeber*, *Autor und Entstehungszeit*, *Literatur*, *Ikonographische Literatur* — stehen jedoch im Fließtext der Lead-Sektion und sind nur durch **fette Wikimarkup-Auszeichnung** (`'''…'''`) hervorgehoben. Sie tauchen daher in der Section-Outline der MCP-Tools **nicht** auf.

Konsequenz: `get-page` mit `section=N` allein verliert die zentralen Sachdaten. Verwende stattdessen einen der beiden Pfade:

- Für gezielte Sachfragen (Auftraggeber, Datierung, Maler): immer Sektion 0 (Lead) mitlesen oder die ganze Seite holen.
- Für reine Beschreibungs-/Ikonographie-Fragen: zuerst `metadata=true, content="none"` zur Übersicht, dann gezielt `section=N` für *Beschreibung* oder *Ikonographie*.

Die vollständige Liste der Fett-Felder und ihre Bedeutung steht in `references/page-schema.md` — bei der ersten Bearbeitung einer CBD-Seite einmal nachlesen. Die bibliografischen Eckdaten (Band, Seitenspanne, AutorInnen) stehen zusätzlich strukturiert in der Vorlage `{{Artikel}}` (siehe `references/templates-and-categories.md`).

## CbDD-Seitenstruktur — lockerer, beschreibende Überschriften

CbDD-Artikel folgen **keinem** festen Schema. Sie verwenden frei formulierte, beschreibende Überschriften und sind unterschiedlich tief gegliedert (Beispiel: [Aschendorf, Herrenhaus und Amtssitz Altenkamp](https://badwcbd-lab.srv.mwn.de/index.php/Aschendorf,_Herrenhaus_und_Amtssitz_Altenkamp) mit Sektionen wie *Bauwerk*, *Malerei* mit Unterabschnitten, *Bibliographie*, *Einzelnachweise*). Die Fett-Marker-Konvention des CBD gilt hier **nicht**; lies bei CbDD-Treffern die Section-Outline (`metadata=true`) und dann die relevanten Sektionen, oder die ganze Seite.

Strukturierte Sachdaten stehen bei CbDD in den Vorlagen: `{{Artikel-modern}}` (Titel, Ort, Jahr, AutorIn, **deckenmalerei.eu-ID**) im Kopf und ein oder mehrere `{{Strukturdaten}}` (je `entity_id` für einen Datensatz, optional `wikidata_qid`). Diese IDs sind für die Zitierung wichtig (s. u.).

## Abkürzungen

Die CBD-Texte verwenden ein etabliertes Abkürzungssystem (z. B. `LKr.` = Landkreis, `LHs` = Langhaus, `QSch.` = Querschiff, `OB` = Oberbayern, `SSch.` = Seitenschiff). Es gilt für den gedruckten Korpus; CbDD-Artikel sind freier formuliert. Die Bildfeldbezeichnungen sind besonders wichtig:

- Großbuchstaben (A, B, C…) bezeichnen **Hauptbilder**, Kleinbuchstaben/Ziffern **Begleitbilder**.
- Sonderpräfixe: `EB` (Emporenbrüstung), `ED` (Emporendecke), `EU` (Emporenunterseite), `K` (Kapelle), `M` (Medaillon), `N`/`S` (Seitenschiff Nord/Süd), `Z` (Zwickel), `W` (Wand) u. a.
- Anordnung bei Kirchen: in Richtung Hauptaltar; bei umlaufenden Begleitbildern im Uhrzeigersinn.

Vollständige Listen (allgemeine Abkürzungen, biblische Schriften nach Vulgata, bibliographische Sigeln wie `LCI`, `LThK`, `Dehio-Gall OB`, `Thieme-Becker`) stehen auf der Wiki-Seite *Zur Benutzung*. Bei unklaren Abkürzungen dort nachschlagen, nicht raten.

Inschriften erscheinen im Wiki kursiv; historische Schreibweisen werden originalgetreu wiedergegeben (`Zimerman` statt aufgelöst „Zimmermann“). Unsichere Lesarten sind durch `(?)` markiert, Ergänzungen verlorener Stellen durch eckige Klammern. Literaturzitate stehen in `» «`, Zitate im Zitat in `> <`.

## Zitierweise

Eine Antwort, die sich auf das Lab stützt, muss **zwei** Referenzebenen nennen: den Wiki-Eintrag als unmittelbare Quelle und die wissenschaftliche Primärreferenz. Letztere unterscheidet sich je Korpus.

**Immer:** den Wiki-Eintrag als öffentliche URL — vollständiger Lemmatitel mit `https://badwcbd-lab.srv.mwn.de/index.php/<Titel>` (**nicht** die interne `http://wiki/...`-URL).

**Bei CBD (gedruckt):** zusätzlich den **gedruckten Band** als Primärreferenz — Band-Nummer und vollständige bibliographische Angabe nach `references/corpus-volumes.md`. Die Band-Nummer steht in der Vorlage `{{Artikel|Band=…}}` bzw. ergibt sich aus dem Landkreis (z. B. Wessobrunn → LKr. Weilheim-Schongau → Bd. 1); die Seitenspanne liefern `Originalseitenvon`/`Originalseitenbis` derselben Vorlage. Beispiel: „Die Pfarrkirche St. Johann Baptist in Wessobrunn wurde 1759 unter Abt Beda Schallhammer ausgemalt (CBD Bd. 1, S. […]; [Wiki-Lemma](https://badwcbd-lab.srv.mwn.de/index.php/Wessobrunn,_Pfarrkirche_St._Johann_Baptist)).“ Steht keine Seitenzahl in der Vorlage, nur Band und Lemma nennen — **keine Seitenzahl erfinden**.

**Bei CbDD (online):** zusätzlich die **deckenmalerei.eu-Datenbank** als Primärreferenz. Die URL wird aus der `ID` der Vorlage `{{Artikel-modern}}` gebildet: `https://www.deckenmalerei.eu/{ID}`. Für einen einzelnen Datensatz (Bauwerk, bestimmtes Deckenbild) die `entity_id` aus dem passenden `{{Strukturdaten}}` verwenden: `https://www.deckenmalerei.eu/{entity_id}`. Liegt eine `wikidata_qid` vor, kann sie ergänzt werden (`https://www.wikidata.org/wiki/{Qid}`). Beispiel: „Die Wandmalerei im Vestibül von Haus Altenkamp (Aschendorf) … ([Wiki-Lemma](https://badwcbd-lab.srv.mwn.de/index.php/Aschendorf,_Herrenhaus_und_Amtssitz_Altenkamp); [deckenmalerei.eu](https://www.deckenmalerei.eu/0c728050-c5af-11e9-893a-a37e5cdc9651)).“

Niemals den Inhalt einer Wiki-Seite als eigene Forschungsleistung ausgeben. Niemals lange Passagen wörtlich übernehmen — paraphrasieren und kurze charakteristische Wendungen ggf. in Anführungszeichen. Bei direkten Zitaten Wiki-Titel + Primärreferenz (CBD-Band bzw. deckenmalerei.eu-URL) angeben. CbDD-Text steht unter CC BY 4.0; das erleichtert die Nachnutzung, ersetzt aber nicht die Quellenangabe.

## Werkzeugaufrufe — sparsam und gezielt

- **Trefferraten realistisch halten:** `search-page` liefert max. 100 Treffer pro Aufruf. Bei breiten Anfragen erst eingrenzen (Künstlername + Landkreis, Bauwerk + Auftraggeber), nicht paginieren.
- **MediaWiki-Schnittstellen direkt nutzen:** Neben den MCP-Tools stellt das Wiki die **Action API** (`api.php`) bereit, darunter die Volltextsuche **CirrusSearch** (Elasticsearch — erlaubt Operatoren wie `incategory:`, `intitle:`, Phrasen-/Wildcard-Suche) und **OpenSearch** für Titel-Autocomplete (`action=opensearch`, läuft über die Action API). Das ist nützlich für präzisere oder kombinierte Abfragen, als die High-Level-MCP-Tools direkt anbieten.
- **Register überspringen:** Das CBD enthält mehrere Register-Seiten — am Titelpräfix erkennbar (z. B. „Ortsregister …") und am Vorlagenfeld `|Meta=…-Register` bzw. `|Meta=Malerliste` in `{{Artikel}}`. Es sind: *Embleme-Register*, *Ikonographisches Register*, *Personenregister*, *Ortsregister* und die *Malerliste*. Sie enthalten nur Verweise mit Druckseitenzahlen, keine inhaltlichen Sachangaben — für fast alle Recherchen **wertlos** und zu ignorieren. Tauchen sie in Trefferlisten auf, überspringen und stattdessen den eigentlichen Objektartikel ansteuern.
- **Truncation respektieren:** Wiki-Seiten werden bei 50 000 Bytes abgeschnitten, mit Hinweis auf verfügbare Sektionen. In dem Fall nachschlagend per `section=N` weiterlesen, nicht erneut die ganze Seite anfordern.
- **Mehrere Lemmata gleichzeitig:** Für Vergleichsfragen (z. B. „die drei Marienkirchen im LKr. Dachau“) `get-pages` mit `titles=[…]` (bis 50 Titel) statt mehrerer Einzelaufrufe.
- **Kategorien als Einstieg:** Wenn der Nutzer thematisch sucht, ist `get-category-members` oft schneller als Volltextsuche. Nützliche Kategorien sind `CBD` bzw. `CbDD` (Korpus), die AutorInnen-Kategorien, die Orts-Kategorien sowie bei CBD die Band-Kategorien. Die Kombination (z. B. Korpus + AutorIn) grenzt schnell ein. Welche Kategorien welcher Korpus setzt, steht in `references/templates-and-categories.md`.
- **Bildinhalte visuell analysieren:** Fragt der Nutzer nach dem *konkreten Bildinhalt* einer Decke (was ist dargestellt, Figuren, Komposition), holt `get-file-data` die Datei serverseitig und liefert eine skalierte Rendition inline als Bild — so ist eine echte visuelle Bildanalyse möglich, auch wenn der Client den Wiki-Host nicht direkt erreicht. MediaWiki rastert Bilder, SVG, PDF und DjVu; andere Dateitypen (Audio, Video, Binärdateien) erzeugen einen Fehler — dafür sowie für reine Metadaten oder eine Download-URL `get-file` verwenden. Den Hinweis auf diese tiefere CV-Bildanalyse sparsam einsetzen (Token schonen), aber bei Bildinhaltsfragen anbieten. **Bildrechte beachten:** CBD-Abbildungen (`{{BildQuelle}}`) sind urheberrechtlich geschützt; CbDD-Abbildungen (`{{BildMeta}}`) tragen ihre Lizenz in den Parametern `lizenz`/`cc` — vor einer Aussage zur Nachnutzung dort nachsehen, nicht als frei nutzbar unterstellen.

## Die beiden Korpora und ihr Verhältnis

Verwende in Antworten stets den Namen **„Deckenmalerei-Lab"** für dieses Wiki-Werkzeug. Es vereint zwei Korpora, die nicht verwechselt werden dürfen:

- **CBD** — der abgeschlossene **gedruckte** Korpus *Corpus der barocken Deckenmalerei* (Bauer/Rupprecht, Hirmer 1976–2010), 14 Bände, **nur Oberbayern**. Festes Editionsschema, Band-/Seiten-Zitierung, geschützte Abbildungen.
- **CbDD** — das **moderne, fortlaufende** *Corpus der barocken Deckenmalerei in Deutschland* für **ganz Deutschland**. Hauptpublikation ist die Online-Datenbank [deckenmalerei.eu](https://www.deckenmalerei.eu/); die Einträge sind ins Lab kopiert. Lockere Struktur, Zitierung über die Wiki-Seite **und** die deckenmalerei.eu-URL (aus der `ID`/`entity_id` der Vorlagen).

Das Lab ist im Rahmen des modernen Projekts entstanden und enthält **beide** Bestände. Ordne jeden Treffer zunächst einem Korpus zu (Kategorie `CBD`/`CbDD` bzw. Vorlagen) und richte Struktur-Erwartung und Zitierweise danach aus. Für Deckenmalerei außerhalb Oberbayerns ist allein CbDD einschlägig; für tiefere Detailtiefe in Oberbayern oft CBD. Für den jeweils aktuellen Forschungsstand und weiterführende Datensätze auf [deckenmalerei.eu](https://www.deckenmalerei.eu/) verweisen.

## Was dieses Skill nicht abdeckt

- Deckenmalerei außerhalb Deutschlands (Österreich, Italien u. a.) — auch CbDD endet an der Landesgrenze.
- Deutsche Regionen außerhalb Oberbayerns, **sofern sie noch nicht in CbDD erfasst** sind: CbDD wächst, aber die Abdeckung ist nicht vollständig. Lücken ehrlich benennen, nicht durch Allgemeinwissen füllen.
- Wand- und Tafelmalerei, sofern nicht in CBD/CbDD aufgenommen (Wandbilder werden nur kontextbedingt erfasst).
- Restaurierungsgeschichte über die Notizen im *Befund* (CBD) bzw. die Artikelangaben (CbDD) hinaus.
- Bearbeitende Edits am Wiki — der MCP-Server stellt nur Leseoperationen zur Verfügung.

In diesen Fällen den Nutzer auf den Charakter der Korpora hinweisen und ggf. auf passendere Quellen verweisen (deckenmalerei.eu, Dehio-Handbücher, RDK, Thieme-Becker, regionale Inventare).
