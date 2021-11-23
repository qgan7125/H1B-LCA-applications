# File: LCA_Data_Wrangling.R
# Purpose: clean LCA applications raw data from 2016 to 2020

# load libraries
library(tidyverse)
library(readxl)
library(lubridate)

# list contents of data folder
list.files(path = "data")

# read data in 
LCA_Disclosure_Data_FY2020_Q1 <- read_excel("Data/LCA_Disclosure_Data_FY2020_Q1.xlsx",
                                            sheet = "LCA_FY2021_Q1")
LCA_Disclosure_Data_FY2020_Q2 <- read_excel("Data/LCA_Disclosure_Data_FY2020_Q2.xlsx",
                                            sheet = "LCA_FY2021_Q2")
LCA_Disclosure_Data_FY2020_Q3 <- read_excel("Data/LCA_Disclosure_Data_FY2020_Q3.xlsx",
                                            sheet = "LCA_FY2021_Q3")
LCA_Disclosure_Data_FY2020_Q4 <- read_excel("Data/LCA_Disclosure_Data_FY2020_Q4.xlsx",
                                            sheet = "LCA_FY2020Q4")
LCA_Disclosure_Data_FY2019 <- read_excel("Data/LCA_Disclosure_Data_FY2019.xlsx",
                                         sheet = "LCA_FY2019")
LCA_Disclosure_Data_FY2018 <- read_excel("Data/LCA_Disclosure_Data_FY2018.xlsx",
                                         sheet = "H-1B_FY2018")
LCA_Disclosure_Data_FY2017 <- read_excel("Data/LCA_Disclosure_Data_FY2017.xlsx",
                                         sheet = "PDD_main")
LCA_Disclosure_Data_FY2016 <- read_excel("Data/LCA_Disclosure_Data_FY2016.xlsx",
                                         sheet = "H-1B_FY2016")


# merge 2020 raw data
LCA_Disclosure_Data_FY2020 <- rbind(LCA_Disclosure_Data_FY2020_Q1,
                                        LCA_Disclosure_Data_FY2020_Q2)
LCA_Disclosure_Data_FY2020 <- rbind(LCA_Disclosure_Data_FY2020,
                                    LCA_Disclosure_Data_FY2020_Q3)
LCA_Disclosure_Data_FY2020 <- rbind(LCA_Disclosure_Data_FY2020,
                                    LCA_Disclosure_Data_FY2020_Q4)

# select needed variables, the columns' names are slightly different.
# FY2020
LCA_Disclosure_Data_FY2020 <- LCA_Disclosure_Data_FY2020 %>% 
  select(CASE_NUMBER,
         CASE_STATUS,
         RECEIVED_DATE,
         EMPLOYER_NAME,
         VISA_CLASS,
         SOC_TITLE,
         JOB_TITLE,
         WAGE_RATE_OF_PAY_FROM,
         WAGE_RATE_OF_PAY_TO,
         WAGE_UNIT_OF_PAY,
         FULL_TIME_POSITION,
         PREVAILING_WAGE,
         PW_UNIT_OF_PAY,
         WORKSITE_CITY,
         WORKSITE_STATE)

# FY2019
LCA_Disclosure_Data_FY2019 <- LCA_Disclosure_Data_FY2019 %>% 
  select(CASE_NUMBER,
         CASE_STATUS,
         CASE_SUBMITTED,
         EMPLOYER_NAME,
         VISA_CLASS,
         SOC_TITLE,
         JOB_TITLE,
         WAGE_RATE_OF_PAY_FROM_1,
         WAGE_RATE_OF_PAY_TO_1,
         WAGE_UNIT_OF_PAY_1,
         FULL_TIME_POSITION,
         PREVAILING_WAGE_1,
         PW_UNIT_OF_PAY_1,
         WORKSITE_CITY_1,
         WORKSITE_STATE_1)

# FY2018
LCA_Disclosure_Data_FY2018 <- LCA_Disclosure_Data_FY2018 %>% 
  select(CASE_NUMBER,
         CASE_STATUS,
         CASE_SUBMITTED,
         EMPLOYER_NAME,
         VISA_CLASS,
         SOC_NAME,
         JOB_TITLE,
         WAGE_RATE_OF_PAY_FROM,
         WAGE_RATE_OF_PAY_TO,
         WAGE_UNIT_OF_PAY,
         FULL_TIME_POSITION,
         PREVAILING_WAGE,
         PW_UNIT_OF_PAY,
         WORKSITE_CITY,
         WORKSITE_STATE)

# FY2017
LCA_Disclosure_Data_FY2017 <- LCA_Disclosure_Data_FY2017 %>% 
  select(CASE_NUMBER,
         CASE_STATUS,
         CASE_SUBMITTED,
         EMPLOYER_NAME,
         VISA_CLASS,
         SOC_NAME,
         JOB_TITLE,
         WAGE_RATE_OF_PAY_FROM,
         WAGE_RATE_OF_PAY_TO,
         WAGE_UNIT_OF_PAY,
         FULL_TIME_POSITION,
         PREVAILING_WAGE,
         PW_UNIT_OF_PAY,
         WORKSITE_CITY,
         WORKSITE_STATE)

