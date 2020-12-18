#!/bin/bash

# Called from root setup.sh
source .env

mkdir -p db/mysql57/init
mkdir -p db/mysql57/data
touch db/mysql57/init/01.sql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL57_USER_NAME;" >> db/mysql57/init/01.sql
echo "GRANT ALL ON *.* TO '$MYSQL57_USER_NAME'@'%';" >> db/mysql57/init/01.sql
echo "FLUSH PRIVILEGES;" >> db/mysql57/init/01.sql