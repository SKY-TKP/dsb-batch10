# loop over a dataframe

nrow(USArrests)
ncol(USArrests)
head(USArrests)

for( i in 1:ncol(USArrests)){
  print( names(USArrests)[i] )
  print( mean(USArrests[[i]]) )
}

cal_mean_by_col <- function(df) {
  for( i in 1:ncol(df)){
    print( names(df)[i] )
    print( mean(df[[i]]) )
    print("-------")
  }
}