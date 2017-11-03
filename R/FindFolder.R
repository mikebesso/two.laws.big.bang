
#' @export
FindProjectRootFolder <- function(path = getwd(), maxDepth = 20, pathStart = path){

  Folder <- path
  Parent <- dirname(path)

  if (Folder == Parent){
    stop("Project Root Not Found For: ", pathStart)
  } else if (maxDepth == 0){
    stop("Max Depth Exceeded Searching For Project Root For : ", pathStart)
  }


  Path <- file.path(Folder, paste0(basename(path), ".Rproj"))

  if (file.exists(Path)){
    return(Folder)
  } else {
    return(FindProjectRootFolder(path = Parent, maxDepth = maxDepth - 1, pathStart = pathStart))
  }


}