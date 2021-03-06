## Coursera - Getting-and-Cleaning-Data
### Course Project

#### File description

This file includes additional information about 
	* data 
	* variables
	* transformations

#### Data Source

The data for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#### Dataset Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.
Using its embedded accelerometer and gyroscope, it was possible to captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the train data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters, 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

Signals were used to estimate variables of the feature vector for each pattern:  

	* tBodyAcc-XYZ
	* tGravityAcc-XYZ
	* tBodyAccJerk-XYZ
	* tBodyGyro-XYZ
	* tBodyGyroJerk-XYZ
	* tBodyAccMag
	* tGravityAccMag
	* tBodyAccJerkMag
	* tBodyGyroMag
	* tBodyGyroJerkMag
	* fBodyAcc-XYZ
	* fBodyAccJerk-XYZ
	* fBodyGyro-XYZ
	* fBodyAccMag
	* fBodyAccJerkMag
	* fBodyGyroMag
	* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

	* mean(): Mean value
	* std(): Standard deviation
	* mad(): Median absolute deviation 
	* max(): Largest value in array
	* min(): Smallest value in array
	* sma(): Signal magnitude area
	* energy(): Energy measure. Sum of the squares divided by the number of values. 
	* iqr(): Interquartile range 
	* entropy(): Signal entropy
	* arCoeff(): Autorregresion coefficients with Burg order equal to 4
	* correlation(): correlation coefficient between two signals
	* maxInds(): index of the frequency component with largest magnitude
	* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	* skewness(): skewness of the frequency domain signal 
	* kurtosis(): kurtosis of the frequency domain signal 
	* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

	* gravityMean
	* tBodyAccMean
	* tBodyAccJerkMean
	* tBodyGyroMean
	* tBodyGyroJerkMean

#### Attribute Information

For each record in the dataset it is provided:
	* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	* Triaxial Angular velocity from the gyroscope.
	* A 561-feature vector with time and frequency domain variables.
	* Its activity label.
	* An identifier of the subject who carried out the experiment.

