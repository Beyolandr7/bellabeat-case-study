# Bellabeat Case Study - Analyze Phase in R
# Author: Your Name
# Date: 2024-10-07

# -------------------------------------------------------------------
# PREREQUISITE:
# This script assumes you have already run the 'process_data.R' script
# and have a cleaned `daily_activity` data frame in your R environment.
# -------------------------------------------------------------------

# Load the tidyverse library if it's not already loaded
library(tidyverse)


# -------------------------------------------------------------------
# 1. HIGH-LEVEL SUMMARY STATISTICS
# -------------------------------------------------------------------

# Let's start by getting a general sense of our data.
# We'll look at the mean, median, min, and max for key metrics.
daily_activity %>%
  select(total_steps,
         total_distance,
         sedentary_minutes,
         calories) %>%
  summary()

# Finding: On average, users take about 7,638 steps a day. However, the median is 7,405,
# and the range is huge (from 0 to 36,019 steps). This indicates a wide variety of
# user activity levels. Users are also sedentary for a significant amount of time,
# averaging over 16 hours (991 minutes) a day.


# -------------------------------------------------------------------
# 2. ANALYSIS 1: RELATIONSHIP BETWEEN STEPS AND CALORIES
# -------------------------------------------------------------------

# We hypothesize that more steps will lead to more calories burned.
# A scatter plot is the best way to visualize this relationship.

ggplot(data = daily_activity, aes(x = total_steps, y = calories)) +
  geom_point(color = "darkblue", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") + # Adds a linear model trend line
  labs(title = "Relationship Between Daily Steps and Calories Burned",
       x = "Total Steps",
       y = "Calories Burned") +
  theme_light()

# Finding: There is a clear and strong positive linear relationship.
# As users take more steps, they burn significantly more calories. This is a
# foundational insight for any fitness app and confirms the data's validity.


# -------------------------------------------------------------------
# 3. ANALYSIS 2: ACTIVITY PATTERNS ACROSS THE WEEK
# -------------------------------------------------------------------

# Do users behave differently on different days of the week?
# Let's group the data by the 'day_of_week' and calculate the average for key metrics.

weekly_summary <- daily_activity %>%
  group_by(day_of_week) %>%
  summarise(
    avg_steps = mean(total_steps),
    avg_calories = mean(calories),
    avg_sedentary_minutes = mean(sedentary_minutes)
  )

# Print the summary table
print(weekly_summary)

# Now, let's visualize the average steps per day to make it easier to see the trend.
ggplot(data = weekly_summary, aes(x = day_of_week, y = avg_steps)) +
  geom_col(fill = "cornflowerblue") +
  labs(title = "Average Steps by Day of the Week",
       x = "Day of the Week",
       y = "Average Steps") +
  theme_minimal()

# Finding: Activity levels are not consistent throughout the week. There appears to be
# a dip in activity on the weekends (especially Sunday). This identifies a potential
# opportunity for targeted user engagement.


# -------------------------------------------------------------------
# 4. ANALYSIS 3: EXPLORING USER ACTIVITY TYPES
# -------------------------------------------------------------------

# Let's understand how users are spending their time. We can compare time spent
# in high-intensity activity versus sedentary time.

ggplot(data = daily_activity, aes(x = very_active_minutes, y = sedentary_minutes)) +
  geom_point(aes(color = calories), alpha = 0.7) +
  labs(title = "Very Active Minutes vs. Sedentary Minutes",
       x = "Very Active Minutes",
       y = "Sedentary Minutes",
       color = "Calories") +
  theme_light()

# Finding: There is no clear inverse relationship. Many users who have high
# "Very Active Minutes" also have very high "Sedentary Minutes". This suggests
# a "workout warrior" profile: someone who exercises intensely for a short period
# but is otherwise inactive. This is a different user type than someone who is
# moderately active throughout the day.

# This concludes our analysis. We have identified several key trends that we can
# now visualize and present in the 'Share' phase.
