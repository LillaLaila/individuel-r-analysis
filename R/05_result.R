cat("\n\nConclusions:

  The analysis focuses on factors related to insurance costs (charges).
  
  The dataset contains 1100 observations and 14 variables. 
  It includes both numerical and categorical variables.  
  Some missing values were present in bmi, exercise_level and annual_checkups,
  numerical variables (bmi and annual checkups) were replaced with the median,
  while missing values in categorical variables (exercise_level) were replaced with Unknown. 
  Text variables were also standardized by converting values to title case.
  
  A new variable age_group was created that helps categorize customers into different life stages:
  young adult (18–29), adult (30–49), middle-aged (50–64) and senior (65+). 
  Most individuals are in the adult group (615), followed by middle-aged (262),
  young adult (171), and senior (52). This grouping makes it easier to compare insurance costs 
  between different age groups.
  
  The analysis showed that the Adult group has the highest total insurance costs
  and the largest number of customers, while the Senior group has 
  the lowest total costs and the fewest customers.
  In terms of average costs, the Senior group tends to have higher insurance expenses.
  
  By region the South region has the highest total insurance costs and the largest number of customers, 
  while the East region has the lowest total costs and the fewest customers.
  
  Smoking status and age were identified as the most important variables, 
  as they showed clear differences in insurance costs.
  Smokers have significantly higher costs than non-smokers.
  
  Regression analysis showed that age and bmi also affect insurance costs. 
  Older people and people with higher bmi usually pay more for insurance.
 
  Gender and children do not have a clear effect on insurance costs.
  
  The model does not include all factors that may affect costs, 
  such as lifestyle, health history, or income.
  The model could be improved by including more variables and using a larger dataset.
  ")