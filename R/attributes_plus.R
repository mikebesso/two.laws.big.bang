
#' @export
TransferAttributes <- function(source, destination){
  SourceAttributes <- attributes(source)
  for(attribute in names(SourceAttributes)){
    if(!(attribute %in% names(attributes(destination)))){
      attr(destination, attribute) <- SourceAttributes[[attribute]]
    }
  }
  return(destination)
}