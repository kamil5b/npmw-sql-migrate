#!/bin/bash

CGO_ENABLED=0 go build -o build_integration ./sql-migrate

OPTIONS="-config=test-integration/dbconfig.yml -env sqlite"

set -ex

./build_integration status $OPTIONS
./build_integration up $OPTIONS
./build_integration down $OPTIONS
./build_integration redo $OPTIONS
./build_integration status $OPTIONS

# Should have used the custom migrations table
sqlite test.db "SELECT COUNT(*) FROM migrations"
