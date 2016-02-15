install.packages("XML")
library("XML")
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL, useInternalNodes = TRUE, isURL = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]]
a <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(a == "21231")