# FY2016
LCA_Disclosure_Data_FY2016 <- LCA_Disclosure_Data_FY2016 %>% 
  select(CASE_NUMBER,
         CASE_STATUS,
         CASE_SUBMITTED,
         EMPLOYER_NAME,
         VISA_CLASS,
         SOC_NAME,
         JOB_TITLE,
         WAGE_RATE_OF_PAY_FROM,
         WAGE_RATE_OF_PAY_TO,
         WAGE_UNIT_OF_PAY,
         FULL_TIME_POSITION,
         PREVAILING_WAGE,
         PW_UNIT_OF_PAY,
         WORKSITE_CITY,
         WORKSITE_STATE)

# rename the columns and merge
columnsNames <- c("case_number", "case_status", "submit_date", "employer_name",
                  "visa_class", "soc_name", "job_title", "wage_rate_from",
                  "wage_rate_to", "wage_rate_unit", "full_time_position", 
                  "prevailing_wage", "prevailing_unit", "worksite_city", "worksite_state")

# change column names and add year column
colnames(LCA_Disclosure_Data_FY2020) <- columnsNames
LCA_Disclosure_Data_FY2020$year <- rep(2020, nrow(LCA_Disclosure_Data_FY2020))
colnames(LCA_Disclosure_Data_FY2019) <- columnsNames
LCA_Disclosure_Data_FY2019$year <- rep(2019, nrow(LCA_Disclosure_Data_FY2019))
colnames(LCA_Disclosure_Data_FY2018) <- columnsNames
LCA_Disclosure_Data_FY2018$year <- rep(2018, nrow(LCA_Disclosure_Data_FY2018))
colnames(LCA_Disclosure_Data_FY2017) <- columnsNames
LCA_Disclosure_Data_FY2017$year <- rep(2017, nrow(LCA_Disclosure_Data_FY2017))
colnames(LCA_Disclosure_Data_FY2016) <- columnsNames
LCA_Disclosure_Data_FY2016$year <- rep(2016, nrow(LCA_Disclosure_Data_FY2016))

# LCA dataframe from 2016 to 2020
LCA_total <- rbind(LCA_Disclosure_Data_FY2020, LCA_Disclosure_Data_FY2019)
LCA_total <- rbind(LCA_total, LCA_Disclosure_Data_FY2018)
LCA_total <- rbind(LCA_total, LCA_Disclosure_Data_FY2017)
LCA_total <- rbind(LCA_total, LCA_Disclosure_Data_FY2016)

# convert columns to suitable data types
LCA_total <- LCA_total %>% 
  mutate(wage_rate_from = as.numeric(wage_rate_from))

LCA_total <- LCA_total %>% 
  mutate(wage_rate_to = as.numeric(wage_rate_to))

LCA_total <- LCA_total %>% 
  mutate(prevailing_wage = as.numeric(prevailing_wage))

# Check the prevailing wage unit
LCA_total %>% 
  group_by(prevailing_unit) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100)

# check the wage rate unit
LCA_total %>% 
  group_by(wage_rate_unit) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100)

# the main unit is year, so convert all wage to same unit
# create a function to deal with different units
unit_to_year = function(wage, unit){
  return(case_when(unit == "Bi-Weekly" ~ wage * 26,
                     unit == "Hour" ~ wage * 2080,
                     unit == "Month" ~ wage * 12,
                     unit == "Week" ~ wage * 52,
                     TRUE ~ wage))
}

# convert prevailing wage
LCA_total <- LCA_total %>% 
  mutate(prevailing_wage_year = unit_to_year(prevailing_wage, prevailing_unit))

# fill missing value with NA
LCA_total <- LCA_total %>% 
  mutate(prevailing_wage_year = ifelse(is.na(prevailing_wage_year), 0, prevailing_wage_year))

# check new variable, prevailing_wage_year
LCA_total %>% 
  group_by(prevailing_wage_year) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100) %>% 
  arrange(desc(count))

# convert wage rate from
LCA_total <- LCA_total %>% 
  mutate(wage_rate_from_year = unit_to_year(wage_rate_from, wage_rate_unit))


# check new variable, wage_rate_from_year
LCA_total %>% 
  group_by(wage_rate_from_year) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100)%>% 
  arrange(desc(count))


# convert wage rate to
LCA_total <- LCA_total %>% 
  mutate(wage_rate_to_year = unit_to_year(wage_rate_to, wage_rate_unit))

LCA_total <- LCA_total %>% 
  mutate(wage_rate_to_year = ifelse(is.na(wage_rate_to_year), 0, wage_rate_to_year))

# check new variable, wage_rate_to_year
LCA_total %>% 
  group_by(wage_rate_to_year) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100) %>% 
  arrange(desc(count))

# check case_status
LCA_total %>% count(case_status)

