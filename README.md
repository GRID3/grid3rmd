
# grid3rmd <img src="http://www.data4sdgs.org/sites/default/files/styles/medium/public/logo/Flowminder%20Logo.png?itok=7KXISaDh" align="right" />

![GitHub commit
activity](https://img.shields.io/badge/Status-Work%20In%20Progress-orange.svg)

-----

This R package contains R Markdown templates for the [GRID3](http://grid3.org/) project, using brand fonts, colour schemes and icons. The package can be installed from GitHub as follows:

```r
devtools::install_github("GRID3/grid3rmd")
```

## Using the templates

The template includes output formats for PDF, HTML and Word. These are available through RStudio through `File -> New -> RMarkdown -> From Template`, where `GRID3 Template` and `GRID3 Training Template`, or by changing the output format in the  the YAML of your R Markdown document using the following:

```yaml
output:
  grid3rmd::html_grid3: default
  grid3rmd::pdf_grid3: default
  grid3rmd::word_grid3: default
```

An example of the outputs is shown below:

![](screenshot.png)

## Custom Blocks

The templates include a range of [custom blocks](https://bookdown.org/yihui/bookdown/custom-blocks.html) which can be used in documents. The options available include **tip**, **question**, **exercise**, **important**, **rmdnote**, **rmdcaution**, **rmdimportant**, **rmdtip**, **rmdwarning**. These are used within code chunks:

```{block2, type = "tip"}

Your text for your custom block

```

The full set of options are shown below:

![](customChunks.png)





