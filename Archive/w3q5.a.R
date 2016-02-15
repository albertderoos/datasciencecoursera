library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "GDP.csv")
GDP <- read.csv("GDP.csv", colClasses = "character")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "countrystats.csv")
countrystats <- read.csv("countrystats.csv")

new <- merge(GDP, countrystats, by.x = "X", by.y = "CountryCode", all = FALSE)


head(new)
tail(new)
nrow(new)
names(new)

#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries
#are Lower middle income but among the 38 nations with highest GDP?

new2 <- new %>% select(X, Gross.domestic.product.2012, Income.Group) %>%
               filter(Gross.domestic.product.2012 != "") 

quantile(as.numeric(new2$Gross.domestic.product.2012), probs = (0.20))

splitnew2 <- split(new2, new2$Income.Group, new2$Gross.domestic.product.2012)
counts <- sapply(splitnew2, count)


breaks <- quantile(as.numeric(new2$Gross.domestic.product.2012), probs = seq(0, 1, 0.2), na.rm = TRUE)
new2$quantileGDP <- cut(as.numeric(new2$Gross.domestic.product.2012), breaks = breaks)

new3 <- new2 %>% select(quantileGDP, Income.Group) %>%
          arrange(quantileGDP, Income.Group) %>%
               group_by(quantileGDP, Income.Group) %>%
                summarize(n= n())

swirl(0)

#5 is correct
