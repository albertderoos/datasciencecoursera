library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "GDP.csv")
GDP <- read.csv("GDP.csv", colClasses = "character")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "countrystats.csv")
countrystats <- read.csv("countrystats.csv")

str(GDP)
str(countrystats)
names (GDP) # "X" = 3 letter code
names(countrystats) #"CountryCode" = 3 letter code

new <- merge(GDP, countrystats, by.x = "X", by.y = "CountryCode", all = FALSE)
head(new)
tail(new)
nrow(new)
names(new)

#What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? 

new %>% select(X, Gross.domestic.product.2012, Income.Group) %>%
               filter(Gross.domestic.product.2012 != "" & (Income.Group == "High income: OECD" | Income.Group == "High income: nonOECD")) %>%
                    arrange(desc(as.numeric(Gross.domestic.product.2012))) %>%
                         group_by(Income.Group) %>%
                              summarize(mean(as.numeric(Gross.domestic.product.2012), na.rm=TRUE))
