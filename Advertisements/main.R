ads = read.csv("/home/pluton/Documents/Desktop Files/sem-6/Intro to regression/Advertisements/Ads.csv")
View(ads)
head(ads)
tail(ads)

model_1 = lm(Sales ~ Newspaper + TV + Radio, data = ads)
model_1
summary(model_1)

cov(ads$Newspaper, ads$Radio)
cor(ads$Radio, ads$Newspaper)
