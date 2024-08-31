## Matrix
x <- 1:25
length(x)

dim(x) <- c(5, 5)

m1 <- matrix(data = x, nrow = 5, ncol = 5, byrow = TRUE)
m2 <- matrix(1:6, nrow = 2, ncol = 3)

m2 = m2 + 100
m2
