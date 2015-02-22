#######################################################################
#Task 1: Merges the training and the test sets to create one data set.#
#######################################################################
print("Task 1: Merging the training and test sets in a new data set.")
print("-------------------------------------------------------------")
# Loading feature names
featureNames <- read.table("data/features.txt")
# Load "training" data
x_trainingData <- read.table("data/train/X_train.txt")
y_trainingData <- read.table("data/train/y_train.txt")
voluteer_trainData <- read.table("data/train/subject_train.txt")
print("Script Message: Traning data loaded :-)")

# Loading "tests" data
x_testsData <- read.table("data/test/X_test.txt")
y_testsData <- read.table("data/test/y_test.txt")
voluteer_testData <- read.table("data/test/subject_test.txt")
print("Script Message: Tests data loaded :-)")

# Create a unique data set with traing and tests data
x_data <- rbind(x_trainingData, x_testsData)
colnames(x_data) <- featureNames[,2]
y_data <- rbind(y_trainingData, y_testsData)
colnames(y_data) <- "Activity"
volunteer_data <- rbind(voluteer_trainData, voluteer_testData)
# Final data merge
mergedData <- cbind(y_data,x_data)
print("Script Message: New data set created, the new data frame is the 'mergedData' object :-)")

###############################################################################################
#Task 2: Extracts only the measurements on the mean and standard deviation on each measurement#
###############################################################################################
print("Task 2: Extracts only the measurements on the mean and standard deviation on each measurement")
print("---------------------------------------------------------------------------------------------")
# Here I use a regular expression to extract the colums related with a standard deviation or a mean value
task2Data <- mergedData[, grep("+(std|mean)\\(\\)", names(mergedData))]
print("Script Message: New data set created, the new data frame is the 'task2Data' object :-)")

############################################################################
#Task 3: Uses descriptive activity names to name activities in the data set#
############################################################################
print("Task 3: Uses descriptive activity names to name activities in the data set")
print("--------------------------------------------------------------------------")
# Using a factor to change the name of the Activity-ids for their corresponding name.
print("Script Message: Change of the Activity-ids for their corresponding names starts")
activityName <- read.table("data/activity_labels.txt")
mergedData$Activity <- as.character(factor(mergedData$Activity, labels = activityName[,2]))
print("Script Message: Activities' names have been assigned to data set")