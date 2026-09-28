# fyng.github.io: notes for agents

Personal academic site (al-folio / Jekyll). See `README.md` for where content lives.

## Design system

The design lives in a separate, shared repo, **fyng/academic-design-system**, checked
out here as a git submodule at `design-system/`. If `design-system/` is empty, run
`git submodule update --init`.

- Before any visual work, read `design-system/core/README.md` and the core element you
  touch (`core/color.md`, `typography.md`, `charts.md`, ...), then the format README:
  `design-system/formats/web/README.md` (site pages) or
  `design-system/formats/abstract/README.md` (graphical abstracts).
- Do not copy design-system files into this repo, and do not restyle site-wide
  typography, colour or chrome in `_sass/_fyng.scss`. That file holds only
  site-specific layout (the about-page sidebar).
- To change the system: branch inside `design-system/`, commit and push there, open a
  PR against academic-design-system `main`, then commit the new submodule pointer
  here and bump the `rev` comment in `assets/css/main.scss`. Follow
  `design-system/CLAUDE.md`.
- Figure sources are `graphical_abstracts/*.html`; they load the kit from
  `../design-system/formats/abstract/kit/`. Render with
  `node ../design-system/formats/abstract/kit/render.cjs <slug>.html`
  from `graphical_abstracts/`, then `./publish.sh <slug>`.
