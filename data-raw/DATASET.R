## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)
library(janitor)

lextale <- read.csv(here('data-raw', 'lextale-sampleData.csv')) # Read in csv file
ids <- gl(10, 60) #generate new variable 'ids'
answer <- sample(c(0,1), replace = TRUE, 600) #generate new variable of binary random answers
is.numeric(answer)
lextale <- lextale %>% #combine the generated 2 variables into the lextale data
  dplyr::mutate(answer = answer) %>%
  dplyr::mutate(ids = ids)
usethis::use_data(lextale, overwrite = TRUE)
