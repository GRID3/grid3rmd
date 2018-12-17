# grid3rmd

R Markdown Templates for use within the GRID project

## Installation

```r
devtools::install_github("GRID3/grid3rmd")
```

## Using in file

The template includes output formats for PDF, HTML and Word. The following options can be used in the YAML of your R Markdown document.

```yaml
output:
  grid3rmd::html_grid3: default
  grid3rmd::pdf_grid3: default
  grid3rmd::word_grid3: default
```
