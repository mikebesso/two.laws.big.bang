
#' @export
str_Upper <- function(.str){
  toupper(.str);
}

#' @export
str_Lower <- function(.str){
  tolower(.str);
}


#' @export
str_Trim <- function(.string){
  str_trim(.string, side = "both");
}


#' @export
str_TrimLeft <- function(.string){
  str_trim(.string, side = "left");
}



#' @export
str_TrimRight <- function(.string){
  str_trim(.string, side = "right");
}


#' @export
str_CleanDates <- function(.string, .output_format = "%Y-%m-%d", .input_format = c('Ymd', 'mdY')){
  retval <-
    ifelse(
      !is.null(.string),
      ifelse(
        !is.na(.string),
        format(
          parse_date_time(.string, orders = .input_format),
          .output_format
        ),
        ""
      ),
      ""
    );

  return(paste(retval));
}



#' @export
str_AddSpaceBetweenCollapsedWords <- function(.string){

  retval <- gsub("([[:lower:]])([[:upper:]])", "\\1 \\2", .string);
  retval <- gsub("([[:lower:]])([[:digit:]])", "\\1 \\2", retval);

  return(retval);


}




#' @export
str_ExtractDate <- function(strings, date_pattern = "[[:digit:]]{4}.[[:digit:]]{2}.[[:digit:]]{2}", date_format = "%Y_%m_%d"){
  date_strings <- str_extract(strings, date_pattern);
  dates <- as.Date(date_strings);

}


#' @export
str_MidString <- function(.string, .start, .nchars){
  substring(.string, start = .start, last = .nchars);
}


#' @export
str_SubString <- function(.string, .start, .stop){
  substr(.string, start = .start, stop = .stop);
}




#' @export
str_Now <- function(.format = "%Y-%m-%d %H:%M:%S"){
  format(Sys.time(), .format)
}



#' @export
str_StartsWith <- function(string, match, ignoreCase = FALSE, trim = FALSE){
  if (trim){
    string <- str_Trim(string);
    match <- str_Trim(match);
  }

  if (ignoreCase) {
    string <- toupper(string)
    match <- toupper(match)
  }
  substr(string, start = 1, stop = nchar(match)) == match
}



#' @export
str_EndsWith <- function(string, match, ignoreCase = FALSE, trim = FALSE){

  if (trim){
    string <- str_Trim(string);
    match <- str_Trim(match);
  }

  if (.ignore_case) {
    string <- toupper(string)
    match <- toupper(match)
  }
  substr(string, start = nchar(string) - nchar(match) + 1, stop = nchar(string)) == match

}




#' @export
str_Replace <- function(.str, .pattern, .replacement, .all = TRUE, .fixed = FALSE){

  retval <- .str;

  pattern <- ifelse(.fixed, fixed(.pattern), .pattern);

  if(.all){
    retval <- str_replace_all(.str, pattern, .replacement);
  } else {
    retval <- str_replace(.str, pattern, .replacement);
  }

  return(retval);
}


str_IsDoubleQuoted <- function(text){
  str_BeginsWith('"') | str_EndsWith('"')
}

str_IsSingleQuoted <- function(text){
  str_BeginsWith("'") | str_EndsWith("'")
}

#' @export
str_DoubleQuote <- function(text){
  paste0('"', text, '"')
}

#' @export
str_SingleQuote <- function(text){
  paste0("'", text, "'")
}