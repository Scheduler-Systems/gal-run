# GAL - Governance Agentic Layer

Governance platform for AI coding agents. Discover, centralize, and sync approved configurations for individuals and teams.

[![npm version](https://img.shields.io/npm/v/@scheduler-systems/gal.svg)](https://www.npmjs.com/package/@scheduler-systems/gal)
[![License](https://img.shields.io/badge/license-Proprietary-blue.svg)](LICENSE)

## What is GAL?

GAL helps you manage AI coding agent configurations at scale:

- **Auto-Discovery** - Automatically scan repositories to find existing AI agent configurations
- **Approved Config** - Set organization-wide approved settings
- **Config Sync** - Pull approved configs with a single command

## Supported Platforms

| Platform | Config Path | Status |
|----------|-------------|--------|
| Claude Code | `.claude/` | Supported |
| Cursor | `.cursor/`, `.cursorrules` | Supported |
| GitHub Copilot | `.github/copilot/` | Supported |
| Windsurf | `.windsurf/` | Coming Soon |

## Quick Start

### 1. Sign Up

Visit [app.gal.run](https://app.gal.run) to create your account.

### 2. Install CLI

```bash
npm install -g @scheduler-systems/gal
```

### 3. Authenticate

```bash
gal auth login
```

### 4. Sync Configurations

```bash
gal sync --pull
```

## Components

| Component | Description |
|-----------|-------------|
| [Dashboard](https://app.gal.run) | Web interface for managing configs and policies |
| [CLI](https://www.npmjs.com/package/@scheduler-systems/gal) | Command-line tool for syncing configurations |
| VS Code Extension | Editor integration (coming soon) |

## Documentation

https://gal.run/docs

## Support

- Documentation: https://gal.run/docs
- Email: support@scheduler-systems.com
- Issues: https://github.com/Scheduler-Systems/gal.run/issues

## License

Proprietary - Copyright (c) 2025 Scheduler Systems. All rights reserved.
