
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
htmlCode

CharsPerLine <- nchar(htmlCode)
CharsPerLine[c(10, 20, 30, 100)]