<p align="center">
  <img src="https://gal.run/logo.svg" alt="GAL" width="120">
</p>

<h1 align="center">GAL - Governance Agentic Layer</h1>

<p align="center">
  <strong>Governance platform for AI coding agents. Discover, centralize, and sync approved configurations for individuals and teams.</strong>
</p>

<p align="center">
  <a href="https://app.gal.run">Dashboard</a> •
  <a href="https://www.npmjs.com/package/@scheduler-systems/gal">CLI</a> •
  <a href="https://marketplace.visualstudio.com/items?itemName=scheduler-systems.gal-vscode">VS Code Extension</a>
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@scheduler-systems/gal"><img src="https://img.shields.io/npm/v/@scheduler-systems/gal.svg" alt="npm version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-Proprietary-blue.svg" alt="License"></a>
</p>

---

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

## Documentation

https://gal.run/docs

## Support

- Documentation: https://gal.run/docs
- Email: support@scheduler-systems.com
- Issues: https://github.com/Scheduler-Systems/gal.run/issues

## License

Proprietary - Copyright (c) 2025 Scheduler Systems. All rights reserved.
