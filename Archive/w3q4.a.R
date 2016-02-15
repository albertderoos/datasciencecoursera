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


new %>% select(X, Gross.domestic.product.2012) %>%
               filter(Gross.domestic.product.2012 != "") %>%
                    arrange(desc(as.numeric(Gross.domestic.product.2012)))

##189 items, KNA is rank 13