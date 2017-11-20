library(two.laws.big.bang)



SetTestContext("HasConfig")


CreateTestCase(
  "Does Not Have Config",
  {
    TestThatFolder <- FindProjectTestThatFolder()
    setwd(TestThatFolder)
    on.exit(setwd(FindProjectTestsFolder()))

    ConfigPath <- file.path(TestThatFolder, "config.yml")

    if (file.exists(ConfigPath)) {
      file.remove(ConfigPath)
    }

    Project <- ProjectBaseClass$new(unitTesting = TRUE, verbose = TRUE)

    expect_false(Project$HasConfig())


  }
)



CreateTestCase(
  "Has Config",
  {
    TestThatFolder <- FindProjectTestThatFolder()
    setwd(TestThatFolder)
    on.exit(setwd(FindProjectTestsFolder()))

    ConfigPath <- file.path(TestThatFolder, "config.yml")
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


setwd(FindPackageCodeFolder())