---
title: "CodeBook"
author: "Kristie Ellickson"
date: "September 25, 2015"
output: html_document
---

This is a Codebook that describes run_analysis.R at the following URL link
---
##The code in the above script has 8 sections detailed below
1. Pull in Libraries and Data package
2. Pull in general data identifiers
3. Pull in test tables
4. Pull in train tables
5. Combine Train and Data Sets
6. Select only Columns with Mean or Standard Deviation Data
7. Reshape data into long format
8. Create Simple Identifiers for Activities
9. Create Averages of Tidy Data by Subject Activity and Measurement Type

---

#Pull in Libraries and Data package
###Data are stored here: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" as a zip file, downloaded using dowload.file, and unzipped

---
#Pull in general data identifiers
###Many different types of measurements were used to test final outcome (e.g. gyro measurements, etc.), these were test type or measurement type identifies and were pulled in using read.table

---
#Pull in test tables
###There are two main data file types those from training subjects and when these subjects are tested post-training.
###Test subject information included measurement results, measurement identifiers, and subject identifiers.
###These tables were pulled and "cbinded" on identifiers.

#Pull in train tables
###Train subject information included measurement results, measurement identifiers, and subject identifiers.
###These tables were pulled and "cbinded" on identifiers.

#Combine Train and Data Sets
###Column headings were made consistent and the training and testing data were combined using rbind.

#Reshape data into long format
###Wide data were "gathered" keping only the measurements and combining all of the measurement type column names as its own column, "MeasurementType"

#Create Simple Identifiers for Activities
###The activity labels dataframe was merged with the larger data base to align an activity description with the activity labels.

#Create Averages of Tidy Data by Subject Activity and Measurement Type
###Means were taken with a group_by and subsequent summarize command by Subject, Measurement Type and Activity Description. 
###Final Data include the following column names: 
#####[1] "Subject"                                 "MeasurementType"                       
#####[3] "Activity"                                "MeanBy_Subject_MeasurementType_Activity"

######Subject: Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
######MeasurementType: 86 Levels including: [1] fBodyAccMag.meanFreq..               fBodyBodyGyroMag.meanFreq..         
 [3] angle.tBodyAccJerkMean..gravityMean. tBodyAcc.mean...Z                   
 [5] fBodyAccJerk.mean...Y                tGravityAcc.mean...Y                
 [7] fBodyAccJerk.mean...Z                fBodyBodyGyroJerkMag.meanFreq..     
 [9] tGravityAcc.std...Z                  tGravityAccMag.std..                
[11] fBodyGyro.meanFreq...X               tBodyGyro.mean...Z                  
[13] tBodyAccJerkMag.mean..               angle.tBodyAccMean.gravity.         
[15] angle.tBodyGyroMean.gravityMean.     tBodyGyroJerkMag.std..              
[17] fBodyAcc.mean...Z                    fBodyGyro.mean...Z                  
[19] fBodyGyro.std...Z                    tBodyAcc.mean...X                   
[21] fBodyAccMag.std..                    fBodyAccJerk.meanFreq...Y           
[23] fBodyAccJerk.mean...X                tBodyAcc.mean...Y                   
[25] tGravityAcc.mean...Z                 tGravityAcc.std...X                 
[27] fBodyGyro.mean...X                   fBodyBodyGyroMag.std..              
[29] tBodyAccJerk.mean...X                fBodyAcc.meanFreq...Y               
[31] fBodyAccJerk.meanFreq...X            angle.X.gravityMean.                
[33] tBodyGyroJerk.mean...X               tBodyGyroJerk.mean...Z              
[35] fBodyBodyGyroJerkMag.mean..          fBodyAcc.mean...X                   
[37] fBodyAccMag.mean..                   fBodyAcc.meanFreq...Z               
[39] tBodyAccMag.mean..                   fBodyGyro.meanFreq...Z              
[41] tBodyGyroJerk.mean...Y               fBodyBodyGyroMag.mean..             
[43] tGravityAcc.std...Y                  tBodyAccJerk.std...X                
[45] tBodyAccMag.std..                    fBodyBodyAccJerkMag.mean..          
[47] fBodyBodyAccJerkMag.std..            fBodyAccJerk.meanFreq...Z           
[49] fBodyGyro.meanFreq...Y               fBodyAcc.mean...Y                   
[51] fBodyAccJerk.std...Y                 tBodyAccJerkMag.std..               
[53] tBodyGyroJerkMag.mean..              fBodyGyro.mean...Y                  
[55] fBodyGyro.std...Y                    tGravityAccMag.mean..               
[57] fBodyAcc.std...Z                     fBodyGyro.std...X                   
[59] tBodyGyroJerk.std...Y                tBodyGyro.mean...Y                  
[61] tBodyGyro.std...Y                    tBodyGyro.mean...X                  
[63] tBodyAccJerk.mean...Y                tGravityAcc.mean...X                
[65] fBodyAccJerk.std...Z                 fBodyAcc.meanFreq...X               
[67] tBodyGyroMag.std..                   angle.tBodyGyroJerkMean.gravityMean.
[69] fBodyBodyGyroJerkMag.std..           tBodyAccJerk.mean...Z               
[71] fBodyBodyAccJerkMag.meanFreq..       tBodyAcc.std...Y                    
[73] tBodyGyroJerk.std...Z                tBodyAcc.std...Z                    
[75] angle.Z.gravityMean.                 fBodyAccJerk.std...X                
[77] fBodyAcc.std...X                     fBodyAcc.std...Y                    
[79] tBodyAcc.std...X                     tBodyGyroMag.mean..                 
[81] angle.Y.gravityMean.                 tBodyAccJerk.std...Y                
[83] tBodyGyroJerk.std...X                tBodyAccJerk.std...Z                
[85] tBodyGyro.std...Z                    tBodyGyro.std...X
######Activity: 6 Levels: [1] WALKING            WALKING_UPSTAIRS   WALKING_DOWNSTAIRS SITTING       
######[5] STANDING           LAYING 

###Created text file of final averaged data and linked on Github under the kmellick user name.
