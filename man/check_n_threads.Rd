% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_n_threads.R
\name{check_n_threads}
\alias{check_n_threads}
\title{Check if the input is a valid number of threads.}
\usage{
check_n_threads(n_threads)
}
\arguments{
\item{n_threads}{the number of computational threads to use.
Use \link{NA} to use the BEAST2 default of 1.}
}
\description{
Will \link{stop} if not.
}
\examples{
# Can have 1 or more threads
check_n_threads(1)
check_n_threads(2)
# Can have NA threads
check_n_threads(NA)
}
\author{
Richèl J.C. Bilderbeek
}
