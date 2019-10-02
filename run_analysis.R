run_analysis <- function() {

library(dplyr)
# download and unzip file
filename<-'Coursera_GCD_project.zip'

# checking if archieve download already exists
if(!file.exists(filename)){
  fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(fileURL,filename, method='curl')
}

# checking if folder exist
if(!file.exists('UCI HAR Dataset')){
  unzip(filename)
}

# read data
features<- read.table('UCI HAR Dataset/features.txt', col.names=c('n','feature'))
activities<- read.table('UCI HAR Dataset/activity_labels.txt', col.names=c('code','activity'))
test_subject<- read.table('UCI HAR Dataset/test/subject_test.txt', col.names='subject')
test_X<- read.table('UCI HAR Dataset/test/X_test.txt', col.names=features$feature)
test_Y<- read.table('UCI HAR Dataset/test/y_test.txt', col.names='activity')
train_subject<- read.table('UCI HAR Dataset/train/subject_train.txt', col.names='subject')
train_X<- read.table('UCI HAR Dataset/train/X_train.txt', col.names=features$feature)
train_Y<- read.table('UCI HAR Dataset/train/y_train.txt', col.names='activity')


# Merges the training and the test sets to create one data set.
test<-cbind(test_Y,test_subject,test_X)
rm(test_Y,test_subject,test_X) # rm extra dataset to make RAM clear
train<- cbind(train_Y,train_subject,train_X)
rm(train_Y,train_subject,train_X) # rm extra dataset to make RAM clear
data<- rbind(test,train)
rm(test,train,features)  # rm extra dataset to make RAM clear


# Extracts only the measurements on the mean and standard deviation for each measurement.
data<- data %>% select(subject, activity, contains('mean'), contains('std'))


# Uses descriptive activity names to name the activities in the data set
data$activity<-activities[data$activity,2]
rm(activities) # rm extra dataset to make RAM clear

# Appropriately labels the data set with descriptive variable names.
names(data)<-gsub('^f','Frequency',names(data))
names(data)<-gsub('^t','Time',names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("\\.", "", names(data))
names(data)<-gsub("mean", "Mean", names(data))
names(data)<-gsub("std", "Std", names(data))
names(data)<-gsub("angle", "Angle", names(data))
names(data)<-gsub("gravity", "Gravity", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))



# creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
SummarizedData <- data %>% 
  group_by(subject,activity) %>% 
  summarize_all(funs(mean))


# write results , remove unnecessary files and r objects
write.table(data, 'FinalData.txt',row.name=FALSE)
write.table(SummarizedData, 'SummarizedData.txt',row.name=FALSE)
unlink('UCI HAR Dataset', recursive=TRUE)
file.remove(filename)
rm(list=ls())

}
