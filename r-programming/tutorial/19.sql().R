library(readr)
library(sqldf)

school <- read_csv("school.csv")

sqldf("select * from school;")

sqldf("select 
      AVG(student),
      SUM(student)
      from school;")

sqldf("select 
        school_id, 
        school_name, 
        country
      from school;
      ")

sql_query <- "select * from school
where country = 'USA'"

usa_school <- sqldf(sql_query)