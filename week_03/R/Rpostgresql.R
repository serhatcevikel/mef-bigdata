# create a connection to postgresql and manipulate databases

library(RPostgreSQL) # load necessary package

drvv <- dbDriver("PostgreSQL") # load postgresql driver

# create a connection to a database using the driver
con <- dbConnect(drvv,
                 dbname = "imdb",
                 host = "localhost",
                 port = 5432,
                 user = "postgres",
                 password = "bda505")


table_names <- dbGetQuery(con,
                          "SELECT table_name
                          FROM information_schema.tables 
                          WHERE table_type = 'BASE TABLE'
                          AND table_schema = 'public'
                          ORDER BY table_name
                          "
                          )



myTable <- dbReadTable(con, "")
