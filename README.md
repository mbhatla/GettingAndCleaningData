

This repository is hosting the Course Project for the course Getting and and Cleaning Data.

The purpose of this project is to get the data and subsequently cleaning this data set.  A Tidy data have been prepared so can be used for later analysis.

The data set "Human Activity Recognition Using Smartphones" has been taken from [UCI]
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Here are the steps that must be performed before running the R script:
1.Download the data zip file from this URL.
2.Unzip the file.

The Data Set has to be stored in `UCI HAR Dataset/` directory.

Once those steps are complete, you can run the R script (run_analysis.R). The `run_analysis.R` is the script that has been used to read and clean the data. It can be loaded in R/Rstudio and executed without any parameters.


The `CodeBook.md` describes the variables, the data, and the work that has been performed to clean up the data.


The result of the execution is that a `Human_Actvity_Tidy.txt` file is being created, that stores the data (mean and standard deviation of each measurement per activity&subject) for later analysis.