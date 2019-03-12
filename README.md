# Coursera Getting and Cleaning Data course project

This repository contains the following files:

README.md containing the study design

tidyData.txt containing the created data set

CodeBook.md containing the codebook generated using dataMaid_1.2.0 package

run_analysis.R containing the R script that was used to create the data set


# Study design

Data Source: Human Activity Recognition Using Smartphones Dataset, Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Smartlab - Non Linear Complex Systems Laboratory

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Project was perford according to the following steps:

1. Merging the training and the test sets to create one data set.

2. Extracting only the measurements on the mean and standard deviation for each measurement.

3. Using descriptive activity names to name the activities in the data set.

4. Appropriately labeling the data set with descriptive variable names.

5. Ccreates a second, independent tidy data set with the average of each variable for each activity and each subject (tidyData.txt).


Session Info:

R version 3.5.1 (2018-07-02)

Platform: x86_64-apple-darwin15.6.0 (64-bit)

Running under: macOS  10.14.3


This script requires the dataMaid_1.2.0 and dplyr_0.8.0.1 package.
