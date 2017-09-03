run_analysis <- function(inputdata, ...){
     #This will run the analysis that cleans and merges
     #the training and test sets to produce a tidy data set
     library(dplyr)
     library(data.table)
     library(tidyr)
     library(readr)
     library(lubridate)
     library(Hmisc)
     #Initialize dataframe
     inputdata <- data.table(read.csv())
     #Load the data sets and convert to data frames
     #Adjust names and data formats for cross index
     #Merge and join output classifiers with input data
     #Stack training and test datasets into one
     #Conduct any transformations to make tidy
     #Adjust final names, variable definitions, and labels
     #Output the final data file into CSV and return
     return(tidydata)
}