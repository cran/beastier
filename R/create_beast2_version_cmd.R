#' Creates the terminal command to version a BEAST2 input file
#' @inheritParams default_params_doc
#' @return a character vector, of which the first element
#'   is the command (\code{java}, in this case),
#'   and the others are arguments (\code{-jar}, in this case, followed
#'   by more arguments.
#' @examples
#' if (is_beast2_installed()) {
#'   create_beast2_version_cmd()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_version_cmd <- function(
  beast2_path = get_default_beast2_path()
) {
  if (is_jar_path(beast2_path)) {
    create_beast2_version_cmd_jar(
      beast2_jar_path = beast2_path
    )
  } else {
    check_true(is_bin_path(beast2_path))
    create_beast2_version_cmd_bin(
      beast2_bin_path = beast2_path
    )
  }
}

#' Creates the terminal command to version a BEAST2 input file
#' using a call to the \code{launcher.jar} file
#' @inheritParams default_params_doc
#' @return a character vector, of which the first element
#'   is the command (\code{java}, in this case),
#'   and the others are arguments (\code{-jar}, in this case, followed
#'   by more arguments.
#' @examples
#' if (is_beast2_installed()) {
#'   create_beast2_version_cmd_jar()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_version_cmd_jar <- function(
  beast2_jar_path = get_default_beast2_jar_path()
) {
  beautier::check_file_exists(beast2_jar_path, "beast2_jar_path")
  check_true(is_jar_path(beast2_jar_path))
  cmds <- c(
    get_default_java_path(),
    "-cp",
    paste0("\"", beast2_jar_path, "\""),
    get_beast2_main_class_name(),
    "-version"
  )
  beautier::check_file_exists(cmds[1], "cmds[1]")
  cmds
}

#' Creates the terminal command to version a BEAST2 input file
#' using a call to the \code{launcher.jar} file
#' @inheritParams default_params_doc
#' @return a character vector, of which the first element
#'   is the command (\code{java}, in this case),
#'   and the others are arguments (\code{-jar}, in this case, followed
#'   by more arguments.
#' @examples
#'   if (is_beast2_installed() && beautier::is_on_ci()) {
#'     create_beast2_version_cmd_bin()
#'   }
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_version_cmd_bin <- function(
  beast2_bin_path = get_default_beast2_bin_path()
) {
  beautier::check_file_exists(beast2_bin_path, "beast2_bin_path")
  check_true(is_bin_path(beast2_bin_path))
  cmds <- c(
    beast2_bin_path,
    "-version"
  )
  beautier::check_file_exists(cmds[1], "cmds[1]")
  cmds
}
