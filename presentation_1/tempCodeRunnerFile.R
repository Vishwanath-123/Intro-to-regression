library(stats)
library(dplyr)

db <- read.csv("Country_data2.csv",  header = TRUE)
View(db)
dim(db)

main_data <- select(db, c(2, 3, 4, 5, 6, 7, 8, 9, 10))
main_data["exports"] <- main_data["exports"] * main_data["gdpp"] / 100
main_data["imports"] <- main_data["imports"] * main_data["gdpp"] / 100
main_data["health"] <- main_data["health"] * main_data["gdpp"] / 100
scaled_main_data <- scale(main_data)

View(scaled_main_data)

View(cor(scaled_main_data))
avg <- mean(cor(scaled_main_data))
avg

pca <- prcomp(scaled_main_data, center = TRUE,   scale. = TRUE)
summary(pca)
plot(pca,  type = "l")
loadings(pca)