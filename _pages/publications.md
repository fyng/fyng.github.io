---
layout: page
permalink: /publications/
title: publications
nav: true
nav_order: 2
---

<!-- _pages/publications.md -->

<!-- Bibsearch Feature -->

<div class="pub-tools" style="display: flex; align-items: center; gap: 0.9rem">
  <div style="min-width: 0">
    {% include bib_search.liquid %}
  </div>
  <a
    href="https://scholar.google.com/citations?user={{ site.data.socials.scholar_userid }}"
    title="Google Scholar"
    aria-label="Google Scholar profile"
    style="font-size: 2rem; line-height: 1; color: var(--global-theme-color)"
  ><i class="ai ai-google-scholar"></i></a>
</div>

<div class="publications">

{% bibliography %}

</div>
