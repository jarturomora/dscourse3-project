#######################################################################
#Task 1: Merges the training and the test sets to create one data set.#
#######################################################################
print("Task 1: Merging the training and test sets in a new data set.")
print("-------------------------------------------------------------")
# Loading feature names
featureNames <- read.table("data/features.txt")
# Load "training" data
print("Script Message: Loading training data, please wait...")
x_trainingData <- read.table("data/train/X_train.txt")
y_trainingData <- read.table("data/train/y_train.txt")
voluteer_trainData <- read.table("data/train/subject_train.txt")
print("Script Message: Traning data loaded :-)")

# Loading "tests" data
print("Script Message: Loading tests data, please wait...")
x_testsData <- read.table("data/test/X_test.txt")
y_testsData <- read.table("data/test/y_test.txt")
print("Script Message: Tests data loaded :-)")

# Loading "volunteers" data
print("Script Message: Loading volunteers data, please wait...")
voluteer_testData <- read.table("data/test/subject_test.txt")
print("Script Message: Volunteers data loaded :-)")

# Create a unique data set with traing and tests data
x_data <- rbind(x_trainingData, x_testsData)
colnames(x_data) <- featureNames[,2] # Gives solution to Task 4
y_data <- rbind(y_trainingData, y_testsData)
colnames(y_data) <- "Activity" # Gives solution to Task 4
volunteer_data <- rbind(voluteer_trainData, voluteer_testData)
colnames(volunteer_data) <- "Volunteer" # Gives solution to Task 4
# Final data merge
mergedData <- cbind(volunteer_data, y_data, x_data)
print("Script Message: New data set created, the new data frame is the 'mergedData' object :-)")

###############################################################################################
#Task 2: Extracts only the measurements on the mean and standard deviation on each measurement#
###############################################################################################
print("Task 2: Extracts only the measurements on the mean and standard deviation on each measurement")
print("---------------------------------------------------------------------------------------------")
# Here I use a regular expression to extract the colums related with a standard deviation or a mean value
task2Data <- mergedData[, grep("+(std|mean)\\(\\)", names(mergedData))]
filteredData <- cbind(volunteer_data, y_data, task2Data)
print("Script Message: New data set created, the new data frame is the 'filteredData' object :-)")

############################################################################
#Task 3: Uses descriptive activity names to name activities in the data set#
############################################################################
print("Task 3: Uses descriptive activity names to name activities in the data set")
print("--------------------------------------------------------------------------")
# Using a factor to change the name of the Activity-ids for their corresponding name.
print("Script Message: Change of the Activity-ids for their corresponding names starts")
activityName <- read.table("data/activity_labels.txt")
filteredData$Activity <- as.character(factor(filteredData$Activity, labels = activityName[,2]))
print("Script Message: Activities' names have been assigned to data set")

#######################################################################
#Task 4: Appropriately labels the data with descriptive variabe names.#
#######################################################################

# -------------------------
# Comments for code reviews
# -------------------------
# I have already perform this task at the begging of the code in lines 28, 30 and 32
print("Task 4: Appropriately labels the data with descriptive variable names")
print("---------------------------------------------------------------------")
print("Script Message: Labeling of variable names done :-)")

#####################################################################################################
#Task 5: Create a second tidy data set with the mean of each variable for each Subject and Activity.#
#####################################################################################################
print("Task 5: Create a second tidy data set with the mean of each variable for each Subject and Activity")
print("--------------------------------------------------------------------------------------------------")
library(plyr)
# Create the new data set aggregating Volunteers and Activities and calculating the mean of each variable
averageData <- aggregate(. ~Volunteer + Activity, filteredData, mean)
# Order the new data set just for fashion :-P
averageData <- averageData[order(averageData$Volunteer, averageData$Activity),]
# Create a text file with new tidy data
write.table(averageData, file = "data/newTidyData.txt", row.name = FALSE)
print("Script Message: New tidy data set created, the new data frame is the 'averageData' object and has been saved in the file 'data/newTidyData.txt' :-)")