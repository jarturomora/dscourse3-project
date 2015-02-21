#######################################################################
#Task 1: Merges the training and the test sets to create one data set.#
#######################################################################
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
colnames(y_data) <- "Activity-id"
volunteer_data <- rbind(voluteer_trainData, voluteer_testData)
# Final data merge
mergedData <- cbind(y_data,x_data)
print("Script Message: New data set created :-)")