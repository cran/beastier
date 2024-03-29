% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/check_beast2_options_do_not_overwrite_existing_files.R
\name{check_beast2_options_do_not_overwrite_existing_files}
\alias{check_beast2_options_do_not_overwrite_existing_files}
\title{Internal function}
\usage{
check_beast2_options_do_not_overwrite_existing_files(beast2_options)
}
\arguments{
\item{beast2_options}{a set of BEAST2 options,
that are the R equivalent of the BEAST2 command-line options,
as can be created by \link{create_beast2_options}}
}
\value{
Nothing. Will \link{stop} if a file is threatened to be overwritten
}
\description{
Check if the \code{beast2_options} will not overwrite
existing files, when the 'overwrite' options is set to \code{FALSE}.
}
\details{
Will \link{stop} if a file is threatened to be overwritten
}
\examples{
check_empty_beaustier_folders()

check_beast2_options_do_not_overwrite_existing_files(
  beast2_options = create_beast2_options()
)

check_empty_beaustier_folders()
}
\author{
Richèl J.C. Bilderbeek
}
