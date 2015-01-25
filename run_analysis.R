

#Import the data from training and test sets

data_train=read.table("./train/X_train.txt")
data_test=read.table("./test/X_test.txt")
subject_train=read.table("./train/subject_train.txt")
subject_test=read.table("./test/subject_test.txt")
activity_train=read.table("./train/y_train.txt")
activity_test=read.table("./test/y_test.txt")

features=read.table("features.txt",colClasses="character")$V2

activities_label=read.table("activity_labels.txt")

#Create the header of our clean data table and make it unique
header=c("Subject","Activity",features)
header=make.names(header, unique=TRUE)

#Combine the observations for both groups, then add the subject and activities 
#both sample and activities are first combined to contain both groups
data_observations=rbind(data_train[,],data_test[,])
subjects=rbind(subject_train,subject_test)
activities=rbind(activity_train,activity_test)

all_data=cbind(subjects,activities,data_observations)

#Substitute the activities numbers for the words
all_data[,2]=activities_label[all_data[,2],2]

#Finally, add header to our complete data set
colnames(all_data)=header

#Extract columns containing mean and std values
install.packages("dplyr")
library(dplyr)
get_mean=select(all_data, contains("mean"))
get_std=select(all_data,contains("std"))
data.clean=cbind(all_data$Subject,all_data$Activity,get_mean,get_std)
names(data.clean)[1]=paste("Subject")
names(data.clean)[2]=paste("Activity")


#Now step 4
require(plyr)
Average_data=ddply(data.clean, c('Subject','Activity'), colwise(mean))
write.table(Average_data, "tidy_data.txt", row.name=FALSE)
