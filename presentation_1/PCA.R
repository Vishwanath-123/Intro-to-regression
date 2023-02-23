library(stats)
library(dplyr)
library(psych)

db <- read.csv("presentation_1/Country_data2.csv",  header = TRUE)

main_data <- db
main_data["exports"] <- main_data["exports"] * main_data["gdpp"] / 100
main_data["imports"] <- main_data["imports"] * main_data["gdpp"] / 100
main_data["health"] <- main_data["health"] * main_data["gdpp"] / 100
main_data <- select(main_data, -c(country))

# Correlation
avg <- mean(cor(main_data))

# PCA
pca <- principal(main_data, nfactors = 9, rotate = "none")
pca$loadings
th <- 5
pc <- pca$scores[, 1:th]
# View(head(pc, 10))
write.csv(pc, "presentation_1/PCA.csv", row.names = FALSE)

# View(pca$loadings)

# View(cor(pc))

summary(pca)
# Plotting the Eigen Values
pdf("presentation_1/images/pca.pdf")
plot(pca$values, type = "o", xlab = "Number of components", ylab = "Eigen Values", col = "brown") 
abline(h = pca$values[th], col = "red", lty = 100)
dev.off()

cumprop <- cumsum(pca$values) / sum(pca$values)
cumprop

# Plotting the Cumulative Proportion
pdf("presentation_1/images/Cummulative_Proportion.pdf")
plot(cumprop * 100,type = "b",xlab = "Number of components", ylab = "Cumulative Proportion of Variance", col = "blue")
abline(v = th, col = "red", lty = 2)
abline(h = cumprop[th] * 100, col = "red", lty = 2)
dev.off()
