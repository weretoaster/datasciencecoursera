---
title: "Codebook"
author: "weretoaster"
date: "Saturday, January 24, 2015"
output: html_document
---

Coursera 'Getting and Cleaning Data Course Project' submitted by weretoaster

###CodeBook for run_analysis.R and tidydata.txt
The run_analysis.R function and the tidydata.txt file were developed to meet the requirements of the Coursera 'Getting and Cleaning Data Course Project'. Please also read the associated README.md file.

The variables in tidydata.txt are derived from source data in the UCI HAR Dataset.zip, obtained from the following website: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For information about how the source data was collected, please consult the README.txt and features_info.txt files included in the UCI HAR Dataset.zip folder.

####tidydata.txt variables created by run_analysis.R
The tidydata.txt data set contains 180 observations of 81 variables:

**subject**

Integer variable. Each value identifies the subject who performed the activity for each window sample. Values range from 1 to 30.

**activity**

Factor variable. Each value identifies the activity performed by the subject. There are six activities:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

**variables 3:81**

Numeric variables. Each of the 79 measurement variables is a grouped mean derived from the equivalent source data variables, which are described in more detail in the 'Source data variables' section below. 
Note: in run_analysis.R, punctuation was removed from the source variables to make them easier to read and manipulate. For example: tBodyAcc-mean()-X in the source data became tBodyAccmeanX in tidydata.txt.

####Source data variables
The source data was collected from Samsung Galaxy S smartphone accelerometers. A full description of the source data set is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

In addition to its activity label and an identifier of the subject who carried out the experiment, each record in the source data contains:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
- Triaxial Angular velocity from the gyroscope
- A 561-feature vector with time and frequency domain variables

Features are normalized and bounded within [-1,1] and each feature vector is a row on the text file.

Only those variables actually used by run_analysis.R are listed below. The individual source variables are combination of the signal, direction, and calculation on the signal, e.g. tBodyAcc-mean()-X

**Signals and directions**

The features selected for the source data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

**Calculations**

The set of variables in the source data that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- angle(): Angle between to vectors.

Additional vectors in the source data were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean
