install.packages("httr")
library("httr")

install.packages("jsonlite")
library("jsonlite")

myapp <- oauth_app("github", key = "c952a18449c4c55f175f", secret = "02dc473d35e3c57fba39d367fd71e211a6e58560")
homeTL = GET("https://api.github.com/users/jtleek/repos")


library(XML)
url <- "https://api.github.com/users/jtleek/repos"
html <- htmlTreeParse(url, useInternalNodes = TRUE)
xpathSApply(html, "//repo", xmlValue)

names <- content(homeTL)
json2 <- fromJSON(url)

json3 <- json2[, "created_at"]
json3 <- json2[, "full_name"]

json3 <- json2[json2$full_name == "jtleek/datasharing", "created_at"]
json3

class(json2)

