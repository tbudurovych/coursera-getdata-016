# The task is as follows:

#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

rm(list=ls())

# 1 - merge
#######


# read into 6 separate data.frames
subjectTrain <- read.table('data\\train\\subject_train.txt')
actTrain <- read.table('data\\train\\y_train.txt')
measTrain <- read.table('data\\train\\x_train.txt')
stopifnot(nrow(actTrain) == nrow(measTrain) && nrow(measTrain)  == nrow(subjectTrain))

subjectTest <- read.table('data\\test\\subject_test.txt')
actTest <- read.table('data\\test\\y_test.txt')
measTest <- read.table('data\\test\\x_test.txt')
stopifnot(nrow(actTest) == nrow(measTest) && nrow(measTest)  == nrow(subjectTest))

# combine rows - still keep columns separate
measFull <- rbind(measTrain, measTest)
actFull <- rbind(actTrain, actTest)
subjectFull <- rbind(subjectTrain, subjectTest)
names(subjectFull) <- "subject"

#2 - extract
#######

# only keep those that have 'mean' or 'std' in a feature name
features <- read.table('data\\features.txt')
colIndicesWithStdMean <- grep("(mean|std)", features[, 2])
measFull <- measFull[,colIndicesWithStdMean]
names(measFull) <- features[colIndicesWithStdMean, 2]

#3 - activity names
#######

activities <- read.table('data\\activity_labels.txt')
names(actFull) <- "activity"
activityIds <- actFull[,1]
# override ids with names
actFull[, 1] <- activities[activityIds, 2]

#4 - combine cols
#######
full <- cbind(subjectFull, actFull, measFull)

#5 - new by act and subj
#######
library(plyr)
newSet <- ddply(full, .(subject, activity), function(x) colMeans(x[, 3:ncol(full)]))
write.table(newSet, "new.txt", row.name=FALSE)

