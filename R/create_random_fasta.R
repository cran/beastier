#' Create a random FASTA file
#' @inheritParams default_params_doc
#' @param taxa_name_ext the extension of the taxa names
#' @return Nothing, creates a FASTA file
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_empty_beaustier_folders()
#'
#' fasta_filename <- get_beastier_tempfilename()
#' create_random_fasta(
#'   n_taxa = 5,
#'   sequence_length = 20,
#'   fasta_filename = fasta_filename
#' )
#' file.remove(fasta_filename)
#'
#' remove_beaustier_folders()
#' check_empty_beaustier_folders()
#' @export
create_random_fasta <- function(
  n_taxa,
  sequence_length,
  fasta_filename,
  taxa_name_ext = ""
) {
  if (n_taxa < 2) {
    stop("'n_taxa' must two or more")
  }
  if (sequence_length < 1) {
    stop("'sequence_length' must be one or more")
  }
  check_true(beautier::is_one_string(fasta_filename))

  if (fasta_filename == "") {
    stop("'fasta_filename' must have at least one character")
  }
  check_true(beautier::is_one_string(taxa_name_ext))
  alignments <- create_random_alignment(
    n_taxa,
    sequence_length,
    taxa_name_ext = taxa_name_ext
  )
  dir.create(
    path = dirname(fasta_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  phangorn::write.phyDat(alignments, file = fasta_filename, format = "fasta")
  NULL
}
