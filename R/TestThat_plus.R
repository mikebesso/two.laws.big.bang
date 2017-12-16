
#' @export
CreateTestCase <- testthat::test_that

#' @export
SetTestContext <- testthat::context



#' @export
UseTestThat <- function(){
  if (!devtools::uses_testthat()){
    devtools::use_testthat()
  }
}

#' @export
expect_equal <- testthat::expect_equal