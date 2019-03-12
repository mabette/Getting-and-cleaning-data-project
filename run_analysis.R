# 0. Downloading files
library(dplyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "data.zip", method="curl")

if(!file.exists("UCI HAR Dataset")) {
  unzip("data.zip")
}

# 1. Merging the training and the test sets to create one data set
# reading training set 
xTrain    <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain    <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# reading test set
xTest     <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest     <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjectTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# reading actvity labels and features
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features  <- read.table("./UCI HAR Dataset/features.txt")

# merging training and test sets
trainingData <- cbind(subjectTrain, yTrain, xTrain)
testData <- cbind(subjectTest, yTest, xTest)
finalData <- rbind(trainingData, testData)

# assigning column names
colnames(finalData) <-c("subject","activity", as.character(features[,2]))

# 2. Extracting only the measurements on the mean and standard deviation for each measurement
# selecting columns based on keywords
selected <- grepl("subject|activity|mean|std", colnames(finalData))
finalData <- finalData[, selected]

# 3. Using descriptive activity names to name the activities in the data set
# replacing numbers
finalData$activity <- activityLabels[finalData$activity, 2]

# 4. Appropriately labelling the data set with descriptive variable names
names(finalData) <- gsub("^t", "time", names(finalData))
names(finalData) <- gsub("^f", "frequency", names(finalData))
names(finalData) <- gsub("Acc", "Accelerometer", names(finalData))
names(finalData) <- gsub("Gyro", "Gyroscope", names(finalData))
names(finalData) <- gsub("Mag", "Magnitude", names(finalData))
names(finalData) <- gsub("std", "StandardDeviation", names(finalData))

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
means <- finalData %>% group_by(subject, activity) %>% summarise_each(list(mean))
write.table(means, "tidyData.txt", row.name=FALSE, quote=FALSE)

# Creating codebook
library(dataMaid)
makeCodebook(finalData, file="Codebook")

