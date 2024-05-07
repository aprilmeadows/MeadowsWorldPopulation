#' Populations of different countries from 1950 to 2020
#'
#' @format a data frame with 235 observations
#' \describe{
#' \item{Country}{The country where population data was taken.}
#' \item{XXXX}{Population of the country in the year XXXX.}}
#'
#'
library(tidyverse)
library(readxl)
library(cowplot)

# import World_Population data with specified sheet and range
# includes only country and population info from main data frame
WorldPopulation <- read_excel("data-raw/World_Population.xlsx",sheet="ESTIMATES", range="C17:BZ306") %>%
  filter(Type == "Country/Area") %>%
  mutate("Country" = `Region, subregion, country or area *`) %>% select(-c("Region, subregion, country or area *","Notes","Country code", "Type", "Parent code"))

# reorders sub data frame to have country first
WorldPopulation <- WorldPopulation[,c(72,1:71)]


usethis::use_data(WorldPopulation)
