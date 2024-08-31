## Data Frame 2

friends <- c("Wan", "Ink", "Aan",
             "Bee", "Top")

ages <- c(26, 27, 32, 31, 28)

locations <- c("NY", "LD", "LD", "TK", "MC")

movie_lover <- c(TRUE, TRUE, FALSE, 
                 TRUE, TRUE)

my_list <- list(friend = friends, 
                age = ages, 
                loc = locations, 
                movie = movie_lover)

df2 = data.frame(my_list)

