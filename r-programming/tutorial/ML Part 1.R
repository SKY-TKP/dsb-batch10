install.packages("caret")
library(caret)
## Regression Example

## Split Data function
train_test_split <- function(ratio = 0.8, data = mtcars){
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n, size = ratio*n) 
  train_data <- data[id,]
  test_data <- data[-id,]
  return(list(train_data, test_data))
}
  
split_data <- train_test_split(ratio = 0.8, data = mtcars)
split_data[[1]] # train_data
split_data[[2]] # test_data

## Train Model
lm_model <- train(mpg ~ hp, data = split_data[[1]], 
      method = 'lm') #RMSE = 4.038468

## Score and Evalute
p <- predict(lm_model, newdata = split_data[[2]])
error <- split_data[[2]]$mpg - p

# Root mean square error -> RMSE
rmse <- sqrt(mean(error**2)) #RMSE = 4.658885

#=====================================================================

## Classification Example

data("mtcars")
## Prepare
mtcars$am <- factor(mtcars$am,
                    levels = c(0, 1),
                    labels = c("Auto", "Manual"))

## Split data
split_data <- train_test_split(ratio = 0.8, data = mtcars)

# Train Model
glm_model <- train(am ~ mpg, 
                   data = split_data[[1]],
                   method = "glm") # glm = generalized logistic model

# score and evalutate
p <- predict(glm_model, newdata = split_data[[2]])

acc <- mean(p == split_data[[2]]$am)


