# fyng.github.io

Personal academic website of Feiyang Huang, built with [al-folio](https://github.com/alshedivat/al-folio) v1.2 (Jekyll) and deployed to GitHub Pages by `.github/workflows/deploy.yml`.

## Local preview

The design system is a git submodule, so clone with `--recurse-submodules`
(or run `git submodule update --init` in an existing clone).

```bash
bundle install
bundle exec jekyll serve   # http://localhost:4000
```

## Where things live

| What | File |
| --- | --- |
| Bio, profile photo | `_pages/about.md`, `assets/img/headshot_1.jpeg` |
| Publications | `_bibliography/papers.bib` (`selected={true}` shows on the home page) |
| News | `_news/*.md` |
| CV page / PDF | `_data/cv.yml`, `assets/pdf/FeiyangHuang_CV.pdf` |
| Social links | `_data/socials.yml` |
| Site settings | `_config.yml` |
| Design system (shared) | `design-system/` → [fyng/academic-design-system](https://github.com/fyng/academic-design-system) |
| Site-only styles (about-page layout) | `_sass/_fyng.scss` |
| Graphical abstracts | `graphical_abstracts/` (see its README) |

Theme runtime (layouts, styles) lives in the `al_folio_*` gems pinned in `Gemfile`; see `docs/` for upstream guides.

## Design system

The look of the site (Instrument / Prussian) and of its figures (Lamina) is defined in
[fyng/academic-design-system](https://github.com/fyng/academic-design-system), checked out
at `design-system/` as a submodule and shared with other projects. `_sass/_fyng.scss`
loads its al-folio adapter through `sass.load_paths` in `_config.yml`; the figure pages in
`graphical_abstracts/` load its kit by relative path.

- **Change the design system** in the submodule (branch, commit, push, PR in
  academic-design-system), not in this repo. See its README, *Contributing*.
- **Pick up a new version:** `git submodule update --remote design-system`, bump the
  `rev` comment in `assets/css/main.scss` (cache-bust), then commit `design-system`.
- **CI:** the workflows check out the submodule. While academic-design-system is
  private, they need a `DESIGN_SYSTEM_TOKEN` repository secret: a fine-grained token with
  read access to its contents.
