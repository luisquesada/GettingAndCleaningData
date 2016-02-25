#Getting and Cleaning Data Project

There is only one script file called "run_analysis.R" that does all the work. You can run the script without any modifications.

The file has internal detailed documentation in every section explaining every step.

Inside the file, the requested steps for the project are executed:

 0. Clean workspace and load required libraries and files. Here the script verifies if the source dataset     is available and if not, downloads it. Also verifies if it is unzipped and if not, unzips it.
 
 1. Merge the training and the test sets to create one data set.
 2. Extract only the measurements on the mean and standard deviation for each measurement.
 
    It is possible do 1 and 2 in the same process, first select only the requested columns and work
    with the reduced train and test datasets to bind them together. See script and CodeBook.md for detailed steps.
 
 3. Use descriptive activity names to name the activities in the data set. For this the "merge" function     was used.
 
 4. Appropriately labels the data set with descriptive variable names. The gsub function was used for the     replacements.
 
 5. From the data set in step 4, creates a second, independent tidy data set with the average 
    of each variable for each activity and each subject. Here the package "reshape2" was used and the use     of the functions "melt" and "dcast" is described in detail.
    
    
When the execution of the script finishes, the result is the file "tidyData.txt" which complies with the definition of tidy data:

1. Each variable forms a column.

2. Each observation forms a row.

3. The table stores data about one kind of observation.
