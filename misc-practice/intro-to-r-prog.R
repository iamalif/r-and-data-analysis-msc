# calculate the sum of 1+1
1+1

# save the result as a variable
result <- 1+1

# run a plot
plot(1:10, 1:10)



# some tests
x <- c(1,2,3,4,5)
print(x)

y <- c(1:100)
print(y)

str(x)
summary(x)
summary(y)

# Using functions
square <- function(x){
  return (x^2)
}

result <- square(5)
print(result)


# Calculate mean with built-in function
mean_value <- mean(x)
print(mean_value)

# Calculate standard deviation with built-in function
sd_value <- sd(x)
print(sd_value)

# Calculate sum with built-in function
sum_value <- sum(x)
print(sum_value)

?mean
?sd
?sum


length(x)


# Arithmetic operations on vectors
a <- c(1,2,3)
b <- c(4,5,6)

addition <- a+b
print(addition)


# Create a character vector
colors <- c("red", "blue", "green", "red", "blue", "green")
print(colors)

# Create a factor from the character vector
colors_factor <- factor(colors)
str(colors)
str(colors_factor)

# View the levels of the factor
levels(colors_factor)

?factor

# Create ordered factor
sizes <- c("large", "small", "medium", "large", "small", "medium")
sizes_ordered <- factor(sizes, ordered = TRUE, levels = c("small", "medium", "large"))
print(sizes_ordered)
str(sizes_ordered)
levels(sizes_ordered)


# Logical operations
v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)

equal <- v1 == v2
print(equal)


# Create a matrix
m <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3)
print(m)


# Create a dataframe - although it's uncommon to create a dataframe; we load them instead
df <- data.frame(
  name = c("Alif", "Upoma", "Rahib"),
  age = c(31, 30, 22),
  married = c(TRUE, TRUE, FALSE)
)

print(df)


# Indexing and subsetting
index_and_subset <- c(2,4,6,8,10)

element1 <- index_and_subset[4]
element2 <- index_and_subset[c(3,5)]

print(element1)
print(element2)


















