

#' @export
TryGet <- function(
  symbol,
  default = NULL,
  envir = parent.frame(),
  recursive = FALSE
){
  rlist::tryGet(symbol, def = default, recursive = recursive)
}