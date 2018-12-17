#' HTML Output for GRID3 Reports
#'
#' Uses bookdown package to allow cross-referencing. Specifies many defaults,
#'   including floating table of contents, code folding and styling.
#'
#' @param toc TRUE/FALSE (default TRUE). Display a table of contents
#' @param code_folding "show", "hide", or FALSE to change code display behaviour
#' @param self_contained Produce a standalone HTML file with no external dependencies, using data: URIs to incorporate the contents of linked scripts, stylesheets, images, and videos. Set as FALSE if the file size increases as Git cannot handle binary functions very efficiently.
#' @param ... additional arguments which can be parsed by the html_document function
#'
#' @seealso  \code{\link[rmarkdown]{html_document}}
#'
#' @export
#' @author Michael Harper
#'
html_grid3 <- function(toc = TRUE, code_folding = "hide", self_contained = TRUE, ...) {

  # get the locations of resource files located within the package
  #css <- system.file("reports/styles.css", package = "mypackage")
  footer <- system.file("rmarkdown/templates/elements/footer.html", package = "grid3rmd")
  header <- system.file("rmarkdown/templates/elements/header.html", package = "grid3rmd")
  css <- system.file("css/style.css", package = "grid3rmd")

  # call the base html_document function
  bookdown::html_document2(toc = toc,
                           fig_caption = TRUE,
                           number_sections = TRUE,
                           self_contained = self_contained,
                           collapsed = FALSE,
                           toc_float = TRUE,
                           theme = "flatly",
                           highlight = "tango",
                           code_folding = code_folding,
                           css = css,
                           includes = rmarkdown::includes(after_body = footer, before_body = header),
                           ...)
}

#' Word Output for GRID3 Reports
#'
#' Uses bookdown package to allow cross-referencing. Uses the styles reference
#'  file `mystyles.docx` stored in directory `inst/rmarkdown/templates/elements`
#'  to define custom styling.
#'
#' @param toc TRUE/FALSE (default TRUE). Display a table of contents
#' @param toc_depth the depth of the table of contents. Default is 2
#' @param ... additional arguments which can be parsed by the word_document function
#'
#' @seealso  \code{\link[rmarkdown]{word_document}}
#'
#' @author Michael Harper
#' @export
#'
word_grid3 <- function(toc = TRUE, toc_depth = 2, ...) {

  # get the locations of resource files located within the package
  #css <- system.file("reports/styles.css", package = "mypackage")
  style <- system.file("rmarkdown/templates/elements/mystyles.docx", package = "grid3rmd")

  # call the base html_document function
  bookdown::word_document2(toc = toc,
                           fig_width = 6,
                           fig_height = 4,
                           fig_caption = TRUE,
                           reference_docx = style,
                           ...)
}



#' PDF Output for GRID3 Reports
#'
#' A custom report style to fromat the output of R Markdown reports.
#'  Uses bookdown's \code{pdf_document2} as the base format to allow
#'  cross-referencing and other improvements.
#'
#'  Lower level LaTeX YAML settings are specified in an external file. This
#'  controls the document paper size, margins, and other layout options.
#'
#' @param toc TRUE/FALSE (default TRUE). Display a table of contents
#' @param toc_depth the depth of the table of contents. Default is 2
#' @param ... additional arguments which can be parsed by the word_document function
#'
#' @seealso  \code{\link[rmarkdown]{pdf_document}}
#'
#' @author Michael Harper
#' @export
#'
pdf_grid3 <- function(toc = TRUE, toc_depth = 2, ...) {

  # get the locations of resource files located within the package
  #css <- system.file("reports/styles.css", package = "mypackage")
  template <- system.file("rmarkdown/templates/elements/template.tex", package = "grid3rmd")
  yaml <- system.file("rmarkdown/templates/elements/latexCommon.yaml", package = "grid3rmd")

  # A temporary header file is created which corrects the filepath with the local name
  header <- system.file("rmarkdown/templates/elements/header.tex", package = "grid3rmd")
  filePathImages <- system.file("logo.png", package = "grid3rmd")
  updatedHeader <- stringr::str_replace(readLines(header), "LOCALFILEPATH", filePathImages)
  tempTex <- tempfile(pattern = "file", fileext = ".tex")
  writeLines(text = updatedHeader, tempTex)

  # Read the YAML file to use as settings for PDF output
  opts <- grid3rmd:::yaml_to_pandoc(yaml)

  # call the base html_document function
  bookdown::pdf_document2(toc = toc,
                          latex_engine= "xelatex",
                          number_sections = TRUE,
                          toc_depth= 2,
                          fig_caption= TRUE,
                          template= template,
                          includes = rmarkdown::includes(in_header = tempTex),
                          pandoc_args = opts,
                          ...)




}


#' Convert a YAML file into correct format for pandoc arguments
#'
#' This is an internal function used by the \code{pdf_GRID3}
#'  function, and is designed to load and format the data from
#'  an external YAML file, and format it correctly to be used
#'  as an argument for pandoc.
#'
#'  @param file the file path of the YAML document
#'
yaml_to_pandoc <- function(file){

  opts <- yaml::read_yaml(file)

  # Convert options to correct format for pandoc
  settings <-
    lapply(1:length(opts), function(x)
      rmarkdown::pandoc_variable_arg(name = names(opts[x]), value = opts[[x]]))

  settings <- unlist(settings)
  return(settings)
}
