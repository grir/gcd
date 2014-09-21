gcd
===
The script "run_analysis.R" is working as follows:

1. Loads activity labels fromthe file  "activity_labels.txt";
2. Loads and edits feature names from the file "features.txt";
3. Loads and merges test data fromteh files  "test/X_test.txt" and  "test/y_test.txt";
4. Loads and merges train data ("train/X_train.txt"and "train/y_train.txt");
5. Binds rows of both data sets to create the data frame "full";
6. Saves "fuil" to file "full.Rda";
7. Calculates means and standard deviations (variables "stdDev" and "means")
8. Adds activity labels to the data frame "full" #Labeling with the activity names;
9. Creates a  new set "newData" as specified in p. 5 of the assignment;
10. Writes "newData" to file "new_data.txt"



