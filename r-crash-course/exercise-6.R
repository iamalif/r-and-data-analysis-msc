#Exercise 6: Lists in R

#Task 1: Creating Lists
my_list <- list(10, "red", TRUE, 3.14)
person <- list(name = "John", age = 25, city = "New York")


#Task 2: Accessing List Elements
list_element <- my_list[[2]]
age <- person$age


#Task 3: Manipulating Lists
modified_list <- c(my_list, "blue")
person$city <- "San Francisco"


#Task 4: A list of lists... of lists!
nested_lists <- list(
  list(
    list(c(1, 2, 3), c("a", "b", "c"), c(TRUE, FALSE, TRUE)),
    list(c(4, 5, 6), c("d", "e", "f"), c(FALSE, TRUE, FALSE)),
    list(c(7, 8, 9), c("g", "h", "i"), c(TRUE, TRUE, FALSE))
  ),
  list(
    list(c(10, 11, 12), c("j", "k", "l"), c(FALSE, FALSE, TRUE)),
    list(c(13, 14, 15), c("m", "n", "o"), c(TRUE, FALSE, TRUE)),
    list(c(16, 17, 18), c("p", "q", "r"), c(FALSE, TRUE, TRUE))
  ),
  list(
    list(c(19, 20, 21), c("s", "t", "u"), c(TRUE, FALSE, FALSE)),
    list(c(22, 23, 24), c("v", "w", "x"), c(FALSE, TRUE, TRUE)),
    list(c(25, 26, 27), c("y", "z", "aa"), c(TRUE, TRUE, TRUE))
  )
)

letter_w <- nested_lists[[3]][[2]][[2]][2]
number_14 <- nested_lists[[2]][[2]][[1]][2]
logical_vector_true <- nested_lists[[3]][[3]][[3]]
element_1 <- nested_lists[[1]][[2]][[3]][2]
