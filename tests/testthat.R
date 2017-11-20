library(testthat)
library(two.laws.big.bang)

setwd(FindProjectTestsFolder())

Report <- testthat::test_check("two.laws.big.bang")



