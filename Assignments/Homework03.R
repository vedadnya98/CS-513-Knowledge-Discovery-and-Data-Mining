###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 3 - K Nearest Neighbors(knn))

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 3

###### ******************************************** ######

################### Question ###################
#### The “breast cancer dataset” in CANVAS was obtained from the University of Wisconsin Hospitals, Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.Use the knn methodology (k=3,5 and 10) to develop a classification models for the Diagnosis. 

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

# importing "class" package
library(class);

# Load Breast cancer data file CSV
breastCancerData <- read.csv("breast-cancer-wisconsin.data.csv",na.string="?")

# View Breast cancer data file 
View(breastCancerData)

# Remove any row with a missing value in any of the columns.
deleted_missing<-na.omit(breastCancerData)

#Converting the Class into type factor
deleted_missing$Class<- factor(deleted_missing$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(deleted_missing$Class)

#Converting the type of column F6 from character to numeric
deleted_missing$F6<-as.integer(deleted_missing$F6)

# View cancerData_missing data file 
View(deleted_missing)

newData<-deleted_missing[2:10]

#70% of the sample size
smp_size <- floor(0.70 * nrow(newData))

#Set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(newData)), size = smp_size)

#Loading 70% Breast cancer record in training dataset
training <- newData[train_ind, ]

#Loading 30% Breast cancer in test dataset
test <- newData[-train_ind, ]


# Use knn with k=1 and classify the test dataset
# using knn model
predict <- knn(training[ , -5], test[ , -5], training[ , 5], k = 1)

# Measure the performance of knn
table(Predict = predict, Actual = test[ , 5])

# Repeat the above steps with k=2, k=5, k=10

# k = 2
predict_K3 <- knn(training[ , -5], test[ , -5], training[ , 5], k = 3)
table(Predict = predict_K3, Actual = test[ , 5])

# k = 5
predict_K5 <- knn(training[ , -5], test[ , -5], training[ , 5], k = 5)
table(Predict = predict_K5, Actual = test[ , 5])

# k = 10
predict_K10 <- knn(training[ , -5], test[ , -5], training[ , 5], k = 10)
table(Predict = predict_K10, Actual = test[ , 5])

# clearing object environment
rm(list=ls())

################### THE END ###################