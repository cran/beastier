#' Creates the terminal command to run BEAST2 from a \code{beast2_options}
#' @inheritParams default_params_doc
#' @return a character vector with the command and
#'   arguments to call BEAST2
#' @examples
#' check_empty_beaustier_folders()
#'
#' if (is_beast2_installed()) {
#'   create_beast2_run_cmd_from_options(
#'     beast2_options = create_beast2_options()
#'   )
#' }
#'
#' check_empty_beaustier_folders()
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_run_cmd_from_options <- function(beast2_options) { # nolint indeed a long function name
  cmds <- create_beast2_continue_cmd_from_options(beast2_options)
  cmds[cmds != "-resume"]
}
