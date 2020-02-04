###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 9 - Clusters)

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603
# Purpose     : Homework 9

###### ******************************************** ######

################### Question ###################
####The “breast cancer dataset” in CANVAS was obtained from the University of Wisconsin Hospitals, Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.Use the Naïve Bayes methodology to develop a classification model for the Diagnosis. 

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

#Load Breast cancer data file CSV
cancerData <- read.csv(file.choose(),na.string="?")
cancerData<- cancerData[,-1]

#Remove any row with a missing value in any of the columns.
data<-na.omit(cancerData)

####### Problem 1
#  Cluster-1 Using hclust, categorize the Breast Cancer data into two (2) clusters based on all the features. Tabulate the clustered rows against the “Class” column. (Remove the rows with missing values first)

?hclust
?dist
?cutree

cancerData<-cancerData[-1]
cancer_dist<-dist(cancerData[,-1])
hclust_results<-hclust(cancer_dist)
plot(hclust_results)
hclust_2<-cutree(hclust_results,2)
table(hclust_2,cancerData[,1])


###### Problem 2
#  Cluster-2Using K-means, categorize the Breast Cancer data into two (2) clusters based on all the features. Tabulate the clustered rows against the “Class” column. . (Remove the rows with missing values first)

# clearing object environment
rm(list=ls())

# set working directory
setwd('~/R')

#Load Breast cancer data file CSV
cancerData <- read.csv(file.choose(),na.string="?")
cancerData<- cancerData[,-1]

#Remove any row with a missing value in any of the columns.
data<-na.omit(cancerData)

kmeans_2<- kmeans(cancerData[,-1],2,nstart = 10)
kmeans_2$cluster
table(kmeans_2$cluster,cancerData[,1])



