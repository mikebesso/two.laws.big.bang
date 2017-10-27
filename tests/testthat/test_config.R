library(testthat)

setwd(rprojroot::find_testthat_root_file())

context("HasConfig")


test_that(
  "Does Not Have Config",
  {
    ConfigPath <- file.path(rprojroot::find_testthat_root_file(), "config.yml")

    if (file.exists(ConfigPath)) {
      file.remove(ConfigPath)
    }


    Project <- ProjectBaseClass$new(unitTesting = TRUE, verbose = TRUE)

    expect_false(Project$HasConfig())


  }
)



test_that(
  "Has Config",
  {

    ConfigPath <- file.path(rprojroot::find_testthat_root_file(), "config.yml")
    ConfigBackupPath <- paste0(ConfigPath, ".bak")

    if (file.exists(ConfigPath)) {
      file.remove(ConfigPath)
    }

    file.copy(
      from = ConfigBackupPath,
      to = ConfigPath
    )

    Project <- ProjectBaseClass$new(unitTesting = TRUE, verbose = TRUE)

    expect_true(Project$HasConfig())

    file.remove(ConfigPath)

  }
)


