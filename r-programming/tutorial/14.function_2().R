# add_two_nums() function
add_two_nums <- function(x = 0, y = 0){
  return(x + y)
}

# cube() function
cube <- function(base, power = 3)
  return(base ** power)

# count_ball() function
balls <- c("red", "red", "blue", "blue", 
           "green", "green", "red", "blue")

count_ball <- function(balls, color){
  sum(balls == color)
}