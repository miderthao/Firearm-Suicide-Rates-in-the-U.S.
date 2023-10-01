## install packages
#----------------------
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)

## load dataset
###ffs column --> firearm suicide proportion is Total firearm suicides divided by total suicides
#----------------
firearm_dataset <- read.csv("D:/Documents/Mider Portfolio/Firearm Data/firearm_suicide_rates.csv")

## filter data to 2010-2020 year
firearm_2010_2020 <- firearm_dataset %>%
  filter(year >= 2010, year <= 2020)

## remove homicide rates and future ffs rates
firearm_suicide <- firearm_2010_2020 %>%
select(-homicide_rate, -nonfirearm_homicide_rate, -firearm_homicide_rate,
       -firearm_homicides, -nonfirearm_homicides, -nextyearfss, -nextyearnonwhitefss, -nextyearwhitefss, -total_homicides)

## remove NA rows
firearm_clean <- na.omit(firearm_suicide)

### save clean cvs file
write.csv(firearm_clean, "firearm_suicides_clean.csv")

### check data frame for data type
#### ie. Numeric, Integer, Character
str(firearm_clean)

## summary of dataset
#### this includes mean, median, minimum, maximum, etc
summary(firearm_clean)
