install.packages("wordcloud")
install.packages("tm")

library(wordcloud)
library(tm)
?wordcloud
?tm

library(dplyr)
library(tidytext)
library(ggplot2)
library(syuzhet)

#text
#setwd("C:/Users/yzh/OneDrive - Högskolan Dalarna/Courses materials/Data Visulazation/VT25")
Drugs <- read.csv("drugs.csv")
getwd()
#***** 1 *****#
mydf <- data.frame(doc_id = row.names(Drugs), text = Drugs$side_effects)
# mydf <- data.frame(doc_id = Drugs$drug_name, text = Drugs$side_effects)
#***** 2 *****#
# The Corpus() is used to create a corpus, which is a structured collection of text documents.
words.corpus <- Corpus(DataframeSource((mydf)))
str(words.corpus)
# inspect(words.corpus)
inspect(words.corpus[[1]])
class(words.corpus[[1]])
meta(words.corpus[[1]])

#***** 3 *****#
words.corpus.clean <- tm_map(words.corpus, content_transformer(tolower))
inspect(words.corpus.clean[[1]])

words.corpus.clean <- tm_map(words.corpus.clean, removePunctuation)

inspect(words.corpus.clean[[1]])

words.corpus.clean <- tm_map(words.corpus.clean, removeNumbers)
inspect(words.corpus.clean[[1]])

words.corpus.clean <- tm_map(words.corpus.clean, removeWords, stopwords("english"))
inspect(words.corpus.clean[[1]])



words.corpus.clean <- tm_map(words.corpus.clean, removeWords, c("difficult", "severe", "reaction", "spreads", "serious", 
                                                                "can", "affect", "many", "parts", "body", "may", "include", 
                                                                "symptoms", "unusual", "several", "weeks", "began", "using",
                                                                "cause", "call", "common", "effects", "doctor", "cause", "little",
                                                                "counts", "side", "difficulty",  "dark", "short", "loss", "tell", "occur",
                                                                "also", "medical", "attention", "rate", "use", "seek", "behavior", "health",
                                                                "feeling", "fast"))
inspect(words.corpus.clean[[1]])

inspect(words.corpus.clean[[2]])

# to save the text documents to disk, you can simply use writeCorpus()
#setwd("C:/Users/yzh/OneDrive - Högskolan Dalarna/Courses materials/Data Visulazation/VT25/CleanedCorpus")
writeCorpus(words.corpus.clean)

#***** 4 *****#
?wordcloud
set.seed(42)
wordcloud(words = words.corpus.clean, min.freq = 5,
          max.words = 40, random.order = TRUE, rot.per = 0.7,
          colors = brewer.pal(8, "Dark2"))

wordcloud(words = words.corpus.clean, min.freq = 10,
          max.words = 40, random.order = FALSE, rot.per = 0,
          colors = brewer.pal(8, "Dark2"))

#***** 5 *****#
# Set up the plotting area

par(mfrow = c(2, 2), mar = c(2, 1, 2, 1)) 
# mfrow: Subsequent figures will be drawn in an nr-by-nc array on the device by rows (mfrow), respectively.
# mar: adjusts the margins around each plot (bottom, left, top, right).

