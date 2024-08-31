# function
# input -> f() -> output

x <- c(10, 25, 50, 100)

sum(x)
mean(x)
sd(x)

help(sd)
#----------------------------------------
# create out function
greeting_name <- function(name){
  print( paste("Hello", name) )
}

func <- function(){
  greeting_name("Toy")
}

new_func <- function(vector_name){
  for (name in vector_name){
    greeting_name(name)
  }
}

friends <- c("Toy", "John", "Bob")
new_func(friends)
#-------------------------------------------
