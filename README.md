<p align="center">
  <img src="https://gal.run/logo.svg" alt="GAL" width="120">
</p>

<h1 align="center">GAL - Governance Agentic Layer</h1>

<p align="center">
  <strong>Governance platform for AI coding agents. Discover, centralize, and sync approved configurations across your organization.</strong>
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

- **Auto-Discovery** - Scan repositories to find existing AI agent configurations
- **Approved Config** - Set organization-wide approved settings for all platforms
- **Config Sync** - Pull approved configs with a single command
- **MCP Server** - Full governance API access via Model Context Protocol

## Supported Platforms

| Platform | Config Path | Status |
|----------|-------------|--------|
| Claude Code | `.claude/` | Supported |
| Cursor | `.cursor/` | Supported |
| GitHub Copilot | `.github/` | Supported |
| Windsurf | `.windsurf/` | Supported |
| Gemini CLI | `.gemini/` | Supported |
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

This pulls your organization's approved configs and sets up MCP for all supported platforms automatically.

## MCP Server

GAL provides an MCP server that gives AI coding agents access to the governance API. Use stdio for file-based clients (recommended) and hosted HTTP for Codex or environments without stdio.

### Copy-Paste Setup (stdio)

Pick your agent and paste the snippet.

**Claude Code**

```bash
cat <<'JSON' > .mcp.json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
JSON
```

**Cursor**

```bash
mkdir -p .cursor
cat <<'JSON' > .cursor/mcp.json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
JSON
```

**Windsurf**

```bash
mkdir -p .windsurf
cat <<'JSON' > .windsurf/mcp_config.json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
JSON
```

**Gemini CLI**

```bash
mkdir -p .gemini
cat <<'JSON' > .gemini/settings.json
{
  "mcpServers": {
    "gal": {
      "command": "npx",
      "args": ["-y", "@scheduler-systems/gal-mcp-session"]
    }
  }
}
JSON
```

> **Tip:** `gal sync --pull` auto-configures MCP for all supported platforms.

### Codex Setup (Hosted HTTP)

**OAuth (preferred)**

```bash
codex mcp add gal --url https://api.gal.run/mcp
codex mcp login gal
```

If OAuth login fails with `Dynamic client registration not supported`, use bearer-token mode:

```bash
export GAL_AUTH_TOKEN="$(gal auth token)"
codex mcp remove gal
codex mcp add gal --url https://api.gal.run/mcp --bearer-token-env-var GAL_AUTH_TOKEN
```

**Troubleshooting: `Tools: (none)`**

- Ensure `GAL_AUTH_TOKEN` is set in the environment that launches Codex.
- Re-run `codex mcp add ... --bearer-token-env-var GAL_AUTH_TOKEN` after exporting the token.
- Restart Codex after changing environment variables.

### Hosted HTTP (alternative)

For environments where stdio is not available, use the hosted endpoint:

```json
{
  "mcpServers": {
    "gal": {
      "type": "streamable-http",
      "url": "https://api.gal.run/mcp"
    }
  }
}
```

Authenticate with `Authorization: Bearer <token>` header. Get your token with `gal auth token`.

### Available Tools

| Category | Tools | Description |
|----------|-------|-------------|
| Organizations | 4 | List orgs, sync, discover configs |
| Approved Config | 2 | Get/set org-wide approved config |
| Config Governance | 8 | Proposals, versions, tracked repos |
| Team Management | 3 | List members, set roles, sync |
| Compliance | 3 | Scan compliance, get results, SDLC status |

## CLI Commands

| Command | Description |
|---------|-------------|
| `gal auth login` | Authenticate with GitHub |
| `gal auth token` | Print your GAL token |
| `gal sync --pull` | Pull approved configurations |
| `gal sync --status` | Check sync status |
| `gal discover` | Scan org repos for AI agent configs |

## Documentation

[gal.run/docs](https://gal.run/docs)

## Support

- Email: support@scheduler-systems.com
- Issues: [github.com/Scheduler-Systems/gal-run/issues](https://github.com/Scheduler-Systems/gal-run/issues)

## License

Proprietary - Copyright (c) 2026 Scheduler Systems. All rights reserved.
