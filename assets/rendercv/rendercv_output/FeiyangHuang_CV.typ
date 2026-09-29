// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Feiyang Huang",
  title: "Feiyang Huang - CV",
  footer: context { [#emph[Feiyang Huang · #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Updated Sept 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "us-letter",
  page-top-margin: 0.55in,
  page-bottom-margin: 0.55in,
  page-left-margin: 0.75in,
  page-right-margin: 0.75in,
  page-show-footer: true,
  page-show-top-note: true,
  colors-body: rgb(22, 24, 29),
  colors-name: rgb(22, 24, 29),
  colors-headline: rgb(112, 116, 128),
  colors-connections: rgb(112, 116, 128),
  colors-section-titles: rgb(31, 78, 121),
  colors-links: rgb(31, 78, 121),
  colors-footer: rgb(150, 150, 150),
  colors-top-note: rgb(150, 150, 150),
  typography-line-spacing: 0.5em,
  typography-alignment: "left",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "IBM Plex Sans",
  typography-font-family-name: "Instrument Serif",
  typography-font-family-headline: "IBM Plex Sans",
  typography-font-family-connections: "IBM Plex Sans",
  typography-font-family-section-titles: "IBM Plex Sans",
  typography-font-size-body: 9.3pt,
  typography-font-size-name: 32pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 9pt,
  typography-font-size-section-titles: 0.95em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: true,
  typography-bold-name: false,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: false,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: left,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.45cm,
  header-space-below-headline: 0.35cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "",
  header-connections-space-between-connections: 0.45cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.4pt,
  section-titles-space-above: 0.4cm,
  section-titles-space-below: 0.2cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.3em,
  sections-space-between-regular-entries: 0.7em,
  entries-date-and-location-width: 3.6cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: true,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "•" ,
  entries-highlights-space-left: 0.15cm,
  entries-highlights-space-above: 0cm,
  entries-highlights-space-between-items: 0cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 9,
    day: 29,
  ),
)


= Feiyang Huang

  #headline([PhD Candidate, Computational Biology & Medicine])

