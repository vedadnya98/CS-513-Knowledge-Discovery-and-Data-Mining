###### Knowledge Discovery and Data Mining (CS 513B) ######

# Course      : CS 513B
# First Name  : VEDADNYA
# Last Name   : JADHAV
# CWID        : 10450603

###### ******************************************** ######

#clearing object environment
rm(list=ls())

#set working directory
setwd('~/R')

# install.packages("dplyr")
# install.packages("plyr")
library(plyr)
library(dplyr)

#Load Adult Income Data file CSV
adultDataBase<-read.csv(file.choose())

# View Adult Income Data file CSV
View(adultDataBase)

#Min, Max, Median and Mean

#1.Age
summary(adultDataBase$Age)
#sd
age <- sd(adultDataBase$Age)

#2. Education_Years
summary(adultDataBase$Education_Years)
#sd
edu <- sd(adultDataBase$Education_Years)

#3.Hours_worked_Perweek
summary(adultDataBase$Hours_worked_Perweek)
#sd
hours <- sd(adultDataBase$Hours_worked_Perweek)


###	2. Replace the missing values with the median of the numbers

#Replacing all the ? with NA to find the medians
Adult <- adultDataBase[,c(2,6,11)]
Adult[Adult == " ?"] <- NA

#Removing all ? levels
Adult<-droplevels(Adult,exclude = c(' ?'))
levels(Adult$Occupation)

#Calculating median for WorkClass
workclass_median<-median(as.numeric(Adult$Workclass),na.rm = TRUE)

#Replacing ? with median level in adultDataBase
adultDataBase$Workclass[adultDataBase$Workclass == ' ?'] <- ' Private'
adultDataBase$Workclass <- droplevels(adultDataBase$Workclass)
levels(adultDataBase$Workclass)

#Calculating median for Occupation
occupation_median<-median(as.numeric(Adult$Occupation),na.rm = TRUE)
levels(Adult$Occupation)

#Replacing ? with median level in adultDataBase
adultDataBase$Occupation[adultDataBase$Occupation == " ?"] <- " Machine-op-inspct"
adultDataBase$Occupation <- droplevels(adultDataBase$Occupation)
levels(adultDataBase$Occupation)

#Calculating median for workclass
native_median<-median(as.numeric(Adult$Native_country),na.rm = TRUE)
levels(Adult$Native_country)

#Replacing ? with median level in adultDataBase
adultDataBase$Native_country[adultDataBase$Native_country == ' ?'] <- ' United-States'
adultDataBase$Native_country <- droplevels(adultDataBase$Native_country)
levels(adultDataBase$Native_country)


#3. Boxplot for numeric values
dev.off()
adultInBoxPlot <- boxplot(adultDataBase[,c(1,4,10)])

