###### Knowledge Discovery and Data Mining (CS 513B) ######

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 2

############################ Problem 1 ############################

# Problem : 1-Load the “breast-cancer-wisconsin.data.csv” from canvas into R and perform the EDA analysis by:

rm(list=ls())


# Load the “breast-cancer-wisconsin.data.csv”
breastCancerData <- read.csv(file.choose(),na.string="?")

# View Breast cancer data file 
View(breastCancerData)

#####I.Summarizing each column (e.g. min, max, mean )
summary(breastCancerData)

#####II.Identifying missing values
dataframe <- data.frame(breastCancerData)
# Total numer of missing values in data set
sum(is.na(dataframe))
# Number of missing values in columns
colSums(is.na(dataframe))

######III.Replacing the missing values with the “mean” of the column.
dataframe$F6 <- ifelse(is.na(dataframe$F6), mean(dataframe$F6, na.rm=TRUE), dataframe$F6)
View(dataframe)

######IV.Displaying the frequency table of “Class” vs. F6
ftable(dataframe$Class,dataframe$F6)

######V.Displaying the scatter plot of F1 to F6, one pair at a time
pairs(dataframe[2:7],main = "Breast Cancer Wisconsin Data -- 2 Classes", pch = 21,bg =c("blue","orange")[factor(dataframe$Class)])
pairs(dataframe[2:7],main = "Breast Cancer Wisconsin Data -- 2 Classes", pch = 21,bg =c("blue","orange"))
#####VI.Show histogram box plot for columns F7 to F9
hist(dataframe$F7, main="Breast Cancer Wisconsin Data", xlab="Class", col="red")
hist(dataframe$F8 ,col="yellow", add=T)
hist(dataframe$F9, col="blue", add=T)

############################ Problem 2 ############################

#Problem 2 : Delete all the objects from your R- environment. Reload the “breast-cancer-wisconsin.data.csv” from canvas into R. Remove any row with a missing value in any of the columns.

#Delete all the objects from your R- environment
rm(list=ls())

#Reloading the “breast-cancer-wisconsin.data.csv” for Problem 2
breastCancerData_Problem2 <- read.csv("breast-cancer-wisconsin.data.csv",na.string="?")
View(breastCancerData_Problem2)
nrow(breastCancerData_Problem2)

#Remove any row with a missing value in any of the columns.
breastCancerData_Delete<-na.omit(breastCancerData_Problem2)
View(breastCancerData_Delete)
nrow(breastCancerData_Delete)
