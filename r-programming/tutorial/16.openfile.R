library(readr)
library(readxl)
library(jsonlite)

# read_table [txt]
students_1 <- read_table("student.txt")
View(students_1)

# read_csv
students_2 <- read_csv("student_csv.csv")
View(students_2)

# read_excel
econ_students = read_excel("students_excel.xlsx", sheet = "Economics")

result <- list()
for (i in 1:3){
  result[[i]] <- read_excel("students_excel.xlsx", sheet = i)
}

result

result[[1]]
result[[2]]
result[[3]]

# read_json
fromJSON("blackpink.JSON")
bp <- data.frame(fromJSON("blackpink.JSON"))
View(bp)


