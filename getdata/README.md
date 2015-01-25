---
title: "README"
author: "weretoaster"
date: "Saturday, January 24, 2015"
output: html_document
---

Coursera 'Getting and Cleaning Data Course Project' submitted by weretoaster

###About run_analysis.R
This function was developed to meet the requirements of the Coursera 'Getting and Cleaning Data Course Project'. The run_analysis.R function takes data collected from Samsung Galaxy S smartphone accelerometers and creates a tidydata.txt file, which combines and summarises the data.

Please also read the CODEBOOK.txt file associated with this function for information about the variables in run_analysis.R and tidydata.txt.

A full description of the source data set is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Reading the tidydata.txt data set
The resulting tidydata.txt file contains a tidy data set with 180 observations of 81 variables. Information about the data in tidydata.txt can be found the CODEBOOK.txt file associated with the run_analysis function.

**The tidydata.txt file should be read into R as a data frame or data table, as the raw text file lacks the formatting to make it intelligible. The tidydata.txt file can be read into R using: read.table("tidydata.txt", header = TRUE)**

###Using the run_analysis() function
The run_analysis.R function assumes that the source data set files have already been downloaded and extracted from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R function also assumes that the the dplyr R package has been installed.

###Key steps in the run_analysis() function
The run_analysis.R function performs the following key steps on the original data, to create a new data set, tidydata.txt. Where the steps relate to a particular instruction in the Coursera 'Getting and Cleaning Data Course Project', these are labeled with the instruction number.

####Reads data sets from "~./UCI HAR Dataset" folder and assigns more meaningful data set names
Eight data sets are read into R as data frames containing the following information: list of test subjects; list of training subjects; list of test activities; list of training activities; test data; training data; list of activity names (labels for the activity codes in test data and training data); list of feature names (labels for the variable names of the test data and training data data sets).

The eight data frames are given names that make it clear which data is in each data set.

####Appropriately labels the data sets with descriptive variable names (Step 4 of course project)
It should be noted that, in this function, Course Project Step 4 is completed before Step 1. While giving the  various data frames meaningful variable names early in the analysis results in some repetition, the benefit is thath the data is more easily understood and therefore will be combined correctly.

The two lists of subjects are given the variable name "subjects" and the two lists of activities are given the variable name "activity".

The gsub() function is used to remove all punctuation from the list of feature names, to make these more meaningful. The tidied list of feature names is then used as variable names for the test data and training data.

####Merges the training and the test sets to create one data set (Step 1 of course project)
The three data frames relating to with the test data (subjects, activities and data) are combined (using the cbind() function). The same process is done on the the three data frames relating to with the training data (subjects, activities and data). The two resultant data frames are then merged together using the rbind() function.

####Extracts only the measurements on the mean and standard deviation for each measurement (Step 2 of course project)
The cbind() and grepl() functions are used to create a new data frame that only contains those variables where 'mean' or 'std' appears in the variable name, indicating that the variable contains mean or standard deviation data.

####Uses descriptive activity names to name the activities in the data set (Step 3 of course project)
The levels in the activity column of the data frame containing mean and standard deviation data are then labelled using the list of activity labels.
   
####From the data set in step 4, creates a second, independent tidy data set with the average (Step 5 of course project)
NOTE: Course Project Step 4. was completed before Step 1 in this function.

The run_analysis.R function uses the dplyr package to create a new data set which is grouped by subject and activity, and summarised using mean(), to give the average of each variable for each activity and each subject.
    
####Write data. Creates a new text file "tidydata.txt".
                                     
Finally, the function creates a new text file called tidydata.txt, in the same folder as the original data.
