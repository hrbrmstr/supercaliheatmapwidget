#' Construct a legend color object for calendar heatmap parameters
#'
#' @param min,max color of the smallest/highest value on the legend.
#'        Must be a valid HTML/javascript/CSS color value/name.
#' @param empty color fo dates with value == 0. Default is `NULL` for
#'        no default behaviour.
#' @param base the base color of the date cells. Default is `NULL` to
#'        not mess with this value.
#' @param overflow color for the "special" value. Default is `NULL` for
#'        no special value color treatment.
#' @export
cal_colors <- function(min, max, empty = NULL, base = NULL, overflow = NULL) {

  out <- list()

  out$min <- min
  out$max <- max

  if (!is.null(empty)) out$empty <- empty
  if (!is.null(base)) out$base <- base
  if (!is.null(overflow)) out$oveflow <- overflow

  class(out) <- c("cal-colors")

  out

}

