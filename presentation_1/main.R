install.packages("dlypr")
install.packages("stats")

library(stats)
library(dplyr)
db <- read.csv("presentation_1/Country_data2.csv",  header = TRUE)
View(db)
dim(db)
main_data <- db
main_data["exports"] <- main_data["exports"] * main_data["gdpp"] / 100
main_data["imports"] <- main_data["imports"] * main_data["gdpp"] / 100
main_data["health"] <- main_data["health"] * main_data["gdpp"] / 100

View(main_data)

# Correlation
View(cor(select(main_data, -c(country))))
avg <- mean(cor(select(main_data, -c(country))))

# PCA
pca <- princomp(select(main_data, -c(country)), center = TRUE,   scale. = TRUE)
pca$loadings

pc <- pca$scores
View(pc)

View(cor(pc))

summary(pca)
th <- 4
eigen_val <- pca$sdev^2
eigen_val

# Plotting the Eigen Values
jpeg(file = "presentation-1/images/pca.jpeg")
plot(eigen_val, type = "o", xlab = "Number of components", ylab = "Eigen Values", col = "brown") 
abline(h = eigen_val[th], col = "red", lty = 100)
dev.off()

cumprop <- cumsum(eigen_val) / sum(eigen_val)
cumprop

# Plotting the Cumulative Proportion
jpeg(file = "presentation-1/images/Cummulative_Proportion.jpeg")
plot(cumprop * 100,type = "b",xlab = "Number of components", ylab = "Cumulative Proportion of Variance", col = "blue")
abline(v = th, col = "red", lty = 2)
abline(h = cumprop[th] * 100, col = "red", lty = 2)
dev.off()

jpeg(file = "presentation-1/images/.jpeg")
plot(pca,  type = "l")
loadings(select(pca, c(1:th)))