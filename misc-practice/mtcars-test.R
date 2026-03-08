#Install and load packages
install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)


#Load the mtcars dataset
data <- mtcars
head(data)
str(data)

#Filter the data to include only cars with high hp
filtered_data <- filter(data, hp>100)

#Check the structure of the filtered data
str(filtered_data)

#Plot with ggplot2
ggplot(data = filtered_data, aes(x=hp, y=mpg)) + geom_point() + theme_minimal()

#Calculate the correlation between hp and mpg
correlation <- cor(filtered_data$hp, filtered_data$mpg)
print(correlation)

#Fit a linear regression model
model <- lm(mpg ~ hp, data = filtered_data)

#Print the summary of the model
summary(model)












