# for
friends <- c("Toy", "John", "Mary", "Anna", "David")

for(friend in friends) {
  print( paste("Hi", friend) )
}

# vectorization

paste("Hi", friends)

nums <- c(5:100)
nums <- nums + 2

for(num in nums){
  print(num - 2)
}

(nums <- nums - 2)

