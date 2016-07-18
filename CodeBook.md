# Introduction 
This program merges the training and the test sets to create one data set and extracts only the measurements on the mean and 
standard deviation for each measurement, then then uses descriptive activity names to name the activities in the data set with 
descriptive variable names. Finaly, it creates independent tidy data set with the average of each variable for each activity and each subject

# Variables
* train_data, train_activities, train_subject, test_data, test_activities, and test_subjects contain the data from the downloaded files.
* dataset, activities_dataset, and subject_dataset are created by merging the previous datasets to further analysis.
* features contains the correct names for the dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
* dataset combines column-wise the dataset, activities_dataset and subject_dataset.
* Finally, averages_data.txt contains the relevant averages.
