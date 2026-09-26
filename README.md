# fyng.github.io

Personal academic website of Feiyang Huang, built with [al-folio](https://github.com/alshedivat/al-folio) v1.2 (Jekyll) and deployed to GitHub Pages by `.github/workflows/deploy.yml`.

## Local preview

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

Theme runtime (layouts, styles) lives in the `al_folio_*` gems pinned in `Gemfile`; see `docs/` for upstream guides.
