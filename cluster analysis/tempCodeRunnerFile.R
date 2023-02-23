utilities.df <- read.csv("/home/pluton/Documents/Desktop Files/sem-6/Intro to regression/cluster analysis/Utilities.csv")
row.names(utilities.df) <- utilities.df[,1]
utilities.df <- utilities.df[,-1]

# normalize input variables
utilities.df.norm <- sapply(utilities.df, scale)
# add row names: utilities
row.names(utilities.df.norm) <- row.names(utilities.df)
# compute normalized distance based on Sales (column 6) and Fuel Cost (column 8)
d.norm <- dist(utilities.df.norm[,c(6,8)], method = "euclidean")