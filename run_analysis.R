
# The script is broken into multiple functions, step by step
# so it is easier to test and repeat centain steps

data_folder <- "data"

# some utility functions used by other functions
util_read_both <- function(filename) {
    test <- read.table(file.path(data_folder, "test", paste(filename, "test.txt", sep = "_")))
    # train <- read.table(file.path(data_folder, "train", paste(filename, "train.txt", sep = "_")))
    # rbind(train, test)
    test
}




download_data <- function() {
    dest_file <- "data.zip"

    # if zip file is not downloaded, download the file
    if (!file.exists(dest_file)) {
        download.file(
            "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", # nolint
            destfile = dest_file
        )
    }

    # if the zip file is not expanded, unzip it
    if (!file.exists(data_folder)) {
        unzip(dest_file, exdir = ".")
        file.rename("UCI HAR Dataset", data_folder)
    }
}


combine_data <- function() {
    subject <- util_read_both("subject")
    names(subject) <- c("subject_id")
    activity <- util_read_both("y")
    names(activity) <- c("activity")
    activity_labels<-read.table(file.path(data_folder,'activity_labels.txt'))
    activity$activity<-factor(activity$activity,levels = activity_labels[1],labels = activity_labels[2])


    # measurement <- util_read_both("X")
    # Filter features with -mean and -std in their name
    features <- read.table(file.path(data_folder, "features.txt"))
    selected_features <- grep("(-mean)|(-std)", features[, 2])

    # selected_measurement <- measurement[, selected_features]
    # names(selected_measurement) <- features[selected_features, 2]

    combined <- merge(subject, activity)
    print(head(combined))
}