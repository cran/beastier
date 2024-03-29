#' Remove the `beautier` and `beastier` temporary folders
#'
#' Remove the `beautier` and `beastier` temporary folders
#' @return Nothing.
#' @examples
#' check_empty_beaustier_folders()
#'
#' remove_beaustier_folders()
#'
#' check_empty_beaustier_folders()
#' @author Richèl J.C. Bilderbeek
#' @export
remove_beaustier_folders <- function() {
  remove_beastier_folder()
  beautier::remove_beautier_folder()
}
