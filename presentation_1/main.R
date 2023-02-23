data.df <- read.csv("presentation_1/Country_data2.csv",  header = TRUE)
str(data.df)
head(data.df)

library(psych)# for parallel analysis,factor and principal analysis.
library(tidyverse)#for better plots
library(cluster)#for cluster analysis
library(factoextra)#extract and visualize the output of multivariate data analyses like pca, clustering, etc.
suppressPackageStartupMessages(library(dendextend))

# pdf("presentation_1/images/parallel_analysis.pdf")
# fa.parallel(data.df[-c(1)], fa="both", n.iter=150,main="Scree plots with parallel analysis")
# dev.off()

df <- data.frame(data.df[c("title","PA1", "PA2")])
df.norm <- sapply(df[,-1], scale)
row.names(df.norm) <- row.names(df)