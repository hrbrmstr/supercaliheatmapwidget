#' Construct a margin object for calendar heatmap parameters
#'
#' @param t,r,b,l top, bottom, left, right margins (in pixels)
#' @export
cal_margin <- function (t = 0, r = 0, b = 0, l = 0) {
  out <- c(t, r, b, l)
  class(out) <- c("cal-margin")
  out
}


