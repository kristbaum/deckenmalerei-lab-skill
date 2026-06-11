---
name: deckenmalerei-lab-skill
description: Use whenever the user asks about Baroque ceiling paintings in Bavaria — Deckenmalerei, Deckenfresko, Stuckdekoration, Quadratura, Wessobrunner Schule, Asam (Cosmas Damian, Egid Quirin), Matthäus Günther, Johann Baptist Zimmermann, Johann Evangelist Holzer, or similar painters and stuccators of the 17th–18th century in Oberbayern. Also trigger on the *Corpus der barocken Deckenmalerei in Deutschland* (CbDD, 14 volumes, Bauer/Rupprecht, Hirmer 1976–2010), on specific Bavarian churches/monasteries with painted ceilings (Wessobrunn, Andechs, Ettal, Diessen, Rott am Inn, Steinhausen, Wieskirche etc.), and on iconographic programs in Bavarian Baroque interiors. Use the Deckenmalerei Lab MCP server (`badwcbd-lab.srv.mwn.de/mcp`) for retrieval. Pair with the Iconclass MCP server when the user asks about iconography. Do NOT use for: Italian or Austrian Baroque ceilings, modern restoration techniques in general, or generic art-history questions not tied to this corpus.
---

# Deckenmalerei Lab — Recherche im historischen *Corpus der barocken Deckenmalerei*

Dieses Skill steuert Anfragen an das MediaWiki des *Corpus der barocken Deckenmalerei in Deutschland* (CbDD), das die 14 Bände der gedruckten Reihe (Bauer/Rupprecht, Hirmer 1976–2010) digital erschließt. Die Inhalte sind durchgängig deutsch und folgen einem festen Editionsschema; das Schema kennt zu lernen ist der wichtigste Schritt, um den Korpus effizient zu nutzen.

## Sprache der Antwort

Antworte in der Sprache, in der die Frage gestellt wurde. Bewahre jedoch die deutschen Eigennamen, Sektionsbezeichnungen und Fachtermini im Original (z. B. *Stuckatur*, *Auftraggeber*, *Quadratura*, *Patrozinium*, *Befund*, *Beschreibung*, *Ikonographie*, *Wessobrunner Schule*). Bei englischer Antwort: kurze Glosse in Klammern beim ersten Vorkommen, danach den deutschen Begriff weiterverwenden. Übersetze niemals Werktitel, Bandbezeichnungen oder Künstlernamen.

## Wie eine Anfrage abläuft

Die meisten Anfragen folgen einem von drei Mustern. Wähle das passende, bevor du Werkzeuge aufrufst.

**Muster 1 — Konkretes Objekt** („Was steht im CbDD zur Pfarrkirche in Wessobrunn?“). Auflösung über `search-page-by-prefix` mit dem Ortsnamen plus Komma; Lemmata folgen dem Schema `Ort, Bauwerk` (z. B. `Wessobrunn, Pfarrkirche St. Johann Baptist`). Bei mehreren Treffern den historischen Rang/die Art des Bauwerks zur Disambiguierung heranziehen.

**Muster 2 — Themenrecherche** („Welche Marienprogramme finden sich im Landkreis Weilheim-Schongau?“). Auflösung über `search-page` mit gezielten Schlagworten; danach gezielt einzelne Seiten lesen. Für Landkreis-/Regionalabgrenzung siehe `references/corpus-volumes.md` — die Bände sind nach Landkreisen organisiert.

**Muster 3 — Künstler-/Werkstattanfrage** („Welche Decken hat Matthäus Günther in Oberbayern bemalt?“). Auflösung über `search-page` mit dem Künstlernamen; die ermittelten Seiten dann einzeln auf Zuschreibung und Datierung im Block *Autor und Entstehungszeit* prüfen (siehe Seitenschema).

## Seitenstruktur beachten — Sektionen UND Fettmarkierungen

