# Assignment
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject.

library(plyr)
library("reshape2")

# Get the data from internet
# setwd("~/Documents/coursera/Getting and Cleaning Data/coursera_GettingCleaningData_project")
# zipFilename <- "getdata_projectfiles_UCI_HAR_Dataset.zip"
# download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zipFilename)
# unzip(zipFilename,exdir=".")
# unlink(zipFilename)



helper <- function(){
	columnNames <- NULL
	columnNamesBool <- NULL
	columnNamesN <- NULL
	activityNames <- NULL

	# Removes unwanted variables from the data set and formats the column
	# names for readability.
	onlyWanted <- function(xData) {
		if(is.null(columnNamesBool)){
			columnNames <<- read.csv("UCI HAR Dataset/features.txt",
									sep="",
									header=F)
			columnNamesBool <<- grepl("mean|std",columnNames[,2])
			columnNamesN <<- grep("mean|std",columnNames[,2],value=T)

			# Clean columnames
			columnNamesN <<- gsub('-mean', ' Mean ', columnNamesN)
			columnNamesN <<- gsub('-std', ' Std ', columnNamesN)
			columnNamesN <<- gsub('[-()]', '', columnNamesN)

		}
		xData <- xData[,columnNames[columnNamesBool,1]]
		names(xData) <- columnNamesN
		xData
	}

	#adds the activities column as factors
	addActivities <- function(xData,yData){
		if(is.null(activityNames)){
			activityNames <<- read.csv("UCI HAR Dataset/activity_labels.txt",
									  sep="",
									  header=F)
		}
		oldLevels <- levels(factor(yData[,1]))
		newLevels <- levels(activityNames[,"V2"])
		xData[,"Activity"] <-mapvalues(yData[,1], from = oldLevels, to = newLevels)
		xData
	}

	addSubjects <- function(xData,subjData){
		xData[,"Subject"] <- subjData
		xData
	}

	list(onlyWanted = onlyWanted,
		 addActivities = addActivities,
		 addSubjects = addSubjects)
}

trainingData <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=F)
trainingActData <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=F)
trainingSubjData <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=F,colClasses=c("factor"))
testData <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=F)
testActData <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=F)
testSubjData <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=F,colClasses=c("factor"))

helper <- helper()

trainingData <- helper$onlyWanted(trainingData)
trainingData <- helper$addActivities(trainingData,trainingActData)
trainingData <- helper$addSubjects(trainingData,trainingSubjData)

testData <- helper$onlyWanted(testData)
testData <- helper$addActivities(testData,testActData)
testData <- helper$addSubjects(testData,testSubjData)

# Bind training and test data
data <- rbind(trainingData, testData)

meltIds <- c("Subject", "Activity")
meltVars <- setdiff(colnames(data), meltIds)
molten <- melt(data, id = meltIds, measure.vars = meltVars)

tidyData   = dcast(molten, Subject + Activity ~ variable, mean)

# print
tidyData

# write.table(tidyData, file = "./tidyData.txt",row.name=FALSE)
