#' Display labels on calendar heatmap cells
#'
#' Use one of `format_string` (for simple data format strings) or
#' javascript function body code to use other values. Not both.
#'
#' @param cwdgt a calendar widget object
#' @param format_string a valid javascript date format string _OR_
#' @param js_body bare javascript function body code that will be wrapped in
#'        `function(date ,value) {}` for you. You must return a value
#'        that can be converted to a string.
#' @references [`subdomainTextFormat`](https://cal-heatmap.com/#subDomainTextFormat)
#' @export
label_cells <- function(cwdgt, format_string = NULL, js_body = NULL) {

  if (is.null(format_string) && is.null(js_body)) {
    stop("You need to specify either 'format_string' or 'js_body.", call.=FALSE)
  }

  if ((!is.null(format_string) && !is.null(js_body))) {
    stop("You need to specify either 'format_string' or 'js_body.", call.=FALSE)
  }

  if (!is.null(format_string)) {
    cwdgt$x$subDomainTextFormat <- format_string
  } else {
    cwdgt$x$subDomainTextFormat <- JS("function(date, value) { ", js_body, "}")
  }

  return(cwdgt)

}