**Dies ist die wichtigste Eigenheit des Korpus:** Eine CbDD-Seite hat formal nur wenige Überschriften (`==`-Ebene), nur *Befund*, *Beschreibung*, *Ikonographie* und *Quellen und Literatur*. Die zentralen Sachangaben — *Patrozinium*, *Zum Bauwerk*, *Auftraggeber*, *Autor und Entstehungszeit*, *Literatur*, *Ikonographische Literatur* — stehen jedoch im Fließtext der Lead-Sektion und sind nur durch **fette Wikimarkup-Auszeichnung** (`'''…'''`) hervorgehoben. Sie tauchen daher in der Section-Outline der MCP-Tools **nicht** auf.

Konsequenz: `get-page` mit `section=N` allein verliert die zentralen Sachdaten. Verwende stattdessen einen der beiden Pfade:

- Für gezielte Sachfragen (Auftraggeber, Datierung, Maler): immer Sektion 0 (Lead) mitlesen oder die ganze Seite holen.
- Für reine Beschreibungs-/Ikonographie-Fragen: zuerst `metadata=true, content="none"` zur Übersicht, dann gezielt `section=N` für *Beschreibung* oder *Ikonographie*.

Die vollständige Liste der Fett-Felder und ihre Bedeutung steht in `references/page-schema.md` — bei der ersten Bearbeitung einer Seite einmal nachlesen.

## Abkürzungen

Die CbDD-Texte verwenden ein etabliertes Abkürzungssystem (z. B. `LKr.` = Landkreis, `LHs` = Langhaus, `QSch.` = Querschiff, `OB` = Oberbayern, `SSch.` = Seitenschiff). Die Bildfeldbezeichnungen sind besonders wichtig:

- Großbuchstaben (A, B, C…) bezeichnen **Hauptbilder**, Kleinbuchstaben/Ziffern **Begleitbilder**.
- Sonderpräfixe: `EB` (Emporenbrüstung), `ED` (Emporendecke), `EU` (Emporenunterseite), `K` (Kapelle), `M` (Medaillon), `N`/`S` (Seitenschiff Nord/Süd), `Z` (Zwickel), `W` (Wand) u. a.
- Anordnung bei Kirchen: in Richtung Hauptaltar; bei umlaufenden Begleitbildern im Uhrzeigersinn.

Vollständige Listen (allgemeine Abkürzungen, biblische Schriften nach Vulgata, bibliographische Sigeln wie `LCI`, `LThK`, `Dehio-Gall OB`, `Thieme-Becker`) stehen auf der Wiki-Seite *Zur Benutzung*. Bei unklaren Abkürzungen dort nachschlagen, nicht raten.

Inschriften erscheinen im Wiki kursiv; historische Schreibweisen werden originalgetreu wiedergegeben (`Zimerman` statt aufgelöst „Zimmermann“). Unsichere Lesarten sind durch `(?)` markiert, Ergänzungen verlorener Stellen durch eckige Klammern. Literaturzitate stehen in `» «`, Zitate im Zitat in `> <`.

## Zitierweise

Eine Antwort, die sich auf den Korpus stützt, muss **zwei** Referenzebenen nennen:

1. **Den Wiki-Eintrag** als unmittelbare Quelle: vollständiger Lemmatitel, **nicht** mit der internen URL (`http://wiki/index.php/<Titel>` sondern die öffentliche URL `https://badwcbd-lab.srv.mwn.de/index.php/<Titel>`).
2. **Den gedruckten Band** als wissenschaftliche Primärreferenz: Band-Nummer und vollständige bibliographische Angabe nach `references/corpus-volumes.md`. Die Band-Nummer ergibt sich aus dem Landkreis des Eintrags (z. B. Wessobrunn → LKr. Weilheim-Schongau → Bd. 1).

