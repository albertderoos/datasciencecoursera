
## download necessary jpeg packages

install.packages("jpeg")
library(jpeg)

#downlaod file and read into df

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "jeff.jpg", mode="wb")
jeff <- readJPEG("jeff.jpg", native = TRUE)
quantile(jeff, probs = c(0.3, 0.8))


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
f <- file.path(getwd(), "jeff.jpg")
download.file(url, f, mode = "wb")
img <- readJPEG(f, native = TRUE)
quantile(img, probs = c(0.3, 0.8))