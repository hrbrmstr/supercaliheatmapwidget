#' Supercalifragilistic HTML Calendar Heatmaps
#'
#' The veritable Mary Poppins of interactive R calendar heatmaps.
#'
#' @param xdf data frame
#' @param datetime_col bare or quoted column name where `Date` or `POSIXct`
#'        (or equivalent character strings) are stored.
#' @param value_col bare or quoted column name where integer or numeric values
#'        are stored.
#' @param tooltip display a tooltip on hover? Default is `TRUE`.
#' @param tooltip_item_name the "thing" being counted in the heatmap cells.
#'        Use [cal_names()] to set the singular and plural form of the "thing".
#'        Defaults to `cal_names('item', 'items')`
#' @param domain the type of "domain" for the calendar. One of `hour`, `day`,
#'        `week`, `month` or `year`; Defaults to `month`. See [the docs](https://cal-heatmap.com/#domain).
#' @param sub_domain the type of "subdomain" for the "domain" of the calendar. This
#'        has to make sens efor the choise of "domain". One of `min`, `x_min`, `hour`,
#'        `x_hour`, `day`, `x_day`, `week`, `x_week`, `month` or `x_month`. Defaults to `day`
#'        since `domain` defaults to `month`. See [the docs](https://cal-heatmap.com/#subdomain).
#' @param range the number of `domain` to display. The default is `12` (e.g. 12 months).
#' @param start the start date of the calendar. Can be a `Date` or `POSIXct` (or
#'        equivalent character value but must match the type/format of `datetime_col`).
#'        See [the docs](https://cal-heatmap.com/#start).
#' @param cell_size the size of each `sub_domain` cell in pixels. Default is `20`.
#' @param cell_padding the space between each `sub_domain` cell in pixels. Default is `4`.
#' @param cell_radius the `sub_domain` cell's border radius in pixels. This enables
#'        rounded corners. Default is `0` or a "box".
#' @param domain_gutter the space betwen each `domain` in pixels. Defaults to `6`.
#' @param domain_margin the top, bottom, left, right margins around each `domain` in
#'        pixels. Use [cal_margin()] to construct this.
#' @param orientation default is "`horizontal`". Can also be "`vertical`".
#' @param label position and alignment of the `domain` label. USe [cal_label()] to construct.
#' @param col_limit control the number of columns to split the `domain` into. Each domain
#'        is split into an arbitrary number of columns (or rows depending on the reading
#'        direction). You can overwrite that number with this parameter and force all
#'        dates on the same line, or split them into more columns. Default is `NULL`.
#' @param row_limit control the number of rows to split the `domain` into. Default is `NULL`.`
#' @param width,height,elementId the usual `htmlwidget` suspsects.
#' @export
supercaliheatmapwidget <- function(xdf, datetime_col, value_col,
                                   tooltip = TRUE, tooltip_item_name = cal_names(),
                                   domain = c("month", "day", "hour", "week", "year"),
                                   sub_domain = c("day", "min", "x_min", "hour", "x_hour", "x_day", "week", "x_week", "month", "x_month"),
                                   range = 12, start = NULL,
                                   cell_size = 20, cell_padding = 4, cell_radius = 0,
                                   domain_gutter = 6, domain_margin = cal_margin(),
                                   orientation = c("horizontal", "vertical"),
                                   label = cal_label(),
                                   col_limit = NULL, row_limit = NULL,
                                   width = NULL, height = NULL, elementId = NULL) {

  domain <- match.arg(domain, c("month", "day", "hour", "week", "year"))
  sub_domain <- match.arg(sub_domain, c("day", "min", "x_min", "hour", "x_hour", "x_day", "week", "x_week", "month", "x_month"))
  orientation <- match.arg(orientation, c("horizontal", "vertical"))

  if (inherits(xdf, "data.frame")) xdf <- as.data.frame(xdf)

  if (!missing(datetime_col)) {
    datetime_col <- substitute(datetime_col)
    res <- try(eval(datetime_col, data, parent.frame()), silent = TRUE)
    if (!inherits(res, "try-error") && inherits(res, "character")) {
      datetime_col <- if (length(res) != 1) as.character(substitute(datetime_col)) else res
    } else if (inherits(datetime_col, "name")) { x <- as.character(datetime_col) }
  } else {
    datetime_col <- as.character(substitute(datetime_col))
  }

  if (!missing(value_col)) {
    value_col <- substitute(value_col)
    res <- try(eval(value_col, data, parent.frame()), silent = TRUE)
    if (!inherits(res, "try-error") && inherits(res, "character")) {
      value_col <- if (length(res) != 1) as.character(substitute(value_col)) else res
    } else if (inherits(value_col, "name")) { x <- as.character(value_col) }
  } else {
    value_col <- as.character(substitute(value_col))
  }

  d <- xdf[[datetime_col]]
  if (inherits(d, "POSIXct")) {
    d <- as.numeric(d)
  } else if (inherits(d, "Date")) {
    d <- as.numeric(as.POSIXct(as.character(d)))
  } else if (inherits(d, "character")) {
    d <- as.numeric(as.POSIXct(d))
  } else {
    stop("Unknown 'datetimecol' format.", call. = FALSE)
  }

  v <- xdf[[value_col]]

  stopifnot(is.numeric(v))

  vals <- jsonlite::toJSON(as.list(set_names(v, as.character(d))), auto_unbox = TRUE)

  if (is.null(start)) {
    start <- format(as.POSIXct(min(d), origin = "1970-01-01 00:00:00"), "%Y-%m-%d")
  }

  list(
    domain = domain,
    subDomain = sub_domain,
    tooltip = tooltip,
    itemName = tooltip_item_name,
    range = range,
    start = start,
    label = label,
    v = v,
    legend = scales::pretty_breaks(5)(v),
    cellSize = cell_size,
    cellPadding = cell_padding,
    cellRadius = cell_radius,
    vals = vals,
    subDomainTextFormat = "",
    displayLegend = TRUE,
    legendColors = NULL,
    legendCellSize = 10,
    legendCellPadding = 2,
    legendMargin = cal_margin(10),
    legendVerticalPosition = "bottom",
    legendHorizontalPosition = "top",
    legendOrientation = "horizontal"
  ) -> params

  # create widget
  htmlwidgets::createWidget(
    name = 'supercaliheatmapwidget',
    x = params,
    width = width,
    height = height,
    package = 'supercaliheatmapwidget',
    elementId = elementId
  )
}
