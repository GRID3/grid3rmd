
<!-- README.md is generated from README.Rmd. Please edit that file -->

# grid3rmd

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Commits](https://img.shields.io/github/last-commit/GRID3/grid3rmd)
<!-- badges: end -->

-----

This R package provides R Markdown templates for the
[GRID3](http://grid3.org/) project. These templates provide branded
fonts, colour schemes and icons. The package can be installed from
GitHub as follows:

    remotes::install_github("GRID3/grid3rmd")

## Using the templates

The template includes output formats for PDF, HTML and Word. These are
available through RStudio through `File -> New -> RMarkdown -> From
Template`, where `GRID3 Template` and `GRID3 Training Template`, or by
changing the output format in the the YAML of your R Markdown document
using the following:

    output:
      grid3rmd::html_grid3: default
      grid3rmd::pdf_grid3: default
      grid3rmd::word_grid3: default

An example of the outputs is shown below:

<img src="man/figures/screenshot.png" width="100%" style="display: block; margin: auto;" />

## Custom Blocks

The templates include a range of [custom
blocks](https://bookdown.org/yihui/bookdown/custom-blocks.html) which
can be used in documents. The options available include **tip**,
**question**, **exercise**, **important**, **rmdnote**, **rmdcaution**,
**rmdimportant**, **rmdtip**, **rmdwarning**. These are used within code
chunks by setting the header as `{block2, type = "tip"}` and including
markdown text within the chunk. The full set of options are shown below:

<img src="man/figures/customChunks.png" width="100%" style="display: block; margin: auto;" />

For more examples and demonstrations, users should refer to the
[template](https://github.com/GRID3/grid3rmd/blob/master/inst/rmarkdown/templates/gridTraining/skeleton/skeleton.Rmd)
