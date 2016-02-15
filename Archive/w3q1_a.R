
library(dplyr)

##download the file and load it into dataframe
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "idaho.csv")
idaho <- read.csv("idaho.csv", colClasses = "character")

str(idaho)

## select all with ACR (Lot size) = 3 .House on ten or more acres 
## AGS (Sales of Agriculture Products) = 6 .$10000+  