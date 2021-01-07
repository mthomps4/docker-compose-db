#!/bin/bash

# Called from root setup.sh
source .env

mkdir -p db/mysql56/init
mkdir -p db/mysql56/data
touch db/mysql56/init/01.sql
touch db/mysql56/my.conf

# echo "CREATE DATABASE IF NOT EXISTS $MYSQL56_USER_NAME;" >> db/mysql56/init/01.sql
# echo "GRANT ALL ON *.* TO '$MYSQL56_USER_NAME'@'%';" >> db/mysql56/init/01.sql
# echo "FLUSH PRIVILEGES;" >> db/mysql56/init/01.sql


echo "[mysqld]" >> db/mysql56/my.conf
echo "table_open_cache=900" >> db/mysql56/my.conf
