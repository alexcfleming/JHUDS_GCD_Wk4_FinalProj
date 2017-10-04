# Final Project for 'Getting and Cleaning Data' Course at JHU Coursera
## Data Science Specialization Program

by Alex C. Fleming (alex.c.fleming@gmail.com)
<https://github.com/alexcfleming/>

Folder Name:JHUDS_GCD_Wk4_FinalProj

The dataset for this project is used with the following citation:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

This project involves the ingesting data from a training and test set that measured the velocity and acceleration of 30 people wearing a smart phone. Each of the 30 people was recorded performing 6 different activities, and the raw data was sampled and then summarized in several different ways to produce a 561-feature vector for each record. There are different index files that link the 30 people to their records and the records to the activity being performed. 

The data from 21 subjects was used in the training set. The data from the remaining 9 subjects was used in the test set. Both the training and test sets represent all 6 activities. Each subject has a slightly different number of observations (between 288 (subject 9) and 409 (subject 25)).

This data set was intended to be used to train algorithms that recognize human activities from accelerometer and gyroscope signals, but we are using it as a test case to perform data manipulations.

The working folder contains the raw data (rawdata) and a folder with the output products of run_analysis.R which are two tidy datasets (tidydata). The output tidy data is written in CSV format.

The final tidy data sets include:
* One set (tidydataFull) with 82 variables and 10299 observations (all feature vectors for all observations)
* One set (tidydataAverages) with 82 variables and 180 observations (an average for each variable for each of the 6 activities for each of the 30 subjects)

** IMPORTANT NOTE: The analysis function assumed that the working directory has been set to the folder that contains this README, the CodeBook, and the rawdata/tidydata folders **
