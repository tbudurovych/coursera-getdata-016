run_analysis - codebook
====================

This codebook decribes the variables used in the code and in the data.

# R variables
Variable      |Units/Type      |Usage
------        |-----           |----------                                      
subjectTrain  ||Ids             |Training subjects from file `subject_train.txt`
actTrain      |Ids             |Activities from `y_train.txt`
measTrain     |[-1;1]          |Normalized feature measurements from `x_train.txt`
subjectTest   |Ids             |Test subjects from file `subject_test.txt`
actTest       |Ids             |Activities from `y_test.txt`
measTest      |[-1;1]          |Normalized feature measurements from `x_test.txt`
measFull      |[-1;1]          |`measTrain` and `measTest` bound
actFull       |Ids             |`actTrain` and `actTest` bound
subjectFull   |Ids             |`subjectTrain` and `subjectTest`
features      |Id;Desc         |A lookup table for features (`features.txt`)
measFull      |[-1;1]          |Reassigned with less columns - only those that have 'mean' or 'std' in name
activities    |Id;Desc         |A lookup for activity (`activity_labels.txt`)
actFull       |Desc            |Reassigned with descriptions of activities instead of Ids
full          |Ids;Desc;[-1;1] |Resulting subjectFull, actFull, measFull bound vertically
newSet        |Ids;Desc;[-1;1] |Datatable with a mean by column per activity and subject

# Column names

## Input data
Can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Is not included in this repo. It is expected that the data will be extracted into folder `data` and be ran under Windows.

## Input column names

Input column names are described in the following files:

 * `features_info.txt`: Shows information about the variables used on the feature vector.
 * `features.txt`: List of all features.
 * `README.txt`: about the experiment itself
 
## Output column names

 * `subject` - corresponds to a measuring subject
 * `activity` - activity of measuring
 * features - i.e. "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" etc.