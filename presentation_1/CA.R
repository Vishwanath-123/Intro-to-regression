library(dplyr)
library(stats)
library(ggplot2)
library(ggfortify)

db <- read.csv("presentation_1/Country_data2.csv")
main_data <- select(db, -c(1))
main_data["exports"] <- main_data["exports"] * main_data["gdpp"] / 100
main_data["imports"] <- main_data["imports"] * main_data["gdpp"] / 100
main_data["health"] <- main_data["health"] * main_data["gdpp"] / 100
View(main_data)

# wssplot <- function(data, nc = 15, seed = 1234){
#   wss <- (nrow(data)-1)*sum(apply(data,2,var))
#   for (i in 2:nc){
#     wss[i] <- sum(kmeans(data, centers = i)$withinss)
#   }
#   plot(1:nc, wss, type = "b", xlab  =  "Number of Clusters",
#        ylab = "Within groups sum of squares")
# }

# wssplot(main_data)
number_of_clusters <- 6
KM <- kmeans(main_data, number_of_clusters)
pdf("presentation_1/images/CA6.pdf")
autoplot(KM, main_data, frame = TRUE)
dev.off()
