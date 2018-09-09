CODEBOOK

The original data of 30 subjects performing 6 different activities was measured using the accelerometers of Samsung Galaxy S smartphones.
The authors have processed the signals to remove noise, standardize the signals, transform them into frequency and time domain, and estimated the body acceleration and gravity of each measurement, resulting in a data set with 561 features.
For more details on the original data set, see the referenced article.

This program takes a subset of 66 features from the original data and summarizes it for each activity performed by each subject.
In the original data set, each subject performs the same activity a number of times. This program computes the average signal from the same subject performing the same activity, resulting in a new data set with 180 rows (6 rows for each of the 30 subjects) and 68 columns (66 features, subject, and activity).

Detailed steps of the program are:
1. Piece the data sets into one.
   The original data was split into training and testing sets.
   The program first added the subject and activity data to the measurements, then the training and testing data sets were appended.
   Finally, the list of features was assigned as the column names for the data set.
2. Generate a subset data of 66 features.
   We are only interested in the signal means and standard deviations measured by the accelerometers.
   Vector angle columns are computed using some of the mean vectors, but they are angles, thus not included.
   meanFreq columns are also not included because they are the weighted mean of frequency compoments instead of non-weighted average of the signal measured by accelerometers.
   The program identifies column names that include "mean" and "std", but not "meanFreq", and stores them in another data frame with the subject and activity ID's to be further processed.
3. The program substitute the activity ID's with the activity name.
   This was done by re-assigning the activity names to cells with corresponding activity ID.
4. Renames columns so they are self-explanatory.
   Sub function was used to replace the shortened column names with the actual meanings.
5. Computes mean signal means and mean signal standard deviations for each activity performed by each subject.
   Nested for loops were used to go through each of the 66 feature columns.
   For each column, all rows where subject X performs activity Y were identified. Then the average of these signals were computed and then stored into the output table for subject X performing activity Y.

   
