#!/bin/bash

source .env

# File Permissions
chmod -R a+x ./initializers/

sh ./initializers/mysql57.sh
sh ./initializers/mysql8.sh
