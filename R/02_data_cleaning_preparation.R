library(tidyverse)
library(here)

unique(df_raw$sex)
unique(df_raw$region)
unique(df_raw$smoker)
unique(df_raw$chronic_condition)
unique(df_raw$exercise_level)
unique(df_raw$plan_type)

# Preparing text variables from lowercase to title case

df_clean <- df_raw %>%
  mutate(
    region = str_to_title(region),
    smoker = str_to_title(smoker),
    plan_type = str_to_title(plan_type),
    )

#Checking text variables after changes

unique(df_clean$region)
unique(df_clean$smoker)
unique(df_clean$plan_type)

# Handling missing values.
# The variables with missing values are:
# - bmi (28 missing values) => numerical variable
# - exercise_level (22 missing values) => categorical variable
# - annual_checkups (20 missing values) => numerical variable

df_clean <- df_clean %>%
  mutate(
    bmi = if_else(is.na(bmi),
                  median(bmi, na.rm = TRUE),
                  bmi),
    
    annual_checkups = if_else(is.na(annual_checkups),
                              median(annual_checkups, na.rm = TRUE),
                              annual_checkups),
    
    exercise_level = if_else(is.na(exercise_level),
                             "Unknown",
                             exercise_level)
  )

# Numerical variables replaced with median
# Categorical variables replaced with "Unknown"


# Checking cleaned data:

colSums(is.na(df_clean))

# Converting categorical variables to factors (groups) for analysis:

df_clean <- df_clean %>%
  mutate(
    sex = as.factor(sex),
    smoker = as.factor(smoker),
    region = as.factor(region),
    exercise_level = as.factor(exercise_level),
    plan_type = as.factor(plan_type),
    chronic_condition = as.factor(chronic_condition)
  )

# Checking if factors are created

glimpse(df_clean)


# Creating new variable: age_group, that helps categorize customers into different life stages:

summary(df_clean$age)

df_clean <- df_clean %>%
  mutate(
    age_group = case_when(
      age < 30 ~ "Young adult",
      age < 50 ~ "Adult",
      age < 65 ~ "Middle-aged",
      TRUE ~ "Senior"
    ),
    
    age_group = as.factor(age_group)
  )
df_clean$age_group <- factor(df_clean$age_group,
                             levels = c("Young adult", "Adult", "Middle-aged", "Senior"))


#Checking new created age_group variable

table(df_clean$age_group)


