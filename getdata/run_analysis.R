
## Coursera 'Getting and Cleaning Data Course Project' submitted by weretoaster

## NOTE: this function assumes that the data set files have already been downloaded and extracted from:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis <- function(){

    # Get data. Reads data sets from "~./UCI HAR Dataset" folder and assigns more meaningful data set names

    test_data <- read.table("test/X_test.txt")
    test_activities <- read.table("test/y_test.txt", colClasses = "factor")
    test_subjects <- read.table("test/subject_test.txt", colClasses = "factor")
    training_subjects <- read.table("train/subject_train.txt", colClasses = "factor")
    training_activities <- read.table("train/y_train.txt", colClasses = "factor")
    training_data <- read.table("train/X_train.txt")
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
    
    # 4. Appropriately labels the data sets with descriptive variable names.
    #    NOTE: This makes the data sets easier to manipulate in the following steps.
    
    tidy_features <- gsub("[[:punct:]]", "", features$V2)
    
    colnames(test_subjects) <- "subject"
    colnames(training_subjects) <- "subject"
    colnames(test_activities) <- "activity"
    colnames(training_activities) <- "activity"
    colnames(test_data) <- tidy_features
    colnames(training_data) <- tidy_features
  
    # 1. Merges the training and the test sets to create one data set.
    
    test <- cbind(test_subjects, test_activities, test_data)
    training <- cbind(training_subjects, training_activities, training_data)
    merged <- rbind(test, training)
    
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    #    NOTE: Interpreted as variables where 'mean' or 'std' appears in the variable name.
    
    mean_std <- cbind(merged[, 1:2],
                 merged[,grepl("mean", colnames(merged))],
                 merged[,grepl("std", colnames(merged))])
    
    # 3. Uses descriptive activity names to name the activities in the data set
    
    mean_std$activity <- factor(mean_std$activity, levels = c(1:6), labels = activity_labels$V2)
    
    # 4. NOTE: Course Project Step 4. is completed before Step 1. in this function.
    
    # 5. From the data set in step 4, creates a second, independent tidy data set with the average
    #    of each variable for each activity and each subject. NOTE: requires "dplyr" package.
    
    library(dplyr)

    tidy_data <- mean_std %>% group_by(subject, activity) %>%
                                summarise_each(funs(mean))

    #    Write data. Creates a new text file "tidydata.txt".
                                     
    write.table(tidy_data, "tidydata.txt", row.names = FALSE)
                                     
}
