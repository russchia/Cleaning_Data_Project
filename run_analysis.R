library(plyr)

# Read in all the data
testData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
featureLabels <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, colClasses="character")

# Uses descriptive activity names to name the activities in the data set
testActivity$V1 <- factor(testActivity$V1, levels=activityLabels$V1, labels=activityLabels$V2)
trainActivity$V1 <- factor(trainActivity$V1, levels=activityLabels$V1, labels=activityLabels$V2)

# Combine the test data and label columns
test <- cbind(testActivity, testSubject)
colnames(test) <- c("Activity", "Subject")
colnames(testData) <- featureLabels$V2
test <- cbind(test, testData)

# Combine the train data and label columns
train <- cbind(trainActivity, trainSubject)
colnames(train) <- c("Activity", "Subject")
colnames(trainData) <- featureLabels$V2
train <- cbind(train, trainData)

# merge the test and train data
data <- rbind(train, test)

# Extract the mean and standard deviation
data_mean_std <- data[,grepl("mean|std|Subject|Activity", names(data))]

# Remove parentheses to clean up names
names(data_mean_std) <- gsub('\\(|\\)',"",names(data_mean_std), perl = TRUE)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData = ddply(data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)
