# CleanData_project: Importing the data
This Code Book explains the run_analysis.R in this same repository.

First, the two data tables, subject numbers and activity label for both the train and test set are uploaded. 
The features.txt file will be part of our header so it is imported too. And we need the activities_label in 
order to replace the activity number for the actual action.

The header of the large dataset includes the column name "Subject", "Activity" and all the features names.
It is stored in the variable "header". make.names is used to make all elements unique so that the select
function will work later on. 

The data points for train and test sets are combined into one and columns with the subject and activities
numbers added. The activities numbers are then replaces by the activity in words and the header is finally
added to the file. 
all_data contains all the data for all the activities and measurements of all subjects

# Selecting the mean and std measurements
From the all_data file I subset all the columns that contain "mean" or "std" using the function select.
Then cbind is used to make the new table with only mean or std values.
data.clean is the results for Step 4.

# Calculating the mean of the values for each activity and each subject
The ddply function is used to select by subject and activity and calculate the mean in the rest of the 
columns.
Average_data contains the average measurement per individual per activity.
