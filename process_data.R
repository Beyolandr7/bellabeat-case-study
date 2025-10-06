# Bellabeat Case Study - Process Phase in R
# Author: Darren
# Date: 2025-10-06

# -------------------------------------------------------------------
# 1. SETUP: LOAD LIBRARIES AND DATA
# -------------------------------------------------------------------

# Install packages if you haven't already
# install.packages("tidyverse")
# install.packages("janitor")

# Load the required libraries for data manipulation and cleaning
library(tidyverse)
library(janitor)

# Load the dailyActivity dataset
# Make sure your working directory is set to where the 'fitbit' folder is,
# or provide the full path to the file.
daily_activity <- read_csv("fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")


# -------------------------------------------------------------------
# 2. INITIAL INSPECTION: UNDERSTAND THE RAW DATA
# -------------------------------------------------------------------

# Get a quick overview of the dataset's structure and data types
glimpse(daily_activity)

# View the first few rows to see the data format
head(daily_activity)

# Get a count of unique participants to verify the sample size (should be ~30)
n_distinct(daily_activity$Id)


# -------------------------------------------------------------------
# 3. CLEANING: ADDRESS INCONSISTENCIES AND FORMATTING
# -------------------------------------------------------------------

# --- Step 3.1: Clean Column Names ---
# The original column names are in PascalCase. We will convert them to snake_case
# for consistency and ease of use (e.g., 'TotalSteps' becomes 'total_steps').
daily_activity <- clean_names(daily_activity)

# --- Step 3.2: Check for Duplicates and Missing Values ---
# Check for any fully duplicated rows in the dataset
cat("Number of duplicate rows:", sum(duplicated(daily_activity)), "\n")
# No duplicates found, which is good.

# Check for missing (NA) values in each column
colSums(is.na(daily_activity))
# No missing values found.

# --- Step 3.3: Format the 'activity_date' Column ---
# The date column is currently a character type. It needs to be a Date type
# for proper analysis, especially for time-series trends.
daily_activity <- daily_activity %>%
  mutate(activity_date = as.Date(activity_date, format = "%m/%d/%Y"))


# -------------------------------------------------------------------
# 4. TRANSFORMATION: CREATE NEW VARIABLES FOR ANALYSIS
# -------------------------------------------------------------------

# It's useful to know the day of the week for analyzing weekly patterns.
# We will create a 'day_of_week' column.
# Note: wday() from lubridate (part of tidyverse) makes this easy.
# `label=TRUE` gives the name (e.g., "Mon"), `week_start=1` sets Monday as the first day.
daily_activity <- daily_activity %>%
  mutate(day_of_week = wday(activity_date, label = TRUE, week_start = 1))


# -------------------------------------------------------------------
# 5. FINAL VERIFICATION: REVIEW THE CLEANED DATA
# -------------------------------------------------------------------

# Let's look at the structure of our cleaned and transformed data
glimpse(daily_activity)

# And view the first few rows to see our new 'day_of_week' column
head(daily_activity)

# Our data is now clean, correctly formatted, and ready for the 'Analyze' phase!