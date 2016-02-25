###############################################################################
## Getting and Cleaning Data Course Project
## Author: Luis Quesada
## 2016-02-23
###############################################################################

###############################################################################
# 0. Clean workspace and load required libraries and files
###############################################################################

rm(list = ls())
library(reshape2)

fileName <- "getdata_projectfiles-UCI HAR Dataset.zip"

## If not already in the working directory, download the dataset
if (!file.exists(fileName))
{
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, fileName)
} 

## if not unzipped, unzip the data set
if (!file.exists("UCI HAR Dataset"))  ##Check the subdirectory
{
    unzip(fileName, overwrite = TRUE)
}

##########################################################################################
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# It is possible to do both in the same process, first select only the requested columns and work
# with the reduced train and test datasets to bind them together.
##########################################################################################

features <- read.table("UCI HAR Dataset/features.txt")

## Get only the features on the mean and standard deviation
## grep returns a vector with indexes of the requested columns
featuresRequested <- grep("mean[()]|std[()]", features[,2])


##Load and bind train data
trainData <- read.table("UCI HAR Dataset/train/x_train.txt")[featuresRequested] ##Only 66 columns, not 561
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

##Bind train variables together
trainData <- cbind(trainActivities, trainSubjects, trainData)

##Load and bind test data
testData <- read.table("UCI HAR Dataset/test/x_test.txt")[featuresRequested] ##Only 66 columns, not 561
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

##Bind test variables together
testData <- cbind(testActivities, testSubjects, testData)


## Then merge the train and test datasets in one dataset
completeData <- rbind(trainData, testData)

## Adjust the column Names of the complete dataset
featuresRequestedNames <- grep("mean[()]|std[()]", features[,2], value = TRUE)
colnames(completeData) <- c("ActivityId", "SubjectId", featuresRequestedNames)


##########################################################################################
# 3. Use descriptive activity names to name the activities in the data set
##########################################################################################

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("ActivityId", "ActivityName")

## Merge the completeData with the Activity Names
finalData = merge(activities, completeData, by="ActivityId", all.y=TRUE)


##########################################################################################
# 4. Appropriately labels the data set with descriptive variable names.
##########################################################################################

## Eliminates parenthesis and hyphens
featuresRequestedNames <- gsub("[(][)]", "", featuresRequestedNames)
featuresRequestedNames <- gsub("-", "", featuresRequestedNames)

## Use Uppercase on the first letter and more desciption for std
featuresRequestedNames <- gsub("mean", "Mean", featuresRequestedNames)
featuresRequestedNames <- gsub("std", "Stdev", featuresRequestedNames)

##Update the variable names
colnames(finalData) <- c("ActivityId", "ActivityName", "SubjectId", featuresRequestedNames)


#############################################################################################
# 5.From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
#############################################################################################

#First create a narrow, tall dataset using melt
#The new dataset will have 5 columns "ActivityId" "ActivityName", "SubjectId",
#the "variable" with the name of every value column and the "value" itself
#notice the measure.vars are the featuresRequestedNames
finalDataMelt <- melt(finalData, Id=c("ActivityName", "SubjectId"), measure.vars = featuresRequestedNames)

#Now with dcast, we ask for the combination of ActivityName + SubjectId broken down by the
#different variables, using the function "mean" to summarize the values
#The average (mean) of each variable for each activity (6 total) and each subject(30 total).
#A total of 180 rows (6*30) and 68 columns (ActivityName, SubjectId, 66 variables)
tidyData <- dcast(finalDataMelt, ActivityName + SubjectId ~ variable, mean)

#Finally save the data
write.table(tidyData, "tidyData.txt", row.names = FALSE)

## To read the tidyData
#testTidy <- read.table("tidyData.txt", header = TRUE)

