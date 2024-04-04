#### Preamble ####
# Purpose: Downloads and saves the data from NFL
# Author: Dongli Sun 
# Date: 3 April 2024 
# Contact: SDL0512@outlook.com
# License: MIT
# Pre-requisites: 
# Any other information needed? 


#### Workspace setup ####
library(nflverse)
library(tidyverse)


#### Download data ###
player_stats <- load_player_stats(seasons = TRUE)
qb_regular_season_stats <- player_stats |> 
  filter(season_type == "REG" & position == "QB" & season == 2023 & !is.na(passing_epa)) |> 
  slice(1:646) 
summary(qb_regular_season_stats)

write_csv(qb_regular_season_stats, "data/analysis_data.csv")

