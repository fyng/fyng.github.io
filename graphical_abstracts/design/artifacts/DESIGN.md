# Lamina: design preferences for lab figures

Lamina is the visual system for the lab's graphical abstracts, charts and schematic figures.
The website has its own system (`../website/DESIGN.md`); `../README.md` explains the split.
This file holds the high-level preferences. The details are in:

| File | Covers |
|---|---|
| [`typography.md`](typography.md) | One family (IBM Plex Sans), type roles, numbers and units |
| [`color.md`](color.md) | Palettes grouped by what they mean, and how they were validated |
| [`charts.md`](charts.md) | Chart grammar and rules for eight common forms |
| `tokens.mjs` → `tokens.css`, `tokens.json` | The values. Edit `tokens.mjs`, run `node design/artifacts/tokens.mjs` |
| `specimen-*.html` → `out/specimen-*.png` | Visual reference sheets, built with the kit |

The kit (`../../kit/`) implements the system, so following it is mostly automatic.
This document says *why*, so you can decide the cases the kit doesn't cover.

## What a Lamina figure is

A **scientific statement**, drawn. It reads like the paper's abstract, not an advertisement:

- **The title says what the work is**, in plain words: a statement ("Spot-based spatial
  transcriptomics cell-type deconvolution without a single-cell reference") or, when the
  work answers one, a question ("Can we predict…?"). Never a slogan.
- **Each panel ends with a finding**, stated as the paper states it, with the
  paper's hedges intact ("predicts propensity", not "reveals").
- **The take-home is one plain sentence** that says why it matters to the field.
  No accent colour or italics by default: emphasis that lands on anything but the key
  point backfires, and a single sentence rarely needs it.
- **Schematic is labelled schematic.** Any chart that is illustrative rather than
  real data says so in its caption, and has no numeric ticks.
  Real numbers come from the paper and nowhere else.

## Principles

1. **One idea per panel, three panels.** Resource → method → finding is the default arc,
   read left to right. A fourth panel means the story has not been cut enough.
2. **Ink is for data and argument.** No decorative gradients, drop shadows, 3D, clip-art
   scenes or background textures. Use a wash fill only to group things.
3. **Colour means something or it is grey.** Every coloured mark has a role from
   `color.md`: valence, emphasis, identity, magnitude or direction. Everything else uses
   ink or context grey. One accent per figure.
4. **Label things directly.** Put words next to the marks they name. Use a legend only
   when direct labels would collide.
5. **One voice.** Every word is IBM Plex Sans. Hierarchy comes from size, weight
   (400/500), case and colour, not from mixing typefaces. Mono is kept for literal codes.
6. **Quiet structure.** No dividers between panels or around the header and take-home:
   the gutters and white space separate them. Hairlines (1.5 px, `--rule`) are for axes
   and grids. The grid shows through alignment, not boxes or lines.
7. **Fewer words, fewer lines.** Draw the object instead of naming it; label only what
   the drawing cannot say. If a label repeats the panel title or conclusion, cut it.
8. **Motion follows the argument.** Things appear in the order you would explain them
   aloud. Nothing moves once it has arrived. There are no loops within the loop.
9. **Accessible by construction.** Palettes are validated for colour-vision deficiency,
   text meets contrast minimums, and there is no meaning by colour alone.
   Every figure carries a `<title>` and `<desc>` that state its content in full.
10. **Checked, not eyeballed.** The kit's lint blocks a render on overlaps, margin
   overflow, divider crossings, and arrows or curves running through labels.
   Never use `--force` to ship.

## Voice

| Do | Don't |
|---|---|
| "Can we predict individual adverse event risk…?" | "Revolutionising cancer safety" |
| "predicts", "is associated with", "in 35,669 patients" | "unlocks", "powerful", "first-ever" |
| Sentence case everywhere except the kicker | Title Case Headlines |
| Numbers with units and denominators | Bare percentages without an n |
| The paper's own terms, defined once (ICI, AUROC) | New jargon invented for the figure |

## Canvas

- **1600 × 900 (16:9)**, white paper, 64 px margins, 8 px spacing grid.
- **Header, y 44–187:** a kicker (`PROJECT · VENUE YEAR`) and a title of at most two
  lines. No rule underneath.
- **Panels, y 204–766:** three columns of 437 px with 80 px gutters, no dividers.
  Each panel has a one-line header, the number in prussian and a title in `head`
  (`01  Multi-cellular pixels`), then the visual, and the conclusion at the foot.
  No step word, no caption line.
- **Take-home, y 812–860:** one plain sentence in `take` type.
- Figures are always light. On a dark page, they sit on their own paper card; there is
  no dark variant (see `../website/DESIGN.md`, *Embedding Lamina figures*).

## Motion

- **Loop 16 s** (always under 20 s, no sound). Header 0–1 s, panels about 4 s each,
  take-home at about 13.4 s, hold, fade out 15.5–16 s. The poster frame (the static
  image) is t = 15 s, so the static version is the complete figure.
- **Vocabulary:** `in` (rise 12 px and fade) for text; `pop` for icons and boxes;
  `draw` for arrows and curves; `grow` for bars; `fade` for chart frames and fields.
  Nothing else.
- **Timing:** enter 0.6–0.8 s, draws 0.8–1.2 s, stagger 80 ms. Arrowheads appear
  as their line finishes. Chart frames come before the data, and labels come after
  the marks land.
- Reduced-motion users get the poster frame.

## Iconography

- Use Health Icons (MIT) from `@iconify-json/healthicons`, on a 48-unit grid, as
  solid silhouettes in a single colour. Draw custom icons (`adrenal`, `note`, `tree`)
  in the same style and add them to `kit/icons.js`.
- Colour an icon only when it is an entity with a registered colour (organs). Otherwise
  use ink or prussian.
- Icon size can encode a quantity (grade, for example) only if a caption says so.

## Arrows and method boxes

- Arrows are prussian (or the finding's colour), 2.5 px, with open chevron heads.
- **Arrows between side-by-side items are straight.** The kit's `connect()` runs them
  along the middle of the two items' overlap. Curves are only for endpoints that are
  offset (fan-in, fan-out), and then they leave and enter perpendicular to the box edge.
- **Method boxes** all look the same: wash fill, an icon, and a short label ("LLM",
  "ML model"). Name the method by what readers know, not the algorithm, unless the
  algorithm is the point. Icons: `llm` (a speech bubble with text) for language models,
  `network` for trained models. Avoid vendor-associated glyphs such as sparkles or
  swirls; icons stay brand-agnostic.

## Deliverables per figure

`out/<slug>.png` (poster, 2×), `out/<slug>.mp4` (H.264), `out/<slug>.webm` (VP9 fallback),
and `out/<slug>.webp` (preview, not committed). Render with `node render.cjs <slug>.html`
from `graphical_abstracts/`; the render fails if lint fails.

## On the website

1. `./publish.sh <slug>` copies the PNG, MP4 and WebM to `assets/img/graphical_abstracts/`
   and makes a 640 px `<slug>-thumb.png`.
2. Add `graphical_abstract={<slug>}` (and no `preview`) to the paper's entry in
   `_bibliography/papers.bib`. The local `_layouts/bib.liquid` (an override of the
   al-folio theme template) then renders `_includes/graphical_abstract.liquid` in the
   entry's preview slot, where other papers show their preview image.
3. The slot shows the static poster, scaled to the column. The animation plays in an
   expanded view sized to fit the viewport (portrait and landscape):
   - on laptops, while hovering the thumbnail; a click opens it as an overlay;
   - on phones, a tap opens the overlay; tap anywhere, the × or Esc closes it.
   Reduced-motion users get the enlarged poster only. The video loads on first open
   (`assets/js/graphical-abstract.js`).
