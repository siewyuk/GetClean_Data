#Load required libraries
library(data.table)
library(dplyr)

#Read supporting data
feaNames <- read.table("~/Downloads/UCI HAR Dataset/features.txt")
actLabels <- read.table("~/Downloads/UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Read train data
subTrain <- read.table("~/Downloads/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
acTrain <- read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt", header = FALSE)
feaTrain <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt", header = FALSE)

#Read test data
subTest <- read.table("~/Downloads/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
acTest <- read.table("~/Downloads/UCI HAR Dataset/test/y_test.txt", header = FALSE)
feaTest <- read.table("~/Downloads/UCI HAR Dataset/test/X_test.txt", header = FALSE)

#Task 1: Merge train and test data sets to create one dataset with rbind
subject <- rbind(subTrain, subTest)
activity <- rbind(acTrain, acTest)
features <- rbind(feaTrain, feaTest)

# Name the columns
colnames(features) <- t(feaNames[2])

# Merge data sets with cbind
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features, activity, subject)


#Task 2: Extracts only the measurements on the mean and standard deviation for each measurement
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case = TRUE)
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
dim(completeData)
extractedData <- completeData[, requiredColumns]
dim(extractedData)


#Task 3: Use descriptive activity names to name the activities in the data set
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(actLabels[i,2])
}
extractedData$Activity <- as.factor(extractedData$Activity)


#Task 4: Appropriately label the data set with descriptive variable names
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))


#Task 5: From the data set in step 4, create a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
#Order the entities in tidyData and write data into tidy_data.txt file that contains final processed data.
extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "tidy_data.txt", row.names = FALSE)
