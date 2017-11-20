library(two.laws.big.bang)


SetTestContext("create new")



CreateTestCase(
  "Initialized Set",
  {
    Base <- BaseClass$new()
    testthat::expect_true(Base$Initialized )
  }
)


CreateTestCase(
  "Validate",
  {
    Base <- BaseClass$new()
    testthat::expect_true(Base$Validate())
  }
)
