library(tidyverse)
library(here)
library(patchwork)


cat ("\nHow are insurance costs distributed by age groups?\n")

costs_by_age <- df_clean %>%
  group_by(age_group) %>%
  summarise(
    avg_cost = mean(charges, na.rm = TRUE),
    sd_cost = sd(charges, na.rm = TRUE),
    median_cost = median(charges, na.rm = TRUE),
    total_cost = sum(charges, na.rm = TRUE),
    customers = n(),
    .groups = "drop"
  ) %>%
  arrange(desc(total_cost))

print(costs_by_age)

cat ("\nResult:

  The Adult group has the highest total insurance costs (6096881) 
  and the largest number of customers (615),
  followed by the Middle-aged group (2876276) and customers (262).
  The Senior group has the lowest total costs (651505),
  and also includes the fewest customers (52).

  In terms of average costs, Senior group tends to have higher insurance expenses (12529).
     
  The standard deviation is relatively similar across groups, 
  but slightly higher for the Senior group, which indicates greater variation 
  in insurance costs among older group.\n")

cat ("\nFIGURE 1 – Total insurance costs by age group\n")

fig1 <- ggplot(costs_by_age,
               aes(x = reorder(age_group, total_cost),
                   y = total_cost,
                   fill = age_group)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = round(total_cost, 0)),
            hjust = -0.1, size = 3.5) +
  coord_flip() +
  labs(
    title = "Total insurance costs by age group",
    x = "Age group",
    y = "Total insurance costs"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold")
  )

print(fig1)

cat("
  The diagram of total insurance costs by age group shows that 
  the Adult group has the highest total insurance costs,
  followed by the Middle-aged group. 
  The Senior group has the lowest total costs.\n")


cat ("\nFIGURE 2 – Distribution of insurance costs by age group\n")

fig2 <- ggplot(df_clean,
               aes(x = age_group,
                   y = charges,
                   fill = age_group)) +
  geom_boxplot(show.legend = FALSE) +
  labs(
    title = "Distribution of insurance costs by age group",
    x = "Age group",
    y = "Insurance costs"
  ) +
  theme_minimal()

print(fig2)

cat("
  The boxplot shows how insurance costs are distributed within each age group
  and that costs increase with age. 
  
  In the Adult and Middle-aged groups, some individuals have much higher costs than others, 
  which is shown by the outliers in the boxplot.
  
  The median line inside the boxes is higher for Seniors than for Young adults, 
  which confirms that older individuals generally have higher insurance costs.\n")



cat("\nDo insurance costs differ by region?\n")

costs_by_region <- df_clean %>%
  group_by(region) %>%
  summarise(
    avg_cost = mean(charges, na.rm = TRUE),
    median_cost = median(charges, na.rm = TRUE),
    total_cost = sum(charges, na.rm = TRUE),
    customers = n(),
    .groups = "drop"
  ) %>%
  arrange(desc(total_cost))

print(costs_by_region)

cat("\nResult:

  The South region has the highest total insurance costs (3297950) 
  and the largest number of customers (320), 
  while the East region has the lowest total costs (2493169) and the fewest customers (253).
  
  The average costs are similar within two groups: South and North have slightly higher average costs, 
  while West and East have slightly lower average costs.\n")


cat("\nFIGURE 3 – Distribution of insurance costs by smoking status, gender, and region\n")

p1 <- ggplot(df_clean,
             aes(x = smoker, y = charges, fill = smoker)) +
  geom_boxplot(show.legend = FALSE) +
  labs(
    title = "Smoking",
    x = "",
    y = "Costs"
  ) +
  theme_minimal()

p2 <- ggplot(df_clean,
             aes(x = sex, y = charges, fill = sex)) +
  geom_boxplot(show.legend = FALSE) +
  labs(
    title = "Gender",
    x = "",
    y = ""
  ) +
  theme_minimal()

p3 <- ggplot(df_clean,
             aes(x = region, y = charges, fill = region)) +
  geom_boxplot(show.legend = FALSE) +
  labs(
    title = "Region",
    x = "",
    y = ""
  ) +
  theme_minimal()

print ((p1 + p2)/p3 +
  plot_annotation(
    title = "Distribution of insurance costs by smoking status, gender, and region"
  ))


cat("
  The plots show that smoking has a strong effect on insurance costs.
  Smokers have significantly higher costs than non-smokers, 
  while differences between males and females are very small,
  as are regional differences.\n")


cat("\nWhich variables seem interesting to investigate further?

  Variables that appear most interesting for further analysis are smoking status and age.
  
  Smoking shows the strongest difference in insurance costs, 
  with smokers having significantly higher expenses than non-smokers.
  
  Age also appears to be an important factor, as insurance costs tend to increase with age.
  
  In contrast, variables such as region and gender show relatively small differences 
  and may have a weaker effect on insurance costs.\n")





