
#' @export
FindProjectRootFolder <- function(path = getwd()){

  Find <- function(path, maxDepth, pathStart){
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
      return(Find(path = Parent, maxDepth = maxDepth - 1, pathStart = pathStart))
    }

  }

  Folder <- Find(path = path, maxDepth = 50, pathStart = path)
  return(Folder)
}


