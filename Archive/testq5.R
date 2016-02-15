

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "data.for")
acs <- read.fwf("data.for", skip = 4, widths = c(-1, 9, -5, 4, 4, -5, 4,4, -5, 4,4, -5, 4,4))

acs


sum(acs$V4)
