# Case Study 1
### Chris Donlan
### 10/21/16
### MSDS 6306

#Project Structure
Files for the case study are stored primailry in three different folders:

##Data 
Contains the CSV data files used in the study, the rmarkdown file user to generate the report and R code used to download, tidy, and merge the data.

##Paper
Contains a PDF copy of the case study.

##Analyze
Contains the R code used to answer the questions.

A few other notes, the root directory also contains a makefile called run.r, which can be used if you want to run the code outside of the report. Also note, that I had some issues using kniter's read_chunk function, it always uses the path of the actual rmarkdown file. I tried to use setwd, but it would always use the path of the file itself. This is why there is a copy of the analyze.r file in the data folder. 
