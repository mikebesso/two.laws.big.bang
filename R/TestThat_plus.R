
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
