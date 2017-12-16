
#' @export
ParseFunctionText <- function(text){
  parse(text = text)[[1]]
}
