# Fallback: MediaWiki-API ohne Connector

Nur verwenden, wenn der MCP-Connector **Deckenmalerei-Lab** fehlt, aber ein Werkzeug für HTTP-Abrufe verfügbar ist (Web-Fetch, `curl` in einer Shell, Code-Ausführung). Alles ist öffentlich lesbar, keine Anmeldung nötig. **Nur GET-Anfragen** — keine Bearbeitungen, kein Login, keine Tokens.

Basis:

- Action-API: `https://deckenmalerei-lab.badw.de/api.php`
- REST-API: `https://deckenmalerei-lab.badw.de/rest.php/v1/`
- Rohtext: `https://deckenmalerei-lab.badw.de/index.php?title=<Titel>&action=raw`

An jede Action-API-Anfrage `&format=json&formatversion=2` anhängen. Titel URL-kodieren (Leerzeichen → `_` oder `%20`, Umlaute UTF-8-kodiert, `|` trennt mehrere Titel).

## MCP-Werkzeug → API-Aufruf

| MCP-Werkzeug | API-Aufruf (`api.php?…`) |
|---|---|
| `search-page` | `action=query&list=search&srsearch=<Suche>&srlimit=50` — CirrusSearch, dieselben Operatoren (`incategory:`, `intitle:`, `insource:"…"`, `hastemplate:`) |
| `search-page-by-prefix` | `action=query&list=prefixsearch&pssearch=<Ort>,%20&pslimit=50` |
| `get-page` (ganz, Quelltext) | `index.php?title=<Titel>&action=raw` oder `action=parse&page=<Titel>&prop=wikitext` |
| `get-page` mit `section=N` | `action=parse&page=<Titel>&section=N&prop=wikitext` |
| `get-page` Outline (`content="none"`) | `action=parse&page=<Titel>&prop=sections` — `index` ist die Sektionsnummer |
| `get-pages` | `action=query&prop=revisions&rvprop=content&rvslots=main&titles=<T1>\|<T2>\|…` (bis 50 Titel) |
| `get-category-members` | `action=query&list=categorymembers&cmtitle=Kategorie:<Name>&cmlimit=500` |
| `get-file` | `action=query&prop=imageinfo&iiprop=url\|size\|mime\|extmetadata&titles=Datei:<Name>` |
| `get-file-data` | wie `get-file` plus `&iiurlwidth=1024`, dann die `thumburl` abrufen (nur wenn das Werkzeug Bilder anzeigen kann) |
| `get-links-here` | `action=query&list=backlinks&bltitle=<Titel>&bllimit=500` |
| `parse-wikitext` | `action=parse&text=<Wikitext>&contentmodel=wikitext&prop=text` |
| `get-page-history` | `action=query&prop=revisions&titles=<Titel>&rvprop=ids\|timestamp\|user\|comment&rvlimit=20` |

Fortsetzung: Steht im Ergebnis ein `continue`-Objekt, dessen Felder (`sroffset`, `cmcontinue` …) unverändert an die nächste Anfrage anhängen.

## Hinweise

- `action=raw` und `prop=wikitext` liefern den **Quelltext** mit `{{Artikel}}`, `{{Abk}}`, `{{Entität}}` — Korpusbestimmung und Leseregeln aus `SKILL.md` gelten unverändert. Gerendertes HTML (`prop=text`) nur, wenn der Quelltext nicht reicht; es ist deutlich länger.
- `Modul:Abk/Daten` mit `action=raw` holen.
- Sparsam abrufen: erst Outline, dann einzelne Sektionen; mehrere Seiten gesammelt über `titles=…|…`.
- Antwortet die API nicht oder blockiert das Werkzeug die Domain, das offen sagen — nicht aus dem Gedächtnis antworten.
