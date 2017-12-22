#!/usr/bin/Rscript

con <- file("stdin")
liness <- readLines(con)
#liness <- readLines("1901")
close(con)

year <- as.numeric(substr(liness, 16, 19))
temp <- as.numeric(substr(liness, 88, 92))
qq <- as.numeric(substr(liness, 93, 93))

output <- cbind(year, temp)

output <- output[temp != 9999 & qq %in% c(0, 1, 4, 5, 9),]

for (i in 1:nrow(output))
{
    pasted <- paste(output[i,], collapse = "\t")
    cat(sprintf("%s\n", pasted))
}

#prmatrix(output, rowlab=rep("", nrow(output)), collab=rep("", 2))