#connections(
  [#connection-with-icon("location-dot")[New York, NY]],
  [#link("mailto:feh4005@med.cornell.edu", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[feh4005\@med.cornell.edu]]],
  [#link("https://fyng.github.io/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[fyng.github.io]]],
  [#link("https://scholar.google.com/citations?user=MFllmkIAAAAJ", icon: false, if-underline: false, if-color: false)[#connection-with-icon("graduation-cap")[Google Scholar]]],
  [#link("https://orcid.org/0000-0002-7241-1509", icon: false, if-underline: false, if-color: false)[#connection-with-icon("orcid")[0000-0002-7241-1509]]],
  [#link("https://github.com/fyng", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[fyng]]],
  [#link("https://linkedin.com/in/feiyang-huang", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[feiyang-huang]]],
  [#connection-with-icon("language")[English, Mandarin]],
)


== Education

#education-entry(
  [
    #strong[Weill Cornell Graduate School of Medical Sciences], Tri-Institutional PhD Program in Computational Biology & Medicine

    - Advisor: Wesley Tansey, Memorial Sloan Kettering Cancer Center

  ],
  [
    New York, NY

    Aug 2023 – present

  ],
  degree-column: [
    #strong[PhD]
  ],
)

#education-entry(
  [
    #strong[Johns Hopkins University], Computer Science and Biomedical Engineering

    - GPA 3.96

    - Activities: President, Singapore Students' Association (2021–2023); Theta Tau Professional Engineering Fraternity (2020–2022)

  ],
  [
    Baltimore, MD

    Sept 2020 – May 2023

  ],
  degree-column: [
    #strong[BS]
  ],
)

== Experience

#regular-entry(
  [
    #strong[Memorial Sloan Kettering Cancer Center, Tansey Lab], PhD Researcher

    - Developing OncoState, a self-supervised transformer learning patient states from multimodal clinical trajectories of 99,000+ MSK-IMPACT patients; outperforms the IMDC risk model in advanced clear cell RCC.

    - Co-led a population-scale study of clinical and genetic determinants of systemic-therapy toxicity (co-first author, medRxiv 2026): developed the random forest toxicity model and the analysis and narrative for Figure 3.

    - Contributed to #link("https://panpreclinical.org")[PPC], a pan-cancer atlas of ex vivo drug screens for functional precision oncology.

  ],
  [
    New York, NY

    June 2024 – present

  ],
)

#regular-entry(
  [
    #strong[Memorial Sloan Kettering Cancer Center], PhD Rotations

    - #strong[Tansey Lab]: Bayesian active learning for nominating combination therapies from ex vivo drug screens

    - #strong[Chodera Lab]: Equivariant graph neural networks for small-molecule property prediction (#link("https://github.com/choderalab/mtenn")[mtenn])

    - #strong[CMO Innovation Lab]: Computational pipeline for bisulfite- and enzyme-based DNA methylation sequencing of tumors

    - #strong[Morris Lab]: BERT representation learning from tumor mutation profiles

  ],
  [
    New York, NY

    Aug 2023 – May 2024

  ],
)

#regular-entry(
  [
    #strong[Johns Hopkins University, Fan Lab], Undergraduate Researcher

    - Built and benchmarked a reference-free LDA pipeline to deconvolve spatial transcriptomics data (STdeconvolve, #emph[Nature Communications] 2022).

    - Developed a torque-based method and simulation framework to quantify subcellular mRNA polarization.

  ],
  [
    Baltimore, MD

    Jan 2021 – May 2023

  ],
)

#regular-entry(
  [
    #strong[Hologic], Software Engineering Intern

    - Built an internal work-history search tool and automated release-note generation (3 h to 20 min).

  ],
  [
    May 2022 – Aug 2022

  ],
)

#regular-entry(
  [
    #strong[Johns Hopkins University, Biomedical Design], Team Lead, iMEDS

    - Led a team of 7 building an algorithm to continuously monitor pediatric ICU sedation; interviewed 20+ clinicians.

  ],
  [
    Baltimore, MD

    Aug 2022 – May 2023

  ],
)

#regular-entry(
  [
    #strong[Johns Hopkins University, Institute for NanoBioTechnology], Research Intern

    - Optimized a point-of-care PCR assay (15\% lower detection limit) and its embedded image-analysis and motor-control code.

  ],
  [
    Baltimore, MD

    May 2021 – Aug 2021

  ],
)

#regular-entry(
  [
    #strong[DioTeX Diagnostics], Co-Founder

    - Led assay development for a lateral-flow test for internal hemorrhage; raised over \$60,000 in non-dilutive funding.

  ],
  [
    Baltimore, MD

    Nov 2020 – Aug 2023

  ],
)

#regular-entry(
  [
    #strong[National University of Singapore, Yu Lab], Research Intern

    - Trained a CNN for endoscopic image classification (91\% accuracy); co-author in #emph[Gastrointestinal Endoscopy].

  ],
  [
    Singapore

    Nov 2019 – Dec 2020

  ],
)

#regular-entry(
  [
    #strong[Singapore Armed Forces], 3rd Sergeant

    - Led a detachment of 3 soldiers and co-supervised daily training for 15.

  ],
  [
    Singapore

    Jan 2018 – Oct 2019

  ],
)

== Publications

#regular-entry(
  [
    #strong[Population-Scale Precision Safety in Oncology Reveals Clinical and Genetic Determinants of Systemic Therapy Toxicity]

    Ziad Bakouny#sym.ast.basic#h(0pt, weak: true) , X Alex Guo#sym.ast.basic#h(0pt, weak: true) , #strong[Feiyang Huang#sym.ast.basic#h(0pt, weak: true) ], Saksham Mohan#sym.ast.basic#h(0pt, weak: true) , Rohan Walser#sym.ast.basic#h(0pt, weak: true) , et al., Wesley Tansey, Jian Carrot-Zhang, Ed Reznik

    #link("https://www.medrxiv.org/content/10.64898/2026.09.16.26363259")[www.medrxiv.org\/content\/10.64898\/2026.09.16.26363259] (medRxiv preprint; #sym.ast.basic#h(0pt, weak: true) equal contribution)

  ],
  [
    Sept 2026

  ],
)

