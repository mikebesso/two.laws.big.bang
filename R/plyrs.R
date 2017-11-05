# row to dataframe
#' @export
rdply <- function(.data, .fun){
  adply(
    .data = .data,
    .margins = 1,
    .fun = .fun
  )
}

# column to dataframe
#' @export
cdply <- function(.data, .fun){
  adply(
    .data = .data,
    .margins = 2,
    .fun = .fun
  )
}
