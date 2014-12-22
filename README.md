How the script works
====================

Analysis `run_analysis.R` solves a course project for getting and cleaning data - https://www.coursera.org/course/getdata. This `readme` describes how `run_analysis.R` works.

# Steps
The script is divided into 5 sections, just mirroring what is taked in the course project.

## Step 1 - Merge

On this step we merge training and test data into one. For merging we use following source. There are 2 folders: `test` and `train`. From `test` folder we take 3 files: `x_test.txt`, `subject_test.txt`, `y_test.txt`. Same three files are taken from `train` folder respectively.

As result we bind rows into 3 new data frames and keep for later use.

## Step 2 - extracting

There are quite many features measured, we are interested only in those that contain `mean` or `std` in their names. To solve this step we use `features.txt` that has names of columns (measurements) that are used in the `x_test.txt` and `x_train.txt`.

As result we remove columns that we are not interested in from the `x_*` data.frame.

## Step 3 - activities

Activities are recorded as identifiers in the `y_*` files. However there is `activities.txt` that has a match beween identifier and a descriptive activity name (SITTING, WALKING etc).

As result of this we have meaningful names of activities in our `in-memory` data.frames.

## Step 4 - columns

At this step we bind together columns: activities, measurements, and activities.

## Step 5 - new data set

At this step we are aggregating column means by subject and activity.