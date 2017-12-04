# row to dataframe
#' @export
rdply <- function(.data, .fun){
  adply(
    .data = .data,
    .margins = 1,
    .fun = .fun
  )
}

#' @export
l_ply <- plyr::l_ply

#' @export
llply <- plyr::llply

#' @export
ldply <- plyr::ldply


#' @export
a_ply <- plyr::a_ply


# row to _
#' @export
r_ply <- function(.data, .fun, ...){
  plyr::a_ply(
    .data = .data,
    .margins = 1,
    .fun = .fun,
    ...
  )
}

# column to dataframe
#' @export
cdply <- function(.data, .fun){
  plyr::adply(
    .data = .data,
    .margins = 2,
    .fun = .fun
  )
}


# column to _
#' @export
cdply <- function(.data, .fun){
  plyr::a_ply(
    .data = .data,
    .margins = 2,
    .fun = .fun
  )
}
