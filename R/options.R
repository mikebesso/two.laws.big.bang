# Creating an internal (to this package) options manager function
OptionsManager <- settings::options_manager(
  verbose = FALSE,
  .allowed = list(
    verbose = is.logical
  )
)


#' Set or get options for my package
#'
#' @param ... Option names to retrieve option values or \code{[key]=[value]} pairs to set options.
#'
#' @section Supported options:
#' The following options are supported
#' \itemize{
#'  \item{\code{verbose}}{(\code{logical};FALSE) Whether or not to include verbose output useful for debugging }
#' }
#'
#' @export
TwoLawsOptions <- function(...){
  # protect against the use of reserved words.
  settings::stop_if_reserved(...)
  OptionsManager(...)
}


