# Create tidy dataset

## Description
Create a tidy dataset from data collected from the accelerometers from the Samsung Galaxy S smartphone.
## How Does It Work

The data is divided into a couple of different files. The script "run_analysis.R" transforms these into one tidy dataset called "tidy.txt".

First, the data from X_test is tidied. The column names are in "features.txt". They are added to the X_test values.
All activities are in "y_test.txt". They are used to transform the integers that represent activities to activity strings. The "activities"
column is added to X_test. Then we select only the activities column and all column that have means and std. Als a column 'category' with value 'test'
is added, so when later the rows of the training data is added, we can still tell where the data came from. At last, a column 'subject'is added, that identifies the person
whom the data belongs to.

The same actions are done for X_train. Then, the rows of X_test and X_train are joined. 

The tidy dataset is made into groups: by subject and activity(change to a factor column). A column with the mean of all variables (mean and std variables) by group is added.
Columns are given appropriate names and written to file.
