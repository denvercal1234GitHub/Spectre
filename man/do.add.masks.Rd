% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/do.add.masks.R
\name{do.add.masks}
\alias{do.add.masks}
\title{do.add.masks}
\usage{
do.add.masks(
  spatial.dat,
  mask.loc,
  masks,
  mask.label = "cell.mask",
  mask.ext = "_mask.tif",
  correct.extent = TRUE,
  flip.y = TRUE,
  value.modifier = 65535,
  array = FALSE
)
}
\arguments{
\item{spatial.dat}{NO DEFAULT. Spatial data list.}

\item{mask.loc}{NO DEFAULT. Directory of mask files.}

\item{masks}{NO DEFAULT. Vector of mask file names}

\item{mask.label}{DEFAULT = "cell_mask"}

\item{mask.ext}{DEFAULT  = "_mask.tif" (will also recognise the '.tiff' file type)}

\item{correct.extent}{DEFAULT = TRUE}

\item{flip.y}{DEFAULT = TRUE}

\item{value.modifier}{DEFAULT = 65535}

\item{array}{DEFAULT = FALSE}
}
\description{
do.add.masks
}
\references{
\url{https://github.com/ImmuneDynamics/Spectre}.
}
\author{
Thomas M Ashhurst, \email{thomas.ashhurst@sydney.edu.au}
}
