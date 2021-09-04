#!/bin/bash

# Source ENVs
. .env

# File Permissions
chmod -R a+x ./initializers/


#########################
####### MYSQL 5.6 #######
#########################
mkdir -p db/mysql56/init
mkdir -p db/mysql56/data
touch db/mysql56/init/01.sql
touch db/mysql56/my.conf

echo "CREATE DATABASE IF NOT EXISTS $MYSQL56_USER_NAME;" >> db/mysql56/init/01.sql
echo "GRANT ALL ON *.* TO '$MYSQL56_USER_NAME'@'%';" >> db/mysql56/init/01.sql
echo "FLUSH PRIVILEGES;" >> db/mysql56/init/01.sql

echo "[mysqld]" >> db/mysql56/my.conf
echo "table_open_cache=900" >> db/mysql56/my.conf

#########################
####### MYSQL 5.7 #######
#########################
#!/bin/bash

mkdir -p db/mysql57/init
mkdir -p db/mysql57/data
touch db/mysql57/init/01.sql
touch db/mysql57/my.conf

echo "CREATE DATABASE IF NOT EXISTS $MYSQL57_USER_NAME;" >> db/mysql57/init/01.sql
echo "GRANT ALL ON *.* TO '$MYSQL57_USER_NAME'@'%';" >> db/mysql57/init/01.sql
echo "FLUSH PRIVILEGES;" >> db/mysql57/init/01.sql

#########################
### MYSQL 8 (:latest) ###
#########################

mkdir -p db/mysql8/init
mkdir -p db/mysql8/data
touch db/mysql8/init/01.sql
touch db/mysql8/my.conf

echo "CREATE DATABASE IF NOT EXISTS $MYSQL8_USER_NAME;" >> db/mysql8/init/01.sql
echo "GRANT ALL ON *.* TO '$MYSQL8_USER_NAME'@'%';" >> db/mysql8/init/01.sql
echo "FLUSH PRIVILEGES;" >> db/mysql8/init/01.sql

#########################
####### POSTGRES ########
#########################

mkdir -p db/postgres/data
mkdir -p db/postgres/init
touch db/postgres/init/01.sql

# NOTE: Postgres User is already a superuser -- not need to initialize further -- Nothing to do in `init`