<p align="center">
  <img src="https://gal.run/logo.svg" alt="GAL" width="120">
</p>

<h1 align="center">GAL - Governance Agentic Layer</h1>

<p align="center">
  <strong>Governance platform for AI coding agents</strong>
</p>

<p align="center">
  <a href="https://app.gal.run">Dashboard</a> •
  <a href="https://www.npmjs.com/package/@scheduler-systems/gal">CLI</a> •
  <a href="https://marketplace.visualstudio.com/items?itemName=scheduler-systems.gal-vscode">VS Code Extension</a>
</p>

---

GAL helps teams manage AI coding agent configurations across their organization. Discover what agents developers are using, define approved configurations, and sync them everywhere.

## What GAL Does

| Feature | Description |
|---------|-------------|
| **Auto-Discovery** | Automatically scans repositories for AI agent configurations |
| **Approved Config** | Define and manage organization-approved settings |
| **Config Sync** | Developers pull approved configs with a single command |

## Supported Agents

| Agent | Config Files |
|-------|--------------|
| Claude Code | `.claude/`, `CLAUDE.md` |
| Cursor | `.cursor/`, `.cursorrules` |
| Windsurf | `.windsurfrules` |
| GitHub Copilot | `.github/copilot-instructions.md` |

## Components

### Dashboard

Web interface for managing configurations and viewing agent usage across your organization.

**[app.gal.run](https://app.gal.run)**

### CLI

Command-line tool for developers to sync configurations.

```bash
npm install -g @scheduler-systems/gal
gal auth login
gal sync --pull
```

### VS Code Extension

Real-time sync status and notifications in your IDE.

**[VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=scheduler-systems.gal-vscode)**

## Getting Started

1. **Sign up** at [app.gal.run](https://app.gal.run)
2. **Install the CLI**: `npm install -g @scheduler-systems/gal`
3. **Authenticate**: `gal auth login`
4. **Sync configs**: `gal sync --pull`

## Support

- **Issues**: [GitHub Issues](https://github.com/Scheduler-Systems/gal.run/issues)
- **Email**: support@scheduler-systems.com

## Security

Found a security issue? See [SECURITY.md](./SECURITY.md).

## License

MIT - see [LICENSE](./LICENSE).

---

<p align="center">
  Built by <a href="https://scheduler-systems.com">Scheduler Systems</a>
</p>
