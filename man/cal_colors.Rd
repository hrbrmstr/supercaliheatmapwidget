% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cal-colors.R
\name{cal_colors}
\alias{cal_colors}
\title{Construct a legend color object for calendar heatmap parameters}
\usage{
cal_colors(min, max, empty = NULL, base = NULL, overflow = NULL)
}
\arguments{
\item{min, max}{color of the smallest/highest value on the legend.
Must be a valid HTML/javascript/CSS color value/name.}

\item{empty}{color fo dates with value == 0. Default is \code{NULL} for
no default behaviour.}

\item{base}{the base color of the date cells. Default is \code{NULL} to
not mess with this value.}

\item{overflow}{color for the "special" value. Default is \code{NULL} for
no special value color treatment.}
}
\description{
Construct a legend color object for calendar heatmap parameters
}
