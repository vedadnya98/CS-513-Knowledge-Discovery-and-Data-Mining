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

# Load Adult Income Data file CSV
adultDataBase<-read.csv(file.choose(),na.strings = ' ?')

# View Adult Income Data file CSV
View(adultDataBase)

# Remove any row with a missing value in any of the columns.
#adultDataBase<-na.omit(adultDataBase)

# install.packages("rpart")
# install.packages("rpart.plot")     # Enhanced tree plots
# install.packages("rattle")         # Fancy tree plot
# install.packages("RColorBrewer")   # colors needed for rattle

library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

index<-seq(1,nrow(adultDataBase),by=5)

training<-adultDataBase[-index,]
test<-adultDataBase[index,]

dev.off()

?rpart()

#Implement CART
model<-rpart(Income~.,training)
rpart.plot(model)

#Prediction using test 
prediction<-predict(model,test,type="class") 

#Forming the confusin matrix
conf_matrix<-table(test$Income,prediction)
conf_matrix
str(prediction)

#Calculating error
Error<-sum(test$Income!=prediction)

#Calculating error rate
error_rate<-Error/length(test$Income)
error_rate