#regular-entry(
  [
    #strong[A Pan-Cancer Ex Vivo Drug Screen Atlas for Functional Precision Oncology]

    Karl Pichotta, Jessica B White, Jeffrey F Quinn, Anneliese Markus, Christopher Tosh, Antoine De Mathelin, Erin Coyne, #strong[Feiyang Huang], Wesley Tansey

    #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC12934811/")[pmc.ncbi.nlm.nih.gov\/articles\/PMC12934811] (bioRxiv preprint)

  ],
  [
    Feb 2026

  ],
)

#regular-entry(
  [
    #strong[Reference-free cell type deconvolution of multi-cellular pixel-resolution spatially resolved transcriptomics data]

    Brendan F Miller, #strong[Feiyang Huang], Lyla Atta, Arpan Sahoo, Jean Fan

    #link("https://doi.org/10.1038/s41467-022-30033-z")[10.1038\/s41467-022-30033-z] (Nature Communications 13, 2339)

  ],
  [
    Apr 2022

  ],
)

#regular-entry(
  [
    #strong[Artificial intelligence-enhanced white-light colonoscopy with attention guidance predicts colorectal cancer invasion depth]

    Xiaobei Luo, Jiahao Wang, Zelong Han, Yang Yu, Zhenyu Chen, #strong[Feiyang Huang], et al., Hanry Yu

    #link("https://doi.org/10.1016/j.gie.2021.03.936")[10.1016\/j.gie.2021.03.936] (Gastrointestinal Endoscopy 94(3), 627–638)

  ],
  [
    Sept 2021

  ],
)

#regular-entry(
  [
    #strong[Roles and regulation of long noncoding RNAs in hepatocellular carcinoma]

    Lee Jin Lim, Samuel YS Wong, #strong[Feiyang Huang], et al., Caroline G Lee

    #link("https://doi.org/10.1158/0008-5472.CAN-19-0255")[10.1158\/0008-5472.CAN-19-0255] (Cancer Research 79(20), 5131–5139)

  ],
  [
    Oct 2019

  ],
)

== Conference Abstracts

- Bakouny Z, Guo XA, Walser R, #strong[Huang F], et al. Pan-cancer discovery of clinical and genomic determinants of immune-related adverse events. #emph[Journal of Clinical Oncology] 44(16\_suppl):11132 (ASCO 2026).

- Wu S, Pejic B, Roy S, #strong[Huang F], et al. Development of a computational model of SBS scores in critically ill children. #emph[Pediatric Critical Care Medicine] 25(11S):e87 (2024).

== Patents

- Parent C, Simon E, #strong[Huang F], Ruci A, Zhang E. Methods and devices for quantitatively estimating thrombomodulin. US Patent App. 19\/240,058 (2025).

- Eng R, Parent C, Hayat A, Ruci A, Krishnan A, #strong[Huang F], Simon E, Zhang E. Methods and devices for quantitatively estimating syndecan-1. US Patent App. 17\/715,294 (2022).

== Presentations

- 45th Vincent du Vigneaud Research Symposium, Weill Cornell Medicine, New York, NY (2026). #strong[Huang F], Tansey W. OncoState: learning patient states from clinical trajectories in cancer. Poster \#66.

- Military Health System Research Symposium, Kissimmee, FL (2022). Towards point-of-care internal hemorrhage detection through a syndecan-1 lateral flow assay. Oral presentation.

- Johns Hopkins BME Design Day, Baltimore, MD (2022). DioTeX: Hemorrhage Diagnostics. Poster.

== Honors and Awards

#regular-entry(
  [
    #strong[NIH DEBUT Challenge, Healthcare Technologies for Low-Resource Settings Prize]

    #summary[With the DioTeX team; \$15,000.]

  ],
  [
    2023

  ],
)

#regular-entry(
  [
    #strong[VentureWell e-Fest Prize]

    #summary[With the DioTeX team; \$10,000.]

  ],
  [
    2023

  ],
)

== Teaching

- Course Assistant, EN.601.230 Mathematical Foundations for Computer Science, Johns Hopkins University (Fall 2022).
