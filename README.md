

#GETTING AND CLEANING DATA - COURSE PROJECT - README


##Overview
There is only one R file and it is called "run_analysis.R". The flow is mostly
linear.


###Read and proces X and y
Data frames for the X- and y-data sets are created by reading
from the given data set files. The data frames are combined using
"rbind" into "dfxtotal" and "dfytotal".

The variable name for "dfytotal" is decided to be "activity" which
seems to be an acceptable descriptive variable name. Also, the values
for "activity" are required to be descriptive and not just the numbers
from 1 to 6. I use the function "factor" for this, since I can supply
the levels and the corresponding labels.


###Read and proces features
In order to name the columns of the measurements, I read the features
data set. It is required to only use measurements for mean and standard
deviation, so I use functions "grepl" and "which" to get the indexes for
the required columns. The pattern used for "grepl" is "mean[(]|std[(]"
since I found these as the only ones to be of the type of required
measurement. Note, there are other featurenames than the ones I have
chosen, but these have the word "mean" in the middle of the name, and
are weighted averages which are not of the required type.


###Update names and narrow the X data frame
As an initial naming, I name the X data frame using the names
from the features data set.
I use the selected indexes corresponding to the required types of
measurements for narrowing the X data frame. Then, I substitute
the names from the features data set with lower case names where
"-" and "()" have been removed. For this I use the function "gsub".
These variable names then seem to be acceptable as descriptive names.


###Read and proces subject
Data frames for subjects are read and combined into one data frame
called "dfsubjecttotal" using "rbind". Since I later need to group the total data frame on the subjects, I change this to a factor using the function "factor". The variable name for "dfytotal" is decided to be "subject" which seems to be an acceptable descriptive variable name.


###Make the final data frame to be summarized
The X data frame, the subject data frame and the activity data frame
are combined into the data frame called "dftotal" using the function
"cbind". This data frame can then be summarized with the mean values.


###Summarization
I use the function "ddply" from the package "plyr" for summarizing
by the means. This is done by a combination of the factors
"activity" and "subject" since this gives a good overview of how
the measurements for an activity vary over the subjects.

The names of the measurements are prepended with "avg" to indicate
that the requirered average has been computed. The prepend is done
using the function "paste".


###Write tidy data set
The summarized data frame is written out as a tidy data set
using the function "write.table" with "row.names = FALSE" as
required.