# Plot 1
wordcloud(words = words.corpus.clean[1], min.freq = 2,
          max.words = 10, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
mtext(paste("Medicine:", Drugs$drug_name[1]), side = 3, line = 0, cex = 1)

# Plot 2
wordcloud(words = words.corpus.clean[2], min.freq = 5,
          max.words = 5, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
mtext(paste("Medicine:", Drugs$drug_name[2]), side = 3, line = 0, cex = 1)

# Plot 3
wordcloud(words = words.corpus.clean[3], min.freq = 2,
          max.words = 10, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
mtext(paste("Medicine:", Drugs$drug_name[3]), side = 3, line = 0, cex = 1)

# Plot 4
wordcloud(words = words.corpus.clean[4], min.freq = 2,
          max.words = 10, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
mtext(paste("Medicine:", Drugs$drug_name[4]), side = 3, line = 0, cex = 1)

# Reset to default single plotting layout
par(mfrow = c(1, 1))


#------------------#
# frequency plot
#------------------#
?TermDocumentMatrix
# A Document-Term Matrix (DTM) represents word frequencies across documents.
dtm <- TermDocumentMatrix(words.corpus.clean)
findAssocs(dtm, "skin", 0.5)
inspect(dtm[1:10, 1:5])
inspect(removeSparseTerms(dtm, 0.4))  # show the terms that must appear in at least (1 - 0.4) = 60% of the documents.
matrix <- as.matrix(dtm)
words_freq <- sort(rowSums(matrix), decreasing = TRUE)
str(words_freq)
class(words_freq)
words_df <- data.frame(word = names(words_freq), freq = words_freq)

# Use ggplot2 to visualize the top 10 most frequent words

ggplot(head(words_df, 20), aes(x = word, y = freq)) +
  geom_bar(stat = "identity") +
  xlab("Word") + ylab("Frequency") +
  coord_flip() +
  theme_minimal()

ggplot(head(words_df, 20), aes(x = reorder(word, freq), y = freq)) +
  geom_bar(stat = "identity") +
  xlab("Word") + ylab("Frequency") +
  coord_flip() + 
  theme_minimal()

# task 3

#reading the file
data <- read.csv("C:/Users/mum/Downloads/restaurants_reviews.csv")


# Creating a corpus from the dataframe obtained in above step
words.corpus <- Corpus(VectorSource((data$reviews_list)))

# Converting the corpus contents to lower case.
words.corpus.clean <- tm_map(words.corpus, content_transformer(tolower))

# Removing all punctuation marks from the text.
words.corpus.clean <- tm_map(words.corpus.clean, removePunctuation)

# Remove all numeric values (digits) from the text as they are not useful
words.corpus.clean <- tm_map(words.corpus.clean, removeNumbers)

# Remove english stopwords from the text
words.corpus.clean <- tm_map(words.corpus.clean, removeWords, stopwords("english"))

# Generating term document matrix
TDM_Mat2 <- TermDocumentMatrix(words.corpus.clean)
TDM_Mat2 <- as.matrix(TDM_Mat2)
TDM_Mat2 <- sort(rowSums(TDM_Mat2),
                 decreasing=TRUE)
TDM_DF2 <- data.frame(word = names(TDM_Mat2),
                      freq = TDM_Mat2)

# Tokenizing the words
poa_word_v <- get_tokens(TDM_DF2$word, 
                         pattern = "\\W")

# Get sentiments using NRC method and treating the words as english language words.
nrc_vector <- get_sentiment(poa_word_v, 
                            method = "nrc", 
                            lang = "english")

nrc_vector
# Convert NRC sentiments to data frame.
nrc_vector <- as.data.frame(nrc_vector)

# Count occurrence of each sentiments in the data frame.
nrc_vector <- nrc_vector %>% 
  group_by(nrc_vector) %>% 
  summarise(Counts = n())

nrc_vector
# Converting sentiments to factor and renaming column names
nrc_vector$nrc_vector <- as.factor(nrc_vector$nrc_vector)
colnames(nrc_vector) <- c("Sentiment", "Counts")

# Plotting the sentiments distribution
ggplot(data = nrc_vector, 
       mapping = aes(x = Sentiment, 
                     y = Counts, 
                     fill = Sentiment)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title = "Sentiments Graph For Restaurant Reviews")
# Getting Further Drill down of sentiments
sentiments <- get_nrc_sentiment(as.character(TDM_DF2$word))

# Converting to dataframe and sorting
sentiments <- data.frame(t(sentiments))
sentiments <- data.frame(rowSums(sentiments))

# Renaming column names and summarizing
names(sentiments)[1] <- "count"
sentiments <- cbind("sentiment" = rownames(sentiments), 
                    sentiments)
rownames(sentiments) <- NULL

# Plotting result
qplot(sentiment,
      data = sentiments[1:8,],
      weight = count,
      geom = "bar",
      fill = sentiment) + 
  ggtitle("Sentiments For Restaurant Reviews")



#image 

# install.packages("magick")
# 
install.packages("devtools")
devtools::install_github("bnosac/image", subdir = "image.darknet", build_vignettes = TRUE)
devtools::install_github("bnosac/image", subdir = "image.darknet")

# library(Rcpp)
# library(dplyr)
# library(tidyr)

library(image.darknet)
library(magick)  # image preprocessing
###################################################
## Load images
setwd("C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs")

path = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/img"
# dir R function returns a character vector of file and/or folder names within a directory
images <- dir(path = path, pattern = "\\.png|\\.jpg|\\.jpeg")
print(images)


?image_darknet_model
?image_darknet_detect
#######################################################
## Detection Models

##**** Useful References ****##
# https://github.com/bnosac/image/blob/master/image.darknet/man/image_darknet_model.Rd
# https://pjreddie.com/darknet/yolo/
tiny_yolo_voc <- image_darknet_model(
  type = "detect",
  model = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/tiny-yolo-voc.cfg",
  weights = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/tiny-yolo-voc.weights",
  labels = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/voc.names"
)

yolo <- image_darknet_model(
  type = "detect",
  model = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/yolo.cfg",
  weights = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/yolo.weights",
  labels = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/coco.names"
)

yolo_voc <- image_darknet_model(
  type = "detect",
  model = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/yolo-voc.cfg",
  weights = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/yolo-voc.weights",
  labels = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/voc.names"
)


## define the detection model  
tiny_yolo_voc <- image_darknet_model(
  type = "detect",
  model = system.file(package = "image.darknet", "include", "darknet",  "cfg", "tiny-yolo-voc.cfg"),
  weights = system.file(package = "image.darknet", "models", "tiny-yolo-voc.weights"),
  labels = system.file(package = "image.darknet", "include", "darknet", "data", "voc.names")
)



yolo <- image_darknet_model(type = 'detect', 
                            model = system.file(package = "image.darknet", "include", "darknet",  "cfg", "yolo.cfg"), 
                            weights = system.file(package = "image.darknet", "models", "yolo.weights"),
                            labels = system.file(package = "image.darknet", "include", "darknet", "data", "coco.names"))


yolo_voc <- image_darknet_model(type = 'detect',
                                model = system.file(package = "image.darknet", "include", "darknet",  "cfg", "tiny-yolo-voc"),
                                weights = system.file(package = "image.darknet", "models", "tiny-yolo-voc.weights"),
                                labels = system.file(package = "image.darknet", "include", "darknet", "data", "voc.names"))





# function to be applied to images
detect_objects <- function(x) {
  filename <- paste(path, x, sep = "/")
  prediction <- image_darknet_detect(
    file = filename,
    object = tiny_yolo_voc,
    # object = yolo,
    # object = yolo_voc,
    threshold = 0.3
  )
  file.rename("predictions.png", paste0(path, "/pred/", x))
  return(prediction)
}

lapply(images, detect_objects)



##################################################################
######--------------- Image Preprocessing ------------############
##################################################################

path = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/img"
images <- dir(path = path, pattern = "\\.png|\\.jpg|\\.jpeg")
# Loop through each image file
preprocessed_img_path <- file.path(path, "preprocessed_img")
# Check if the subfolder exists; if not, create it
if (!dir.exists(preprocessed_img_path)) {
  dir.create(preprocessed_img_path)
}
for(image_name in images) {
  # Construct the full path to the image file
  full_path <- file.path(path, image_name)
  
  image <- image_read(full_path)
  
  # Resize the image to 512x, maintaining aspect ratio
  image_resized <- image_resize(image, "512x")
  image_enhanced <- image_modulate(image_resized, brightness = 110, saturation = 100, hue = 100)
  image_gray <- image_convert(image_enhanced, colorspace = 'gray')
  
  output_path <- file.path(preprocessed_img_path, paste0("processed_", image_name))
  image_write(image_gray, output_path)
}




###############################################################
##------------ Object detection on preprocessed images ----####
###############################################################
preprocessed_path <- file.path(path, "preprocessed_img")
pred_path <- file.path(path, "pred")

if (!dir.exists(preprocessed_path)) dir.create(preprocessed_path)
if (!dir.exists(pred_path)) dir.create(pred_path)

preprocessed_images <- dir(path = preprocessed_path, pattern = "\\.png|\\.jpg|\\.jpeg$")


detect_objects <- function(x) {
  filename <- paste(preprocessed_path, x, sep = "/")
  prediction <- image_darknet_detect(
    file = filename,
    object = tiny_yolo_voc,
    # object = yolo,
    # object = yolo_voc,
    threshold = 0.19
  )
  
  file.rename("predictions.png", paste0(pred_path, "/", x))
  return(prediction)
}

lapply(preprocessed_images, detect_objects)


##**** Useful References ****##
# https://rpubs.com/dgolicher/yolo
# https://tomazweiss.github.io/blog/object_detection/


#############task2#########
####################################################
#---------- Image Preprocessing With magick -------#
####################################################

# install.packages("magick")
library(magick)

full_path = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/img/du homepage.png"


# Read the image
image <- image_read(full_path)
print(image)
# print(image_info(image))
# Resize the image to 512x, maintaining aspect ratio
image_resized <- image_resize(image, "512x")
image_blur(image_resized, 3)
image_gray <- image_convert(image_resized, colorspace = 'gray')
print(image_gray)

image_enhanced <- image_modulate(image_gray, brightness = 110, saturation = 100, hue = 100)
print(image_enhanced)

image_sharpened <- image_contrast(image_enhanced, sharpen = TRUE)
print(image_sharpened)
image_write(image_sharpened, path = "C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/img/1.png", format = "png")


image_edge(image_sharpened)

# image_equalize(image_resized)

image_blur(image_sharpened, 10, 5)
####################################################
#---------- Image Preprocessing With Opencv -------#
####################################################

# devtools::install_github("ropenscilabs/opencv")
library(opencv)
pic <- ocv_read("C:/Users/mum/OneDrive - Högskolan Dalarna/Desktop/Data_visualisation_labs/Lab_5/img/du homepage.png")
# ocv_resize(image, width = 0, height = 0)
resize_img <- ocv_resize(pic, width = 512)
ocv_hog(resize_img)
ocv_grayscale(resize_img)
ocv_edges(resize_img)
ocv_blur(resize_img, ksize = 5)

## Face detection 
faces <- ocv_face(pic)
facemask <- ocv_facemask(faces)
ocv_write(faces, "~/1.jpg")

# https://cran.r-project.org/web/packages/opencv/opencv.pdf




################################
# Install necessary packages if you haven't already
install.packages("ggplot2")
install.packages("imager")

# Load the libraries
library(ggplot2)
library(imager)

# Install necessary libraries if not already installed
install.packages("ggplot2")
install.packages("imager")



# Histogram 
library(ggplot2)
# install.packages("png")
library(png)
library(reshape2)
library(grid)
image <- readPNG(full_path)  # height, width, RGBA(red, green, blue, alpha)
grid.raster(image)
# Convert image data to a data frame
img_data <- data.frame(
  Red = as.vector(image[,,1]),
  Green = as.vector(image[,,2]),
  Blue = as.vector(image[,,3])
)

# Melt the data frame for ggplot
img_melted <- melt(img_data)

# Plot the histogram
ggplot(img_melted, aes(x=value, fill=variable)) +
  geom_histogram(binwidth=1/256, position="identity", alpha=0.6) +
  facet_wrap(~variable, nrow=3) +
  scale_x_continuous(name="Intensity Value") +
  scale_y_continuous(name="Frequency") +
  scale_fill_manual(values=c("Red"="red", "Green"="green", "Blue"="blue")) +
  theme_minimal() +
  theme(legend.position = "none")+
  ggtitle("RGB Channel Histograms")












# Read the image
image <- readPNG(full_path)  # height, width, RGBA (red, green, blue, alpha)

# Visualize the image (optional)
grid.raster(image)

# Convert image data to a data frame (RGB channels)
img_data <- data.frame(
  Red = as.vector(image[,,1]),
  Green = as.vector(image[,,2]),
  Blue = as.vector(image[,,3])
)

# Melt the data frame for ggplot
img_melted <- melt(img_data, variable.name = "Channel", value.name = "Intensity")

# Plot the histogram for RGB channels
ggplot(img_melted, aes(x=Intensity, fill=Channel)) +
  geom_histogram(binwidth=1/255, position="identity", alpha=0.6) +  # Adjust binwidth for pixel intensity
  facet_wrap(~Channel, nrow=3) +  # Facet by RGB channels
  scale_x_continuous(name="Intensity Value") +  # X-axis label
  scale_y_continuous(name="Frequency") +  # Y-axis label
  scale_fill_manual(values=c("Red"="red", "Green"="green", "Blue"="blue")) +  # Color for each channel
  theme_minimal() +  # Minimal theme
  theme(legend.position = "none") +  # No legend
  ggtitle("RGB Channel Histograms")  # Title

##################task 4############################
library(metagear)
library(tcltk)

# Choose PDF files
pdf_files <- tk_choose.files()

# Extract images from each selected PDF file
for (pdf_file in pdf_files) {
  # Extract images
  images <- PDF_extractImages(file = pdf_file)
  
  # Create directory if it doesn't exist
  if (!file.exists("extract_images")) {
    dir.create("extract_images")
  }
  
  # Move images containing "_bin_" to the "extract_images" directory
  for (image_file in images) {
    if (grepl("_bin_", image_file)) {
      file.rename(image_file, paste0("extract_images/", basename(image_file)))
    }
  }
}


