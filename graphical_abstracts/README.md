# Graphical abstracts

Lamina figures for this site's publications. The system (rules, tokens, kit and
renderer) is in the shared design system at `../design-system/`; read
`../design-system/artifacts/DESIGN.md` before making or editing a figure.

| Path | What |
|---|---|
| `<slug>.html` | Figure source, built with the kit from `../design-system/kit/` |
| `out/<slug>.{png,mp4,webm}` | Rendered poster (2×) and animation |
| `publish.sh` | Copies a render into the site's assets |

## Make and publish a figure

1. Render from this folder (needs `npm ci` at the repo root for Playwright, plus ffmpeg):
   `node ../design-system/kit/render.cjs <slug>.html`. The render fails if the kit's
   layout lint fails; open the page with `?debug` to see the boxes.
2. `./publish.sh <slug>` copies the PNG, MP4 and WebM to `assets/img/graphical_abstracts/`
   and makes a 640 px `<slug>-thumb.png`.
3. Add `graphical_abstract={<slug>}` to the paper's entry in
   `_bibliography/papers.bib`. The local `_layouts/bib.liquid` (an override of the
   al-folio theme template) then renders `_includes/graphical_abstract.liquid` in the
   entry's preview slot. If the entry also has a `preview`, that image stays as the
   thumbnail and the animation opens from it (STdeconvolve keeps its paper figure
   this way). Viewer behaviour is in `assets/js/graphical-abstract.js` and
   `assets/css/graphical-abstract.css`.
