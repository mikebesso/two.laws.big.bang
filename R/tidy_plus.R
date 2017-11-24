
TransferAttributes <- function(source, destination){
  SourceAttributes <- attributes(source)
  for(attribute in names(SourceAttributes)){
    if(!(attribute %in% names(attributes(destination)))){
      attr(destination, attribute) <- SourceAttributes[[attribute]]
    }
  }
  return(destination)
}

# We want here() from plyr, not lubridate

#' @export
here <- plyr::here;

#' @export
data_frame <- dplyr::data_frame

#' @export
as_data_frame <- dplyr::as_data_frame

#' @export
df_arrange <- dplyr::arrange

#' @export
df_select <- dplyr::select

#' @export
df_one_of <- dplyr::one_of

#' @export
df_starts_with <- dplyr::starts_with

#' @export
df_mutate <- function(.data, ...){
  df <- dplyr::mutate(.data, ...)
  df <- TransferAttributes(.data, df)
  return(df)
}

#' @export
df_full_join <- dplyr::full_join

#' @export
df_inner_join <- dplyr::inner_join;

#' @export
df_left_join <- dplyr::left_join;

#' @export
df_semi_join <- dplyr::semi_join;

#' @export
df_anti_join <- dplyr::anti_join;

#' @export
df_group_by <- dplyr::group_by;

#' @export
df_group_by_all <- dplyr::group_by_all;

#' @export
df_group_by_if <- dplyr::group_by_if;

#' @export
df_group_by_at <- dplyr::group_by_at;

#' @export
df_bind_rows <- dplyr::bind_rows;

#' @export
df_bind_cols <- dplyr::bind_cols;

#' @export
df_filter <- dplyr::filter;


#' @export
if_else <- dplyr::if_else

#' @export
case_when <- dplyr::case_when


# We need cross product in addition to the other joins of dplyr
#' @export
df_full_join <- function(a, b){

  full_join(
    df_mutate(a, f_o_o = 1),
    df_mutate(b, f_o_o = 1),
    by = 'f_o_o'
  ) %>%

    select(-f_o_o)
}


#' @export
df_cartesian_product <- function(a,  b){
  as_data_frame(expand.grid(a, b, stringsAsFactors = FALSE));
}



x <- data_frame(a = 1, b = 2)
attr(x, "help") = "help"

y <- df_mutate(x, c = 3, d = a + b)

attributes(y)

