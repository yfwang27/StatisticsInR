# subset the data for "England" area from Life_expectancy_at_birth.csv

# What are the min, median, mean and max 

# step1: load the data
Life_exp<-read.csv("data/Life_expectancy_at_birth.csv",header=T)
# step2: subset data
Eng.life.exp<-Life_exp[Life_exp$area=="England",]

boxplot(life.expectancy~area,data=Life_exp,las=2, cex.axis=0.6)
boxplot(life.expectancy~gender*area,data=Life_exp,col=(c("gold","darkgreen")),
        las=2, cex.axis=0.6)
