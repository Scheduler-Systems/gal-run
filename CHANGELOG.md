# GAL Changelog

All notable changes to GAL will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added
- `gal discover` command for org-wide config scanning with platform filtering
- Sync Status dashboard page with real-time sync monitoring
- MCP Server — hosted at `api.gal.run/mcp` for AI agent integration (no install needed)
- Background agent dispatch rules — admin-configurable work categories
- Config governance: proposals, versioning, and tracked repos
- Team management with live GitHub sync
- Compliance scanning and SDLC status tracking

### Changed
- MCP server is now a hosted HTTP service (no npm install required)
- Expanded MCP tools to 36 (20 governance + 16 agent coordination)

### Security
- Pre-launch hardening: org restriction middleware for background agent APIs
- MCP endpoint gated by auth + org access

## [1.0.0] - 2026-02-17

### Added
- Multi-platform support: Claude Code, Cursor, GitHub Copilot, Windsurf, Gemini, Codex
- `gal auth login` — GitHub authentication
- `gal sync --pull` — Sync approved configurations
- `gal sync --status` — Check sync status
- Organization-wide configuration management
- Auto-discovery of AI agent configs across repositories
- Approved config management (set org-wide settings)
- Background agent sessions with dashboard streaming
- VS Code extension integration
- CLI telemetry with opt-out support
- Dashboard with organization discovery, team management, and config governance

### Security
- Authentication tokens in httpOnly cookies
- Rate limiting on auth endpoints
- Org-level access controls
