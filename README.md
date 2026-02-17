<p align="center">
  <img src="https://gal.run/logo.svg" alt="GAL" width="120">
</p>

<h1 align="center">GAL - Governance Agentic Layer</h1>

<p align="center">
  <strong>Governance platform for AI coding agents. Discover, centralize, and sync approved configurations for individuals and teams.</strong>
</p>

<p align="center">
  <a href="https://app.gal.run">Dashboard</a> &bull;
  <a href="https://www.npmjs.com/package/@scheduler-systems/gal-run">CLI</a> &bull;
  <a href="https://marketplace.visualstudio.com/items?itemName=scheduler-systems.gal-vscode">VS Code Extension</a> &bull;
  <a href="#mcp-server">MCP Server</a> &bull;
  <a href="CHANGELOG.md">Changelog</a>
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@scheduler-systems/gal-run"><img src="https://img.shields.io/npm/v/@scheduler-systems/gal-run.svg" alt="npm version"></a>
  <a href="LICENSE.md"><img src="https://img.shields.io/badge/license-Proprietary-blue.svg" alt="License"></a>
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
| Cursor | `.cursor/` | Supported |
| GitHub Copilot | `.github/` | Supported |
| Windsurf | `.windsurf/` | Supported |
| Gemini | `.gemini/` | Supported |
| Codex | `.codex/` | Supported |

## Quick Start

### 1. Sign Up

Visit [app.gal.run](https://app.gal.run) to create your account.

### 2. Install CLI

```bash
npm install -g @scheduler-systems/gal-run
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

GAL provides a hosted MCP (Model Context Protocol) server that gives AI coding agents full access to the GAL API.

**Hosted endpoint:** `https://api.gal.run/mcp`

### Claude Code

Add to `.mcp.json` in your project root:

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

Or use the stdio transport (no token needed if authenticated via CLI):

```json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
```

> **Tip:** `gal sync --pull` auto-configures this for you.

### Cursor

Add to `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
```

### Windsurf

Add to `.windsurf/mcp_config.json`:

```json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
```

### Gemini

Add to your Gemini settings (`settings.json`):

```json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
```

### Codex

Codex reads MCP configuration from `AGENTS.md`. Run `gal sync --pull` to generate an `AGENTS.md` with GAL integration instructions, or manually add:

```
## MCP Servers

- **GAL**: `npx -y @scheduler-systems/gal-mcp-session` - Organization governance and agent coordination
```

### GitHub Copilot

Copilot supports MCP servers at the organization level. Configure via your GitHub organization settings or add the GAL MCP server URL in your Copilot agent configuration.

### Get Your Token

```bash
gal auth login    # Authenticate with GitHub
gal auth token    # Print your GAL token
```

### Available MCP Tools

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

## CI/CD Integration

```yaml
- name: Install GAL CLI
  run: npm install -g @scheduler-systems/gal-run

- name: Sync configs
  run: gal sync --pull
  env:
    GAL_TOKEN: ${{ secrets.GAL_TOKEN }}
```

## Documentation

https://gal.run/docs

## Support

- Documentation: https://gal.run/docs
- Email: support@scheduler-systems.com
- Issues: https://github.com/Scheduler-Systems/gal-run/issues

## License

Proprietary - Copyright (c) 2026 Scheduler Systems. All rights reserved.
