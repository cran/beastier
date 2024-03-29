#' Creates the terminal command to run BEAST2 from a \code{beast2_options}
#'
#' If the BEAST2 input \code{.xml} filename
#' or the BEAST2 state \code{.state.xml} filename
#' contain spaces, these filenames are quoted,
#' so that the command-line interface to BEAST2 correctly parses its arguments
#' @inheritParams default_params_doc
#' @return a character vector with the command and
#'   arguments to call BEAST2
#' @examples
#'   if (is_beast2_installed()) {
#'     create_beast2_continue_cmd_from_options(
#'       beast2_options = create_beast2_options()
#'     )
#'   }
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_continue_cmd_from_options <- function(beast2_options) { # nolint indeed a long function name
  check_beast2_options(beast2_options)
  check_true(file.exists(beast2_options$beast2_path))
  check_true(file.exists(get_default_java_path()))
  cmds <- NULL
  if (is_jar_path(beast2_options$beast2_path)) {
    cmds <- c(
      get_default_java_path(),
      "-cp",
      add_quotes_if_has_spaces(beast2_options$beast2_path),
      get_beast2_main_class_name()
    )
    check_true(file.exists(cmds[1]))
    # Cannot do: check_true(file.exists(cmds[3]))
    # because that path is quotes
    # and file.exists does not know what to do with that
  } else {
    check_true(is_bin_path(beast2_options$beast2_path))
    check_true(file.exists(beast2_options$beast2_path))
    cmds <- add_quotes_if_has_spaces(beast2_options$beast2_path)
  }
  if (!beautier::is_one_na(beast2_options$rng_seed)) {
    cmds <- c(cmds, "-seed")
    cmds <- c(cmds, beast2_options$rng_seed)
  }
  if (!beautier::is_one_na(beast2_options$n_threads)) {
    cmds <- c(cmds, "-threads")
    cmds <- c(cmds, beast2_options$n_threads)
  }
  if (beast2_options$use_beagle == TRUE) {
    cmds <- c(cmds, "-beagle")
  }
  cmds <- c(cmds, "-statefile")
  cmds <- c(
    cmds,
    add_quotes_if_has_spaces(beast2_options$output_state_filename)
  )
  cmds <- c(cmds, "-resume")
  if (beast2_options$overwrite == TRUE) {
    cmds <- c(cmds, "-overwrite")
  }
  cmds <- c(
    cmds,
    add_quotes_if_has_spaces(beast2_options$input_filename)
  )
  cmds
}
