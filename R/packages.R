
#' Quietly load one or more packages
#'
#' Wraps install.packages and require/requireNamespace
#'
#' @param libraries a character vector of libraries to load
#'
#' @return None
#'
#' @examples
#' LoadPackages(c("stringr", "stringi"))
#'
#' @export
LoadPackages <- function(libraries, stealth = FALSE){

  LoadPackage <- function(lib, stealth = FALSE){

    # if not installed, go get it
    if (!(lib %in% installed.packages()[, "Package"])){
      Quietly(install.packages(lib, verbose = FALSE, quiet = TRUE))
    }

    # load the package, stealthily if specified
    if (!stealth){
      Quietly(
        require(
          lib,
          character.only = TRUE,
          warn.conflicts = FALSE,
          quietly = TRUE
        )
      )
    } else {
      Quietly(
        requireNamespace(
          lib,
          quietly = TRUE
        )
      )
    }

    # check if loaded
    Result <- lib %in% loadedNamespaces();

    return(Result)

  }

  Results <- lapply(
    libraries,
    LoadPackage,
    stealth = stealth
  );

  Failures <- libraries[Results == FALSE];
  if(length(Failures) > 0){

    Failures <- paste0("Failed to load: \n", paste0("\t", Failures, collapse = "\n"));
    stop(Failures);
  }

}
