#!/usr/bin/Rscript

#liness <- readLines(file("stdin"))
liness <- readLines("mapped")

keyval <- list()

for (i in 1:length(liness))
{
    linex <- unlist(strsplit(liness[i], split = " "))
    key <- linex[1]
    val <- as.numeric(linex[2])

    cur.maxval <- keyval[[key]]

    if (is.null(cur.maxval))
    {
        keyval[[key]] <- val
    }
    else
    {
        if (val > cur.maxval)
        {
            keyval[[key]] <- val
        }
    }
}

keys <- as.numeric(names(keyval))
vals <- as.numeric(unlist(keyval))

output <- matrix(c(keys, vals), ncol = 2)
output <- output[order(keys),, drop = F]


for (i in 1:nrow(output))
{
    pasted <- paste(output[i,], collapse = " ")
    cat(sprintf("%s\n", pasted))
}

