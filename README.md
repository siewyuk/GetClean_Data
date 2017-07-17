### Project Methodology

1. After downloading the data from the project provided link, extract the compressed file into the UCI HAR Dataset folder. 
2. Ensure the folder is set as the working directory using the setwd() function in RStudio.
3. Create run_analysis.R in the parent folder of UCI HAR Dataset.
4. Run source(`run_analysis.R`), then it will generate a new file `tidy_data.txt` in the working directory.

### Library Dependencies

To enable run_analysis.R file to execute, ensure the data.table and dplyr libraries are installed and loaded.

### Getting and Cleaning Data Project

1. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
2. The goal is to prepare tidy data that can be used for later analysis.
3. The required submission are:

    1) A tidy data set, 
    2) A Github repository with a script for performing the analysis, and 
    3) A codebook that describes the variables, the data, and any transformations or work that was performed to clean up the data
    4) A README.md in the repo with the scripts. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
