###### Knowledge Discovery and Data Mining (CS 513B) ######

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603

###### ******************************************** ######


# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

#Import package 'e1071' for Naive Bayes Classifier and class package
# install.packages("e1071")
# install.packages(class)
library(e1071)
library(class)

# Load Adult Data file CSV
adultDataBase <- read.csv(file.choose(),na.string="?")

# View Adult Data file 
View(adultDataBase)

# Remove any row with a missing value in any of the columns.
omit<-na.omit(adultDataBase)

# View cancerData_missing data file 
View(omit)

#Train Test Split
index<-seq(1,nrow(omit),by=5)
test<-omit[index,]
training<-omit[-index,]

#Implementing NaiveBayes
Naive_Bayes <- naiveBayes(Income ~., training)

#Prediction model
predict<-predict(Naive_Bayes,test)

table(naiveBayes=predict,Income=test$Income)

#Wrong  Predictions
NB_wrong<-sum(predict!=test$Income)

#Error Rate calculation
error_rate<-NB_wrong/length(predict)

#Error Rate for Naive Bayes
error_rate
