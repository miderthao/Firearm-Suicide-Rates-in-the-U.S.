## install packages
install.packages("tidyverse")
library(tidyverse)
install.packages("lubridate")
library(lubridate)
install.packages("dplyr")
library(dplyr)

## import datasets (2)
firearm_suicide_clean <- read.csv("D:/Documents/Mider Portfolio/Firearm Data/firearm_suicide_clean.csv")

nics_firearms_clean <- read.csv("D:/Documents/Mider Portfolio/Firearm Data/nics_firearms_clean.csv")

## bind datasets together

firearm_suicide_sale_rates <- bind_rows(firearm_suicide_clean, nics_firearms_clean)

## save csv file
write.csv(firearm_suicide_sale_rates, "firearm_suicide_sale_rates.csv")
