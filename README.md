# GettingCleaningData_Project2
Project 2 for the course. Cleans the accelerometer signal data measured by smartphone.


The "run_analysis.R" program takes Samsung Galaxy S smartphone accelerometers data, cleans it, and generates the overall average of mean signals and standard deviation signals per subject per activity.
Specifically, the program:
1. Pieces back the training and testing data so all subjects and measurements are in the same data frame and each row is labeled with the corresponding activity and performing subject.
2. There are 10 time domain measurements, 5 of which are measured in triaxial coordinates, and 7 frequency domain measurements, 3 of which are in triaxial coordinates. Thus there are a total of 33 measurements recorded per test. The program retains the mean and standard deviation of each measurement, resulting in 66 columns in addition to the subject and activity columns.
3. Replaces the activity code with description of the activity to make data easier to understand.
4. Re-names the columns so the meaning of each column is clear.
5. Computes the average signal per subject per activity for each of the 66 mean and standard deviation measurements and store it as a separate tab delimited data set "AverageActivitySignal.txt".

The CodeBook describes the data, variables, and scripts in greater detail.

