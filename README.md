# Data Cleaning Course Project


## Usage
* Clone the repo
* Open terminal/power shell and navigate into the cloned folder
* Run R interactive mode
* Include the R script with command `source('run_analysis.R')`
* Call `combine_data()` to  combine the test and train data based on the requirements from steps 1-4
* Call `summerise_data()` to create the other dataset based on the requirements from step 5


## Requirement
The script uses `dplr` package for `summerise_data` function


## Codebook
Column `subject_id` means which person(test subject) provided the measurement
Column `activity` means what kind of activity is the test subject is performing when the measurement is taken

The remaining columns are inherited from the original dataset `features_info.txt`. 
The following descriptions are adapted from the original file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

## Column names
subject_id
activity
t_body_acc_x_mean
t_body_acc_y_mean
t_body_acc_z_mean
t_body_acc_x_std
t_body_acc_y_std
t_body_acc_z_std
t_gravity_acc_x_mean
t_gravity_acc_y_mean
t_gravity_acc_z_mean
t_gravity_acc_x_std
t_gravity_acc_y_std
t_gravity_acc_z_std
t_body_acc_jerk_x_mean
t_body_acc_jerk_y_mean
t_body_acc_jerk_z_mean
t_body_acc_jerk_x_std
t_body_acc_jerk_y_std
t_body_acc_jerk_z_std
t_body_gyro_x_mean
t_body_gyro_y_mean
t_body_gyro_z_mean
t_body_gyro_x_std
t_body_gyro_y_std
t_body_gyro_z_std
t_body_gyro_jerk_x_mean
t_body_gyro_jerk_y_mean
t_body_gyro_jerk_z_mean
t_body_gyro_jerk_x_std
t_body_gyro_jerk_y_std
t_body_gyro_jerk_z_std
t_body_acc_mag_mean
t_body_acc_mag_std
t_gravity_acc_mag_mean
t_gravity_acc_mag_std
t_body_acc_jerk_mag_mean
t_body_acc_jerk_mag_std
t_body_gyro_mag_mean
t_body_gyro_mag_std
t_body_gyro_jerk_mag_mean
t_body_gyro_jerk_mag_std
f_body_acc_x_mean
f_body_acc_y_mean
f_body_acc_z_mean
f_body_acc_x_std
f_body_acc_y_std
f_body_acc_z_std
f_body_acc_jerk_x_mean
f_body_acc_jerk_y_mean
f_body_acc_jerk_z_mean
f_body_acc_jerk_x_std
f_body_acc_jerk_y_std
f_body_acc_jerk_z_std
f_body_gyro_x_mean
f_body_gyro_y_mean
f_body_gyro_z_mean
f_body_gyro_x_std
f_body_gyro_y_std
f_body_gyro_z_std
f_body_acc_mag_mean
f_body_acc_mag_std
f_body_body_acc_jerk_mag_mean
f_body_body_acc_jerk_mag_std
f_body_body_gyro_mag_mean
f_body_body_gyro_mag_std
f_body_body_gyro_jerk_mag_mean
f_body_body_gyro_jerk_mag_std