# bind_cols() != JOIN

df1 <- data.frame(
  id = c(1:5),
  name = c("John", "Mary", "Anna", "David", "Lisa")
)
View(df1)

df2 <- data.frame(
  id = c(1:5),
  city = c( rep("BKK",3), rep("LONDON", 2) ),
  country = c( rep("TH", 3), rep("UK", 2) )
)
View(df2)

bind_cols(df1, df2)
bind_cols(df2, df1)

