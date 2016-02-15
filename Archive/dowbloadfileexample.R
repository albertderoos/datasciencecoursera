

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "idaho.csv")
idaho <- read.csv("idaho.csv", colClasses = "character")
names(idaho)
str(idaho)
million <- data.frame()
million <- idaho[idaho$"VAL" == "24", ]
str(million)
nrow(million)