
# We want here() from plyr, not lubridate

#' @export
here <- plyr::here;



# We need cross product in addition to the other joins of dplyr
cross_join <- function(a, b){

  full_join(
    mutate(a, f_o_o = 1),
    mutate(b, f_o_o = 1),
    by = 'f_o_o'
  ) %>%

    select(-f_o_o)
}

cartesian_product <- function(a,  b){
  as_data_frame(expand.grid(a, b, stringsAsFactors = FALSE));
}
