#!/bin/bash
# scripts/test-local.sh

# 1. Detect current OS and Arch using valid Node.js syntax
PLATFORM=$(node -p "process.platform")
ARCH=$(node -e "console.log(process.arch)")
FOLDER="${PLATFORM}-${ARCH}"

echo "Detected Platform: $FOLDER"

# 2. Build the binary for your local machine
echo "🔨 Building Go binary for local test..."
go build -o "npm/$FOLDER/bin/sql-migrate" ./sql-migrate

# 3. Use 'npm link' to simulate a real installation
echo "🔗 Linking packages..."
cd "npm/$FOLDER" && npm link
cd "../main" && npm link "npmw-sql-migrate-$FOLDER"

# 4. Execute the test
echo "🚀 Testing execution..."
node index.js --version

if [ $? -eq 0 ]; then
  echo "✅ Success: JS wrapper successfully called the Go binary!"
else
  echo "❌ Failure: Bridge logic failed."
  exit 1
fi