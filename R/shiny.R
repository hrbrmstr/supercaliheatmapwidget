#' Shiny bindings for supercaliheatmapwidget
#'
#' Output and render functions for using supercaliheatmapwidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a supercaliheatmapwidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name supercaliheatmapwidget-shiny
#'
#' @export
supercaliheatmapwidgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'supercaliheatmapwidget', width, height, package = 'supercaliheatmapwidget')
}

#' @rdname supercaliheatmapwidget-shiny
#' @export
renderSupercaliheatmapwidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, supercaliheatmapwidgetOutput, env, quoted = TRUE)
}
