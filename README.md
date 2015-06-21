# Collect, work with, and clean a data set

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This repo explains how all of the scripts work and how they are connected.  


### The raw data

One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked below represent data collected from the accelerometers from the Samsung Galaxy S II smartphone. A full description is available at the site where the data was obtained: 

[httg://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### The analysis [the R script](run_analysis.R) is doing

1. Merges the training and the test sets to create one data set
1. Extracts only the measurements on the mean and standard deviation for each measurement
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject, and output this tidy data set to a file - tidydata.txt.


### [The Code book](CodeBook.md)

The code book contains:

1. Information about the variables(including units) in the data set not contained in the tidy data 
1. Information about the summary choices
1. Information about the experimental study design
