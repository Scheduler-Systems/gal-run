# GAL Examples

This directory contains examples and guides for using GAL.

## Quick Start

```bash
# Install GAL
npm install -g @scheduler-systems/gal

# Authenticate
gal auth login

# Sync your organization's approved configuration
gal sync --pull
```

## Configuration Examples

### Claude Code

After running `gal sync --pull`, your Claude Code configuration will be updated:

```
~/.claude/
├── settings.json      # Approved permissions and settings
├── commands/          # Organization-approved commands
└── agents/            # Approved agent definitions
```

### Cursor

```
~/.cursor/
├── rules/             # Organization rules
└── .cursorrules       # Cursor-specific rules
```

### Windsurf

```
~/.windsurfrules       # Windsurf rules
```

## Organization Setup

For administrators setting up GAL for your organization, see the [Admin Guide](https://docs.gal.run/admin).
