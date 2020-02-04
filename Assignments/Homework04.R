###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 4 - Naïve Bayes Methodology)

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 4

###### ******************************************** ######

################### Question ###################
####The “breast cancer dataset” in CANVAS was obtained from the University of Wisconsin Hospitals, Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.Use the Naïve Bayes methodology to develop a classification model for the Diagnosis. 

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/')

#Import package 'e1071' for Naive Bayes Classifier and class package
install.packages("e1071")
install.packages(class)
library(e1071)
library(class)

#Load Breast cancer data file CSV
breastCancerData <- read.csv("breast-cancer-wisconsin.data.csv",na.string="?")

#View Breast cancer data file 
View(breastCancerData)

#Remove any row with a missing value in any of the columns.
data<-na.omit(breastCancerData)

#Converting the type of column F6 from character to numeric
data$F6<-as.integer(data$F6)

#Converting the Class into type factor
data$Class<- factor(data$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(data$Class)

#Structure of Breast Cancer Dataset now
str(data)

newData<- data[2:11]

#70% of the sample size
smp_size <- floor(0.70 * nrow(newData))

#Set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(newData)), size = smp_size)

#Loading 70% Breast cancer record in training dataset
training <- newData[train_ind, ]

#Loading 30% Breast cancer in test dataset
test <- newData[-train_ind, ]

#Implementing NaiveBayes
model_naive<- naiveBayes(Class ~ ., data = training)

#Predicting target class for the Validation set
predict_naive <- predict(model_naive, test)

table(model_naive=predict_naive,class=test$Class)

#prop table
prop.table(table(model_naive=predict_naive,class=test$Class))

#Error in perdiction of result
wrong_prediction<-sum(predict_naive!=test$Class)

#Error Rate in prediction of Naive Bayes Classifier
wrong_prediction_rate<-wrong_prediction/length(predict_naive)

#Output of Naive Bayes Classifier
print(paste("Total number of wrong Predictions:" , wrong_prediction))
print(paste("Error Rate was :" , wrong_prediction_rate))
print(paste("Accuracy was :" , 100-(wrong_prediction_rate*100)))


################### THE END ###################

