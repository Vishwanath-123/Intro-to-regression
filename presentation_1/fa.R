# loading important libraries
library(ggplot2)
library(corrplot)
library(ggcorrplot)
library(psych)

# loading the data
df <- read.csv("presentation_1/Country_data2.csv")
df["exports"] <- df["exports"] * df["gdpp"] / 100
df["imports"] <- df["imports"] * df["gdpp"] / 100
df["health"] <- df["health"] * df["gdpp"] / 100
main_data <- df[, -1]

fa_df <- fa(main_data, nfactors = 4, rotate = "varimax", fm = "pa")
# fa_df
fa_df_loading <- (fa_df$loadings)
fa_df_loading