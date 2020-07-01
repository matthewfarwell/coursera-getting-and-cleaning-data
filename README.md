Tidying the Human Activity Recognition Using Smartphones Dataset
================================================================
Version 1.0
[Getting and Cleaning Data Course](https://www.coursera.org/learn/data-cleaning)

Author: Matthew Farwell

# Introduction

This repo contains a script to download, read and clean a dataset for the Coursera course Getting and Cleaning Data.
It saves the new data set to *tidy_dataset.txt*. It then summarises (takes of the mean of all of the values) the data set, grouping by subject and activity. This is saved into *mean_dataset.txt*.

For the original data, please see https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
For the original specification for the project, see [Original Specification](#Original-Specification)


# Tidying script

The script *run_analysis.R* downloads, reads, and cleans the data and saves the data sets to two files. It merges the training data and the test data and adds in the activity names.

The *tidy_dataset.txt* set contains the subject, activity along with the only means and standard deviations from the original data set.
The *mean_dataset.txt* set contains the subject, activity along with the the mean values of each of the lines from the tidy data set for that activity/subject combinations.


# Original Specification

The specification for the project was the following:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

## Review criteria

- The submitted data set is tidy.
- The Github repo contains the required scripts.
- GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- The README that explains the analysis files is clear and understandable.
- The work submitted for this project is the work of the student who submitted it.

## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

License:
========
This work is based upon the Human Activity Recognition Using Smartphones Dataset. Use of this dataset in publications must be acknowledged by referencing the following publication [1]. Please contact them for more details 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Matthew Farwell