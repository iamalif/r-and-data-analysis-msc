install.packages("ggplot2")
library(ggplot2)
?ggplot2

install.packages("MASS")
library(MASS)

mpg
?mpg

head(mpg)
str(mpg)
summary(mpg)

# Plot 1
ggplot(mpg, aes(displ, hwy)) +
  geom_point()

# Plot 2
ggplot(mpg, aes(displ, cty, colour = class)) +
  geom_point()

# Plot 3
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~class)

# Plot 4
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 1/2)

# Plot 5
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 1/2, size = 4)

# Plot 6
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 1/2, size = 4, colour = "red", shape = "diamond")

# Plot 7
ggplot(mpg, aes(displ, hwy, colour = manufacturer)) +
  geom_point()

# Plot 8
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~manufacturer)

# Plot 9
ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  facet_wrap(~manufacturer)

# Plot 10
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 1/4, size = 4, colour = "red", shape = "diamond") +
  xlab("displacement of engine (L)") +
  ylab("highway drivign (mpg)")

# Plot 11
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 1/4, size = 4, colour = "red", shape = "diamond") +
  xlab("displacement of engine (L)") +
  ylab("highway drivign (mpg)") +
  xlim(2,6) +
  ylim(10,35)

# Plot 12
plot11 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 1/4, size = 4, colour = "red", shape = "diamond") +
  xlab("displacement of engine (L)") +
  ylab("highway drivign (mpg)") +
  xlim(2,6) +
  ylim(10,35)

# Saving plots
print(plot11)
summary(plot11)
ggsave("plot11.png", width = 5, height = 5)
saveRDS(plot11, "plot11.rds")
plot11a <- readRDS("plot11.rds")
summary(plot11a)

# Plot 13
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

?loess
?gam
?lm
?rlm

# Plot 14
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.2)

# Plot 15
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "gam")

# Plot 16
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "lm")

# For rlm, need the MASS library.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "rlm")

# Plot 17
ggplot(mpg, aes(manufacturer)) +
  geom_bar()

# Plot 18
ggplot(mpg, aes(manufacturer, hwy)) +
  geom_bar(stat = "identity")

# Same as above
ggplot(mpg, aes(manufacturer, hwy)) +
  geom_col()

# Plot 19
ggplot(mpg, aes(manufacturer)) +
  geom_bar(fill = "blue")

# Plot 20
ggplot(mpg, aes(manufacturer)) +
  geom_bar(fill = "blue", colour = "red", linewidth = 1.5)

# Plot 21
ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill = class))

# Same as above
ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill = class), position = "stack")

# Plot 22
ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill = class)) +
  coord_flip()

# Plot 23
ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill = class), position = "fill")

# Plot 24
ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill = class), position = "dodge")

# Plot 25
ggplot(mpg, aes(drv, hwy)) +
  geom_point()

# Plot 26, 27, 28
ggplot(mpg, aes(drv, hwy)) +
  geom_jitter()

ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot()

ggplot(mpg, aes(drv, hwy)) +
  geom_violin()

# Plot 29, 30
ggplot(mpg, aes(hwy)) +
  geom_histogram()

ggplot(mpg, aes(hwy)) +
  geom_freqpoly()

# Plot 31, 32, 33, 34
ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 2.5)

ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 10)

ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 1)

# Plot 35
ggplot(mpg, aes(displ)) +
  geom_freqpoly(binwidth = 0.5)

# Plot 36
ggplot(mpg, aes(displ, colour = drv)) +
  geom_freqpoly(binwidth = 0.5)

# Plot 37
ggplot(mpg, aes(displ, fill = drv)) +
  geom_histogram(binwidth = 0.5)

# Plot 38
ggplot(mpg, aes(displ, fill = drv)) +
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 1)

# Plot 39
?economics
head(economics)

ggplot(economics, aes(date, unemploy/pop)) +
  geom_line(colour = "maroon", size=2)

# Plot 40
?faithfuld
head(faithfuld)

ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_tile(aes(fill = density))

# Same as above
ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_raster(aes(fill = density))

# Plot 41
df <- data.frame(
  x = c(1, 1, 2, 2, 1.5),
  y = c(1, 2, 1, 2, 1.5),
  text = c(
    "bottom-left", "bottom-right",
    "top-left", "top-right", "center"
  )
)

ggplot(df, aes(x,y)) +
  geom_text(aes(label = text))

# To beautify
ggplot(df, aes(x,y)) +
  geom_text(aes(label = text), vjust = "inward", hjust = "inward")

# Plot 42
ggplot(df, aes(x,y)) +
  geom_point() +
  geom_text(aes(label = text), vjust = "inward", hjust = "inward")

# To beautify
ggplot(df, aes(x,y)) +
  geom_point() +
  geom_text(aes(label = text), vjust = "inward", hjust = "inward", nudge_x = -0.15)

# Plot 43
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(alpha = 1/4, size = 4, color = "red", shape = "diamond") + 
  xlab(" displacement of engine (L) ") +  
  ylab("highway driving (mpg)") + 
  geom_text(aes(label = model))

# To beautify
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(alpha = 1/4, size = 4, color = "red", shape = "diamond") + 
  xlab(" displacement of engine (L) ") +  
  ylab("highway driving (mpg)") + 
  geom_text(aes(label = model), check_overlap = TRUE)

# Plot 44
install.packages("directlabels")
library(directlabels)

ggplot(mpg, aes(displ, cty, colour = class)) +
  geom_point(show.legend = FALSE) +
  directlabels::geom_dl(aes(label = class), method = "smart.grid")





















