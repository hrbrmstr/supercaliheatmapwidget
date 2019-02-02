#' Construct a tooltip names object for the calender widget
#'
#' @param singular,plural singular and plural forms for the "thing(s)".
#'        Defaults to naively sticking an `s` on the end of `singular` and
#'        defaults `singular` to `item`.
#' @export
cal_names <- function(singular = "item", plural = sprintf("%ss", singular)) {

  out <- c(singular, plural)
  class(out) <- c("cal-names")

  out

}

