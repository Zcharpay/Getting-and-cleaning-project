## Variables
- labels_features: dataframe with the feature labels imported from features.txt
- labels_activities: dataframe with the activity labels imported from activity_labels.txt
- data_test_subj: dataframe with the subject data from the test dataset
- data_test_act: dataframe with the activity data from the test dataset 
- data_train_subj: dataframe with the subject data from the training dataset
- data_train_act: dataframe with the activity data from the training dataset
- data_test_obs: dataframe with the observations from the test dataset
- data_train_obs: dataframe with the observations from the training dataset
- data_test: dataframe with the combined subject, activity, observations from the test dataset
- data_train: dataframe with the combined subject, activity, observations from the training dataset
- data_merged: dataframe with the merged test and training datasets
- data_tidy: dataframe with only the mean and stdev variables, tidied
- data_grouped: dataframe with the tidied data, grouped by activity, subject, and variable
- data_means: dataframe with the mean for each variable, for each activity and subject.

## Data
- activity_labels.txt: the labels for each numeric activity code
- features.txt: the list of features in the obseration datasets
- subject_test.txt: the subject data for the test dataset
- X_test.txt: observation data from the test dataset 
- y_test.txt: activity data from the test dataset
- subject_train.txt: the subject data for the training dataset
- X_train.txt: observation data from the training dataset 
- y_train.txt: activity data from the training dataset

## Data Wrangling
1. Merged the training and test datasets together (all three components: activity, subject, observation)
2. Use the feature labels and activity labels to tidy the dataset, and make it more readable
3. Extract only the variables that are mean() or std()
4. Reduce the variable columns to a single pair (variable and value) to avoid untidy values as column names
5. Grouped the tidy data by activity, subject, and variable
6. Calculated the average value for each variable, activity, subject combination.
