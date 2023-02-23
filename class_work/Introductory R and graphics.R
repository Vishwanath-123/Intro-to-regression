
#rm(list=ls()) # clear the memory, please use this function with caution

x = 5 
x

x <- 5
x

# assign vs check 

x = 6

x == 5

# For example, checking Sales reported by Sales dept and Sales reported by audit dept.


#############################
##              	   ##
##  VECTORS (arrays) in R  ##
##                	   ##
#############################

x = 1:10

x= -10:10

x = c(1,2,5,9) # the function 'c' creates a vector for us

help(seq)

seq(-1,10,by=1.5)

help(rep)

rep(1,5)

rep(x,5)

rep("A",5)

n=6

rep("a",n)

length(x) # checks the length of the vector

# recall different values of x wrt the position

x[1]

x[3]

x[c(1,4)]

x=-10:10

y=c(1,4,9)

x[y]

z=x[y]

length(z)==length(y)

class(x)

class(z)

class(y)

cbind(z,y) # column bind

rbind(z,y) # row bind

b=cbind(z,y)

class(b)

#######################
##		               ##
## Summary Measures  ##
##		               ##
#######################

mean(x)
median(x)
sd(x)
var(x)

mean(c(1,2,3,9))

summary(y)

cov(z,y)
cor(z,y)


##############################
##                          ##
##      Plots in R          ##
##                          ##
##############################

plot(y,z)

plot(y,z,xlab="Supply",ylab="Demand",main="Demand and Supply",
	col="lightblue",pch=2,type="b",lty=2)

######################
##                  ##
##  MATRICES in R   ##
##                  ##
######################

help(matrix)

a=matrix(c(1,2,3,9,11,19),byrow=TRUE,ncol=2)

a=matrix(c(1,2,3,9,11,19),ncol=2)

a=matrix(c(1,2,3,9,11,19),byrow=FALSE,ncol=2)


# Matrix example
# RIL sales for different quarters across different subsidiaries

#           Q1  Q2  Q3  Q4
# Textiles
# Groceries
# Petroleum

WorldPhones

nrow(a)

ncol(a)

a[1]

a[2]

a[2,2]

a[3,2]

a[,2]

a[3,]

dim(a) # tells us the number of rows and columns of a matrix

dim(a)==dim(b)

a+b # matrix addition
# For example, 

# Matrix multiplication (advanced)

a %*% b

B=matrix(b,ncol=3)

t(B) # transposes B that is interchanges the rows and columns

a %*% B

  # optional
 # solve(B) # inverse of a matrix (only works for square matrices)

##############################
##                          ##
##  Matrix Plots            ##
##                          ##
##############################

WorldPhones


matplot(y=WorldPhones,type="b",pch=c(14:20),xlab="Year",col=2:8,
        x=c(1951,1956,1957,1958,1959,1960,1961),
        ylab="Number of telephones (in thousands)",
        main=c("Number of telephones across the world", "(in thousands)"))

legend(legend=c(" N.Amer", "Europe", "Asia", "S.Amer", "Oceania", "Africa", 
                "Mid.Amer"),pch=c(14:20),col=2:8,"topleft",lty=c(1:7),cex=0.8)

class(WorldPhones)

plot(y=WorldPhones[,"Europe"],x=c(1951,1956,1957,1958,1959,1960,1961),xlab="Year",
     ylab="Number of telephones (in thousands)",type="b",col=2,lwd=2,main="Europe")
plot(y=WorldPhones[,"Asia"],x=c(1951,1956,1957,1958,1959,1960,1961),xlab="Year",
     ylab="Number of telephones (in thousands)",type="b",col=2,lwd=2,main="Asia")

########################
##                    ##
## Dataframes in R    ##
##                    ##
########################

dept1 = c( 43, 51, 30, 39, 61, 92, 45)
dept2 = c( 63, 64, 51, 54, 63, 73, 47)
dept3 = c( 71, 70, 68, 69, 76, 86, 48)
dept4 = c( 61, 63, 45, 47, 54, 84, 35)

data_SJ = data.frame(rbind(dept1,dept2,dept3,dept4) )

colnames(data_SJ) = c( "rating", "complaints", "privileges",	"learning", "raises", "critical", "advance")
data_SJ

rownames(data_SJ)=1:4
data_SJ

class(data_SJ)

AA = as.matrix(data_SJ) # treating data frame (list) as a matrix

class(AA) 

attitude # Chatterjee-Price attitude data

help(attitude)

head(attitude) # prints the first 6 rows

tail(attitude) # prints the last 6 rows

attitude

attitude[ ,2] # Print the second column of the attitude dataset

attitude[5, ] # Print the fifth row of the attitude dataset

attitude[9,3]  # Print the ninth row third column of the attitude dataset

attitude["privileges"]

attitude$privileges

