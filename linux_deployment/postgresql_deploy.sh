#!/bin/bash

# deploy postgresql server
# download and import imdb database


echo "postgres:bda505" | chpasswd # change password of postgres

# create en empty directory for tablespace
mkdir /home/bda505/pg

# change the ownership of the tablespace directory to postgres user
chown -R postgres:postgres /home/bda505/pg

systemctl enable postgresql.service
systemctl start postgresql.service

sudo -i -u postgres /bin/bash - <<-EOF

# download the database as gzip file
# you can also download manually from url:
# https://drive.google.com/open?id=12e8VZM06v64FordR6RiMr5zOMu3Jb5Qb
curl 'https://doc-14-30-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/4l5gdhhvvb08jrs8va158ejpc27hd05j/1511380800000/05429831023401132617/*/12e8VZM06v64FordR6RiMr5zOMu3Jb5Qb?e=download' > /var/lib/postgresql/imdb.sql.gz


# change db user password
# create tablespace
# drop existing imdb if any
# create empty imdb database at pg tablespace 

psql -U postgres -d postgres <<-EOF2

ALTER USER postgres WITH PASSWORD 'bda505';

CREATE TABLESPACE pg LOCATION '/home/bda505/pg';

DROP DATABASE imdb;
DROP DATABASE imdb2;

CREATE DATABASE imdb
WITH OWNER = postgres
ENCODING = 'UTF8'
TABLESPACE = pg
LC_COLLATE = 'en_US.UTF-8'
LC_CTYPE = 'en_US.UTF-8'
CONNECTION LIMIT = -1;

EOF2

gunzip /var/lib/postgresql/imdb.sql.gz

psql imdb < /var/lib/postgresql/imdb.sql

EOF
