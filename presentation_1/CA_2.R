library(dplyr)
library(stats)
library(ggplot2)
library(ggfortify)
library(cluster)
library(dendextend)

db <- read.csv("presentation_1/child_mortality.csv")
main_data <- select(db, -c(1))
main_data["exports"] <- main_data["exports"] * main_data["gdpp"] / 100
main_data["imports"] <- main_data["imports"] * main_data["gdpp"] / 100
main_data["health"] <- main_data["health"] * main_data["gdpp"] / 100
View(main_data)

wssplot <- function(data, nc = 15, seed = 1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    wss[i] <- sum(kmeans(data, centers = i)$withinss)
  }
  plot(1:nc, wss, type = "b", xlab  =  "Number of Clusters",
       ylab = "Within groups sum of squares")
}
pdf("presentation_1/images/wssplot_2.pdf")
wssplot(main_data)
dev.off()

number_of_clusters <- 3
KM <- kmeans(main_data, number_of_clusters)
View(KM$centers)
View(KM$withinss)
View(KM$tot.withinss)
View(KM$betweenss)
View(KM$size)
View(KM$iter)

pdf("presentation_1/images/CA3_2.pdf")
autoplot(KM, main_data, frame = TRUE)
dev.off()


# Dendogram
hc <- hclust(dist(main_data), method = "ward.D")
dend_obj <- as.dendrogram(hc)
col_obj <- color_branches(dend_obj, k = number_of_clusters)
pdf("presentation_1/images/dendogram_2.pdf")
plot(col_obj)
dev.off()
