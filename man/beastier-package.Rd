% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/beastier-package.R
\docType{package}
\name{beastier-package}
\alias{beastier}
\alias{beastier-package}
\title{\code{beastier}: A package to call BEAST2.}
\description{
\code{beastier} allows to call BEAST2, a popular
Bayesian phylogenetics tool, using
an R interface. 'beastier' closely follows the interface
of BEAST2, including its default settings.
}
\examples{
check_empty_beaustier_folders()

beast2_options <- create_beast2_options(
  input_filename = get_beastier_path("2_4.xml")
)

if (is_beast2_installed() && beautier::is_on_ci()) {
  run_beast2_from_options(beast2_options)
  file.remove(beast2_options$output_state_filename)
  remove_beaustier_folders()
}
}
\seealso{
These are packages associated with \code{beastier}:
\itemize{
  \item{
    The package \code{beautier} can create
    BEAST2 input files from R
  }
  \item{
    The package \code{tracerer} can parse
    BEAST2 output files from R
  }
  \item{
    The package \code{babette} combines the
    functionality of \code{beautier},
    \code{beastier} and \code{tracerer}
    into a single workflow
  }
}
}
\author{
Richèl J.C. Bilderbeek
}
\keyword{internal}
