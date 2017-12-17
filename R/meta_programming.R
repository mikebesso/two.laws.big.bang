
#' @export
ParseFunctionText <- function(text){

  # Take the text of a function and parse it as an expression.
  ParsedText <-  parse(text = text)

  # Fail if we got more than one expression
  assertive::is_of_length(ParsedText, 1)

  # Return the expression
  return(ParsedText[[1]])

}


#' @export
GetFunctionDefinitionFromAttribute <- function(f, fName = substitute(f)){

  # Try to get the code from the attribute
  Code <- attr(f, "srcref")

  # If we got some code, then format it as a function definition
  if (!is.null(Code)){
    Code <- paste0(fName, " <- ", paste(as.character(Code, useSource = TRUE), collapse = "\n"))
  }

  # Return either the code, or of no code, NULL
  return(Code)
}



#' @export
GetFunctionDefinitionFromInternals <- function(f, fName = substitute(f)){

  # Get the code
  Code <- paste(deparse(functionBody(f)), collapse = "\n")

  # Get the arguments
  FormalArguments <- formals(f)
  FormalArgumentNames <- names(FormalArguments)

  # Translate defaults to text
  #   TODO: This probably requires more work to handle
  #         more interesting defaults
  FormalArgumentDefaults <- lapply(
    FormalArguments,
    function(x){
      default <-
        if(is.symbol(x)) {
          ""
        } else if(is.null(x)) {
          " = NULL"
        } else if(is.na(x)) {
          " = NA"
        } else {
          x
        }
      return(default)
    }
  )

  # Combine arguments with defaults
  Arguments <- paste(
    names(FormalArguments),
    FormalArgumentDefaults,
    collapse = ", ",
    sep = ""
  )

  # Paste the code together
  Code <- paste0(
    fName,
    " <- function(",
    Arguments,
    ") ",
    Code
  )

  # Return the code
  return(Code)
}

#' @export
GetFunctionDefinition <- function(f, fName = substitute(f)){

  # Try and get the code from the source attribute
  Code <- GetFunctionDefinitionFromAttribute(f, fName)

  # If there is no code for source attribute, than get code for internals
  if (is.null(Code)){
    Code <- GetFunctionDefinitionFromInternals(f, fName)
  }

  # Return the code
  return(Code)

}

