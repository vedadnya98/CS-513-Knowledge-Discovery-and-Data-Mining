###### Knowledge Discovery and Data Mining (CS 513B) ######

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603

###### **************** ######

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

#Remove any row with a missing value in any of the columns.


data<-as.data.frame(apply(adultDataBase,2,function(x)gsub('\\s+', '',x)))
# C50  classification 
library('C50')
?C5.0


index<-seq(1,nrow(data),by=5)

training<-data[-index,]
test<-data[index,]

dev.off()

#Implement CART
model<-C5.0(Income~.,training)
plot(model)

#Prediction using test 
prediction<-predict(model,test,type="class") 

#Forming the confusin matrix
confusion_matrix<-table(test$Income,prediction)
confusion_matrix
str(prediction)

#Wrong Prediction
wrong<-sum(test$Income!=prediction)

#Calculating the error rate 
error_rate<-wrong/length(test$Income)
error_rate
