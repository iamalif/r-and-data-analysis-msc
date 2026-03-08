# IF statements
x <- 2
if(x>5){
  print(" x is greater than 5")
}else{
  print("x is less than 5")
}


# FOR loops
for (i in 1:7){
  print(i)
}


# WHILE loops
y <- 1
while (y<=3){
  print(y)
  y <- y+1
}



# DPLYR
# Main functions in DPLYR are filter(), arrange(), select(), mutate(), summarise()

install.packages("dplyr")
library(dplyr)

# load data
data <- mtcars
head(mtcars)

# filter data
filtered_data <- filter(data, mpg>20)
print(filtered_data)

# arrange data
arranged_data <- arrange(filtered_data, desc(mpg))
print(arranged_data)

# select columns
selected_data <- select(filtered_data, mpg, cyl, hp)
print(selected_data)

# mutate data (example below is of a new col being created)
mutated_data <- mutate(selected_data, hp_per_cyl = hp/cyl)
print(mutated_data)

# summarise data
summarised_data <- summarise(mutated_data, avg_hp_per_cyl = mean(hp_per_cyl))
print(summarised_data)



# ggplot2
# Main functions in ggplot2 are ggplot(), geom_point(), geom_line(), geom_bar(), theme(), ggtheme()

install.packages("ggplot2")
library(ggplot2)
?ggplot2
?dplyr
?mtcars

# scatter plot
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()

# line plot
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_line()

# bar plot
ggplot(data=mtcars, aes(x=factor(cyl))) + geom_bar()

# customizing plots
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point() + theme_minimal()
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point() + theme_classic()
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point() + theme_bw()

# load ggthemes for applying the wsj (wall street journal) theme
install.packages("ggthemes")
library(ggthemes)
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point() + theme_wsj()



#+ Reading CSV files
#+ data <- read.csv("data.csv")
#+ 
#+ View first few rows of the data
#+ head(data)
#+ 
#+ View the structure of the data
#+ str(data) 
#+ 
#+ Reading Excel files
#+ Install the "readxl" package
#+ library(readxl)
#+ data <- read_excel("data.xlsx")
#+ 
#+ Saving data in .RData format
#+ save() function saves one or more R objects to a file
#+ save(data, file="data.RData")
#+ load("data.RData")
#+ 
#+ Saving data in .Rds format
#+ saveRDS() function saves a single R object to a file
#+ saveRDS(data, file="data.rds")
#+ data <- readRDS("data.rds")






