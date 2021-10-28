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

colnames(LCA_Disclosure_Data_FY2020) <- columnsNames
colnames(LCA_Disclosure_Data_FY2019) <- columnsNames
colnames(LCA_Disclosure_Data_FY2018) <- columnsNames
colnames(LCA_Disclosure_Data_FY2017) <- columnsNames
colnames(LCA_Disclosure_Data_FY2016) <- columnsNames

# LCA dataframe from 2016 to 2020
LCA_total <- rbind(LCA_Disclosure_Data_FY2020,
                       LCA_Disclosure_Data_FY2019)
LCA_total <- rbind(LCA_total, LCA_Disclosure_Data_FY2018)
LCA_total <- rbind(LCA_total, LCA_Disclosure_Data_FY2017)
LCA_total <- rbind(LCA_total, LCA_Disclosure_Data_FY2016)

# Check the prevailing wage unit
LCA_total %>% 
  group_by(prevailing_unit) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100)

# check the wage rate unit
LCA_total %>% 
  group_by(wage_rate_unit) %>% 
  summarise(count = n(), percentage = count/nrow(LCA_total) * 100)

# the main unit is year, so convert all wage to same unit
# convert prevailing wage
LCA_total <- LCA_total %>% 
  mutate(prevailing_wage_year = 
           case_when(prevailing_unit == "Bi-Weekly" ~ as.numeric(prevailing_wage) * 26,
                     prevailing_unit == "Hour" ~ as.numeric(prevailing_wage) * 2080,
                     prevailing_unit == "Month" ~ as.numeric(prevailing_wage) * 12,
                     prevailing_unit == "Week" ~ as.numeric(prevailing_wage) * 52,
                     TRUE ~ as.numeric(prevailing_wage)))

# convert wage rate from
LCA_total <- LCA_total %>% 
  mutate(wage_rate_from_year = 
           case_when(prevailing_unit == "Bi-Weekly" ~ as.numeric(wage_rate_from) * 26,
                     prevailing_unit == "Hour" ~ as.numeric(wage_rate_from) * 2080,
                     prevailing_unit == "Month" ~ as.numeric(wage_rate_from) * 12,
                     prevailing_unit == "Week" ~ as.numeric(wage_rate_from) * 52,
                     TRUE ~ as.numeric(wage_rate_from)))

# convert wage rate to
LCA_total <- LCA_total %>% 
  mutate(wage_rate_to_year = 
           case_when(prevailing_unit == "Bi-Weekly" ~ as.numeric(wage_rate_to) * 26,
                     prevailing_unit == "Hour" ~ as.numeric(wage_rate_to) * 2080,
                     prevailing_unit == "Month" ~ as.numeric(wage_rate_to) * 12,
                     prevailing_unit == "Week" ~ as.numeric(wage_rate_to) * 52,
                     TRUE ~ as.numeric(wage_rate_to)))

# transform date to year, month, day
LCA_total <- LCA_total %>%  
  mutate(Date = as.Date(submit_date)) %>% 
  mutate(year = year(Date),
         month = month(Date),
         week = week(Date))
  