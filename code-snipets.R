#######################################################################
#Task 1: Merges the training and the test sets to create one data set.#
#######################################################################
# Step 1. Load data into dataframes for manipulation
# Loading feature names
featureNames <- read.table("data/features.txt")
# Load "training" data
x_trainingData <- read.table("data/train/X_train.txt")
y_trainingData <- read.table("data/train/y_train.txt")
voluteer_trainData <- read.table("data/train/subject_train.txt")

# Loading "tests" data
x_testsData <- read.table("data/test/X_test.txt")
y_testsData <- read.table("data/test/y_test.txt")
voluteer_testData <- read.table("data/test/subject_test.txt")

# Create a unique data set with traing and tests data
x_data <- rbind(x_trainingData, x_testsData)
y_data <- rbind(y_trainingData, y_testsData)
volunteer_data <- rbind(voluteer_trainData, voluteer_testData)

# Adding feature names to data set
colnames(x_data) <- featureNames[,2]