install.packages("psych")
library(dplyr)
library(psych)


db <- read.csv("presentation_1/Country_data2.csv")

main_data <- select(db, c(2, 3, 4, 5, 6, 7, 8, 9, 10))
main_data["exports"] <- main_data["exports"] * main_data["gdpp"] / 100
main_data["imports"] <- main_data["imports"] * main_data["gdpp"] / 100
main_data["health"] <- main_data["health"] * main_data["gdpp"] / 100
View(main_data)

corr_main_data <- cor(main_data)
View(corr_main_data)

fa_data <- fa(corr_main_data, nfactors = 4, rotate = "varimax")

print(fa_data, sort = TRUE, digits = 2)
