#!/bin/bash

CGO_ENABLED=0 go build -o build_integration ../sql-migrate

export MYSQL_USER=root
export DATABASE_NAME=test_env
export MYSQL_PASSWORD=
export MYSQL_HOST=localhost
export MYSQL_PORT=3306

OPTIONS="-config=test-integration/dbconfig.yml -env mysql_env"

set -ex

./build_integration status $OPTIONS
./build_integration up $OPTIONS
./build_integration down $OPTIONS
./build_integration redo $OPTIONS
./build_integration status $OPTIONS
