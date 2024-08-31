# basic programming for data analyst
# 1. variable
# 2. data types
# 3. data structures
# 4. function
# 5. control flow : if for while

## [1] variables
## reusable
new_income <- 35000 * 1.20
expense <- 22000
saving <- new_income - expense

## remove variable
rm(expense)
rm(new_income)
rm(saving)

#--------------------------------------------------------

## [2] data types
## numeric, character (text, string), logical, date

money_in_my_pocket <- 150
my_age <- 21
my_name <- "gun"
movie_lover <- TRUE # FALSE

today_date <- as.Date("2024-07-02") #year-month-day

## check class
class(money_in_my_pocket)
class(my_age)
class(my_name)
class(movie_lover)
class(today_date)

## change data types
class(as.numeric("100"))

#--------------------------------------------------------

## [3] data structures
## 1. vector
## 2. matrix
## 3. list
## 4. dataframe

seq(from = 1, to = 100, by = 5)

## [3.1] vector, contains only single data type
friends <- c("Toy", "John", 
             "David", "Mary", "Anna")
ages <- c(22, 18, 19, 35, 15)
marvel_lover <- c(TRUE, FALSE, TRUE, FALSE, FALSE)

## [3.2] matrix
m1 <- matrix(1:4, ncol = 2)
m2 <- matrix(1:8, nrow = 2, byrow = TRUE)
my_vec <- 1:25
my_mat <- matrix(my_vec, nrow = 5, ncol = 5)

m2 <- matrix(c(5,5,2,1), ncol = 2)

## [3.3] list
john <- list(
  first_name = "john",
  last_name = "wick",
  age = 45,
  city = "Bankok",
  occupation = "teacher",
  salary = 100000,
  marvel_fan = TRUE,
  marvel_movies = c("Thor", "Loki Series")
)

mary <- list(
  full_name = "mary anne",
  age = 28,
  city = "London",
  football_fan = TRUE,
  football_team = c("Chelsea", "ManU")
)

## data analyst
## know the last data structure
## [3.4] data frame => excel, csv

id <- 1:5
friends <- c("Toy", "Mary", "Anne", "Joe", "David")
ages <- c(35, 32, 28, 29, 30)
own_a_dog <- c(T, T, F, F, F)
city <- c("BKK", "LON", "LON", "TOK", "TOK")

df <- data.frame(id,friends,ages,own_a_dog,city)

df2 <- data.frame(
  id = 6:7,
  friends = c("wick", "ky"),
  ages = c(25, 26),
  own_a_dog = c(T, T),
  city = c("Seoul", "Seoul")
)

df3 <- rbind(df, df2)

#--------------------------------------------------------
## [4] function
## create your own function

my_func <- function(base, pow){
  return(base ** pow)
}

greeting <- function(name = "Gun"){
  text <- paste("Hello", name, sep = " ")
  print(text)
}

## simple function
## default argument
add_two_num <- function(x = 10, y = 20){
  return(x + y)
}

## function calls another function(s)
hi1 <- function() print("hi")
hi2 <- function() print("hi hi!")
hi3 <- function() print("hello")

all_hi <- function(){
  hi1()
  hi2()
  hi3()
}


#--------------------------------------------------------
## [5] control flow
## if for while

ifelse(10 > 2, T, F)

score = 49

grading <- function(score = 0){
    if(score >= 80){
      return("A")
  } else if(score >= 70){
      return("B")
  } else if(score >= 60){
      return("C")
  } else if(score >= 50){
      return("D")
  } else {
      return("Failed")
  }
}


## for loop
## vactorization

student_score <- c(70, 79, 80, 4, 19, 35, 67, 
                   72, 36, 79, 82, 91)
id <- c(1:length(student_score))
student_grading <- c()

for(scoring in student_score){
  #print(grading(scoring))
  student_grading <- append(student_grading, 
                            grading(scoring))
}
df <- data.frame(id, 
                 score = student_score, 
                 grade = student_grading
                 ) 


## take input from a user
## user input is character
user_name <- readline("what's your name: ")

print(user_name)

