
#' Insert \%in\%.
#'
#' Call this function as an addin to insert \code{ \%in\% } at the cursor position.
#'
#' @export
AddIn_InsertIn <- function() {
  rstudioapi::insertText(" %in% ")
}