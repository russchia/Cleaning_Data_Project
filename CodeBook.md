#Code Book

#Data Transformation Steps

Following data transformations are carried out by the run_analysis.R script.

  1. Read in all the raw data for test and train and the labels.
  2. Use descriptive activity names to name the activities in the data sets (train and test).
  3. Combine the test data and label the columns.
  4. Combine the train data and label columns.
  5. merge the test and train data.
  6. Extract the mean and standard deviation data.
  7. Remove the parenthese to clean up names.
  8. Create a second, indepenent tidy dataset with the average of each variable for each activity and each subject.  Write tidy data to a text file.
  
# Variable Descriptions

The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
