## Coursera - Getting-and-Cleaning-Data
### Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

#### To complete the course project, one has to accomplish the following tasks:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

#### To accomplish the tasks R Script run_analysis.R does the following:

1. Merges the training and the test sets to create one data set. Specifically,
	* Sets working directory to unziped folder UCI HAR Dataset. One needs to set the path to his own directory with project datasets.
	* Reads data from folder UCI HAR Dataset and subfolder train
	* Assigins names to columns in read data files
	* Creates train dataset merging data files with activity IDs, subject IDs, and features read from train subfolder
	* Reads data from subfolder test
	* Assigins names to columns in read test data files
	* Creates test dataset merging data files with activity IDs, subject IDs, and features read from test subfolder
	* Combines train and test datasets by rows to create a final dataset
	* Creates a vector of column names from the final dataset. This vector will be used to accomplish the second task described below

2. Extract only the measurements on the mean and standard deviation for each measurement. Specifically,
	* Creates a logical vector that contains TRUE values for ID, mean(), and stddev() columns and FALSE for others
	* Creates subset of final sataset created in step 1 based on the logical vector

3. Uses descriptive activity names to name the activities in the data set. Specifically,
	* Merges the final sataset created in step 1 set with the acitivity lables to include descriptive activity names
	* Updatings the vector of column names created in step 1 to include the new column names after merge

4. Appropriately labels the data set with descriptive activity names. Then re-assignings new descriptive column names to the final dataset

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Specifically,
	* Creates a new dataset without the column with activity labels
	* Calculates summary statistics for the new dataset to include just the mean of each variable for each activity and each subject
	* Merges the tidy dataset with dataset with activity labels to include descriptive activity names
	* Exports the tidy dataset set (file tidyData.txt in this case)

#### CodeBook.md describes variables claculated during the analysis

##### Acknowledgement
The way to approach the analysis within the Course project was based on ideas and suggestions provided by Heather Glenn Wade (see https://github.com/hglennrock for reference).
