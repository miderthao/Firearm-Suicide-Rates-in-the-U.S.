## install packages
install.packages("tidyverse")
library(tidyverse)
install.packages("lubridate")
library(lubridate)
install.packages("dplyr")
library(dplyr)


## import dataset
nics_firearm <- read.csv("D:/Documents/Mider Portfolio/Firearm Data/nics-firearm-background-checks.csv")

## change month (YYYY-MM) to year (YYYY)
nics_firearm_v2 <- nics_firearm %>% mutate(month = year(ym(month)))

## keep year 2010 - 2020, remove other year rows
#========= rename month column to year
nics_firearm_v2 <- nics_firearm_v2 %>%
  filter(month >= 2010, month <= 2020)

colnames(nics_firearm_v2)[colnames(nics_firearm_v2) == "month"] <- "year"


## remove unnecessary columns
nics_firearm_filter <- nics_firearm_v2 %>%
  select(year,state,handgun,long_gun,other,multiple)

## multiply multiple column by 2
###===== handgun, long gun, other = 1 sale; multiple = 2 sales
##========== add new column named "total"
nics_firearm_v3 <- nics_firearm_filter %>% mutate(multiple * 2)

nics_firearm_v4 <- nics_firearm_v3 %>%
  mutate(Total_sales = handgun + long_gun + other + `multiple * 2`)

### filter out "multiple" column
nics_firearm_filter_v2 <- nics_firearm_v4 %>%
  select(-multiple)

## remove NA values
nics_firearm_clean <- nics_firearm_filter_v2 %>%
  na.omit(nics_firearm_filter_v2)

## check clean data set
#### and save clean data set
str(nics_firearm_clean)
summary(nics_firearm_clean)

write.csv(nics_firearm_clean, "nics_firearms_clean.csv")
