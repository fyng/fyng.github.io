// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Feiyang Huang",
  title: "Feiyang Huang - CV",
  footer: context { [#emph[Feiyang Huang · #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Updated Oct 2026] ],
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
  entries-date-and-location-width: 2.1cm,
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
    month: 10,
    day: 27,
  ),
)

#grid(
  columns: (1fr, auto),
  align: (left + bottom, right + bottom),
  [
= Feiyang Huang
    #headline([PhD Candidate, Computational Biology & Medicine])
  ],
  [
    #set par(spacing: 0.3cm)
    #set text(fill: rgb(112, 116, 128), font: "IBM Plex Sans", size: 9pt)
    #text(size: 12pt)[
      #link("mailto:feh4005@med.cornell.edu", icon: false, if-underline: false, if-color: false)[#fa-icon("envelope")]#h(0.3cm)
      #link("https://scholar.google.com/citations?user=MFllmkIAAAAJ", icon: false, if-underline: false, if-color: false)[#fa-icon("graduation-cap")]#h(0.3cm)
      #link("https://orcid.org/0000-0002-7241-1509", icon: false, if-underline: false, if-color: false)[#fa-icon("orcid")]#h(0.3cm)
      #link("https://github.com/fyng", icon: false, if-underline: false, if-color: false)[#fa-icon("github")]#h(0.3cm)
      #link("https://linkedin.com/in/feiyang-huang", icon: false, if-underline: false, if-color: false)[#fa-icon("linkedin")]
    ]

    #connection-with-icon("location-dot")[New York, NY]

    #connection-with-icon("language")[English, Mandarin]

  ],
)
#v(0.35cm)

== Education

#education-entry(
  [
    #strong[Weill Cornell Graduate School of Medical Sciences], Tri-Institutional PhD Program in Computational Biology & Medicine

    - Advisor: Wesley Tansey, Memorial Sloan Kettering Cancer Center

  ],
  [
    New York, NY

    Aug 2023 –

    present

  ],
  degree-column: [
    #strong[PhD]
  ],
)

#education-entry(
  [
    #strong[Johns Hopkins University], Computer Science and Biomedical Engineering

    - GPA 3.96

  ],
  [
    Baltimore, MD

    Sept 2020 –

    May 2023

  ],
  degree-column: [
    #strong[BS]
  ],
)

== Research Experience

#regular-entry(
  [
    #strong[Memorial Sloan Kettering Cancer Center], PhD Rotations

    - #strong[Tansey Lab]: Bayesian active learning for nominating combination therapies from ex vivo drug screens.

    - #strong[Chodera Lab]: Equivariant graph neural networks for small-molecule property prediction (#link("https://github.com/choderalab/mtenn")[mtenn]).

    - #strong[CMO Innovation Lab]: Computational pipeline for bisulfite- and enzyme-based DNA methylation sequencing of tumors.

    - #strong[Morris Lab]: BERT representation learning from tumor mutation profiles.

  ],
  [
    Aug 2023 –

    May 2024

  ],
)

#regular-entry(
  [
    #strong[Johns Hopkins University, Fan Lab], Undergraduate Researcher

    - Reference-free deconvolution of spot-based spatial transcriptomics using LDA topic modeling.

    - Quantification of subcellular mRNA polarization using a torque framework.

  ],
  [
    Jan 2021 –

    May 2023

  ],
)

#regular-entry(
  [
    #strong[Johns Hopkins University, Institute for NanoBioTechnology], Research Intern

    #summary[Microfluidic chip platform for rapid (\<10 min) point-of-care PCR diagnostics.]

  ],
  [
    May 2021 –

    Aug 2021

  ],
)

#regular-entry(
  [
    #strong[National University of Singapore, Yu Lab], Research Intern

    #summary[Lesion invasion depth prediction from endoscopic images using a CNN.]

  ],
  [
    Nov 2019 –

    Dec 2020

  ],
)

== Honors and Awards

#regular-entry(
  [
    #strong[NIH DEBUT Challenge, Healthcare Technologies for Low-Resource Settings Prize]

  ],
  [
    2023

  ],
)

#regular-entry(
  [
    #strong[VentureWell e-Fest Prize]

  ],
  [
    2023

  ],
)

== Preprints

#regular-entry(
  [
    #strong[Population-Scale Precision Safety in Oncology Reveals Clinical and Genetic Determinants of Systemic Therapy Toxicity]

    Ziad Bakouny#sym.ast.basic#h(0pt, weak: true) , X Alex Guo#sym.ast.basic#h(0pt, weak: true) , #strong[Feiyang Huang#sym.ast.basic#h(0pt, weak: true) ], Saksham Mohan#sym.ast.basic#h(0pt, weak: true) , Rohan Walser#sym.ast.basic#h(0pt, weak: true) , et al., Wesley Tansey, Jian Carrot-Zhang, Ed Reznik

    #link("https://www.medrxiv.org/content/10.64898/2026.09.16.26363259")[www.medrxiv.org\/content\/10.64898\/2026.09.16.26363259] (medRxiv; #sym.ast.basic#h(0pt, weak: true) equal contribution)

  ],
  [
    Sept 2026

  ],
)

#regular-entry(
  [
    #strong[A Pan-Cancer Ex Vivo Drug Screen Atlas for Functional Precision Oncology]

    Karl Pichotta, Jessica B White, Jeffrey F Quinn, Anneliese Markus, Christopher Tosh, Antoine De Mathelin, Erin Coyne, #strong[Feiyang Huang], Wesley Tansey

    #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC12934811/")[pmc.ncbi.nlm.nih.gov\/articles\/PMC12934811] (bioRxiv)

  ],
  [
    Feb 2026

  ],
)

== Peer-Reviewed Publications

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

#regular-entry(
  [
    #strong[Pan-cancer discovery of clinical and genomic determinants of immune-related adverse events]

    Ziad Bakouny, X Alex Guo, Rohan Walser, #strong[Feiyang Huang], et al.

    #link("https://doi.org/10.1200/JCO.2026.44.16_suppl.11132")[10.1200\/JCO.2026.44.16\_suppl.11132] (Journal of Clinical Oncology 44(16\_suppl), 11132; ASCO 2026)

  ],
  [
    2026

  ],
)

#regular-entry(
  [
    #strong[Development of a computational model of SBS scores in critically ill children]

    S Wu, B Pejic, S Roy, #strong[Feiyang Huang], et al.

    #link("https://doi.org/10.1097/01.pcc.0001085444.27374.df")[10.1097\/01.pcc.0001085444.27374.df] (Pediatric Critical Care Medicine 25(11S), e87)

  ],
  [
    2024

  ],
)

== Presentations

#regular-entry(
  [
    #strong[OncoState: Learning patient states from clinical trajectories in cancer] Poster. 45th Vincent du Vigneaud Research Symposium, Weill Cornell Medicine, New York, NY.

  ],
  [
    2026

  ],
)

#regular-entry(
  [
    #strong[Towards point-of-care internal hemorrhage detection through a syndecan-1 lateral flow assay] Oral presentation. Military Health System Research Symposium, Kissimmee, FL.

  ],
  [
    2022

  ],
)

== Patents

#strong[Granted:] US 12,105,099 B2; Methods and devices for quantitatively estimating syndecan-1

#strong[Pending:] US 19\/240,058; Methods and devices for quantitatively estimating thrombomodulin

== Teaching

#regular-entry(
  [
    #strong[Course Assistant, Mathematical Foundations for Computer Science] Johns Hopkins University

  ],
  [
    Fall 2022

  ],
)

== Leadership and Service

#regular-entry(
  [
    #strong[Singapore Students' Association, Johns Hopkins University], President

  ],
  [
    2021 –

    2023

  ],
)

#regular-entry(
  [
    #strong[Theta Tau Professional Engineering Fraternity, Johns Hopkins University], Member

  ],
  [
    2020 –

    2022

  ],
)

== Work and Entrepreneurship Experience

#regular-entry(
  [
    #strong[DioTeX Diagnostics], Co-Founder

    - Developed a lateral flow test for internal hemorrhage.

    - Raised over \$60,000 in nondilutive funding.

  ],
  [
    Nov 2020 –

    Aug 2023

  ],
)

#regular-entry(
  [
    #strong[BME Design Team], Team Leader

    - Developed a continuous monitoring solution using accelerometry and vitals for sedative dosage adjustment in the pediatric ICU.

    - Led a team of 7 undergraduates and managed the project.

    - Launched an IRB study to generate a dataset of regular interval, nurse annotated clinical sedation score.

    - Obtained \$100,000 in competitive internal grant funding.

    - Interviewed 20 clinicians for needs discovery.

  ],
  [
    Aug 2022 –

    May 2023

  ],
)

#regular-entry(
  [
    #strong[Hologic], Software Engineering Intern

    - Built an internal work history search tool and automated release note generation.

  ],
  [
    May 2022 –

    Aug 2022

  ],
)

== Other Experience

#regular-entry(
  [
    #strong[Singapore Armed Forces], 3rd Sergeant

    - Led a detachment of 3 soldiers and co-supervised daily training for 15 soldiers.

  ],
  [
    Jan 2018 –

    Oct 2019

  ],
)
