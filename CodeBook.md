

#GETTING AND CLEANING DATA - COURSE PROJECT - CODEBOOK


##Summary
Most of the variables have been chosen from the set of variables given in the file "UCI HAR Dataset/features.txt". From this file, only  the variables with the pattern "mean()" or the pattern "std()" in their names have been chosen. These variables represent the requirement, that only mean and standard deviation measurements must be used. Note, that the file contains other variable names with the word "mean" in the middle of the name, but these represent weighted averages and are therefore not of the required type.

###Details
* **activity** "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

* **subject** Subject numbers 1 thru 30.

All of the following variables are averages of the corresponding variables found in the file "UCI HAR Dataset/features_info.txt". The averages are computed over groupings of "activity" and "subject".

* **avgtbodyaccmean(xyz)**

* **avgtbodyaccstd(xyz)**

* **avgtgravityaccmean(xyz)**

* **avgtgravityaccstd(xyz)**

* **avgtbodyaccjerkmean(xyz)**

* **avgtbodyaccjerkstd(xyz)**

* **avgtbodygyromean(xyz)**

* **avgtbodygyrostd(xyz)**

* **avgtbodygyrojerkmean(xyz)**

* **avgtbodygyrojerkstd(xyz)**

* **avgtbodyaccmagmean**

* **avgtbodyaccmagstd**

* **avgtgravityaccmagmean**

* **avgtgravityaccmagstd**

* **avgtbodyaccjerkmagmean**

* **avgtbodyaccjerkmagstd**

* **avgtbodygyromagmean**

* **avgtbodygyromagstd**

* **avgtbodygyrojerkmagmean**

* **avgtbodygyrojerkmagstd**

* **avgfbodyaccmean(xyz)**

* **avgfbodyaccstd(xyz)**

* **avgfbodyaccjerkmean(xyz)**

* **avgfbodyaccjerkstd(xyz)**

* **avgfbodygyromean(xyz)**

* **avgfbodygyrostd(xyz)**

* **avgfbodyaccmagmean**

* **avgfbodyaccmagstd**

* **avgfbodybodyaccjerkmagmean**

* **avgfbodybodyaccjerkmagstd**

* **avgfbodybodygyromagmean**

* **avgfbodybodygyromagstd**

* **avgfbodybodygyrojerkmagmean**

* **avgfbodybodygyrojerkmagstd**