The columns in the "AverageActivitySignal.txt" are: (Columns 3 through 68 are as self-explanatory as can be. I'll omit the explainations there.)

 [1] "Subject" - The subject who performed the test activity. Ranges from 1 to 30. 
 [2] "Activity" - Test activity performed. Either walking, walking- up stairs, walking- down staris, sitting, standing, or laying.
 [3] "Time Domain Body Acceleration Signal Mean in the X-Axis" 
 [4] "Time Domain Body Acceleration Signal Mean in the Y-Axis" 
 [5] "Time Domain Body Acceleration Signal Mean in the Z-Axis" 
 [6] "Time Domain Body Acceleration Signal Standard Deviation in the X-Axis"
 [7] "Time Domain Body Acceleration Signal Standard Deviation in the Y-Axis" 
 [8] "Time Domain Body Acceleration Signal Standard Deviation in the Z-Axis"
 [9] "Time Domain Gravity Acceleration Signal Mean in the X-Axis"
 [10] "Time Domain Gravity Acceleration Signal Mean in the Y-Axis"
 [11] "Time Domain Gravity Acceleration Signal Mean in the Z-Axis"
 [12] "Time Domain Gravity Acceleration Signal Standard Deviation in the X-Axis"
 [13] "Time Domain Gravity Acceleration Signal Standard Deviation in the Y-Axis" 
 [14] "Time Domain Gravity Acceleration Signal Standard Deviation in the Z-Axis"  
 [15] "Time Domain Body Acceleration Jerk Signal Mean in the X-Axis"   
 [16] "Time Domain Body Acceleration Jerk Signal Mean in the Y-Axis" 
 [17] "Time Domain Body Acceleration Jerk Signal Mean in the Z-Axis" 
 [18] "Time Domain Body Acceleration Jerk Signal Standard Deviation in the X-Axis" 
 [19] "Time Domain Body Acceleration Jerk Signal Standard Deviation in the Y-Axis" 
 [20] "Time Domain Body Acceleration Jerk Signal Standard Deviation in the Z-Axis"
 [21] "Time Domain Body Gyroscope Signal Mean in the X-Axis"  
 [22] "Time Domain Body Gyroscope Signal Mean in the Y-Axis" 
 [23] "Time Domain Body Gyroscope Signal Mean in the Z-Axis"  
 [24] "Time Domain Body Gyroscope Signal Standard Deviation in the X-Axis"
 [25] "Time Domain Body Gyroscope Signal Standard Deviation in the Y-Axis"  
 [26] "Time Domain Body Gyroscope Signal Standard Deviation in the Z-Axis"  
 [27] "Time Domain Body Gyroscope Jerk Signal Mean in the X-Axis"  
 [28] "Time Domain Body Gyroscope Jerk Signal Mean in the Y-Axis"  
 [29] "Time Domain Body Gyroscope Jerk Signal Mean in the Z-Axis" 
 [30] "Time Domain Body Gyroscope Jerk Signal Standard Deviation in the X-Axis" 
 [31] "Time Domain Body Gyroscope Jerk Signal Standard Deviation in the Y-Axis" 
 [32] "Time Domain Body Gyroscope Jerk Signal Standard Deviation in the Z-Axis" 
 [33] "Time Domain Body Acceleration Signal Magnitude Mean" 
 [34] "Time Domain Body Acceleration Signal Magnitude Standard Deviation" 
 [35] "Time Domain Gravity Acceleration Signal Magnitude Mean" 
 [36] "Time Domain Gravity Acceleration Signal Magnitude Standard Deviation" 
 [37] "Time Domain Body Acceleration Jerk Signal Magnitude Mean" 
 [38] "Time Domain Body Acceleration Jerk Signal Magnitude Standard Deviation" 
 [39] "Time Domain Body Gyroscope Signal Magnitude Mean" 
 [40] "Time Domain Body Gyroscope Signal Magnitude Standard Deviation" 
 [41] "Time Domain Body Gyroscope Jerk Signal Magnitude Mean" 
 [42] "Time Domain Body Gyroscope Jerk Signal Magnitude Standard Deviation" 
 [43] "Frequency Domain Body Acceleration Signal Mean in the X-Axis" 
 [44] "Frequency Domain Body Acceleration Signal Mean in the Y-Axis" 
 [45] "Frequency Domain Body Acceleration Signal Mean in the Z-Axis" 
 [46] "Frequency Domain Body Acceleration Signal Standard Deviation in the X-Axis" 
 [47] "Frequency Domain Body Acceleration Signal Standard Deviation in the Y-Axis" 
 [48] "Frequency Domain Body Acceleration Signal Standard Deviation in the Z-Axis" 
 [49] "Frequency Domain Body Acceleration Jerk Signal Mean in the X-Axis" 
 [50] "Frequency Domain Body Acceleration Jerk Signal Mean in the Y-Axis" 
 [51] "Frequency Domain Body Acceleration Jerk Signal Mean in the Z-Axis" 
 [52] "Frequency Domain Body Acceleration Jerk Signal Standard Deviation in the X-Axis"
 [53] "Frequency Domain Body Acceleration Jerk Signal Standard Deviation in the Y-Axis"
 [54] "Frequency Domain Body Acceleration Jerk Signal Standard Deviation in the Z-Axis"
 [55] "Frequency Domain Body Gyroscope Signal Mean in the X-Axis"      
 [56] "Frequency Domain Body Gyroscope Signal Mean in the Y-Axis" 
 [57] "Frequency Domain Body Gyroscope Signal Mean in the Z-Axis" 
 [58] "Frequency Domain Body Gyroscope Signal Standard Deviation in the X-Axis" 
 [59] "Frequency Domain Body Gyroscope Signal Standard Deviation in the Y-Axis" 
 [60] "Frequency Domain Body Gyroscope Signal Standard Deviation in the Z-Axis" 
 [61] "Frequency Domain Body Acceleration Signal Magnitude Mean" 
 [62] "Frequency Domain Body Acceleration Signal Magnitude Standard Deviation" 
 [63] "Frequency Domain Body Acceleration Jerk Signal Magnitude Mean" 
 [64] "Frequency Domain Body Acceleration Jerk Signal Magnitude Standard Deviation" 
 [65] "Frequency Domain Body Gyroscope Signal Magnitude Mean" 
 [66] "Frequency Domain Body Gyroscope Signal Magnitude Standard Deviation" 
 [67] "Frequency Domain Body Gyroscope Jerk Signal Magnitude Mean" 
 [68] "Frequency Domain Body Gyroscope Jerk Signal Magnitude Standard Deviation"  



Reference:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
