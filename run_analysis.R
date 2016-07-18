# This program merges the training and the test sets to create one data set and
# extracts only the measurements on the mean and standard deviation for each measurement, then
# then uses descriptive activity names to name the activities in the data set with descriptive variable names
# finaly creates independent tidy data set with the average of each variable for each activity and each subject

library(plyr)

# Step 1:Merge the training and test sets to create one data set

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

dataset <- rbind(train_data, test_data)    # Merging the "x" data set
activities_dataset <- rbind(train_activities, test_activities)    # Merging the "y" data set
subject_dataset<- rbind(train_subjects, test_subjects)  # Merging the "subject" data set


# Step 2: Extract only the data on the mean and standard deviation 

features <- read.table("./UCI HAR Dataset/features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])  # select features with "mean" or "std" in their names
dataset <- dataset[, mean_and_std_features]  # subset the desired columns


# Step 3:Use descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities_dataset[, 1] <- activities[activities_dataset[, 1], 2]  # Replace values with correct activity names


# Step 4: Appropriately label the data set with descriptive variable names
dataset <- cbind(dataset, activities_dataset, subject_dataset) # bind all the data in a single data set
colnames(dataset) <- c(as.character(features[mean_and_std_features, 2]), "activity", "subject") # correct the column names


# Step 5: tidy data set with the average of each variable for each activity and each subject

averages_data <- ddply(dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "./UCI HAR Dataset/averages_data.txt", row.name=FALSE)


