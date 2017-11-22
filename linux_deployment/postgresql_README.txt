postgresql_deploy.sh script will take all necessary steps to deploy and start postgresql server and download and import imdb database

You should first login with the ubuntu account (the admin password is ubuntu)
Open a terminal window with Ctrl+Alt+T and type:
(replace the "/path/to" with the actual path of the script)

sudo /path/to/postgresql_deploy.sh

The default path to the script will be:
/home/bda505/mef-bigdata/linux_deployment/postgresql_deploy.sh

If the downloading is not successful you can do it manually following the link:

https://drive.google.com/open?id=12e8VZM06v64FordR6RiMr5zOMu3Jb5Qb

Note that the file is gzipped so first you should gunzip it:
(replace /path/to with the actual path)

gunzip /path/to/imdb.sql.gz

Move to a location that postgres user can access and make the file owned by the postgres user:

sudo mv /path/to/imdb.sql /var/lib/postgres

sudo chown postgres:postgres /var/lib/postgres/imdb.sql


You can comment out the 23rd line on the postgresql_deploy.sh (the line starting with "curl") and try to run the script again as such:
 
sudo /path/to/postgresql_deploy.sh

