# ---- GatherData ----
#Load Libraries
library(downloader)

#Download GDP Data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url,destfile="FEDSTATS_Country.raw.csv") 

#Download Educ Data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,destfile="FGDP.raw.csv") 


