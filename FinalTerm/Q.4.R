###### Knowledge Discovery and Data Mining (CS 513B) ######

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# FINAL EXAMINATION

###### **************** ######
rm(list=ls())
library(randomForest)
fileName <- file.choose() 
IBM <- read.csv(fileName , na.strings = '?')
View(IBM)
summary(IBM)
#To factor the data set
IBM<-na.omit(IBM)
summary(IBM)
index<-seq(1,nrow(IBM),by=3)
test<-IBM[index,]
training<-IBM[-index,]
dev.off()
#Implement Random Forest
model<- randomForest( Attrition~., data=training, importance=TRUE, ntree=1000)
importance(model)
varImpPlot(model)
#Prediction using test 
Prediction <- predict(model, test)
#Forming the confusin matrix
table(actual=test$Attrition,Prediction)
#Showing the error rate
wrong<- (test$Attrition!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 

