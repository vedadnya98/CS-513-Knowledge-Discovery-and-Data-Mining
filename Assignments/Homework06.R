###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 6)

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 6

###### ******************************************** ######

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

# importing "class" package
library(class);

# Load Breast cancer data file CSV
breastCancerData <- data <- read.csv(file.choose())

# View Breast cancer data file 
View(breastCancerData)

# Remove any row with a missing value in any of the columns.
#breastCancerData<-na.omit(breastCancerData)

#Converting the Class into type factor
breastCancerData$Class<- factor(breastCancerData$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(breastCancerData$Class)

#Remove any row with a missing value in any of the columns.
data<-na.omit(breastCancerData)

# installed.packages()
# install.packages("C50", repos="http://R-Forge.R-project.org")
# install.packages("C50")


library('C50')
?C5.0
# C50  classification 
library('C50')

set.seed(111)

index<-sort(sample(nrow(breastCancerData),round(.25*nrow(breastCancerData))))

training<-breastCancerData[-index,]
test<-breastCancerData[index,]


C50_class <- C5.0( Class~.,data=training )

summary(C50_class )
dev.off()
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,11],C50=C50_predict)
wrong<- (test[,11]!=C50_predict)
errorRate<-sum(wrong)/length(test[,11])
errorRate