#' Construct a margin object for calendar heatmap parameters
#'
#' @param position position of the label, relative to the `domain` one of
#'        `top`, `left`, `bottom` or `right` (or abbreviated versions). Default
#'        is `bottom`.
#' @param align horizontal alignment of the `domain`. One of `left`, `right` or
#'        `center`. Default is `center`.
#' @param rotate rotation of vertical label. One of `none`, `left` or `right`.
#'        Defautl is `none`.
#' @param offset additional control over label positioning. i.e. if the default
#'        does not fit your need (likley when rotation is involved) or when
#'        using a larger font size. Use [cal_offset()] to construct. Defualt
#'        is `cal_offset(0,0)`.
#' @param width _only used when `roate` is not `none`! This defines the width
#'        of the label (in pixels).
#' @param height height of the `domain` labels in pixels. If `NULL` the label
#'        is automagically set to 2x the height of `sub_domain` cells.
#' @export
cal_label <- function (position = c("bottom", "top", "left", "right"),
                       align = c("center", "left", "right"),
                       rotate = c("none", "left", "right"),
                       offset = cal_offset(0,0),
                       width = 100, height = NULL) {

  position <- match.arg(position, c("bottom", "top", "left", "right"))
  align <- match.arg(align, c("center", "left", "right"))
  rotate <- match.arg(rotate, c("none", "left", "right"))

  list(
    position = position,
    align = align,
    rotate = rotate,
    offset = offset,
    width = width,
    height = height
  ) -> out

  class(out) <- c("cal-label")

  out

}
