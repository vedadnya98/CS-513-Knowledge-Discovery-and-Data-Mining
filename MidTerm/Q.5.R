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

# install.packages('kknn')
library(kknn)

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


#To predict and fit the knn model for k=1
predict_k1 <- kknn(formula=Income~., training, test, k=1,kernel ="rectangular" )
fit <- fitted(predict_k1)
table(test$Income,fit)

#Wrong Prediction for k=1
error<-sum(fit!=test$Income)
error

#Error Calculation for k=1
error_rate<-error/length(fit)
error_rate

#To predict and fit the knn model for k=3
predict_k3 <- kknn(formula=Income~., training, test, k=3,kernel ="rectangular")
fit <- fitted(predict_k3)
table(test$Income,fit)

#Wrong Prediction for k=3
error<-sum(fit!=test$Income)
error

#Error Calculation for k=3
error_rate<-error/length(fit)
error_rate

#To predict and fit the knn model for k=5
predict_k5 <- kknn(formula=Income~., training, test, k=5,kernel ="rectangular" )
fit <- fitted(predict_k5)
table(test$Income,fit)

#Wrong Prediction for k=5
error<-sum(fit!=test$Income)
error

#Error Calculation for k=5
error_rate<-error/length(fit)
error_rate


