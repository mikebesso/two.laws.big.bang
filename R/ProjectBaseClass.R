#' @include FindFolder.R

#' @export
ProjectBaseClass <- R6::R6Class(
  "ProjectBaseClass",
  inherit = BaseClass,

  public = list(

    Folders = list(),
    ConfigName = NA_character_,
    Config = NULL,

    HasConfig = function(){
      return(!is.null(self$Config))
    },

    GetConfig = function(config){

      self$Config <- tryCatch(
        {
          config::get(
            config = self$ConfigName
          )
        },
        error = function(e){
          NULL
        }
      )


      return(self$Config)
    },

    initialize = function(
      configName = Sys.getenv("R_CONFIG_ACTIVE", "default"),
      verbose = FALSE,
      unitTesting = TRUE
    ){
      super$initialize(verbose = verbose)

      self$Folders$Project <- FindProjectRootFolder()

      self$Folders$Tests <- file.path(FindProjectTestsFolder())
      self$Folders$TestThat <- file.path(FindProjectTestThatFolder())
      self$Folders$TestThatTemp <-  file.path(self$Folders$TestThat, "temp")

      self$ConfigName <- configName

      self$GetConfig()


      if (unitTesting){
        dir.create(self$Folders$TestThatTemp, showWarning = FALSE, recursive = TRUE)
      }

    }
  )
)