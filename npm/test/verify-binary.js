const fs = require('fs');
const path = require('path');

// This finds the root of your repo (two levels up from npm/test/)
const repoRoot = path.resolve(__dirname, '../../'); 

const platforms = [
  'linux-x64', 'linux-arm64', 
  'darwin-x64', 'darwin-arm64', 
  'win32-x64'
];

console.log("🧐 Verifying binaries in root:", repoRoot);

platforms.forEach(p => {
  const isWin = p.includes('win32');
  const binName = isWin ? 'sql-migrate.exe' : 'sql-migrate';
  
  // Construct path: root/npm/platform-name/bin/binary
  const binPath = path.join(repoRoot, 'npm', p, 'bin', binName);

  if (!fs.existsSync(binPath)) {
    console.log(`🟡 Skipping ${p}: Not built yet.`);
    return;
  }

  const stats = fs.statSync(binPath);
  
  // Check for executable bit on Mac/Linux
  if (!isWin) {
    const isExecutable = !!(stats.mode & fs.constants.S_IXUSR);
    if (!isExecutable) {
      console.error(`❌ Permission Error: ${p} is not executable!`);
      process.exit(1);
    }
  }

  console.log(`✅ ${p} binary is valid (${(stats.size / 1024 / 1024).toFixed(2)} MB)`);
});