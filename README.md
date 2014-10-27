coursera_GettingCleaningData_project
====================================

Coursera's Getting and Cleaning Data course project

##Assignment

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Steps to execute the script

### Downloading the data manually
1. Copy the file "run_analysis.R" to the working directory
2. Download the data from http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and set it in the working directory.
3. unzip the file in the same directory. it should create a subdirectory named `UCI HAR Dataset`
4. Run `source(run_analysis.R)` it will generate the file `tidyData.txt` in the same directory.

### Have the script download the data
1. Copy the file "run_analysis.R" to the working directory
2. Uncomment the lines **15-18** of the script
3. Run `source(run_analysis.R)` it will generate the file `tidyData.txt` in the same directory.

## Dependencies

Depends on the folowing packages:
- reshape2
- plyr

## Code Book

The `CodeBook.md` file explains the data on thr resulting dataset