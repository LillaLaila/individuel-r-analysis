library(tidyverse)
library(here)

cat("\nSelection of predictors:

  The predictors were selected based on the descriptive analysis.
  
  Smoking status and age were identified as the most important variables, 
  as they showed clear differences in insurance costs.
  
  BMI was included because it is related to health and may affect insurance costs.
  
  Gender and children were also included as control variables.\n")



cat("\nRegression model\n")

model <- lm(charges ~ age + bmi + smoker + sex + children, data = df_clean)

summary(model)

coef(model)

cat("\nInterpretation of model results:

  The results show that smoking has the strongest effect on insurance costs.
  Being a smoker increases insurance costs by approximately 7968 units.
  
  Age and BMI also affect insurance costs. 
  Older people and people with higher BMI usually pay more for insurance.
 
  Gender and children do not have a clear effect on insurance costs.\n")



cat("\nAre the results reasonable?

  The results seem reasonable, as smoking, age and BMI are related to health risks, 
  which can increase insurance costs.\n")



cat("\nAre there limitations in the model?

  The model has some limitations.
  
  The analysis is based on a limited dataset, which may not represent all cases.
  
  Some missing values were replaced during data cleaning, 
  which may affect the results.
  
  Also, not all factors that may influence insurance costs are included in the model, 
  for example lifestyle, health history, income, etc.\n")

