# download the data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

dir.create("data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", file.path("data", "dataset.zip"))
unzip(file.path("data", "dataset.zip"), exdir="data")

# utility function for pathnames
path <- function(file, sub = NULL) {
    base <- file.path("data", "UCI HAR Dataset")
    dir <- if (is.null(sub)) {
        base
    } else {
        file.path(base, sub)
    }
    file.path(dir, file)
}

# function to read the test or train data frames, combining multiple sources
readDataframe <- function(subDir, xFile, yFile, subjectFile) {
    # read the X file (data)
    x <- read.table(path(xFile, sub=subDir))
    names(x) <- featureLabels$name

    # read the y file (activity)
    # mutate the activity into a factor
    y <- read.table(path(yFile, sub=subDir)) %>%
        rename(activity=V1) %>%
        mutate(activity=as.factor(activity))

    # read the subject file
    subjects <- read.table(path(subjectFile, sub=subDir))
    names(subjects) <- c("subject")
    
    # create data frame, as the three data frames side by side
    # adding in the activity name as first column
    data.frame(subjects, y, x) %>%
        inner_join(activityLabels, by = "activity") %>%
        rename(activity_name = name) %>%
        relocate(activity_name, .before = 1)
}

library(dplyr)

# read the activity labels
activityLabels <- read.table(path("activity_labels.txt")) %>% rename(name=V2, activity=V1) %>% mutate(activity=as.factor(activity))

featureLabels <- read.table(path("features.txt")) %>% rename(name=V2, label=V1) %>% mutate(label=as.factor(label))

# read the training data
trainDf <- readDataframe("train", "X_train.txt", "y_train.txt", "subject_train.txt")

# read the test data
testDf <- readDataframe("test", "X_test.txt", "y_test.txt", "subject_test.txt")

# concatenate the two
allDf <- rbind(trainDf, testDf)

# only keep columns whoses names which match "mean" or "std" (for standard deviation)
keepNames <- grepl("(mean|activity_name|std|subject)", names(allDf),ignore.case=TRUE)
allDf <- allDf[, which(keepNames)]

# in the column names, replace non-alphanumeric characters with _, reduce multiple _ to single _, remove _ from start & end
names(allDf) <- gsub("^_", "", gsub("_$", "", gsub("_+", "_", gsub("[^a-zA-Z0-9]", "_", names(allDf)))))

# write out the tidy data set
write.table(x=allDf, file="tidy_dataset.txt", row.name=FALSE)

meanDf <- allDf %>% group_by(activity_name, subject) %>% summarise_all(mean)

# write out the mean dataset
write.table(x=meanDf, file="mean_dataset.txt", row.name=FALSE)



