## load libraries
library(tidyverse)
library(glue)
library(RSQLite)
library(readxl)
library(jsonlite)

## glue -> string template
name <- "toy"
age <- 35

glue("Hello my name is {name}, 
     and I'm {age} year old.")
#----------------------------------------------------
## RSQLite
## connect sqltie database
con <- dbConnect(SQLite(), "chinook.db")

## how many tables
dbListTables(con)

## check column names in a table
dbListFields(con,"customers")

## get data from a table
usa_customers <- dbGetQuery(con, "SELECT 
                              firstname,
                              lastname,
                              country,
                              email
                              FROM customers
                        WHERE country = 'USA' ")

## write Table into a database
branch <- data.frame(
  branch_id = 1:3,
  branch_name = c("BKK", "LON", "SEOUL")
)
dbWriteTable(con,"branches", branch)

dbGetQuery(con, "SELECT branch_name FROM branches")

## remove table
dbRemoveTable(con, "branches")

## dbDisconnect()
dbDisconnect(con)
#----------------------------------------------------
## Tidyverse

## read files into R

df1 <- read_csv("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_01.csv")

df2 <- read_csv2("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_02.csv")

df3 <- read_delim("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_03.txt", delim = "|")

df4 <- read_tsv("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_04.tsv")

df5 <- read_excel("student_05.xlsx", sheet = 1)

## read JSON file as dataframe
temp <- fromJSON("example_df.json")

#----------------------------------------------------------------------------------
## data transfromation 101
## Tidyverse

## 1. select columns      => SQL select
## 2. filter rows         => SQL where
## 3. arrange             => SQL order by
## 4. mutate (create new columns)
## 5. summarize           => SQL aggregate function


car_names <- rownames(mtcars)
select(mtcars, hp, wt, am)
select(mtcars, 1, 2, 5)

select(mtcars, contains("a"))

## data transfromation pipelines

mtcars %>%
  select(hp, wt, am) %>%
  filter( (hp >= 200 | am == 1) & wt < 5 )

## REGEX
m_car<- mtcars %>%
          select(hp, wt, am) %>%
          filter(grepl("^M+.", car_names) & hp >= 100) %>%
          arrange(am, desc(hp))

grep("Merc", car_names)  #return index value that contains "Merc"
grepl("Merc", car_names) #return logic => contain "Merc" = TRUE

## mutate and summarise
hp_df<- mtcars %>%
        filter(hp < 100) %>%
        select(am, hp) %>%
        ## create new columns
        mutate(am_label = ifelse(am == 0, "Auto", "Manual"),
               hp_scale = hp/100,
               hp_double = hp*2)

## summarize
mtcars %>%
  summarise(mean_hp = mean(hp), 
            sum_hp = sum(hp),
            count_hp = n())

## data transformation pipeline
data %>%
  select() %>%
  filter() %>%
  arrange() %>%
  mutate() %>%
  sumarise() %>%
  ...
















































