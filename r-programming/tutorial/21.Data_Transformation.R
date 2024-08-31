## load package
library(dplyr)

## read csv file into RStudio
imdb = read.csv("imdb.csv", stringsAsFactors = 
                FALSE, header =  TRUE)

## review data stucture
glimpse(imdb)

## print head and tail of data
head(imdb, 6)
tail(imbd, 6)

## select columns
select(imdb, MOVIE_NAME, RATING)
select(imdb, 1, 5)

select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

## pipe operator
imdb %>% 
  select(movie_name = MOVIE_NAME, released_year = YEAR) %>%
  head(10)

#-----------------------------------------
## filter data --> filter()
filter(imdb, SCORE >= 9.0)
imdb %>% filter(SCORE >= 9.0)

names(imdb) <- tolower(names(imdb))

# and operation ==> &
imdb %>% 
  select(movie_name, year, score) %>%
  filter(score >= 9 & year >= 2000)

# or operation ==> |
imdb %>% 
  select(movie_name, length, score) %>%
  filter(score == 8.80 | score == 8.3 | score == 9.0)

imdb %>% 
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3,8.8,9.0))

#-----------------------------------------
## create new columns --> mutate()
imdb %>%
  select(movie_name, score, length) %>%
  mutate(
    score_group = if_else(
      score >= 9, "High Rating", "Low Rating"),
    length_grou = if_else(
      length >= 120, "Long Film", "Short Fim")
    ) %>% 
  head(5)


imdb %>%
  select(movie_name, score) %>%
  mutate(score_update = score + 0.1) %>%
  head(10)

#-----------------------------------------
## arrange data --> arrange()
head(imdb)

imdb %>%
  arrange(desc(length)) %>% #descending order
  head(10)

imdb %>%
  arrange(rating, desc(length)) %>% #descending order
  head(10)

#-----------------------------------------
## summarize and group_by
imdb %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(count_length = n(),
            sum_length = sum(length),
            mean_length = mean(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length)
            )

#-----------------------------------------
## join data
favourite_film <- data.frame(id = c(4,5,10,34,97))

favourite_film %>% 
  inner_join(imdb, by = c("id" = "no"))

#-----------------------------------------
## Write csv file (export result)
imdb_prep <- imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 1990)

# export_file
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)



library(tidyverse)
## dplyr
## 1. select
## 2. filter
## 3. arrange
## 4. mutate
## 5. summarise
## other function: count, distinct
## join tables, bind_row, bind_col

df <- tibble(mtcars)

df <- mtcars %>% 
  rownames_to_column(var = "model") %>%
  tibble()

## random sample / sampling
set.seed(42)
df %>% 
  sample_n(size = 5)

df %>% 
  select(model, am) %>%
  mutate(new_am 
         = ifelse(am == 0, "auto", "manual")) %>%
  count(new_am) %>%
  mutate(pct = n/sum(n))

## distinct
model_names <- df %>% 
  select(model, am) %>%
  mutate(new_am 
         = ifelse(am == 0, "auto", "manual")) %>%
  distinct(model) %>%
  pull()

## replance NA
band_members %>%
  full_join(band_instruments, by = "name") %>%
  mutate(plays = replace_na(plays, "drum"),
         band = replace_na(band, "Aerosmith"))

df1 <- data.frame(id = 1:3,
                  name = c("toy", "john", "mary"))

df2 <- data.frame(id = 3:5,
                  name = c("mary", "david", "anna"))

df3 <- data.frame(id = 6:8,
                  name = c("a", "b", "c"))

df4 <- data.frame(id = 9:10,
                  name = c("e","f"))

## Join data frame
bind_rows(df1, df2)
union(df1, df2)

band_members %>%
  rename(friend = name) %>%
  left_join(band_instruments, by = c("friends" = "name"))

## Join multiple data
df1 %>% 
  bind_rows(df2) %>%
  bind_rows(df3) %>%
  bind_rows(df4) %>%
  distinct()

## shortcut when we have multiple dataframes
list_df <- list(df1, df2, df3, df4)
list_df %>%
  bind_rows() %>%
  distinct()







































