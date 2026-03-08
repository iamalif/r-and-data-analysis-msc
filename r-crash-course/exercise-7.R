#Exercise 7: Matrices in R

#Task 1: Creating Matrices
matrix1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2, ncol=3)
print(matrix1)

matrix2 <- matrix(c(10, 20, 30, 40),
                  nrow=2,
                  ncol=2,
                  dimnames = list(c("A", "B"), c("C", "D")))
print(matrix2)


#Task 2: Accessing Matrix Elements
element1 <- matrix1[1,2]
element2 <- matrix2[2, "D"]


#Task 3: Manipulating Matrices
matrix1 <- rbind(matrix1, c(7, 8, 9))
print(matrix1)
matrix2[1, "C"] <- 50
print(matrix2)




