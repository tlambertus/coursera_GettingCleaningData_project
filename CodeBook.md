# Code Book

## Data source
The data for this excercise corresponds to the **Human Activity Recognition Using Smartphones** Data Set hosted on the UCI Machine Learning Repository [(link)](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The data was downloaded from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Objective
The main objective is to transform and sumarize the averages and std. dev. from all the original observations of the test and training data and compile them into one tidy easily understandable table.

## Data
The following lias describes the files used in the excercise. 

- *README.txt* Description of the datasource
- *features_info.txt*: Information about the variables on the features.txt file.
- *features.txt*: List of all features.
- *activity_labels.txt*: Links the observations in y_train.txt and y_test.txt with their description.
- *train/X_train.txt*: Training set.
- *train/y_train.txt*: Training activity observations.
- *train/subject_train.txt*: Id of the subjects linked to the main observation file.
- *test/X_test.txt*: Test set.
- *test/y_test.txt*: Test activity observations.
- *test/subject_test.txt*: Id of the subjects linked to the main observation file.

## Transformations
The following transformations were aplied to the data
- From X_train.txt and Xtest.txt. Dropped all variables that did not correspond to Std or Mean.
- Added the corresponding **Activity** variable form y_train.txt and y_test.txt
- Added the corresponding **Subject** variable from subject_train.txt and subject_test.txt
- Modifies the variable names to make them mor readable. (e.g. "tBodyAcc-mean()-X" to "tBodyAcc Mean X")
- joined both the **train** and **test** data.
- Extracted the Average of all the variables and summarized it grouping by Subject and activity.

## Result
The result is a text file `tidyData.txt` containing a summary the average of all the mean and std. dev. observations. Grouped by **Subject** and **Activity**. Both the training and test data were used for the summarization.

The variable names were simplified for easier reading.

### Variables

* Subject
* Activity
* tBodyAcc Mean X
* tBodyAcc Mean Y
* tBodyAcc Mean Z
* tBodyAcc Std X
* tBodyAcc Std Y
* tBodyAcc Std Z
* tGravityAcc Mean X
* tGravityAcc Mean Y
* tGravityAcc Mean Z
* tGravityAcc Std X
* tGravityAcc Std Y
* tGravityAcc Std Z
* tBodyAccJerk Mean X
* tBodyAccJerk Mean Y
* tBodyAccJerk Mean Z
* tBodyAccJerk Std X
* tBodyAccJerk Std Y
* tBodyAccJerk Std Z
* tBodyGyro Mean X
* tBodyGyro Mean Y
* tBodyGyro Mean Z
* tBodyGyro Std X
* tBodyGyro Std Y
* tBodyGyro Std Z
* tBodyGyroJerk Mean X
* tBodyGyroJerk Mean Y
* tBodyGyroJerk Mean Z
* tBodyGyroJerk Std X
* tBodyGyroJerk Std Y
* tBodyGyroJerk Std Z
* tBodyAccMag Mean 
* tBodyAccMag Std 
* tGravityAccMag Mean 
* tGravityAccMag Std 
* tBodyAccJerkMag Mean 
* tBodyAccJerkMag Std 
* tBodyGyroMag Mean 
* tBodyGyroMag Std 
* tBodyGyroJerkMag Mean 
* tBodyGyroJerkMag Std 
* fBodyAcc Mean X
* fBodyAcc Mean Y
* fBodyAcc Mean Z
* fBodyAcc Std X
* fBodyAcc Std Y
* fBodyAcc Std Z
* fBodyAcc Mean FreqX
* fBodyAcc Mean FreqY
* fBodyAcc Mean FreqZ
* fBodyAccJerk Mean X
* fBodyAccJerk Mean Y
* fBodyAccJerk Mean Z
* fBodyAccJerk Std X
* fBodyAccJerk Std Y
* fBodyAccJerk Std Z
* fBodyAccJerk Mean FreqX
* fBodyAccJerk Mean FreqY
* fBodyAccJerk Mean FreqZ
* fBodyGyro Mean X
* fBodyGyro Mean Y
* fBodyGyro Mean Z
* fBodyGyro Std X
* fBodyGyro Std Y
* fBodyGyro Std Z
* fBodyGyro Mean FreqX
* fBodyGyro Mean FreqY
* fBodyGyro Mean FreqZ
* fBodyAccMag Mean 
* fBodyAccMag Std 
* fBodyAccMag Mean Freq
* fBodyBodyAccJerkMag Mean 
* fBodyBodyAccJerkMag Std 
* fBodyBodyAccJerkMag Mean Freq
* fBodyBodyGyroMag Mean 
* fBodyBodyGyroMag Std 
* fBodyBodyGyroMag Mean Freq
* fBodyBodyGyroJerkMag Mean 
* fBodyBodyGyroJerkMag Std 
* fBodyBodyGyroJerkMag Mean Freq

### Activity variable labels
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Subject variable labels
There are 30 subjects identified by a number from 1 - 30.