par(mfrow=c(1,2))
hist(attitude$rating,probability=TRUE,main ="Ratings of attitude",xlab="Ratings",
     ylab="Probability density", breaks=10,col="lightblue")
hist(attitude$complaints,probability=TRUE,xlab ="Complaints",main="Handling of employee",
     ylab="Probability density", breaks=10,col="grey")
dev.off()

par(mfrow=c(1,2))
hist(attitude$rating,probability=TRUE,main ="Ratings of attitude",xlab="Ratings",
     ylab="Probability density", breaks=10,col="lightblue",ylim=c(0,0.05))
hist(attitude$complaints,probability=TRUE,xlab ="Complaints",main="Handling of employee",
     ylab="Probability density", breaks=10,col="grey",ylim=c(0,0.05))
dev.off()


##############################
##                   	      ##
## Importing files in R     ##
## Reading files in R       ##
##			                    ##
##############################

# Dataset 1 

# Downloaded from the Kaggle website
# Company Acquisitions Data - Top 7 Companies
# This dataset contains the list of acquisitions made by the following companies:

# Google
# Microsoft
# Facebook
# Apple
# Yahoo
# Twitter
# IBM

# Content
# The attributes include the date, year, month of the acquisition, name of the company # acquired, value or the cost of acquisition, business use-case of the acquisition, and the # country from which the acquisition was made.

# Source
# Source of this dataset is Wikipedia

# https://en.wikipedia.org/wiki/List_of_mergers_and_acquisitions_by_Alphabet # (/Apple/Facebook/IBM/Yahoo!/Twitter/Microsoft)

# Inspiration
# Which company makes the acquisitions quickly
# What is the trend of business use-cases among the acquired companies throughout the years
# What can be forecasted for upcoming years in terms of acquisitions


# Save excel file as CSV

# Save data in working directory

getwd()

setwd("C:/Users/Admin/Documents")

AcquisitionsData = read.csv("datasets_30633_39076_acquisitions.csv")

file.choose()

head(AcquisitionsData)

tail(AcquisitionsData)

names(AcquisitionsData)

colnames(AcquisitionsData)

rownames(AcquisitionsData)

class(AcquisitionsData)

mode(AcquisitionsData)

class(AcquisitionsData$AcquisitionMonth)
class(AcquisitionsData$AcquisitionYear)
class(AcquisitionsData$Value..USD)

levels(AcquisitionsData$AcquisitionMonth)

head(AcquisitionsData)


#############################################

## Subsetting from a Dataset

# Removing all rows with any missing value

Acquisitions_subset1 =  AcquisitionsData[complete.cases(AcquisitionsData),] 

head(Acquisitions_subset1)

dim(Acquisitions_subset1)

Acquisitions_subset2=na.omit(AcquisitionsData) # same purpose

dim(Acquisitions_subset2)

# Creating a subset data only for USA

Acquisition_subset3=subset(AcquisitionsData,Country=="USA")

head(Acquisition_subset3)
##########################################

## Merge two datasets in R

authors <- data.frame(
    surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
    nationality = c("US", "Australia", "US", "UK", "Australia"),
    retired = c("yes", rep("no", 4)))
authors

books <- data.frame(
    name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
    title = c("Exploratory Data Analysis",
              "Modern Applied Statistics ...",
              "LISP-STAT",
              "Spatial Statistics", "Stochastic Simulation",
               "Interactive Data Analysis"),
    other.author = c(NA, "Ripley", NA, NA, NA, NA))
books

merge(authors, books, by.x="surname", by.y="name")
merge(books, authors, by.x="name", by.y="surname")


##########################
## Print vs Paste     	##
##########################

print(" IIM Nagpur")

print(" IIM Nagpur 2020")
 
paste(" IIM Nagpur",2020)

i=2020

paste(" IIM Nagpur",i)

i=20

paste(" IIM Nagpur 20",i)

paste0(" IIM Nagpur 20",i)

# printing a sequence

vecn=15:20

paste0(" IIM Nagpur 20",vecn)
cat("\n",paste0(" IIM Nagpur 20",vecn,"\n"))


############################
##                    		##
##	Installing a Package	##
##				                ##
############################

install.packages("ggplot2") 

library(ggplot2) # attaches the package/library to your current R session

library(help=ggplot2)

if(!require(devtools)) install.packages("devtools")

##########################
##			##
## grammar of graphics  ##
##			##
##########################

library(ggplot2)

mpg ## fuel economy dataset : http://fueleconomy.gov

help(mpg)

## scatter plot

ggplot(mpg, aes(x = displ, y = hwy)) +
geom_point()

## playing with geom

ggplot(mpg, aes(cty, hwy)) + geom_point()

ggplot(diamonds, aes(carat, price)) + geom_point()

ggplot(economics, aes(date, unemploy)) + geom_line()

