# row to dataframe
#' @export
rdply <- function(.data, .fun){
  adply(
    .data = .data,
    .margins = 1,
    .fun = .fun
  )
}

# row to _
#' @export
r_ply <- function(.data, .fun, ...){
  a_ply(
    .data = .data,
    .margins = 1,
    .fun = .fun,
    ...
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


# column to _
#' @export
cdply <- function(.data, .fun){
  a_ply(
    .data = .data,
    .margins = 2,
    .fun = .fun
  )
}
