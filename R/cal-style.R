# http://www.buildingwidgets.com/blog/2016/9/7/custom-styling-for-htmlwidgets
.set_style <- function(w, nm, css) {

  stopifnot(!is.null(w), inherits(w, "htmlwidget"))

  elementId <- w$elementId # use current id of htmlwidget if already specified

  if(is.null(elementId)) {
    elementId <- sprintf( 'htmlwidget-%s', htmlwidgets:::createWidgetId()) # borrow htmlwidgets unique id creator
    w$elementId <- elementId
  }

  htmlwidgets::prependContent(
    w, htmltools::tags$style(
      sprintf("#%s %s {%s}", elementId, nm, css)
    )
  )

}

#' Add CSS styling rules to a calendar heatmap
#'
#' @param cwdgt a calendar widget object
#' @param subdomain_text CSS style for `sub_domain` text. Note you can't change
#'        horizontal or vertical justification.
#' @param hover_cursor CSS for all clickable cells
#' @param graph_label CSS for the `domain` label
#' @param graph_rect CSS for the `sub_domain` cells and used when the cell is not
#'        associated to a value.
#' @param highlight,highlight_now CSS for higlighted cells
#' @param rect_highlight,rect_highlight_now,text_highlight,text_highlight_now used
#'        instead of `highlight`/`highlight_now` to set CSS on the cell rect and the text
#'        inside respectively.
#' @export
cal_style <- function(cwdgt,
                      subdomain_text,
                      hover_cursor,
                      graph_label, graph_rect,
                      highlight, highlight_now,
                      rect_highlight, rect_highlight_now,
                      text_highlight, text_highlight_now) {

  if (!missing(subdomain_text)) cwdgt <- .set_style(cwdgt, ".subdomain-text", subdomain_text)
  if (!missing(hover_cursor)) cwdgt <- .set_style(cwdgt, ".hover_cursor", hover_cursor)
  if (!missing(graph_label)) cwdgt <- .set_style(cwdgt, ".graph-label", graph_label)
  if (!missing(graph_rect)) cwdgt <- .set_style(cwdgt, ".graph-rect", graph_rect)
  if (!missing(highlight)) cwdgt <- .set_style(cwdgt, ".highlight", highlight)
  if (!missing(highlight_now)) cwdgt <- .set_style(cwdgt, ".highlight.now", highlight_now)
  if (!missing(rect_highlight)) cwdgt <- .set_style(cwdgt, "rect.highlight", rect_highlight)
  if (!missing(rect_highlight_now)) cwdgt <- .set_style(cwdgt, "rect.now", rect_highlight_now)
  if (!missing(text_highlight)) cwdgt <- .set_style(cwdgt, "text.highlight", text_highlight)
  if (!missing(text_highlight_now)) cwdgt <- .set_style(cwdgt, "text.now", text_highlight_now)

  cwdgt

}