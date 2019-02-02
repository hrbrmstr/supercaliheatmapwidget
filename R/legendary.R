#' Modify the calendar heatmap legend
#'
#' @param cwdgt a calendar widget object
#' @param show if `TRUE` show the legend. Default: `TRUE`
#' @param breaks number of breaks for the legend values; Default is 5
#' @param colors colors to compute the legend from. Use [cal_colors()] to construct.
#'        Default is `NULL` so you get that horrible greeen legend.
#' @param cell_size the size of the legend cells in pixels. Default is 10 pixels.
#' @param padding the padding between each legen cell in pixels. Default is 2 pixels.
#' @param margin the margin around the legend. Use [cal_margin()] to set this.
#'        Default is `cal_margin(10)`.
#' @param vjust the vertical positon of the legend. One of `bottom`, `center` or
#'        `top`. Default is `bottom`.
#' @param hjust the horizontal position of the legend. One of `left`, `center` or
#'        `right`. Default is `left`.
#' @param `orientation` the orientation of the legend. One of `horizontal` or
#'        `vertical`. Default is `horizontal`.
#' @export
cal_legend <- function(cwdgt, show = TRUE, breaks = 5, colors = NULL, cell_size = 10,
                       padding = 2, margin = cal_margin(10), vjust = "bottom",
                       hjust = "top", orientation = "horizontal") {


  cwdgt$x$displayLegend <- show
  cwdgt$x$legend <- scales::pretty_breaks(breaks)(cwdgt$x$v)
  cwdgt$x$legendColors <- colors
  cwdgt$x$legendCellSize <- cell_size
  cwdgt$x$legendCellPadding <- padding
  cwdgt$x$legendMargin <- margin
  cwdgt$x$legendVerticalPosition <- vjust
  cwdgt$x$legendHorizontalPosition <- hjust
  cwdgt$x$legendOrientation <- orientation

  return(cwdgt)

}