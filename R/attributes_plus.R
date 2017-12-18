
#' @export
TransferAttributes <- function(source, destination){

  # TODO
  #   Consider copying over attributes that exist
  #   Consider copying/merging classes

  # Get that attributes from the source
  SourceAttributes <- attributes(source)

  # Copy the attributes from the destination that do not exist in the source
  for(attribute in names(SourceAttributes)){
    if(!(attribute %in% names(attributes(destination)))){
      attr(destination, attribute) <- SourceAttributes[[attribute]]
    }
  }

  # Return the destination with the copied attributes
  return(destination)
}