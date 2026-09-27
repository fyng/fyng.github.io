# Design systems

There are two systems: one for things people read in a browser, and one for figures.

| System | For | Type | Entry point |
|---|---|---|---|
| **Instrument / Prussian** | The website, fyng.github.io | Instrument Serif display, IBM Plex Sans body, IBM Plex Mono labels | [`website/DESIGN.md`](website/DESIGN.md) |
| **Lamina** | Visual artifacts: graphical abstracts, charts, schematics | IBM Plex Sans throughout; Plex Mono for literal codes only | [`artifacts/DESIGN.md`](artifacts/DESIGN.md) |

They share white paper, the same ink (`#16181d`), Prussian blue (`#1f4e79`), a
vermilion accent, Plex Sans for reading, and hairlines instead of boxes. That way a
Lamina figure sits naturally on a website page. They differ where the job differs:
the website has an editorial serif voice and light and dark themes. Figures use a
single sans family, full semantic colour palettes, and are always light.

Specimens:
- `website/out/specimen-website.png`
- `artifacts/out/specimen-{type,color,charts}.png`
