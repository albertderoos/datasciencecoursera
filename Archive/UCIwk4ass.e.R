## Assignment for Coursera; Albert de Roos

library("dplyr")

## 1. Merges the training and the test sets to create one data set.

     # a. read in all the relevant data
     traindata <- read.table("UCI/train/X_train.txt", sep="", header=FALSE) # dim: 7352x561 original observations
     trainsubjects <- read.table("UCI/train/subject_train.txt", sep="", header=FALSE) # dim: 7352x1 (train subjects from 1-30)
     trainactivities <- read.table("UCI/train/y_train.txt", sep="", header=FALSE) # dim: 7351x1 (values 1 till 6)
     testdata <- read.table("UCI/test/X_test.txt", sep="", header=FALSE) # dim: 2947x561 original observations
     testsubjects <- read.table("UCI/test/subject_test.txt", sep="", header=FALSE) # dim: 2947x1 (test subjects from 1-30)
     testactivities <- read.table("UCI/test/y_test.txt", sep="", header=FALSE) # dim: 2947x1 (values 1 till 6)
     activitieslabels <- read.table("UCI/activity_labels.txt", sep="", header=FALSE) # dim: 6x2 id 1-6 to specific activity
     features <- read.table("UCI/features.txt", sep="", header=FALSE, colClasses = "character") # dim: 561x2 names of the column rows 

     # b. append the subjects and the activities columns to both test and train datasets
     traindata2 <- cbind(trainsubjects, trainactivities, traindata) #dim: 7352x563
     testdata2 <- cbind(testsubjects, testactivities, testdata) #dim: 2947x563

     # c. merge and append labels the train and test data; subject id's are unique between the two sets and total 30 for the 2 sets
     merged <- rbind(traindata2, testdata2) #dim(10299x563)
     features2 <- rbind(c(563, "subjects"), c(562, "activities"), features)
     names(merged) <- features2$V2

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.  
     merged2 <- merged[ !duplicated(names(merged)) ]
     mergedsel <- select(merged2, matches("subjects|activities|mean|std"))
     
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
     names(activitieslabels) <- c("activities", "name")
     mergedsel2 <- merge(mergedsel, activitieslabels, sort = FALSE)
     mergedsel3 <- select(mergedsel2, name, subjects, activities, everything())
     mergedselfin <- select(mergedsel3, -activities)
     
## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
     
     