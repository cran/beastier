#' Create a random phylogeny
#' @inheritParams default_params_doc
#' @param taxa_name_ext the extension of the taxa names
#' @return a phylogeny of class `phylo` (which is part of the `ape` package)
#' @author Richèl J.C. Bilderbeek
#' @examples
#' create_random_phylogeny(n_taxa = 6)
#' @export
create_random_phylogeny <- function(
  n_taxa,
  taxa_name_ext = ""
) {
  phylogeny <- ape::rcoal(n = n_taxa)
  phylogeny$tip.label <- paste0(phylogeny$tip.label, taxa_name_ext) # nolint APE uses a different style guideline
  phylogeny
}
