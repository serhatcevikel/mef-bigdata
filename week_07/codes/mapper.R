#!/usr/bin/Rscript

con <- file("stdin")
#con <- file("1910")
liness <- readLines(con)
close(con)

year <- as.numeric(substr(liness, 16, 19))
temp <- as.numeric(substr(liness, 88, 92))
qq <- as.numeric(substr(liness, 93, 93))

output <- cbind(year, temp)

output <- output[temp != 9999 & qq %in% c(0, 1, 4, 5, 9),]

for (i in seq_along(output[,1]))
{
    pasted <- paste(output[i,], collapse = "\t")
    cat(sprintf("%s\n", pasted))
}


