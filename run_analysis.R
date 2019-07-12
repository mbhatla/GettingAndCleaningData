library(data.table)
library(plyr)

# load test and training sets and the activities

testData <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
testData_activity <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
testData_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainData_activity <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
trainData_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# Combine  the Test and Train data sets

comb_data<- rbind(testData, trainData)
comb_activity<- rbind(testData_activity, trainData_activity)
comb_subject<-rbind(testData_subject,trainData_subject)



# Uses descriptive activity names to name the activities in the data set
names(comb_subject)<-c("Subject")
names(comb_activity)<- c("Activity")

dataFeaturesNames <- read.table("./UCI HAR Dataset/features.txt",head=FALSE)
names(comb_data)<- dataFeaturesNames$V2

activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
comb_activity$Activity<- factor(comb_activity$Activity,labels=activities$V2)


# merge the three tables into one
Data<-cbind(comb_subject,comb_activity)
Data<-cbind(Data,comb_data)

# Extract only the measurements on the mean and standard deviation for each measurement
# determine which columns contain "mean()" or "std()" 
mean_std_cols <- grepl("mean\\(\\)", names(Data)) | grepl("std\\(\\)", names(Data)) 

# keep the Subject and Activity columns 
mean_std_cols[1:2] <- TRUE 

# remove columns not selected
Data <- Data[, mean_std_cols] 

# Appropriately labels the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))


# Creates a tidy data set with the average of each variable for each 
#activity and each subject.
tidied<-ddply(Data, c("Subject","Activity"), numcolwise(mean))

# write the tidy data set to a .csv file 
write.table(tidied, "Human_Actvity_Tidy.txt", row.names=FALSE) 


