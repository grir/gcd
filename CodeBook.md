CodeBook.md
===
Most importana variables:
 + actLabels - activity labels loded from the  file "activity_labels.txt";

 + featureNames - loaded and edited feature names fromthe file  "features.txt";
 + tf1 - test data set;
 + tf2 - training data set;
 + full - merged tf1 and tf2;
 + stdDev - standard deviations and means specified in p.2 of the assignment;
 + newData - new tidy data set as specified in p.5 of the assignment;
for(i in 1:6){  
  newData[i,] <-  colMeans(full[full$activitylabels == i,2:(ncol(full)-1)])
}
names(newData) <- names(full)[2:(ncol(full)-1)]

#writting data:

write.table(newData,file="new_data.txt",row.name=FALSE)



