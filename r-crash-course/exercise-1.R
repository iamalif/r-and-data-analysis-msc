#Exercise 1: Introduction to R

#Task 1: Print Your Name
print("Alif")


#Task 2: Install a Package
#Task 3: Load a Package
#install.packages("tidyverse")
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)


#Task 4: Learn More About a Package
?dplyr
?ggplot2


#Task 5: Load a Dataset
data(mpg, package = "ggplot2")

#Task 6: View the Dataset
View(mpg)
head(mpg)

#Task 7: Summarize the Dataset
summary(mpg)

