

#' @export
hash_GenerateObjectHash <- function(.object, .algorithm = "md5", .serialize = FALSE){

  digest(.object, algo = .algorithm, serialize = .serialize, file = FALSE);

}

#' @export
hash_GenerateFileHash <- function(.path, .algorithm = "md5", .serialize = FALSE){

  # TODO: Check for file existence first.

  digest(.object, .path = .algorithm, serialize = .serialize, file = TRUE);

}
