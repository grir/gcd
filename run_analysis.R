#clear all:
rm(list=ls())

#Load activity labels:
actLabels <- read.table("activity_labels.txt", header = FALSE)

#Load and edit feature names:
featureNames <- read.delim("features.txt", header = FALSE, sep=" ")
featureNames$V2 <- gsub("-", "", featureNames$V2)
featureNames$V2 <- gsub(",", "_", featureNames$V2)
featureNames$V2 <- gsub("\\(", "", featureNames$V2)
featureNames$V2 <- gsub("\\)", "", featureNames$V2)

#Load and merge test data:
t1 <- read.table("test/X_test.txt", header = FALSE) 
t1y <- read.table("test/y_test.txt", header = FALSE) 
#bind t1 and  corresponding activity labels:
tf1 <- cbind(t1, t1y[,1])
#assign appropriate column names
names(tf1) <- c(featureNames$V2, "activitylabels")
##################################################################

#Load and merge training data:
t2 <- read.table("train/X_train.txt", header = FALSE) 
t2y <- read.table("train/y_train.txt", header = FALSE) 
#bind t1 and  corresponding activity labels:
tf2 <- cbind(t2, t2y[,1])
#assign appropriate column names
names(tf2) <- c(featureNames$V2, "activitylabels")

##################################################################
#Bind rows of both data sets:
full <- rbind(tf1,tf2)
#Save data to file:
save(full, file="full.Rda")
#Calculate means and standard deviations:
numericalMeasurments<- length(names(full)) - 1
stdDev <- apply(full[,1:numericalMeasurments], 2, sd)
means <- apply(full[,1:numericalMeasurments], 2, mean)
#Labeling with the activity names:
anames <- c()
for(a in full$activitylabels){
    anames <- c(anames, as.character(actLabels$V2[a]))
} 
fullL <- cbind(anames, full)
full <- fullL
names(full)[1]<-"activity"
#New data set:
z1 <- matrix(nrow=length(actLabels$V2), ncol = numericalMeasurments)
newData <- data.frame(z1, row.names=actLabels$V2)
for(i in 1:6){  
  newData[i,] <-  colMeans(full[full$activitylabels == i,2:(ncol(full)-1)])
}
names(newData) <- names(full)[2:(ncol(full)-1)]

#writting data:

write.table(newData,file="new_data.txt",row.name=FALSE)







