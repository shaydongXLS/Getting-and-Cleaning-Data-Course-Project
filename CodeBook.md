CodeBook
====
The `run_analysis.R` script download and load in the required data, performs the 5 steps described in the project assignment, saves the result into `FinalData.txt` and `SummarizedData.txt`, and deletes all intermediate objects and files.

1. **Download the dataset**
    - Data saved in the folder `UCI HAR Dataset`

2. **Read data into variables**
    - `features` <- `UCI HAR Dataset/features.txt`561 rows, 2 columns 
  
      *features* stores all the feature name in column 2 and their index in column 1.
      
    - `activities` <- `UCI HAR Dataset/activity_labels.txt` : 6 rows, 2 columns
    
      List of the six activities and their corresponding index.
      
    - `test_subject` <- `UCI HAR Dataset/test/subject_test.txt`: 2947 rows, 1 column 
    
      contains the volunteer index of each observations in the test set
      
    - `test_X` <- `UCI HAR Dataset/test/X_test.txt`: 2947 rows, 561 columns 
    
      contains 561 feature values of the 2947 observations in the test set
      
    - `test_Y` <- `UCI HAR Dataset/test/y_test.txt`: 2947 rows, 1 columns 
      
      contains the labels ( activity code) of the 2947 observations in the test set
      
      
    - `train_subject` <- `UCI HAR Dataset/train/subject_train.txt`: 7352 rows, 1 column 
    
          
      contains the volunteer index of each observations in the training set
      
    - `train_X` <- `UCI HAR Dataset/train/X_train.txt`: 7352 rows, 561 columns 
    
      contains the 561 feature values of the 7352 observations in the training set
    
    - `train_Y` <- `UCI HAR Dataset/train/y_train.txt`
    
      contains the labels ( activity code) of the 7352 observations in the training set
      
3. **Merges and parses data**
    -  The training data and the testing data are merged to create one data set called `data`. Removed intermediate data to keep RAM clear.

4. **Select interested data**
    - Extracts only the measurements on the mean and standard deviation for each measurement.

5. **Renames the labels**
    - Uses descriptive activity names to name the activities in the data set. e.g.`1` is parsed into `WALKING`, `2` is parsed into `WALKING_UPSTAIRS`, etc.

6. **Renames the variables**
    - Appropriately labels the data set with descriptive variable names.
7. **summarize data**

    - Creates a second, independent tidy data set called `SummarizedData` with the average of each variable for each activity and each subject.

8. **Write results, remove unnecessary files and r objects**

    - Writes `data` into `FinalData.txt`. Wrtites `SummarizedData` into `SummarizedData.txt`.
    
    - removed `Coursera_GCD_project.zip` and folder `UCI HAR Dataset`