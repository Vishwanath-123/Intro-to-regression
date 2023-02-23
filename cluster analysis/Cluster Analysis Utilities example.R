utilities.df <- read.csv("/home/pluton/Documents/Desktop Files/sem-6/Intro to regression/cluster analysis/Utilities.csv")
row.names(utilities.df) <- utilities.df[,1]
utilities.df <- utilities.df[,-1]

# normalize input variables
utilities.df.norm <- sapply(utilities.df, scale)
# add row names: utilities
row.names(utilities.df.norm) <- row.names(utilities.df)
# compute normalized distance based on Sales (column 6) and Fuel Cost (column 8)
d.norm <- dist(utilities.df.norm[,c(6,8)], method = "euclidean")

hc1 <- hclust(d.norm, method = "single")
plot(hc1, hang = -1,cex = 0.65, ann = FALSE)
hc2 <- hclust(d.norm, method = "average")
plot(hc2, hang = -1, ann = FALSE)

memb <- cutree(hc1, k = 3)
memb

memb <- cutree(hc2, k = 6)
memb

row.names(utilities.df.norm) <- paste(memb, ": ", row.names(utilities.df), sep = "")
# plot heatmap
# rev() reverses the color mapping to large = dark
heatmap(as.matrix(utilities.df.norm), Colv = NA, hclustfun = hclust,
        col=rev(paste("gray",1:99,sep="")))


# normalized distance:
utilities.df.norm <- sapply(utilities.df, scale)
row.names(utilities.df.norm) <- row.names(utilities.df)
# run kmeans algorithm
km <- kmeans(utilities.df.norm, 6)
# show cluster membership
km$cluster

# centroids
km$centers

# within-cluster sum of squares
km$withinss

# cluster size
km$size

# plotting profile plot of centroids
# plot an empty scatter plot
plot(c(0), xaxt = 'n', ylab = "", type = "l",cex=0.5,
     ylim = c(min(km$centers), max(km$centers)), xlim = c(0, 8))
# label x-axes
axis(1, at = c(1:8), labels = names(utilities.df))
# plot centroids
for (i in c(1:6))
  lines(km$centers[i,], cex=0.5,lty = i, lwd = 2, col = ifelse(i %in% c(1, 3, 5),
                                                "black", "dark grey"))
# name clusters
text(x = 0.5, y = km$centers[, 1], cex=0.5,labels = paste("Cluster", c(1:6)))

dist(km$centers)
