#' Get the default BEAST2 download URL,
#' which depends on the operating system
#' @inheritParams default_params_doc
#' @return the URL where BEAST2 can be downloaded from
#' @author Richèl J.C. Bilderbeek
#' @examples
#' get_default_beast2_download_url()
#' @export
get_default_beast2_download_url <- function(# nolint internal functions may be long
  beast2_version = get_default_beast2_version(),
  os = rappdirs::app_dir()$os
) {
  check_os(os)
  url <- get_default_beast2_download_url_win(
    beast2_version = beast2_version
  )
  if (os != "win") {
    url <- get_default_beast2_download_url_linux(
      beast2_version = beast2_version
    )
  }
  url
}

#' Get the BEAST2 download URL for Linux
#' @inheritParams default_params_doc
#' @return the URL where BEAST2 can be downloaded from
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_beast2_download_url_linux <- function(# nolint internal functions may be long
  beast2_version = get_default_beast2_version()
) {
  paste0(
    "https://github.com/CompEvol/beast2/releases/download/v",
    beast2_version,
    "/BEAST.v",
    beast2_version,
    ".Linux.tgz"
  )
}

#' Get the BEAST2 download URL for Windows
#' @inheritParams default_params_doc
#' @return the URL where BEAST2 can be downloaded from
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_beast2_download_url_win <- function(# nolint internal functions may be long
  beast2_version = get_default_beast2_version()
) {
  paste0(
    "https://github.com/CompEvol/beast2/releases/download/v",
    beast2_version,
    "/BEAST.v",
    beast2_version,
    ".Windows.zip"
  )
}
