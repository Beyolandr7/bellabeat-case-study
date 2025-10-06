# Bellabeat Case Study: Data-Driven Marketing Strategy
This repository contains a complete data analysis case study for Bellabeat, a high-tech manufacturer of health-focused products. This project follows the six steps of the data analysis process—Ask, Prepare, Process, Analyze, Share, and Act—to deliver data-driven recommendations for Bellabeat's marketing strategy. This case study is part of the Google Data Analytics Professional Certificate.

## 1. Project Overview: The Business Task
Scenario: You are a junior data analyst on the marketing team at Bellabeat. The cofounder and Chief Creative Officer, Urška Sršen, believes that analyzing smart device fitness data could unlock new growth opportunities for the company.

Business Task: Analyze smart device usage data to gain insight into how consumers use their smart devices and deliver high-level recommendations for Bellabeat's marketing strategy.

Guiding Questions:
* What are some trends in smart device usage?
* How could these trends apply to Bellabeat customers?
* How could these trends help influence Bellabeat marketing strategy?

## 2. Data Source
The analysis was performed on the FitBit Fitness Tracker Data set, a public dataset available on Kaggle. This dataset contains personal fitness data from 30 anonymous Fitbit users, including daily steps, activity levels, sleep, and heart rate.

Data Limitations:
* Small Sample Size: Data from only 30 users is not representative of the entire smart device market.
* Outdated Data: The data was collected in 2016 and may not reflect current user habits.
* Lack of Demographics: The data is anonymous and lacks key demographic information.

## 3. Tools Used
* R & RStudio: For all data cleaning, transformation, analysis, and visualization.
* R Packages:
- tidyverse: A collection of R packages for data science, including ggplot2 (for visualizations) and dplyr (for data manipulation).
- janitor: For initial data cleaning and standardizing column names.
- rmarkdown: For creating the final, shareable report.

## 4. The Analysis Process
The analysis followed the six steps of the data analysis framework:
* Ask: Defined the business objective and key questions.
* Prepare: Sourced the data and identified its limitations.
* Process: Cleaned and transformed the data in R to ensure it was accurate and ready for analysis. This included formatting dates, removing duplicates, and creating new variables for analysis.
* Analyze: Performed exploratory data analysis to identify trends and relationships. This involved calculating summary statistics and investigating correlations between different user metrics.
* Share: Created visualizations in ggplot2 to tell a clear and compelling story. All findings were compiled into a final report using R Markdown.
* Act: Translated the findings into actionable, high-level recommendations for the business.

## 5. Key Findings
The analysis uncovered three key insights into user behavior:

* Activity Drives Results: There is a strong positive correlation between the number of steps a user takes and the number of calories they burn, reinforcing the core value of fitness tracking.
* The "Weekend Slump": User activity levels consistently decrease over the weekend, particularly on Sundays.
* The "Workout Warrior" Profile: Many users exhibit a pattern of high-intensity activity for short periods, coupled with long periods of sedentary time.

## 6. Recommendations for Bellabeat
Based on the findings, the following recommendations were made to guide Bellabeat's marketing strategy:

* Focus Marketing on Clear Outcomes: Shift marketing messages to emphasize the tangible results of activity (e.g., "See how a 15-minute walk impacts your daily calorie goals"), reinforcing the value of Bellabeat products.
* Launch a Weekend Engagement Campaign: Create targeted weekend challenges, badges, and motivational push notifications to turn periods of low user activity into positive brand interactions.
* Promote a Holistic Wellness Narrative: Develop content and app features that encourage light, consistent movement throughout the day to support the "workout warrior" profile and position Bellabeat as a comprehensive wellness partner.

## 7. How to Reproduce This Analysis
#### Clone this Repository:

1. git clone [https://github.com/beyolandr7/bellabeat-case-study.git](https://github.com/beyolandr7/bellabeat-case-study.git)

#### Download the Data:

1. Download the dataset from the Kaggle link.

2. Unzip the file and place the contents in a folder named fitbit in the root of the project directory.

#### Run the R Scripts:

1. Open the project in RStudio.

2. Run the process_data.R script to clean the data.

3. Run the analyze_data.R script to perform the analysis.

4. Generate the Report:

5. Open the bellabeat_report.Rmd file.

6. Click the "Knit" button in RStudio to generate the final HTML report with all visualizations and findings.
