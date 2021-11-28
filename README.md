# INFO-536-final-project
Analyzing H1B LCA applications.

## Research Questions
```
1. What factors impact the approval of LCA applications?
2. What companies have high expectations of international workers?
3. What are the change of data science jobs's demands in the US market?
```

## Data
Data come from LCA program disclose file of [The U.S. DEPARTMENT OF LABOR](https://www.dol.gov/agencies/eta/foreign-labor/performance) from 2016 to 2020.
[Data](Data) folder contains all xlsx files. Because the file names of The U.S. DEPARTMENT OF LABOR are inconsistent, I rename the file to the consistent name. 
The total observations in the data file are over 300 million.
  - [LCA_cleanred.csv](Data/LCA_cleaned.csv) is the cleaned data by data wrangling. If you could not open this file, please rerun [LCA_Data_Wrangling.R](LCA_Data_Wrangling.R) R file 
  to regenerate the LCA_cleaned.csv file.

## Files
In the event that the massive data cannot be processed, we also provide html files to present the results.
- [LCA_Data_Wrangling.R](LCA_Data_Wrangling.R) is used to clean data and generate the cleaned data file
- Data Visualization.Rmd is used to plot visualization 
- Data modeling.Rmd is used to do modeling
- Final_report.Rmd contains all previous analysis and report the final analysis.
