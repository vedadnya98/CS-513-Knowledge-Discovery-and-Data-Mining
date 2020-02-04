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
IBM_dist<-dist(IBM1)
#Implement Hcluster
hclust_results<-hclust(IBM_dist)
#Plot the cluster
plot(hclust_results)
hclust_2<-cutree(hclust_results,2)
#Forming the confusin matrix
table(hclust_2,IBM[,6])

