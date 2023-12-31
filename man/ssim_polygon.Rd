% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ssim_polygon.R
\name{ssim_polygon}
\alias{ssim_polygon}
\title{The SSIM index for polygon maps.}
\usage{
ssim_polygon(
  shape,
  map1,
  map2,
  standardize = TRUE,
  bandwidth = NULL,
  k1 = NULL,
  k2 = NULL,
  global = TRUE
)
}
\arguments{
\item{shape}{A \code{sf} polygon containing the attributes that can create polygon-based maps.}

\item{map1}{The name of the first map to compare as a column in the shape.}

\item{map2}{The name of the second map to compare as a column in the shape.}

\item{standardize}{If TRUE, standardize the variables before computing the SSIM. Default is TRUE.}

\item{bandwidth}{The size of bandwidth for the Gaussian kernel weighting used in the SSIM calculation. Default is the square root of N.}

\item{k1}{The constant used in the SSIM calculation. Default is NULL, in which case it is computed from the maximum value of the variables.}

\item{k2}{The constant used in the SSIM calculation. Default is NULL, in which case it is computed from the maximum value of the variables.}

\item{global}{If global is TRUE, returning the global average of SSIM, SIM, SIV, and SIP. If the option is FALSE, a \code{sf} polygon containing the SSIM, SIM, SIV, and SIP for each polygon is returned.
Default is TRUE.}
}
\value{
If global is TRUE, returning the global average SSIM, SIM, SIV, and SIP on the console window.
If global is FALSE, a \code{sf} object containing the SSIM, SIM, SIV, and SIP for each polygon.
}
\description{
This function computes the SSIM, a measure of similarity between two polygon maps.
}
\details{
This function computes the SSIM index for two polygon maps.
}
\examples{
# Load example sf object Toronto Area with three attributes for maps:
# Pampalon Index, CIMD Index,
# and percentage of household commuting within the same Census Sub-Division of residence.
data("Toronto")

# Mapping two attributes
plot(Toronto$CIMD_SDD)
plot(Toronto$PP_SDD)
# Finding global ssim
\donttest{
ssim_polygon(Toronto,"CIMD_SDD","PP_SDD")
df<-ssim_polygon(Toronto,"CIMD_SDD","PP_SDD",global=FALSE)
}
}
