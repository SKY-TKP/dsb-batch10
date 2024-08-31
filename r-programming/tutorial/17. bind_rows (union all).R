library(dplyr)
library(readxl)

# read excel file
econ <- read_excel("students_excel.xlsx", sheet = 1)
business <- read_excel("students_excel.xlsx", sheet = 2)
data <- read_excel("students_excel.xlsx", sheet = 3)

# bind row == SQL UNION ALL
bind_rows(econ, business, data)

list_df <- list(econ, business, data)
full_df <- bind_rows(list_df)
View(full_df)
