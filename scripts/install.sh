#!/bin/bash
# GAL CLI Installer
# Usage: curl -fsSL https://gal.run/install.sh | bash

set -e

BOLD="\033[1m"
GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}GAL CLI Installer${RESET}"
echo ""

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}Error: Node.js is required but not installed.${RESET}"
    echo "Install Node.js from: https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo -e "${RED}Error: Node.js 18+ required. Found: $(node -v)${RESET}"
    exit 1
fi

# Install via npm
echo "Installing GAL CLI..."
npm install -g @anthropic-ai/gal

# Verify installation
if command -v gal &> /dev/null; then
    echo ""
    echo -e "${GREEN}GAL CLI installed successfully!${RESET}"
    echo ""
    gal --version
    echo ""
    echo "Next steps:"
    echo "  gal auth login    # Authenticate with GitHub"
    echo "  gal sync --pull   # Sync approved config"
    echo ""
else
    echo -e "${RED}Installation failed. Please try: npm install -g @anthropic-ai/gal${RESET}"
    exit 1
fi
