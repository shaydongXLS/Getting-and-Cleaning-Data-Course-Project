Peer-graded Assignment: Getting and Cleaning Data Course Project
====

This repository id a **Shay Shao** submission for Getting and Cleaning Data project. This file contains the instructions on how to run the project

### Dataset
- [Human Activity Recognition Using Smartphones](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

- [Full description of the dataset where the data was obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Files
- `README.md` is a introduction of the repository and how to use it.

- `CodeBook.md` explains the how is the original data processed  produce the final result.

- `run_analysis.R` performs the data preparation.

- **Product Files**
    - `FinalData.txt` stores the resulted tidy data.
    
    - `SummarizedData.txt`stores the summarized data. e.g. the mean of each interested variable for each activity and each subject.


### To Run the Program
```r
source('run_analysis.R')
run_analysis()
```

### To clean the workspace
```r
file.remove('SummarizedData.txt','FinalData.txt')
```
If the workspace has been cleaned successfully, `r` will return `[1] TRUE TRUE`

<br/><br/>
Oct 2, 2019.
Shay Shao