#Getting and Cleaning Data Project

This document describes the data, transformations performed and variables 


## Source Data
The detailed description of the source data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data itself can be downloaded [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Inside the downloaded zipfile there is a "README.txt" file with detailed information about the dataset.

## Clean Up Transformations

* In the main directory of the zipfile there is a file called "features.txt", with a list of the variables included in the data. The column names of the "X_train.txt" and "X_test.txt" files inside the "train" and "test" subdirectories. Only the columns related to mean and standard deviation were selected for the data.

* Inside those subdirectories ("train" and "test") the structure of the files is the same, containing three files "subject", "Y" and "X". Those files are part of the same structure includind the subject, the activity(Y) and the related data(X) respectively and were binded together by column. Same process for train and test.

* The resulting datasets (train and test) are binded (merged) together by row to a complete new data table.

* The descriptive activity names are added to the new complete data table.

* The labels of the variables are improved, eliminating parenthesis and hyphens and using Uppercase on the first letter of "mean" and "std", making them easier to read.

* With this data table, create another tidy dataset with the average of each variable for each activity and each subject. For that we use the package "reshape2" and the instructions "melt" to create a narrow tall dataset that can be used as an input for "dcast" to calculate the average of every variable grouped by Activity and Subject.

* See the run_analysis.R and the README file for more details and documentation.



## Variables

Variables for the resulting new dataset called tidyData.txt, and uploaded as part of the project.

To read this file to a variable called "testTidy" you can use this instruction:

####testTidy <- read.table("tidyData.txt", header = TRUE)

### Identifiers

* SubjectId - The Id of the test subject, values 1 to 30
* ActivityName - The Activity performed (Posible values: WALKING, WALKING_UPSTAIRS,      WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING)

### Measurements

* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdevX
* tBodyAccStdevY
* tBodyAccStdevZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdevX
* tGravityAccStdevY
* tGravityAccStdevZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdevX
* tBodyAccJerkStdevY
* tBodyAccJerkStdevZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdevX
* tBodyGyroStdevY
* tBodyGyroStdevZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdevX
* tBodyGyroJerkStdevY
* tBodyGyroJerkStdevZ
* tBodyAccMagMean
* tBodyAccMagStdev
* tGravityAccMagMean
* tGravityAccMagStdev
* tBodyAccJerkMagMean
* tBodyAccJerkMagStdev
* tBodyGyroMagMean
* tBodyGyroMagStdev
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStdev
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdevX
* fBodyAccStdevY
* fBodyAccStdevZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdevX
* fBodyAccJerkStdevY
* fBodyAccJerkStdevZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdevX
* fBodyGyroStdevY
* fBodyGyroStdevZ
* fBodyAccMagMean
* fBodyAccMagStdev
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStdev
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStdev
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStdev
