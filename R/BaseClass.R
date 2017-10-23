#' BaseClass
#'
#' A helper class
#' @export
BaseClass <- R6::R6Class(
  "BaseClass",
  public = list(

    Verbose = FALSE,

    Message = function(...){
      if(self$Verbose){
        message(...);
      }
    },

    Quietly = function(){
      self$Verbose <- (self$Verbose == FALSE)
    },

    Verbosely = function(){
      self$Verbose <- (self$Verbose == TRUE)
    },

    IsQuiet = function(){
      return(self$Verbose == FALSE)
    },

    IsVerbose = function(){
      return(self$Verbose)
    },

    initialize = function(verbose = FALSE){
      self$Verbose = verbose
    }


  )
)