#' Construct an offset object for calendar labels
#'
#' @param x,y x and y offsets
#' @export
cal_offset <- function (x = 0, y = 0) {
  out <- list(x=x, y=y)
  class(out) <- c("cal-offset")
  out
}