# we only need certified and denied. Certified-withdrawn is also considered as
# certified
status_clean <- function(word){
  word = tolower(word)
  word = gsub("-", " ", word)
  return(strsplit(word, " ")[[1]][1])
}

LCA_total$case_status <- sapply(LCA_total$case_status, status_clean)
LCA_total$case_status <- unname(LCA_total$case_status, force = FALSE)
LCA_total <- LCA_total %>% 
  filter(case_status == "certified" | case_status == "denied")

# transform date to year, month, day
LCA_total <- LCA_total %>%  
  mutate(Date = as.Date(submit_date)) %>% 
  mutate(submited_year = year(Date),
         submited_month = month(Date),
         submited_week = week(Date))

# check the SOC_name
LCA_total %>% group_by(soc_name) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100) %>% 
  arrange(desc(count))

# to lowercase 
LCA_total <- LCA_total %>% 
  mutate(soc_name = tolower(soc_name))

# check employer_name
LCA_total %>% group_by(employer_name) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100) %>% 
  arrange(desc(count))

# to lowercase
LCA_total <- LCA_total %>% 
  mutate(employer_name = tolower(employer_name))

# check job_title
LCA_total %>% count(job_title, sort = T) %>% print(n = Inf)

# to lowercase
LCA_total <- LCA_total %>% 
  mutate(job_title = tolower(job_title))


# check the worksite_city
LCA_total %>%  count(worksite_city, sort = T) %>% print(n = Inf)

# to lowercase
LCA_total <- LCA_total %>% 
  mutate(worksite_city = tolower(worksite_city))

# some cites have state abbr, remove state abbr
remove_abbr = function(word, split = " "){
  return(strsplit(word, split = split)[[1]][1])
}

LCA_total$worksite_city <- sapply(LCA_total$worksite_city, remove_abbr, split=",")
LCA_total$worksite_city <- unname(LCA_total$worksite_city, force = FALSE)


# check worksite_state
LCA_total %>% count(worksite_state, sort = T)

# convert abbs to full name
state_abbs = c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
               "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME",
               "MI", "MN", "MO", "MS",  "MT", "NC", "ND", "NE", "NH", "NJ", "NM",
               "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN",
               "TX", "UT", "VA", "VT", "VI", "WA", "WI", "WV", "WY", "GU", "MP",
               "MH", "PW", "FM")

state_full = c("alaska","alabama","arkansas","arizona","california","colorado",
               "connecticut","district of columbia","delaware","florida","georgia",
               "hawaii","iowa","idaho","illinois","indiana","kansas","kentucky",
               "louisiana","massachusetts","maryland","maine","michigan","minnesota",
               "missouri","mississippi","montana","north carolina","north dakota",
               "nebraska","new hampshire","new jersey","new mexico","nevada",
               "new york","ohio","oklahoma","oregon","pennsylvania","puerto rico",
               "rhode island","south carolina","south dakota","tennessee","texas",
               "utah","virginia","vermont", "virgin islands","washington","wisconsin",
               "west virginia","wyoming", "guam", "northern mariana islands",
               "marshall islands", "palau", "federated states of micronesia")

names(state_full) <- state_abbs

LCA_total <- LCA_total %>% 
  mutate(state = case_when(worksite_state %in% state_abbs ~ state_full[worksite_state],
                           TRUE ~ worksite_state))

LCA_total$state <- unname(LCA_total$state, force = FALSE)
LCA_total$state <- tolower(LCA_total$state)
LCA_total %>% count(state, sort = T) %>%  print(n = 1000)
LCA_total <- LCA_total %>% 
  mutate(worksite_state = state)

# check the full_time_position
LCA_total %>% group_by(full_time_position) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100) %>% 
  arrange(desc(count))

# too many rows miss the full time position value
# we need to fill the missing values
# turn off scientific notation
options(scipen = 999)

ggplot(LCA_total, aes(x = factor(year), y = prevailing_wage_year)) + 
                        geom_boxplot(aes(fill = full_time_position)) + 
                        coord_cartesian(ylim=c(0,150000))


LCA_total %>%
  group_by(full_time_position) %>%
  summarise('75%' = quantile(prevailing_wage_year,probs = 0.75,na.rm=TRUE))

# so wages that are less than 87000, we consider them as past-time job
LCA_total <- LCA_total %>% 
  mutate(full_time_position = ifelse(is.na(full_time_position),
                                     ifelse(prevailing_wage_year > 87000, "Y", "N"),
                                     full_time_position))

# check visa class
LCA_total %>%  count(visa_class)

# only choose H1B
LCA_total <- LCA_total %>% 
  filter(visa_class == "H-1B")

# select cleaned data
LCA_cleaned <- LCA_total %>% 
  select(case_number,
         case_status,
         employer_name,
         visa_class,
         soc_name,
         job_title,
         full_time_position,
         worksite_city,
         worksite_state,
         year,
         wage_rate_from_year,
         wage_rate_to_year,
         prevailing_wage_year,
         submited_year,
         submited_month,
         submited_week)

write.csv(LCA_cleaned, "Data/LCA_cleaned.csv")