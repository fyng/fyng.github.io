# Typography

Three open-source families (SIL OFL), each with one job.

| Family | Job | Why |
|---|---|---|
| **Instrument Serif** | Questions, panel heads, take-home: the *argument* | A condensed display serif. It reads as editorial and scholarly, and packs a two-line question into the header. Regular and italic only, so it cannot shout. |
| **IBM Plex Sans** | Body, labels, captions, axes: the *evidence* | A neutral, technical sans with tabular figures and good small-size legibility. It has a true italic for gene names and emphasis. |
| **IBM Plex Mono** | Kickers, step numbers, codes: the *metadata* | Signals "index, not prose". Also suits alleles, sample IDs and patient tags. |

The serif carries claims and the sans carries data. Never set numbers, axes or labels
in the serif, and never set a title in the sans.

Load them from Google Fonts (see any figure's `<head>`), or locally from `~/.fonts`
when rendering offline. The CSS tokens are `--font-display`, `--font-text` and
`--font-mono`.

## Roles

Sizes are px on the 1600 × 900 canvas (`GA.ROLE` in `kit/ga-kit.js`), shown as
size/line height.

| Role | Face | Size | Colour | Use |
|---|---|---|---|---|
| `kicker` | Mono 500, caps, +16 % tracking | 15/20 | muted | `PROJECT · VENUE YEAR` above the title |
| `title` | Serif | 40/45 | ink | The question. ≤ 2 lines, break by hand at a phrase boundary |
| `step` | Mono 500, caps, +16 % tracking | 14/18 | prussian | `01 · RESOURCE`, one per panel |
| `head` | Serif | 34/37 | ink | Panel head, a noun phrase |
| `body` | Sans 400 | 17/24 | ink | Panel conclusions (the findings) |
| `label` | Sans 400 | 17/24 | ink-2 | Names on the diagram |
| `cap` | Sans 400 | 15/20 | muted | Scale, n, "schematic", secondary notes |
| `tag` | Mono 500, +10 % tracking | 13/17 | ink-2 | Short codes: PT A, HLA-DRB1\*15 |
| `axis` | Sans 500 | 14/18 | ink-2 | Chart axis titles |
| `tick` | Sans 400, tabular figures | 13/16 | muted | Tick labels, keys, legends |
| `take` | Serif | 32/38 | ink | The single take-home sentence |

Rules:

- **13 px is the floor.** A figure is often viewed at 800 px wide, so 13 px renders at
  6.5 px. Nothing smaller.
- **Weights:** 400 and 500 only, plus 300 for large Plex numbers if needed.
  There is no bold; hierarchy comes from face and size.
- **Emphasis** uses the italic (`*…*` in kit markup). The accent colour (`{…}`) is
  for the one phrase that carries the finding, at most once per panel.
  `{*…*}` gives accent italic for the take-home keyword.
- **Case:** sentence case. Caps only in `kicker` and `step`, which are tracked.
- **Line length:** body ≤ 437 px (one column). The title may span the full 1472 px.
- **Text colour is always a text token** (`ink`, `ink-2`, `muted`, or a `*-text` step
  from `color.md`), never a 500-step mark colour.

## Numbers and units

- **Figures:** tabular in ticks and tables (`tick` role does this); proportional
  elsewhere.
- **Minus:** true minus `−` (U+2212), not a hyphen. The chart layer converts
  negative tick labels automatically.
- **Thousands:** use a comma (35,669). Use a thin space or no separator for 4-digit
  years and IDs.
- **Decimals:** drop the leading zero only for bounded metrics (AUROC .81, P .03).
  Keep it for everything else (0.42 µM).
- **P values:** *P* italic capital, `P = 3 × 10⁻⁸`. Use superscript digits, not `e-8`.
- **Units:** after a space, in the axis title (`Drug (µM)`, `Months on ICI`).
  Use `µ`, not `u`.
- **Ranges:** en dash without spaces (`2014–2023`), or with spaces between phrases.
- **Counts carry denominators:** "35,669 patients", "7,734 images from 657 lesions".
- **Gene and allele names** follow nomenclature: human genes are italic (*HLA-DRB1*);
  alleles use the `tag` role (HLA-DRB1\*15).
