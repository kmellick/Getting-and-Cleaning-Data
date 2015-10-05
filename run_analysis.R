library(dplyr)
library(RCurl)
library(data.table)
library(utils)
library(tidyr)

setwd("H:/Public/Coursera/Getting and Cleaning Data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./classproject.zip")
unzip("classproject.zip")

##================================
##Pull in general data identifiers
##================================
activitylabels <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt", col.names=c("V1", "Activity"))
features <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/features.txt", col.names=c("V1", "Features"))
features <- features[,2]

##================================
##pull in test tables
##================================
subjecttest <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
xtest <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt", col.names = features)
ytest <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/Y_test.txt", col.names = "ActivityLabel")
test <- cbind(xtest, ytest, subjecttest) %>% mutate(Set="test")

##================================
##pull in train tables
##================================
subjecttrain <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
xtrain <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt", col.names = features)
ytrain <- read.table("H://Public/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/Y_train.txt")
colnames(ytrain) <- "ActivityLabel"
train <- cbind(xtrain, ytrain, subjecttrain) %>% mutate(Set="train")

##==============================
##Combine Train and Data Sets
##==============================
data <- rbind(test, train)

##=========================================================
##Select only Columns with Mean or Standard Deviation Data
##=========================================================
data <- select(data, ActivityLabel, Set, Subject, contains("mean"), contains("std")) 

##===============================
##Reshape data into long format
##===============================
data <- gather(data, MeasurementType, Measurement, -ActivityLabel, -Subject, -Set)

##========================================
##Create Simple Identifiers for Activities
##========================================
data <- merge(data, activitylabels, by.x="ActivityLabel", by.y="V1")

##======================================================================
##Create Averages of Tidy Data by Subject Activity and Measurement Type
##======================================================================
data$Subject <- as.factor(data$Subject)
tidyavgdata <- group_by(data, Subject, MeasurementType, Activity) %>% summarize(MeanBy_Subject_MeasurementType_Activity = mean(Measurement, na.rm=T))
write.table(tidyavgdata, "tidyavgdata.txt", row.name=FALSE)

