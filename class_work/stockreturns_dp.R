db = read.csv("Stock Returns.csv")
matrix <- as.matrix(db)
matrix <- matrix[,-1]
matrix
mat_num <- matrix(as.numeric(matrix), ncol = ncol(matrix))
mat_num