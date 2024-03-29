#' Internal function
#'
#' Check that a file can be created at a certain path.
#'
#' Will \link{stop} if not. Will \link{stop} if the file already exists.
#' Does so by creating an empty file at the path,
#' and then deleting it.
#' @param filename file that may or may not be created
#' @param overwrite if TRUE, if \code{filename} already exists, it
#' will be deleted by this function
#' @return Nothing.
#' Will \link{stop} if a file cannot be created at a certain path.
#' @examples
#' check_can_create_file("my_local_file.txt")
#' @author Richèl J.C. Bilderbeek
#' @export
check_can_create_file <- function(
  filename,
  overwrite = TRUE
) {
  if (file.exists(filename)) {
    if (overwrite == FALSE) {
      stop(
        "Cannot check if a file can be created ",
        "if the desired file already exists. \n",
        "Filename: ", filename
      )
    } else {
      # Delete the file
      file.remove(filename)
      check_true(
        !file.exists(filename),
        info = paste0(
          "Cannot delete the file already present at location ", filename
        )
      )
    }
  }
  dir.create(dirname(filename), showWarnings = FALSE, recursive = TRUE)
  tryCatch(
    suppressWarnings(
      writeLines(text = "check_can_create_file testing text", con = filename)
    ),
    error = function(e) {} # nolint indeed does nothing
  )
  if (!file.exists(filename)) {
    stop(
      "Cannot create a file at location ", filename
    )
  }
  file.remove(filename)

  # Go up and remove all empty sub-sub-sub-folders
  folder_name <- dirname(filename)
  while (length(list.files(path = folder_name)) == 0) {
    unlink(x = folder_name, recursive = TRUE)
    folder_name <- dirname(folder_name)
  }


  check_true(
    !file.exists(filename),
    info = paste0(
      "Cannot delete the temporary file created at location ", filename
    )
  )
  invisible(filename)
}
