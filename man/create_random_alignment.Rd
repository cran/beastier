% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_random_alignment.R
\name{create_random_alignment}
\alias{create_random_alignment}
\title{Create a random alignment}
\usage{
create_random_alignment(n_taxa, sequence_length, rate = 1, taxa_name_ext = "")
}
\arguments{
\item{n_taxa}{The number of taxa}

\item{sequence_length}{The number of base pairs the alignment will have}

\item{rate}{mutation rate}

\item{taxa_name_ext}{the extension of the taxa names}
}
\value{
an alignment of class \link[ape]{DNAbin}
}
\description{
Create a random alignment
}
\examples{
check_empty_beaustier_folders()

alignment <- create_random_alignment(
  n_taxa = 5,
  sequence_length = 10
)
image(alignment)

remove_beaustier_folders()
check_empty_beaustier_folders()
}
\author{
Richèl J.C. Bilderbeek
}
