library(ggplot2)
library(scales)
# ---- Question1 ----
#Question 1
length(mergeddata$CountryCode)

# ---- Question2 ----
#Quesion 2
mergeddata.small.sorted <- mergeddata.small[with(mergeddata.small,order(-Ranking)),]

#13th element
mergeddata.small.sorted[13,]

# ---- Question3 ----
#Question 3
incomeAgg <- aggregate(mergeddata.small.sorted, by=list(mergeddata.small.sorted$IncomeGroup), FUN=mean, na.rm=TRUE)
incomeAgg <- incomeAgg[c("Group.1","Ranking","GDP")]  
incomeAgg <- rename(incomeAgg, c("Group.1"="IncomeGroup","GDP"="MeanGDP","Ranking"="MeanRanking"))
incomeAgg <- incomeAgg[with(incomeAgg,order(MeanRanking)),]
incomeAgg
#str(incomeAgg)
#head(mergeddata.small.sorted)

# ---- Question4 ----
#Question 4
ggplot(mergeddata.small.sorted, aes(GDP, colour = IncomeGroup)) + 
  geom_density() + 
  scale_x_continuous(name="GDP",label = comma) +
  scale_y_continuous(name="Density",label = comma) +
  theme(axis.text.x = element_text(angle = 22.5, hjust = 1))

# ---- Question5 ----
#Question 5
rankedquantiles <- cut(mergeddata.small.sorted$Ranking,breaks=5)
quant <- table(mergeddata.small.sorted$IncomeGroup,rankedquantiles)
quant