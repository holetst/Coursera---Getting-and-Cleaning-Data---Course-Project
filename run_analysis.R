
## Coursera - Getting and Cleaning Data
# Course Project

# This script will perform the following tasks:

# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


# 1. Merge the training and the test sets to create one data set.

# Set working directory to unziped folder UCI HAR Dataset
setwd("D:/Coursera/Getting_and_Cleaning_Data/Data/Project/UCI HAR Dataset")

# Read data from folder UCI HAR Dataset and subfolder train
features <- read.table('./features.txt',header=FALSE)
activityLabels <- read.table('./activity_labels.txt',header=FALSE)
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE)
xTrain <- read.table('./train/x_train.txt',header=FALSE)
yTrain <- read.table('./train/y_train.txt',header=FALSE)

# Assigin names to columns in read data files
colnames(activityLabels) <- c('activityID','activityLabel')
colnames(subjectTrain) <- "subjectID"
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityID"

# Create train dataset merging yTrain, subjectTrain, and xTrain
trainData = cbind(yTrain,subjectTrain,xTrain)

# Read data from subfolder test
subjectTest <- read.table('./test/subject_test.txt',header=FALSE)
xTest <- read.table('./test/x_test.txt',header=FALSE)
yTest <- read.table('./test/y_test.txt',header=FALSE)

# Assigin names to columns in read test data files
colnames(subjectTest) <- "subjectID"
colnames(xTest) <- features[,2]
colnames(yTest) <- "activityID"


# Create test dataset by merging yTest, subjectTest, and xTest
testData <- cbind(yTest,subjectTest,xTest)


# Combine train and test datasets
finalData <- rbind(trainData,testData)

# Create a vector of column names from the finalData
colNames <- colnames(finalData) 

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# Create a logicalVector that contains TRUE values for 
# the ID, mean(), and stddev() columns and FALSE for others
logicalVector <- (grepl("activity..",colNames) | 
                   grepl("subject..",colNames) | 
                   grepl("-mean..",colNames) & 
                   !grepl("-meanFreq..",colNames) & 
                   !grepl("mean..-",colNames) | 
                   grepl("-std..",colNames) & 
                   !grepl("-std()..-",colNames))

# Create subset of finalData table based on the logicalVector
finalData <- finalData[logicalVector==TRUE]

# 3. Use descriptive activity names to name the activities in the data set

# Merge the finalData set with the acitivityLables table to include descriptive activity names
finalData <- merge(finalData,activityLabels,by='activityID',all.x=TRUE)

# Updating the colNames vector to include the new column names after merge
colNames <- colnames(finalData)

# 4. Appropriately label the data set with descriptive activity names. 

for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
}

# Re-assigning new descriptive column names to the finalData dataset
colnames(finalData) <- colNames

# 5. Create a second, independent tidy data set with 
# the average of each variable for each activity and each subject. 

# Create a new dataset, finalDataNoActivityLabel without the activityLabel column
finalDataNoActivityLabel <- finalData[,names(finalData) != 'activityLabel']

# Calculates summary statistics for finalDataNoActivityLabel dataset 
# to include just the mean of each variable for each activity and each subject
tidyData <- aggregate(finalDataNoActivityLabel[,
            names(finalDataNoActivityLabel) != c('activityID','subjectID')],
            by=list(activityID=finalDataNoActivityLabel$activityID,
                    subjectID = finalDataNoActivityLabel$subjectID),mean)

# Merging the tidyData with activityLabel to include descriptive activity names
tidyData <- merge(tidyData,activityLabels,by='activityID',all.x=TRUE)

# Export the tidyData set 
write.table(tidyData, './tidyData.txt',row.name=FALSE,sep='\t')
