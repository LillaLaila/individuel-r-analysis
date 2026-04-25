library(tidyverse)
library(here)

df_raw <- read_csv(here("data", "insurance_costs.csv"))

cat("\nFirst rows:\n")
print(head(df_raw))

cat("\nStructure:\n")
print(str(df_raw))

cat("\nMore detailed structure:\n")
print(glimpse(df_raw))

cat("\nDataset size:\n")
print(dim(df_raw))

cat("\nVariables names:\n")
print(names(df_raw))

cat("\nSummary statistic:\n")
print(summary(df_raw))

cat("\nChecking missing values:\n")
print(colSums(is.na(df_raw)))

