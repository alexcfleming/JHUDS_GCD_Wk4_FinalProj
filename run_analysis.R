run_analysis <- function(...){
     #This will run the analysis that cleans and merges
     #the training and test sets to produce a tidy data set
     #this function assumes the working directory has been set
     #to the folder structure that contains the rawdata and tidydata folders
     library(dplyr)
     library(tidyr)
     library(readr)
     library(data.table)
     #Initialize data tables and load data
     X_train <- fread("./rawdata/train/X_train.txt")
     y_train <- fread("./rawdata/train/y_train.txt")
     subject_train <- fread("./rawdata/train/subject_train.txt")
     X_test <- fread("./rawdata/test/X_test.txt")
     y_test <- fread("./rawdata/test/Y_test.txt")
     subject_test <- fread("./rawdata/test/subject_test.txt")
     features <- fread("./rawdata/features.txt")
     activity_labels <- fread("./rawdata/activity_labels.txt")
     #Stack subject, training and test sets into one combined X and Y
     X <- bind_rows(X_train,X_test)
     y <- bind_rows(y_train,y_test)
     subject <- bind_rows(subject_train, subject_test)
     SubjectXY <- bind_cols(subject,X,y)
     #Sets names for certain columns in combined table
     setnames(SubjectXY, c("V1","V1100","V1101"),c("SubjectNum","V1","ActivityCode"))
     #Apply activity descriptions to Y index values as labels in new column
     setnames(activity_labels, c("V1","V2"), c("ActivityCode","ActivityDesc"))
     SubjectXYlabeled <- left_join(SubjectXY, activity_labels)
     #Remove Feature Columns to leave the mean and SD of each measurement
     meanfeatures <- features[V2 %like% "mean"]
     stdfeatures <- features[V2 %like% "std"]
     filteredfeatures <- bind_rows(meanfeatures, stdfeatures)
     orderedfeatures <- arrange(filteredfeatures, V1)
     orderedfeaturesDT <- data.table(orderedfeatures)
     orderedfeaturesDT[,V1:=sub("^","V", orderedfeaturesDT$V1)]
     keepindex <- orderedfeaturesDT$V1
     keepindex <- c(keepindex,"SubjectNum","ActivityCode","ActivityDesc")
     keep.bool <- names(SubjectXYlabeled) %in% keepindex
     SubjectXYlabeledreduced <- SubjectXYlabeled[,keep.bool]
     data.table(SubjectXYlabeledreduced)
     #Update final column names to readable form
     nameVec <- names(SubjectXYlabeledreduced)
     newNamesVec <- c("SubjectNum", orderedfeaturesDT$V2, "ActivityCode", "ActivityDesc")
     setnames(SubjectXYlabeledreduced, nameVec, newNamesVec)
     #Output the first final data file into CSV
     write.table(SubjectXYlabeledreduced,"./tidydata/tidydataFull.txt", row.names=FALSE)
     #Create the second tidy data file
     SubjectXYlabeledreducedDT <- data.table(SubjectXYlabeledreduced)
     newsummary <- SubjectXYlabeledreducedDT[, lapply(.SD, mean), by=.(SubjectXYlabeledreducedDT$SubjectNum,SubjectXYlabeledreducedDT$ActivityDesc)]
     newsummary[,ActivityCode:=NULL]
     setnames(newsummary, c("SubjectXYlabeledreducedDT","SubjectXYlabeledreducedDT.1"), c("SubjectNum","ActivityDesc"))
     #Output the second tidy data file into CSV
     write.table(newsummary,"./tidydata/tidydataAverages.txt", row.names=FALSE)
}