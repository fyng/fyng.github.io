{#
  Overrides RenderCV's built-in typst/Header.j2.typ for the `classic` theme (RenderCV looks
  for <theme>/<template> next to the input file first). Differences from the built-in:
  name and headline on the left; on the right, email and social networks as a row of
  linked icons, then location and each custom connection on a row of its own. No photo
  support; `website` and `phone` are not shown.
#}
{% set icons = {"Google Scholar": "graduation-cap", "ORCID": "orcid", "GitHub": "github", "LinkedIn": "linkedin"} %}
{% set links = [] %}
{% for email in ([cv.email] if cv.email is string else (cv.email or [])) %}
{% set _ = links.append(("mailto:" ~ email, "envelope")) %}
{% endfor %}
{% for network in cv.social_networks or [] %}
{% set _ = links.append((network.url, icons.get(network.network, "link"))) %}
{% endfor %}
#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  [
= {{ cv.name }}
{% if cv.headline %}
    #headline([{{ cv.headline }}])
{% endif %}
  ],
  [
    #set par(spacing: 0.3cm)
    #set text(fill: {{ design.colors.connections.as_rgb() }}, font: "{{ design.typography.font_family.connections }}", size: {{ design.typography.font_size.connections }})
    #text(size: 12pt)[
{% for url, icon in links %}
      #link("{{ url }}", icon: false, if-underline: false, if-color: false)[#fa-icon("{{ icon }}")]{% if not loop.last %}#h(0.3cm){% endif %}

{% endfor %}
    ]

{% if cv.location %}
    #connection-with-icon("location-dot")[{{ cv.location }}]

{% endif %}
{% for connection in cv.custom_connections or [] %}
    #connection-with-icon("{{ connection.fontawesome_icon }}")[{{ connection.placeholder }}]

{% endfor %}
  ],
)
#v({{ design.header.space_below_headline }})
