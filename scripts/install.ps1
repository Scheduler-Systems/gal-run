# GAL CLI Installer for Windows
# Usage: iwr -useb https://gal.run/install.ps1 | iex

$ErrorActionPreference = "Stop"

Write-Host "GAL CLI Installer" -ForegroundColor Cyan
Write-Host ""

# Check for Node.js
try {
    $nodeVersion = node -v
    $majorVersion = [int]($nodeVersion -replace 'v(\d+)\..*', '$1')
    if ($majorVersion -lt 18) {
        Write-Host "Error: Node.js 18+ required. Found: $nodeVersion" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Error: Node.js is required but not installed." -ForegroundColor Red
    Write-Host "Install Node.js from: https://nodejs.org/"
    exit 1
}

# Install via npm
Write-Host "Installing GAL CLI..."
npm install -g @anthropic-ai/gal

# Verify installation
try {
    $galVersion = gal --version
    Write-Host ""
    Write-Host "GAL CLI installed successfully!" -ForegroundColor Green
    Write-Host $galVersion
    Write-Host ""
    Write-Host "Next steps:"
    Write-Host "  gal auth login    # Authenticate with GitHub"
    Write-Host "  gal sync --pull   # Sync approved config"
} catch {
    Write-Host "Installation may require a new terminal window." -ForegroundColor Yellow
}
