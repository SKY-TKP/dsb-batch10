## control flow

# if
# = IF() in google sheets

score <- 20

if(score >= 90){
  print("Passed")
} else {
 print("Failed") 
}

if (score >= 90){
  print("Passed")
} else if (score >= 50){
  print("OK")
} else{
  print("Enroll again!")
}

# ifelse
ifelse(score >= 80, "Passed", "Failed")

ifelse(score >= 90, "Passed", 
       ifelse(score >= 50, "OK", "Entroll again!")
       )
