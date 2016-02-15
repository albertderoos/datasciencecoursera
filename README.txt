This file belongs to the UCI repository by Albert de Roos (Github) and the accompanying R script named run_analysis.R 

General desciption of original dataset
One of the most exciting areas in all of data science right now is wearable computing. The data frame that is presented here represents data collected from the accelerometers from the Samsung Galaxy S smartphone and can be used to calibrate signals from these devices to specific activities such as walking, climbing, laying etc.

Raw data on the signals from were obtained for use of 'Human Activity Recognition Using Smartphones Data Set' by experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. We refer to this as the 'UCI dataset'and documentation can be fiund here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


Handling and transformation of the UCI dataset
The dataset here are4 based on the UCI test set and represent the mean of the measurements for the individual activities for the specific persons that performed these activities. From the measurements, the mean is given for a number of individual measurements  as given in the original data set. For instance for the activity of 'walking' they give per subject (there are 30 persons/subjects) the mean of the specified features. 

The script provided transforms the original data in several steps. First, the training and the test sets were combined into one set and labels were attached to the columns of measurements. Also, the subjects and activities related to the measurements were included in the dataset from the reference files and appropriately labeled. Only the mean and std measurements were retained from the set. The activities were replaced with descriptive values from the reference set that was included (activity_labels). Finally, the dataset was grouped by activity name and subject and the mean per activity and subject was calculated.

Script Output
The entire R script provided will produce a comma-separated file called tidymeans.csv with the means per activity and subject. The dplyr library was used to clean, aggregrate and summarize the data.