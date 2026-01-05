#!/bin/bash

# Tweak PATH for Travis
CGO_ENABLED=0 go build -o build_integration ./sql-migrate

OPTIONS="-config=test-integration/dbconfig.yml -env mysql_noflag"

set -ex

./build_integration status $OPTIONS 2>&1 | grep -q "Make sure that the parseTime option is supplied"

