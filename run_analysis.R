# Make sure dplyr package is installed
if(!require('dplyr')) install.packages('dplyr')
library(dplyr)


# The script is broken into multiple functions, step by step
# so it is easier to test and repeat each step
# combine_data function fulfills the requirement of step 1-4
# summerise_data function fulfills the requirement of step 5

data_file <- "data.zip"
data_folder <- "data"

# Add a debugging toggle
# When debugging is True, only read the test data to save time
is_debugging <- TRUE

# Download and extract the data file
util_download_data <- function() {
  # if zip file is not downloaded, download the file
  if (!file.exists(data_file)) {
    download.file(
      "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
      destfile = data_file
    )
  }
  
  # if the zip file is not expanded, unzip it
  if (!file.exists(data_folder)) {
    unzip(data_file, exdir = ".")
    file.rename("UCI HAR Dataset", data_folder)
  }
}

# Utility function that read the same file from both test and train folder
# then join them together into one data frame
util_read_both <- function(filename) {
  
  # Generate full path to the -test.txt file
  filename<-paste(filename, 'test.txt', sep = '_')
  test_file <- file.path(data_folder,  'test', filename )
  
  # Read the test file
  test_df <- read.table(test_file)
  
  # Terminate the script here to skip reading the training file
  if (is_debugging)
    return(test_df)
  
  # Swap the 'test' path to 'train' path 
  train_file <- gsub('test', 'train', test_file)
  # Read the rain file
  train_df <-read.table(train_file)
  
  # Combine the 2 df together 
  rbind(train_df, test_df)
}

# Combine test and train measurements
# Select mean and std features only
# Add subject_id and activity columns as a complete data frame
combine_data <- function() {
  # Download and extract data
  util_download_data()
  # Read subject ids for each measurement
  subject <- util_read_both("subject")
  # Rename the column as subject_id, a more meaningful name
  names(subject) <- c("subject_id")
  
  # Read activity ids for each measurement
  activity <- util_read_both("y")
  # Rename the column as activity, a more meaningful name
  names(activity) <- c("activity")
  
  # Read activity labels
  activity_labels <-
    read.table(file.path(data_folder, 'activity_labels.txt'))
  activity[, 1] <- tolower(activity_labels[activity[, 1], 2])
  
  # Read features list
  features <- read.table(file.path(data_folder, "features.txt"))
  # Filter features with -mean and -std in their name, but not meanFreq
  selected_features <-
    grep("(-mean|-std)(?!Freq)", features[, 2], perl = T)
  
  
  # Read measurement
  measurement <- util_read_both("X")
  # Extracted selected features
  selected_measurement <- measurement[, selected_features]
  
  # Give feature columns same names as the original data
  names(selected_measurement) <- features[selected_features, 2]
  
  # Join all data together as 1 dataset
  cbind(subject, activity, selected_measurement)
}

# Summarise the combined data based on step 5 requirement
summarise_data<-function(){
  combine_data() %>%
    group_by(subject_id,activity) %>%
    summarise_all(mean)
}
