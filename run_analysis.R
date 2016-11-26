## Script for assignment, "Getting and Cleaning Data" module

## Load libraries required for this script
library(dplyr)
library(reshape2)

## Check if data has already been downloaded, if not download and unzip
if(!file.exists("UCI HAR Dataset")){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="assigndata.zip",mode = "wb")
        unzip("assigndata.zip")
}

## Import labels for features and activities from the data set
labels_features <- read.table("./UCI HAR Dataset/features.txt")
labels_activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Import the subject and activity tables from the data set
data_test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
data_test_act <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
data_train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
data_train_act <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

## Import the observations from the data set
data_test_obs <- read.table("./UCI HAR Dataset/test/X_test.txt")
data_train_obs <- read.table("./UCI HAR Dataset/train/X_train.txt")

## Merge the components of the test and train tables into one cohesive table each
data_test <- cbind(data_test_act, data_test_subj, data_test_obs)
data_train <- cbind(data_train_act, data_train_subj, data_train_obs)

## Merge the test and train data frames
data_merged <- rbind(data_test,data_train)

## Tidy the merged data
## 1. Set the names for the dataframe to make tidier, using the feature labels imported above
## 2. Extract the mean and standard deviation variables
## 3. Convert the activity data from integer codes to descriptive names, using the activity labels imported above
## 4. Melt the dataset to comply with tidy data guidelines, column names are values
names(data_merged) <- c("activity","subject",as.character(labels_features[,2]))
data_tidy <- cbind(data_merged[,1:2],subset(data_merged,select=grepl("mean()|std()",names(data_merged))))
data_tidy$activity <- factor(data_tidy$activity,labels=as.character(labels_activities[,2]))
data_tidy <- melt(data_tidy,id=c("activity","subject"))

## Group the data and calculate the means by activity, subject, and variable
data_grouped <- group_by(data_tidy,activity,subject,variable)
data_means <- summarise(data_grouped,mean(value))