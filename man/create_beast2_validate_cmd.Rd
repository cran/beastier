% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_beast2_validate_cmd.R
\name{create_beast2_validate_cmd}
\alias{create_beast2_validate_cmd}
\title{Creates the terminal command to validate a BEAST2 input file}
\usage{
create_beast2_validate_cmd(
  input_filename,
  beast2_path = get_default_beast2_path()
)
}
\arguments{
\item{input_filename}{the name of a BEAST2 input XML file.
This file usually has an \code{.xml} extension.
Use \link{create_temp_input_filename} to create a temporary
filename with that extension.}

\item{beast2_path}{name of either a BEAST2 binary file
(usually simply \code{beast})
or a BEAST2 jar file
(usually has a \code{.jar} extension).
Use \link{get_default_beast2_bin_path} to get
the default BEAST binary file's path
Use \link{get_default_beast2_jar_path} to get
the default BEAST jar file's path}
}
\value{
a character vector, of which the first element
  is the command (\code{java}, in this case),
  and the others are arguments (\code{-jar}, in this case, followed
  by more arguments.
}
\description{
Creates the terminal command to validate a BEAST2 input file
}
\examples{
check_empty_beaustier_folders()

if (is_beast2_installed() && beautier::is_on_ci()) {
  create_beast2_validate_cmd(
    input_filename = "input.xml"
  )
}

check_empty_beaustier_folders()
}
\author{
Richèl J.C. Bilderbeek
}
