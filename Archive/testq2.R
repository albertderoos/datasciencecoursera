
install.packages("sqldf")
library("sqldf")


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "acsdata.csv")
acs <- read.csv("acsdata.csv", colClasses = "character")


sqldf("select pwgtp1 from acs")
sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select pwgtp1, AGEP from acs where AGEP < 50")
unique((acs$AGEP))


names(acsdata)
str(acsdata)
acsdata

