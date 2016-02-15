## Assignment for Coursera; Albert de Roos

library("dplyr")

## 1. Merges the training and the test sets to create one data set.

     # a. read in all the relevant data
     traindata <- read.table("UCI/train/X_train.txt", sep="", header=FALSE)
     trainsubjects <- read.table("UCI/train/subject_train.txt", sep="", header=FALSE)
     trainactivities <- read.table("UCI/train/y_train.txt", sep="", header=FALSE)
     testdata <- read.table("UCI/test/X_test.txt", sep="", header=FALSE) 
     testsubjects <- read.table("UCI/test/subject_test.txt", sep="", header=FALSE) 
     testactivities <- read.table("UCI/test/y_test.txt", sep="", header=FALSE) 
     activitieslabels <- read.table("UCI/activity_labels.txt", sep="", header=FALSE) 
     features <- read.table("UCI/features.txt", sep="", header=FALSE, colClasses = "character")  

     # b. append the subjects and the activities columns to both test and train datasets
     traindata2 <- cbind(trainsubjects, trainactivities, traindata) 
     testdata2 <- cbind(testsubjects, testactivities, testdata) 

     # c. merge and append labels the train and test data; subject id's are unique between the two sets and total 30 for the 2 sets
     merged <- rbind(traindata2, testdata2) #dim(10299x563)
     features2 <- rbind(c(563, "subjects"), c(562, "activities"), features)
     names(merged) <- features2$V2

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.  
     merged2 <- merged[ !duplicated(names(merged)) ]
     mergedsel <- select(merged2, matches("subjects|activities|mean|std"))
     
## 3. Uses descriptive activity names to name the activities in the data set
     names(activitieslabels) <- c("activity_id", "activity")     
     
## 4. Appropriately labels the data set with descriptive variable names. 
     
     mergedselfin <- merge(mergedsel, activitieslabels, sort = FALSE) %>%
          select(activity, subjects, activity_id, everything()) %>%
               select( -activity_id) %>%
                    arrange(activity, subjects)
     
## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
     
     summarized <- group_by(mergedselfin, activity, subjects) %>%
          summarize_each(funs(mean))

## 6. Write the data frame to a file
     
     write.csv(summarized, "tidymeans.csv")
     