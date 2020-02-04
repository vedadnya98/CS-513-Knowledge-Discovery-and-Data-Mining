###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 8 - Artificial Neural Networks)

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 8

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

cancerData<-data.frame(lapply(na.omit(breastCancerData),as.numeric))

#25% of the sample size
train_ind <- sort(sample(nrow(cancerData),round(.25*nrow(cancerData))))

#Loading 75% Breast cancer record in training dataset
training <- cancerData[-train_ind, -1]

#Loading 25% Breast cancer in test dataset
test <- cancerData[train_ind, -1]

train_ind <- seq (1,nrow(cancerData),by=5)
test<- cancerData[train_ind,-1]
training<-cancerData[-train_ind,-1]


install.packages("neuralnet")
library("neuralnet")
?neuralnet()
class(training$diagnosis)
net_Cancer<- neuralnet( diagnosis~. ,training, hidden=5, threshold=0.01)

#Plot the neural network
plot(net_Cancer)

## test should have only the input colum
#?compute

ann <-compute(net_Cancer , test[,-1])
ann$net.result 

ann_cat<-ifelse(ann$net.result <1.5,1,2)
length(ann_cat)

table(Actual=test$diagnosis,predition=ann_cat)

wrong<- (test$diagnosis!=ann_cat)
error_rate<-sum(wrong)/length(wrong)
error_rate 

