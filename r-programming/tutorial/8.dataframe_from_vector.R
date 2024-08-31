## Data Frame #1

friends <- c("Wan", "Ink", "Aan",
             "Bee", "Top")

ages <- c(26, 27, 32, 31, 28)

locations <- c("NY", "LD", "LD", "TK", "MC")

movie_lover <- c(TRUE, TRUE, FALSE, 
                 TRUE, TRUE)

df = data.frame(friends, 
                ages, 
                locations, 
                movie = as.numeric(movie_lover))

View(df)
