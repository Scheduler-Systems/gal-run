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
  <a href="https://marketplace.visualstudio.com/items?itemName=scheduler-systems.gal-vscode">VS Code Extension</a> •
  <a href="#mcp-server">MCP Server</a>
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
- **MCP Server** - Full API access via Model Context Protocol for AI coding agents
- **Background Agents** - Dispatch and coordinate background coding agents

## Supported Platforms

| Platform | Config Path | Status |
|----------|-------------|--------|
| Claude Code | `.claude/` | Supported |
| Cursor | `.cursor/`, `.cursorrules` | Supported |
| GitHub Copilot | `.github/copilot/` | Supported |
| Windsurf | `.windsurf/` | Supported |
| Gemini | `.gemini/` | Supported |
| Codex | `.codex/` | Supported |

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

## MCP Server

GAL provides a hosted MCP (Model Context Protocol) server that gives AI coding agents full access to the GAL API. No installation required — just add the URL to your agent's MCP configuration.

### Setup

Add the GAL MCP server to your agent's configuration:

**Claude Code** (`.mcp.json`):

```json
{
  "mcpServers": {
    "gal": {
      "type": "streamable-http",
      "url": "https://api.gal.run/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_GAL_TOKEN"
      }
    }
  }
}
```

**Other MCP-compatible agents** — use the same URL (`https://api.gal.run/mcp`) with your GAL auth token as a Bearer token.

Get your token by running `gal auth login` via the CLI.

### Available Tools

The MCP server exposes governance and agent coordination tools:

| Category | Tools | Description |
|----------|-------|-------------|
| Organizations | 4 | List orgs, sync, discover configs |
| Approved Config | 2 | Get/set org-wide approved config |
| Config Governance | 8 | Proposals, versions, tracked repos |
| Team Management | 3 | List members, set roles, sync |
| Compliance | 3 | Scan compliance, get results, SDLC status |
| Agent Coordination | 16 | Sessions, dispatch, work items, branch claims |

## CLI Commands

| Command | Description |
|---------|-------------|
| `gal auth login` | Authenticate with GitHub |
| `gal sync --pull` | Pull approved configurations |
| `gal sync --status` | Check sync status |
| `gal discover` | Scan org repos for AI agent configs |

## Documentation

https://gal.run/docs

## Support

- Documentation: https://gal.run/docs
- Email: support@scheduler-systems.com
- Issues: https://github.com/Scheduler-Systems/gal-run/issues

## License

Proprietary - Copyright (c) 2025 Scheduler Systems. All rights reserved.
