
#' @export
ProjectBaseClass <- R6Class(
  "ProjectBaseClass",
  inherit = BaseClass,

  public = list(

    Folders = list(),


    initialize = function(verbose = FALSE, unitTesting = TRUE){
      super$initialize(verbose = verbose)

      self$Folders$Project = rprojroot::find_rstudio_root_file()
      self$Folders$TestThat = rprojroot::find_testthat_root_file()

      self$Folders$TestThatTemp = file.path(self$Folders$TestThat, "temp")

      if (unitTesting){
        dir.create(self$Folders$TestThatTemp, showWarning = FALSE, recursive = TRUE)
      }

    }
  )
)