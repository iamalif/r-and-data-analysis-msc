#Exercise 8: Data Frames in R

#Task 1: Creating Data Frames
df1 <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  age = c(25, 30, 35, 40, 45),
  employed = c(TRUE, FALSE, TRUE, FALSE, TRUE)
)
head(df1)
print(df1)

df2 <- data.frame(
  city = c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix"),
  population = c(8537673, 3976322, 2720546, 2296224, 1660272),
  state = c("New York", "California", "Illinois", "Texas", "Arizona")
)
head(df2)
print(df2)


#Task 2: Accessing Data Frame Elements
element1 <- df1[2,3]
element2 <- df2[4, "population"]


#Task 3: Manipulating Data Frames
df1$gender <- c("female", "male", "male", "female", "female")
print(df1)

df1$employed <- c(
  "currently employed",
  "not employed",
  "currently employed",
  "not employed",
  "currently employed"
)
#with ifelse
#df1$employed <- ifelse(df1$employed, "currently employed", "not employed")
print(df1)

df2[3, "state"] <- "Michigan"
#also works: df2$state[3] <- "Michigan"
print(df2)

df2$population <- round(df2$population / 1000000)
print(df2)



