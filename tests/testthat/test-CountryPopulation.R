testthat::test_that("Input should be the exact spelling of a country listed in the WorldPopulation dataset.",{
  testthat::expect_error(
    CountryPopulation("US"))

})
