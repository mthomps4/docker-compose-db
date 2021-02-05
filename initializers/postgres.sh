#!/usr/bin/bash

# Called from root setup.sh
. ./.env

mkdir -p db/postgres/data
mkdir -p db/postgres/init
touch db/postgres/init/01.sql

# Postgres User is already a superuser -- not need to initialize further
# Nothing to do in `init`
