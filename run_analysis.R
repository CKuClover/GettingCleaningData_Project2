##### Getting and Cleaning Data- Project 2 #####
# Suppose the folder "UCI HAR Dataset" with the datafiles is in the working directory.

##### Read datasets
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", dec = ".")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", dec = ".")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

feature <- read.table("./UCI HAR Dataset/features.txt")


##### Requirement 1. Merge Training and Test Data Sets
# Merge all training data sets to get complete training data with subject and test labels.
train_set <- cbind(Sub_train, Y_train, X_train)
# Merge all test data sets to get complete data with subject and test labels.
test_set <- cbind(Sub_test, Y_test, X_test)

# Append training data and test data sets into one data file.
all_data <- rbind(train_set, test_set)
# Replace column names with the features list
colnames(all_data) <- c('Subject','Activity', as.character(feature[,2]))


##### Requirement 2. Extract only thee measurements on means and standard deviations for each measurement.
# Assuming this means we are only keeping the means and standard deviations (SDs) columns from the data set.
# Columns containing means and SDs can be identified by searching in the column names list for elements that contain "Mean", "mean()" or "std()".
# Leaving out meanFreq columns because they are means of frequency componenets instead of the signals.
# Also leaving out vector angles (those with "angle()" in column names). The angles are computed using some of the mean signal vectors, but they are angles.
Cols <- colnames(all_data) #put all column names into a list.

KeepMCol <- grep("*mean[^F]", Cols) # record the column numbers that contain "mean" but not "meanF" into a variable.
KeepSCol <- grep("std..(-.)?$", Cols) # record the column numbers that contain "std" into a variable.  
Keep <- c(KeepMCol, KeepSCol) # Gather all column numbers into one list
KeepData <- all_data[,c(1, 2, sort(Keep))] # Narrow data set down to the mean and std columns (as well as activity and subjects). Sort the column numbers so they are in the order of the original data.


##### Requirement 3. Use descriptive activity names in the data set
KeepData[KeepData$Activity == 1,]$Activity <- "1. Walking"
KeepData[KeepData$Activity == 2,]$Activity <- "2. Walking_upstairs"
KeepData[KeepData$Activity == 3,]$Activity <- "3. Walking_downstairs"
KeepData[KeepData$Activity == 4,]$Activity <- "4. Sitting"
KeepData[KeepData$Activity == 5,]$Activity <- "5. Standing"
KeepData[KeepData$Activity == 6,]$Activity <- "6. Laying"


##### Requirement 4. Label columns with descriptive column names
OrigNames <- colnames(KeepData) # Store the original column names into a list
# Clarify time and frequency domains in the column names
NewNames <- sub('^t', 'Time Domain ', OrigNames)
NewNames <- sub('^f', 'Frequency Domain ', NewNames)
# Specify the axis in column names
NewNames <- sub('-X$', 'in the X-Axis', NewNames)
NewNames <- sub('-Y$', 'in the Y-Axis', NewNames)
NewNames <- sub('-Z$', 'in the Z-Axis', NewNames)
# Elaborate on the signal type
NewNames <- sub('BodyAccJerk', 'Body Acceleration Jerk Signal ', NewNames)
NewNames <- sub('BodyGyroJerk', 'Body Gyroscope Jerk Signal ', NewNames)
NewNames <- sub('BodyAcc', 'Body Acceleration Signal ', NewNames)
NewNames <- sub('GravityAcc', 'Gravity Acceleration Signal ', NewNames)
NewNames <- sub('BodyGyro', 'Body Gyroscope Signal ', NewNames)
NewNames <- sub('Mag', 'Magnitude ', NewNames)
# Explain mean() and std() in the column names
NewNames <- sub('-mean\\(\\)', 'Mean ', NewNames)
NewNames <- sub('-std\\(\\)', 'Standard Deviation ', NewNames)
# Correct mislabeled column names. A few of them seems to be repeating "Body".
NewNames <- sub('BodyBody', 'Body', NewNames)
# Clean up double spaces and trailing spaces if there are any
NewNames <- sub('  ', ' ', NewNames)
NewNames <- sub(' $', '', NewNames)
# Assign the new column names to the data set
colnames(KeepData) <- NewNames


##### Requirement 5. Create an independent tidy data set with the average of each variable for each activity and each subject.
#Set up a matrix to store tidy data.
TidyData <- data.frame(matrix(nrow = 180, ncol = 68))
colnames(TidyData) <- NewNames
# Set up the subjects and activities in TidyData
TidyData$Subject <- gl(30, 6)   # Allot 6 rows for each of the 30 subjects (1 row for each activity).
ALevels <- sort(unique(KeepData$Activity))  # Store the activity levels into a list.
TidyData$Activity <- rep(ALevels, 30)   # Repeat the activity levels 30 times for each subject in the Activity column.

# Use loop to populate the remaining cells in TidyData.
# In each iteration, the loop identifies cells with the specified subject and activity for the column, takes the average, and stores it in the corresponding cell in the tidy data set.
for (c in 1:66) { # loops through the 66 columns
    for (s in 1:30) { # loops through the 30 subjects
        for (a in ALevels) { # loops through the 6 activities
            SubData <- KeepData[KeepData$Subject == s & KeepData$Activity == a, c+2] #Column number need to be increased by 2 because the first two columns are Subject and Activity.
            meanVal <- mean(SubData) # Take the mean of all of records
            TidyData[TidyData$Subject == s & TidyData$Activity == a, c+2] <- meanVal  # Store the mean into TidyData
           
            }
    }
}

# Store the clean data set into a tab-delimited text file.
write.table(TidyData, file = "AverageActivitySignal.txt", sep = "\t", row.names = FALSE)
