###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 7 - Random Forest Classifier)

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 7

###### ******************************************** ######

################### Question ###################
####The “breast cancer dataset” in CANVAS was obtained from the University of Wisconsin Hospitals, Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.Use the Naïve Bayes methodology to develop a classification model for the Diagnosis. 

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

#Load Breast cancer data file CSV
breastCancerData <- read.csv(file.choose(),na.string="?")

#View Breast cancer data file 
View(breastCancerData)

#Remove any row with a missing value in any of the columns.
data<-na.omit(breastCancerData)

#Converting the type of column F6 from character to numeric
data$F6<-as.integer(data$F6)

#Converting the Class into type factor
data$Class<- factor(data$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(data$Class)
installed.packages()

?install.packages()

#75% of the sample size
smp_size <- floor(0.75 * nrow(data))
#Set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(data)), size = smp_size)

#Loading 75% Breast cancer record in training dataset
training <- data[train_ind, ]

#Loading 25% Breast cancer in test dataset
test <- data[-train_ind, ]

install.packages('randomForest')

library(randomForest)

model <- randomForest( Class~., data=training, importance=TRUE, ntree=1000)
importance(model)
varImpPlot(model)
Prediction <- predict(model, test)
table(actual=test[,11],Prediction)


wrong<- (test[,11]!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate   



