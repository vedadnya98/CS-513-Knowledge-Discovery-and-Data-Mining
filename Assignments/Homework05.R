###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 5)

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 5

###### ******************************************** ######

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

# importing "class" package
library(class);

# Load Breast cancer data file CSV
breastCancerData <- read.csv("breast-cancer-wisconsin.data.csv")

# View Breast cancer data file 
View(breastCancerData)

# Remove any row with a missing value in any of the columns.
#breastCancerData<-na.omit(breastCancerData)

#Converting the Class into type factor
breastCancerData$Class<- factor(breastCancerData$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(breastCancerData$Class)

installed.packages()

# install.packages("rpart")
# install.packages("rpart.plot")     # Enhanced tree plots
# install.packages("rattle")         # Fancy tree plot
# install.packages("RColorBrewer")   # colors needed for rattle

library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

set.seed(111)

index<-sort(sample(nrow(breastCancerData),round(.25*nrow(breastCancerData))))

training<-breastCancerData[-index,]
test<-breastCancerData[index,]

?rpart()
#Grow the tree 
dev.off()
CART_class<-rpart( Class~.,data=training)
rpart.plot(CART_class)
CART_predict2<-predict(CART_class,test, type="class") 
table(Actual=test[,11],CART=CART_predict2)
CART_predict<-predict(CART_class,test) 


CART_predict<-predict(CART_class,test)
str(CART_predict)
CART_predict_cat<-ifelse(CART_predict[,1]<=.5,'Malignant','Benign')


table(Actual=test[,11],CART=CART_predict_cat)
CART_wrong<-sum(test[,11]!=CART_predict_cat)
CART_error_rate<-CART_wrong/length(test[,11])
CART_error_rate
CART_predict2<-predict(CART_class,test, type="class")
CART_wrong2<-sum(test[,11]!=CART_predict2)
CART_error_rate2<-CART_wrong2/length(test[,11])
CART_error_rate2 

library(rpart.plot)
prp(CART_class)


# much fancier graph
fancyRpartPlot(CART_class) 





