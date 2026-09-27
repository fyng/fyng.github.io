# Explanatory layer (PROPOSED, awaiting approval)

Distilled from the STdeconvolve paper figure (`assets/img/publication_preview/stdeconvolve.png`).
What makes that figure work is that it **draws the actual objects**: the tissue, the
pixel, the cells inside it, the matrix and the model, and it lets muted notes explain
the notation. These additions give Lamina the same vocabulary. They are implemented
in `kit/ga-bio.js` and used by `stdeconvolve.html`. The one thing not carried over is
the panel lettering (a, b, c, d); Lamina panels are numbered `01  Title`.

The paper figure also says the point with **fewer words and fewer lines**, which is now a
core principle (`DESIGN.md` §7). These components exist so the drawing can carry the
explanation; label only what the drawing cannot say.

| # | Proposal | Rule | Kit |
|---|---|---|---|
| 1 | **Family palette** for members of one kind (cell types) | 4 hues from one blue–violet–magenta band, chosen by search: CVD ΔE ≥ 10.7, normal ΔE ≥ 15, all ≥ 3:1. Each has a tint for fills. Don't mix with the categorical slots in one panel. Beyond 4 members, facet or fold into "other" | `--cell-1…4`, `--cell-k-wash` (`tokens.mjs` `family`) |
| 2 | **Cell glyph** | Cytoplasm in the tint with a 1.5 px mark outline; offset nucleus in the mark colour. It is the cell type's legend swatch everywhere | `B.cell`, `B.cellMarkup` |
| 3 | **Tissue and spots** | Tissue is neutral (wash plus a darker core); colour is kept for cell types. Spots are paper rings with a `context` outline | `B.tissue`, `B.spots` |
| 4 | **Proportion dial** | One cell type per map; the wedge in each spot is that type's share. Small multiples, never many-slice pies (the no-pies-over-3 rule holds) | `B.dials` + `sweep` motion |
| 5 | **Zoom inset** | The source ring is inked, dotted tangent leaders (muted, `1 4`) run to a circular inset, and the inset grows out of its source | `B.zoom` + `zoom` motion |
| 6 | **Matrix glyph** | Hairline grid in `rule`, row-marker glyphs, braces with a dimension symbol. Cells stay empty unless their values carry the point | `B.matrix`, `B.brace` |
| 7 | **Math role** | Plex Sans (no serif, one family): italic Latin variables; Greek, digits and operators upright (Plex's italic θ reads as ϑ); subscripts at 70 % | `math` role, `B.math` |
| 8 | **Model notation** | Nodes r 26, ink-2 ring; observed nodes filled `rule`; plates are 1.5 px ink-2 rectangles with a 4 px radius, labelled top-left with the index only ("d = 1…D"). Edges use the standard prussian arrow | `B.node`, `B.plate` |
| 9 | **Notes** | The `note` role (14/18, muted) with a thin muted leader (1.5 px, small head) from the mark to the words, one to three words each. Only for notation a reader outside the field can't decode; never for what the drawing already shows. Process arrows stay prussian | `note` role, `B.note` |

**Motion additions:** `zoom` (an inset grows out of its source) and `sweep` (a wedge
fills clockwise to its share). Both come from the "motion follows the argument"
rule: the zoom *is* the "look inside one pixel" step, and the sweep *is* the
deconvolution result arriving.

**Loop length:** explanatory figures may run 18 s (poster at 17 s), still under 20 s.

## Considered, not proposed

- **Grey projection wedges across panels** (as in the paper figure). They cross the
  dividers and add a second kind of connector. The zoom leaders do this job inside a panel.
- **The K-selection chart** (perplexity against rare cell types). It needs two y-axes,
  which the chart rules forbid, and it is a detail rather than the concept.
