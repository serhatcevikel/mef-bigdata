# Melt the table by splitting the second field across commas
# Ideas from:
# https://stackoverflow.com/questions/13808553/melt-data-frame-and-split-values
# https://stackoverflow.com/questions/15673662/applying-a-function-to-each-row-of-a-data-table

library(data.table) # load data.table package

prefix <- Sys.getenv("fls") # get the environment variable - a path prefix - "fls"
in_path <- sprintf("%s/data/imdb/tsv/title.principals.tsv", prefix) # create the path to input file

principals <- fread(in_path) # fast read input file into DT

# split 2nf field, replicate 1st field length of split times
principals_molten <- principals[, {principalCast_list = strsplit(principalCast, ",");
                                    list(tconst = rep(tconst, sapply(principalCast_list, length)),
                                         principalCast = unlist(principalCast_list))}]


out_path <- sprintf("%s/data/imdb/tsv/title.principals2.tsv", prefix) # create output file path

fwrite(principals_molten, file = out_path, sep = "\t") # fast write new DT as tsv
