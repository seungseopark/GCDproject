## run_analysis.R
##
## 1. Merges the training and the test sets to create one data set
## 2. Extracts only the measurements on the mean and standard deviation for
##    each measurement
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names
## 5. Creates a second, independent tidy data set with the average of each
##    variable for each activity and each subject

## Download and list files in the zip data file
##   zipFile: downloaded zip data file name
##   fileList: list of files in zipFile
# Uncomment below 3 lines if the zip data file is not downloaded
#zipFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#cat("Downloading the zip data file...")
#download.file(zipFileURL, destfile = "UCI_HAR_Dataset.zip", method = "curl")
zipFile <- "UCI_HAR_Dataset.zip"
fileList <- unzip(zipFile, list = TRUE)

## Read and merge the test and training sets to one data frame
##   test: fileList$Name[17], "UCI HAR Dataset/test/X_test.txt"
##   training: fileList$Name[31], "UCI HAR Dataset/train/X_train.txt"
cat("Reading the data set...\n")
dataSet <- rbind(read.table(unz(zipFile, fileList$Name[17])),
                 read.table(unz(zipFile, fileList$Name[31])))

## Extract only the measurements on the mean and standard deviation
##   features: fileList$Name[2], "UCI HAR Dataset/features.txt"
##   colNames: descriptive variable names of the data set
cat("Analysing the data...\n")
features <- read.table(unz(zipFile, fileList$Name[2]))
subsetFeatures <- sort(c(grep("mean()", features$V2, fixed = TRUE),
                         grep("std()", features$V2, fixed = TRUE)))
dataSet <- dataSet[, subsetFeatures]
colNames <- as.vector(features$V2[subsetFeatures])

## Use descriptive activity names to name the activities in the data set
## using subject number and activity name
##   subject: fileList$Name[16], "UCI HAR Dataset/test/subject_test.txt"
##            fileList$Name[30], "UCI HAR Dataset/train/subject_train.txt"
##   activytyLabels : fileList$Name[1], "UCI HAR Dataset/activity_labels.txt"
##   activity: fileList$Name[18], "UCI HAR Dataset/test/y_test.txt"
##             fileList$Name[32], "UCI HAR Dataset/train/y_train.txt"
subject <- rbind(read.table(unz(zipFile, fileList$Name[16])),
                 read.table(unz(zipFile, fileList$Name[30])))
activityLabels <- read.table(unz(zipFile, fileList$Name[1]))
activity <- rbind(read.table(unz(zipFile, fileList$Name[18])),
                  read.table(unz(zipFile, fileList$Name[32])))
dataSet <- cbind(subject, activityLabels$V2[activity$V1], dataSet)
colNames <- c("subject", "activity", colNames)

## Labels the data set with descriptive variable names using colNames
colnames(dataSet) <- colNames

## Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject
require("dplyr")
dataSetGrp <- group_by(dataSet, subject, activity)
dataSetGrpAvg <- summarise_each(dataSetGrp, funs(mean))

## Writes the tidy data set to a file
cat("Writing the tidy data set to a file[tidydata.txt].\n")
write.table(dataSetGrpAvg, file = "tidydata.txt", row.names = FALSE)