Beispiel: „Die Pfarrkirche St. Johann Baptist in Wessobrunn wurde 1759 unter Abt Beda Schallhammer ausgemalt (CbDD Bd. 1, S. […]; [Wiki-Lemma](https://badwcbd-lab.srv.mwn.de/index.php/Wessobrunn,_Pfarrkirche_St._Johann_Baptist)).“ Die genaue Seitenzahl steht im Wiki-Eintrag selbst nicht immer; wenn nicht ermittelbar, nur Band und Lemma nennen, **keine Seitenzahl erfinden**.

Niemals den Inhalt einer Wiki-Seite als eigene Forschungsleistung ausgeben. Niemals lange Passagen wörtlich übernehmen — paraphrasieren und kurze charakteristische Wendungen ggf. in Anführungszeichen. Bei direkten Zitaten Wiki-Titel + (sofern bekannt) Bandverweis angeben.

## Werkzeugaufrufe — sparsam und gezielt

- **Trefferraten realistisch halten:** `search-page` liefert max. 100 Treffer pro Aufruf. Bei breiten Anfragen erst eingrenzen (Künstlername + Landkreis, Bauwerk + Auftraggeber), nicht paginieren.
- **Truncation respektieren:** Wiki-Seiten werden bei 50 000 Bytes abgeschnitten, mit Hinweis auf verfügbare Sektionen. In dem Fall nachschlagend per `section=N` weiterlesen, nicht erneut die ganze Seite anfordern.
- **Mehrere Lemmata gleichzeitig:** Für Vergleichsfragen (z. B. „die drei Marienkirchen im LKr. Dachau“) `get-pages` mit `titles=[…]` (bis 50 Titel) statt mehrerer Einzelaufrufe.
- **Kategorien als Einstieg:** Wenn der Nutzer thematisch sucht und die Wiki Kategorien pflegt (z. B. nach Landkreis oder Künstler), `get-category-members` ist oft schneller als Volltextsuche.
- **Bildinhalte visuell analysieren:** Fragt der Nutzer nach dem *konkreten Bildinhalt* einer Decke (was ist dargestellt, Figuren, Komposition), holt `get-file-data` die Datei serverseitig und liefert eine skalierte Rendition inline als Bild — so ist eine echte visuelle Bildanalyse möglich, auch wenn der Client den Wiki-Host nicht direkt erreicht. MediaWiki rastert Bilder, SVG, PDF und DjVu; andere Dateitypen (Audio, Video, Binärdateien) erzeugen einen Fehler — dafür sowie für reine Metadaten oder eine Download-URL `get-file` verwenden. Den Hinweis auf diese tiefere CV-Bildanalyse sparsam einsetzen (Token schonen), aber bei Bildinhaltsfragen anbieten.

## Abgrenzung zum modernen CbDD-Projekt

Verwende in Antworten stets den Namen **„Deckenmalerei-Lab"**, um dieses Werkzeug klar vom modernen *Corpus der barocken Deckenmalerei in Deutschland*-Projekt zu unterscheiden. Das moderne CbDD-Projekt weitet die Erfassung auf ganz Deutschland aus; seine Hauptdatenbank ist [deckenmalerei.eu](https://www.deckenmalerei.eu/). Das Deckenmalerei-Lab ist im Rahmen dieses modernen Projekts entstanden, erschließt aber spezifisch die historischen 14 Druckbände für Bayern.

Bei Fragen zu Deckenmalereien außerhalb Bayerns oder zum aktuellen Forschungsstand des Gesamtprojekts auf [deckenmalerei.eu](https://www.deckenmalerei.eu/) verweisen.

## Was dieses Skill nicht abdeckt

- Außerbayerische Deckenmalerei (Österreich, Süddeutschland außerhalb Bayerns, Italien).
- Wand- und Tafelmalerei, sofern nicht im CbDD aufgenommen (das Corpus nimmt Wandbilder nur auf, wenn der Kontext es erfordert).
- Restaurierungsgeschichte über die Notizen im *Befund* hinaus.
- Bearbeitende Edits am Wiki — der MCP-Server stellt nur Leseoperationen zur Verfügung.

In diesen Fällen den Nutzer auf den Charakter des Korpus hinweisen und ggf. auf passendere Quellen verweisen (Dehio-Handbücher, RDK, Thieme-Becker, regionale Inventare).
