#' @export
list_append <- rlist::list.append


#' @export
list_apply <- rlist::list.apply

#' @export
list_clean <- rlist::list.clean

#' @export
list_remove_nulls <- function(.data, recursive = FALSE){
  rlist::list.clean(.data, fun = is.null, recursive = recursive)
}

#' @export
list_remove_nas <- function(.data, recursive = FALSE){
  rlist::list.clean(.data, fun = is.na, recursive = recursive)
}

#' @export
list_do <- rlist::list.do


#' @export
list_expand <- rlist::list.expand

#' export
lol_AppendListsToListOfLists <- function(listOfLists, ...){

  ListsToAppend <- list(...);

  ListOfLists <- listOfLists;

  for(i in 1:length(ListsToAppend)){
    NameToAppend <- names(ListsToAppend)[i];
    ListToAppend <- ListsToAppend[[i]];
    assert_that(is.list(ListToAppend));
    ListOfLists[[length(ListOfLists) + 1]] <- ListToAppend;
    names(ListOfLists)[length(ListOfLists)] <- NameToAppend;
  }
  ListOfLists;
}