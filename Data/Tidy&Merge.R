# ---- LoadLib ----
library(plyr)

# ---- SetPaths ----
GDPFile <- "FGDP.raw.csv"
EDFile <- "FEDSTATS_Country.raw.csv"

# ---- ReadGDP ----
#load data from CSV files
GDP <- read.csv(GDPFile)

# ---- RemoveHeaderFooter ----
#remove header and footer at the bottom of page
GDP.NHF<- GDP[5:235,]

# ---- RenameColumns ----
#Update column names
GDP.NHF.CN <-rename(GDP.NHF, c("X"="CountryCode","Gross.domestic.product.2012" ="Ranking"
                    ,"X.2"="Country","X.3"="GDP","X.4" = "Category"))

# ---- RemoveNA ----
#Replace empty strings with NA
GDP.NHF.CN[GDP.NHF.CN==""] <- NA

#Keep only the columns we need
GDP.NHF.CN.DC <- GDP.NHF.CN[c("CountryCode","Ranking","Country","GDP","Category")]

#remove rows that do not have rankings
GDP.Final <- GDP.NHF.CN.DC[!(is.na(GDP.NHF.CN.DC$Ranking)), ]

# ---- EdLoad ----
#Load Edstats data
edstats <- read.csv(EDFile)

# ---- EdRemoveNA ----
#Replace empty string with NA
edstats[edstats == ""] <- NA

# ---- EdGDPMerge ----
#Merge Data
mergeddata <- merge( GDP.Final, edstats,by="CountryCode")

# ---- EdRemoveColumns ----
#Only keep the columns we need
mergeddata.small <- mergeddata[c("CountryCode","Ranking","GDP","Long.Name","Income.Group")]

# --- EdRenameColumns ---
#rename long.name and Income.Group to keep consistent
mergeddata.small <-rename(mergeddata.small, c("Long.Name"="LongName","Income.Group"="IncomeGroup"))

# --- EdConvertColumns ---
#Convert ranking from factor to numeric
mergeddata.small$Ranking <- as.numeric(levels(mergeddata.small$Ranking))[mergeddata.small$Ranking]

#Convert LongName from factor to char
mergeddata.small$LongName <- as.character(levels(mergeddata.small$LongName))[mergeddata.small$LongName]

#Remove commas from GDP
mergeddata.small$GDP <-gsub(",", "", mergeddata.small$GDP)

#Convert GDP from factor to numeric
mergeddata.small$GDP <- as.numeric(mergeddata.small$GDP)
