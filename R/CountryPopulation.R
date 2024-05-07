#' Graphs the population of a given country from 1950 to 2020
#'
#' This function combines all of the year columns in the WorldPopulation dataset
#' for a given country and graphs the population for that country from 1950 to 2020.
#'
#' @param country A country in the WorldPopulation dataset
#' @return The population graph of a country from 1950 to 2020
#' @examples
#' CountryPopulation("United States of America")
#' CountryPopulation("China")
#' @export
#'
CountryPopulation <- function(country){
if(all(WorldPopulation$Country!=country)){
  stop("Input should be the exact spelling of a country listed in the WorldPopulation dataset.")
}
else{
  FuncPop <- WorldPopulation %>%
    filter(Country == country) %>%
    pivot_longer(2:72,names_to = "Year",values_to = "Population")

  FuncPop <- transform(FuncPop, Population = as.numeric(Population))

  ggplot(FuncPop) + geom_point(aes(x=Year,y=Population)) + scale_x_discrete(breaks=seq(1950,2020,by=20)) + facet_grid(cols = vars(Country)) + theme_bw() + theme(axis.text.x = element_text(angle = 70, hjust = 1)) +
    labs(title = paste("Population of", country, "from 1950 to 2020")) + theme(plot.title = element_text(size=8))
}
}

usethis::use_testthat()
usethis::use_test("CountryPopulation")
