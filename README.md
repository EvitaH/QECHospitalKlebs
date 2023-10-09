
<!-- README.md is generated from README.Rmd. Please edit that file -->

# QECHospitalKlebs

[![DOI](https://zenodo.org/badge/701648680.svg)](https://zenodo.org/badge/latestdoi/701648680)

<!-- badges: start -->
<!-- badges: end -->

The QECHKlebs R package is a repository for data generated and
reproducible analysis scripts for the manuscripts arising from this
study:

[**Longitudinal analysis within one hospital in sub-Saharan Africa over
20 years reveals repeated replacements of dominant clones of Klebsiella
pneumoniae and stresses the importance to include temporal patterns for
vaccine design
considerations**](https://www.medrxiv.org/content/10.1101/2023.09.26.23296137v1)

Eva Heinz<sup>1,2</sup>, Oliver Pearse<sup>2,3</sup>, Allan
Zuza<sup>3</sup>, Sithembile Bilima<sup>3</sup>, Chisomo
Msefula<sup>4</sup>, Patrick Musicha<sup>2,3</sup>, Patriciah
Siyabu<sup>5</sup>, Edith Tewesa<sup>5</sup>, Fabrice E
Graf<sup>2</sup>, Rebecca Lester<sup>3,6</sup>, Samantha
Lissauer<sup>3,7</sup>, Jennifer Cornick<sup>3,7</sup>, Joseph M
Lewis<sup>2,3,7</sup>, Kondwani Kawaza<sup>3,4</sup>, Nicholas R
Thomson<sup>8,9</sup>, Nicholas A Feasey<sup>2,3,10</sup>

1.  Department of Vector Biology, Liverpool School of Tropical Medicine,
    Liverpool, UK
2.  Department of Clinical Sciences, Liverpool School of Tropical
    Medicine, Liverpool, UK
3.  Malawi Liverpool Wellcome Programme, Kamuzu University of Health
    Sciences, Blantyre, Malawi
4.  Kamuzu University of Health Sciences, Blantyre, Malawi
5.  Queen Elizabeth Central Hospital, Blantyre, Malawi
6.  Division of Infection & Immunity, University College London, UK
7.  Department of Clinical Infection, Microbiology and Immunology,
    University of Liverpool, Liverpool, UK
8.  Parasites and Microbes Program, Wellcome Sanger Institute, Hinxton,
    UK
9.  London School of Hygiene and Tropical Medicine, London, UK
10. School of Medicine, St Andrews University, UK

Paper currently available as pre-print
[here](https://www.medrxiv.org/content/10.1101/2023.09.26.23296137v1)

## Installation

If you just want the data, then all the data to replicate the analysis
are bundled with the package. To install the package from GitHub:

``` r
install.packages("devtools")
devtools::install_github("https://github.com/EvitaH/QECHospitalKlebs")
```

The various data objects are described in the [pkgdown]() site for this
package [here](), and available via R in the usual way. They are all
lazy loaded so will be available for use immediately.

### Whole genome sequence accession numbers and metadata

Reads from all isolates sequenced as part of this study have been
deposited in the European Nucleotide Archive (ENA); accession numbers
are available in the Table S1 from the publication.

### Analysis scripts

The analysis scripts to reproduce tables and figures for each manuscript
are available as package vignettes; these can be built when downloading
the package by running:

``` r
devtools::install_github(
  "https://github.com/EvitaH/QECHospitalKlebs", 
  build_vignettes = TRUE, 
  dependencies = TRUE )
```

The `dependencies = TRUE` option will install all the packages necessary
to run the vignette.

Most analyses performed for the manuscript are straightforward, but
please note that running rPinecone might take a while on the larger data
sets (especially the *K. pneumoniae subsp. pneumoniae*).
