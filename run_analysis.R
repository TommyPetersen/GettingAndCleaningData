library("plyr")


#x- and y-train:
#---------------
dfxtrain <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
dfytrain <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")




#x- and y-test:
#--------------
dfxtest <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
dfytest <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")



#x- and y-totals:
#----------------
dfxtotal <- rbind(dfxtrain, dfxtest)
dfytotal <- rbind(dfytrain, dfytest)

names(dfytotal) <- c("activity")

dfytotal[, 1] <- factor(dfytotal[, 1], levels = 1:6, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


#features:
#---------
dffeatures <- read.table(file = "./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
vecfeatures <- dffeatures$V2
lvecfeatures <- grepl(pattern = "mean[(]|std[(]", x = vecfeatures, ignore.case = TRUE)
selectedindexes <- which(lvecfeatures)


#names
#-----
names(dfxtotal) <- vecfeatures


#narrow
#------
dfxnarrow <- dfxtotal[selectedindexes]
names(dfxnarrow) <- gsub(pattern = "-|[(][)]", replacement = "", x = tolower(names(dfxnarrow)))


#subject
#-------
dfsubjecttrain <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
dfsubjecttest <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")

dfsubjecttotal <- rbind(dfsubjecttrain, dfsubjecttest)
dfsubjecttotal[, 1] <- factor(x = dfsubjecttotal[, 1])

names(dfsubjecttotal) <- c("subject")


#Final data frame to be summarised:
#----------------------------------
dftotal <- cbind(dfxnarrow, dfsubjecttotal, dfytotal)


#Summarise:
#----------
dfmean <- ddply(dftotal, .(activity, subject), numcolwise(mean))

fun2 <- function(x){paste("avg", x, sep = "")}

names(dfmean) <- c(names(dfmean)[1:2], lapply(X = names(dfmean)[3:68], FUN = fun2))


#Write to tidy data set:
#------------------------
write.table(x = dfmean, file = "tidy.txt", row.names = FALSE)


#To read file into data frame:
#-----------------------------
#read.table(file = "filename", header = TRUE)


