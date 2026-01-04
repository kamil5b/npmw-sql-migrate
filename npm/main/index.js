#!/usr/bin/env node
const { spawn } = require('child_process');
const path = require('path');
const os = require('os');

function getBinaryPath() {
  const platform = os.platform(); // win32, linux, darwin
  const arch = os.arch();         // x64, arm64
  
  // Construct the name of the sub-package
  const subPackage = `npmw-sql-migrate-${platform}-${arch}`;
  
  try {
    const pkgRoot = path.dirname(require.resolve(`${subPackage}/package.json`));
    const exe = platform === 'win32' ? 'sql-migrate.exe' : 'sql-migrate';
    return path.join(pkgRoot, 'bin', exe);
  } catch (e) {
    console.error(`Error: Unsupported platform ${platform}-${arch}.`);
    process.exit(1);
  }
}

const child = spawn(getBinaryPath(), process.argv.slice(2), { stdio: 'inherit' });
child.on('exit', (code) => process.exit(code || 0));