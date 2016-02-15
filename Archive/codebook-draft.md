This files contains an explanation of the data in the UCI repo for the Github Account of Albert de Roos. Author: albert de Roos.

#Data
The raw data was obtained from the UCI machine learning repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). For full descriptions of the labels, we refer to the original dataset. From the dataset, the test and train data was taken. For each, the files X_train.txt (X-test.txt) contained the original measurements, Y-train.txt (Y-test.txt) contains the activities that belinged to the measurements and the subject_test.txt (subject_train.txt) contained the subjects (persons) from which the measurements were derived. The files features.txt and activity-labels.txt contain the specific features that were measured and the descruptive activity labels.Only the features that describe the the mean and std of the measurements were taken from the original set as described under 'transformations'.   


#Variables
The following variables are included in the set:

name: name of the activity that is being performed by the subject, in this case WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
subject: the id that identifies the specific person that performed the activities under 'name
features: there are the mean of several experiments that representing the mean and the std of several features derived from the accelerometer and gyroscope that were used in the experiments, 3-axial linear acceleration and 3-axial angular velocity. See also feautures_info.txt from the original files.


T#ransformations
1. The training and the test sets were merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement were extracted.  
3. Descriptive activity names to name the activities in the data set were given
4. Labels to the new the data set were given with descriptive variable names. 
5. A second, independent tidy data setwas created with the average of each variable for each activity and each subject.