ggplot(mpg, aes(cty)) + geom_histogram()

ggplot(mpg, aes(cty)) + geom_histogram(binwidth=0.5)

ggplot(mpg, aes(displ, hwy)) +
geom_point() +
geom_smooth()

## colours as labels
ggplot(mpg, aes(displ, cty, colour = class)) +
geom_point()

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = "blue"))

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(colour = "blue")

## faceted plots
ggplot(mpg, aes(displ, hwy)) +
geom_point() +
facet_wrap(~class)
	
ggplot(mpg, aes(drv, hwy)) + geom_point()
ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(mpg, aes(hwy)) + geom_histogram(bins = 20)

ggplot(mpg, aes(displ, fill = drv)) +
geom_histogram(binwidth = 0.5) +
facet_wrap(~drv, ncol = 1)

ggplot(mpg, aes(manufacturer)) +
geom_bar()

head(economics)
ggplot(economics, aes(date, unemploy / pop)) +
geom_line()
ggplot(economics, aes(date, uempmed)) +
geom_line()

## Modifying the Axes labels

ggplot(mpg, aes(cty, hwy)) +
geom_point(alpha = 1 / 3)

ggplot(mpg, aes(cty, hwy)) +
geom_point(alpha = 1 / 3) +
xlab("city driving (mpg)") +
ylab("highway driving (mpg)")

# Remove the axis labels with NULL
ggplot(mpg, aes(cty, hwy)) +
geom_point(alpha = 1 / 3) +
xlab(NULL) +
ylab(NULL)

## xlim() and ylim() modify the limits of axes:
ggplot(mpg, aes(drv, hwy)) +
geom_point(width = 0.25)
ggplot(mpg, aes(drv, hwy)) +
geom_point(width = 0.25) +
xlim("f", "r") +
ylim(20, 30)


## labelling - install package directlabels

ggplot(mpg, aes(displ, hwy, colour = class)) +
geom_point()

ggplot(mpg, aes(displ, hwy, colour = class)) +
geom_point(show.legend = FALSE) +
directlabels::geom_dl(aes(label = class), method = "smart.grid")

## subsets and plots
presidential <- subset(presidential, start > economics$date[1])
ggplot(economics) +
geom_rect(
aes(xmin = start, xmax = end, fill = party),
ymin = -Inf, ymax = Inf, alpha = 0.2,
data = presidential
) +
geom_vline(
aes(xintercept = as.numeric(start)),
data = presidential,
colour = "grey50", alpha = 0.5
) +
geom_text(
aes(x = start, y = 2500, label = name),
data = presidential,
size = 3, vjust = 0, hjust = 0, nudge_x = 50
) +
geom_line(aes(date, unemploy)) +
scale_fill_manual(values = c("blue", "red"))

## anotate
yrng <- range(economics$unemploy)
xrng <- range(economics$date)
caption <- paste(strwrap("Unemployment rates in the US have
varied a lot over the years", 40), collapse = "\n")
ggplot(economics, aes(date, unemploy)) +
geom_line() +
geom_text(
aes(x, y, label = caption),
data = data.frame(x = xrng[1], y = yrng[2], caption = caption),
hjust = 0, vjust = 1, size = 4
)
ggplot(economics, aes(date, unemploy)) +
geom_line() +
annotate("text", x = xrng[1], y = yrng[2], label = caption,
hjust = 0, vjust = 1, size = 4
)

## Why is anotation important?

ggplot(diamonds, aes(log10(carat), log10(price))) +
geom_bin2d() +
facet_wrap(~cut, nrow = 1)

## Advanced 
ggplot(faithfuld, aes(eruptions, waiting)) +
geom_contour(aes(z = density, colour = ..level..))
ggplot(faithfuld, aes(eruptions, waiting)) +
geom_raster(aes(fill = density))
#######

p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
geom_point()
print(p)

# Save as png 
ggsave("plot.png", width = 5, height = 5)

## quick plots
qplot(displ, hwy, data = mpg)
qplot(displ, data = mpg)
qplot(displ, hwy, data = mpg, colour = "blue")
qplot(displ, hwy, data = mpg, colour = I("blue"))



########################
##		                ##
##	For loop	        ##
##			              ##
########################

n=20
sum=0

for( i in 1:n)
	{
	sum=sum+i
	}

print(sum)

# for loop using vectors

vecn=1:20
sum=0

for( i in vecn)
	{
	sum=sum+i
	}

print(sum)


vecn=seq(1.5,10,0.5)
vecn
sum=0

for( i in vecn)
{
  sum=sum+i
}

print(sum)


vecn=c(-1.5,10,3.5,-2.5)
vecn
sum=0

for( i in vecn)
{
  sum=sum+i
}

print(sum)



n=20
sum=0
i=1
while(i<=n)
	{
	sum=sum+1
	i=i+1
	}



 