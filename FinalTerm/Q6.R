###### Knowledge Discovery and Data Mining (CS 513B) ######

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# FINAL EXAMINATION

###### **************** ######
rm(list=ls())
fileName <- file.choose() 
IBM <- read.csv(fileName , na.strings = '?')
View(IBM)
summary(IBM)
#To factor the data set
IBM<-na.omit(IBM)
summary(IBM)
IBM1<-IBM[-3]
IBM1<-IBM1[-5]
kmeans_2<- kmeans(IBM1,2,nstart = 10)
kmeans_2$cluster
#Forming the confusin matrix
table(kmeans_2$cluster,IBM[,6])
