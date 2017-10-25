context("Folders")

Project <- ProjectBaseClass$new(unitTesting = TRUE, verbose = TRUE)

test_that(
  "TestThatFolder",
  {
    TestThatFolder <- Project$Folders$TestThat
    expect_equal(basename(TestThatFolder), 'testthat')
  }
)


test_that(
  "TestThatTempFolder",
  {
    TestThatTempFolder <- Project$Folders$TestThatTemp
    expect_equal(basename(TestThatTempFolder), 'temp')
  }
)