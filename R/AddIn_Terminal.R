#' Terminal.
#'
#' Call this function as an addin to insert \code{ \%in\% } at the cursor position.
#'
#' @export
AddIn_Terminal <- function() {
  system(paste0("open -n -a iterm --args '", getwd(), "'"), wait = FALSE)
}