library(ggplot)

## histogram
qplot(mpg, data = mtcars, geom = "histogram", bins = 10)

## density
qplot(mpg, data = mtcars, geom = "density")

## scatter plot
qplot(x = hp, y = mpg, data = mtcars, geom = "point")

## ggplot ของแทร่
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(col = 'red') + 
  geom_smooth(se = F) +
  theme_minimal()
