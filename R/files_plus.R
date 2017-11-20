
#' @export
RemoveFileExtension <- function(path) {
  tools::file_path_sans_ext(path)
}

#' @export
ExtractFilename <- function(path) {
  tools::file_path_sans_ext(basename(path))
}


