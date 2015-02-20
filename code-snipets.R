# Step 1. Load data into dataframes for manipulation
# Loading column names
featureNames <- read.table("data/features.txt")
# Loading "tests" data
testData <- read.table("data/test/X_test.txt")
# Adding column names to test data
colnames(testData) <- featureNames[,2]
