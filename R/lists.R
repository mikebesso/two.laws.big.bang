
#' export
lol.AppendListsToListOfLists <- function(listOfLists, ...){

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