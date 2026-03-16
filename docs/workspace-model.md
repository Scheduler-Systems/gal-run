# GAL Workspace Model

This document defines the target local-first model for the GAL CLI and how that model will be published into the public `gal-run` repository.

## Current Public Repo Status

Today this repository is the public home for:

- release assets
- installation instructions
- Homebrew formula
- issues and community discussion

The CLI source is still being extracted in stages. This document describes the target architecture that public CLI work should implement.

## Scope Model

GAL should behave as a workspace-scoped configuration layer with repo-scoped overrides.

The intended precedence is:

`project scope > GAL workspace scope > generated native files`

In practice:

- `~/.gal/workspaces/<workspace>/` stores the local mirror of a GAL workspace
- `<repo>/.gal/` stores repo-specific overrides
- native files like `AGENTS.md`, `.claude/`, `.cursor/`, and `.github/copilot-instructions.md` are generated outputs

## Directory Layout

Workspace scope:

```text
~/.gal/
  state/
    config.json
    current-workspace.json
    credentials.json
    update-cache.json
    telemetry-queue.json

  workspaces/
    personal/
      config.yaml
      platforms/
      sync-state.json

    scheduler-systems/
      config.yaml
      platforms/
      sync-state.json
```

Project scope:

```text
<repo>/.gal/
  config.yaml
  sync-state.json
```

## Resolution Rules

Effective config for a repo should be resolved like this:

1. Load the active workspace config from `~/.gal/workspaces/<workspace>/config.yaml`
2. Load repo overrides from `<repo>/.gal/config.yaml` when present
3. Merge both, with repo scope taking precedence
4. Generate native agent files from the effective config

Important rules:

- repo overrides never silently mutate workspace config
- workspace sync from GAL Cloud updates `~/.gal/workspaces/<workspace>/`
- promotion from local state into GAL Cloud or org workflows must be explicit

## Command Model

For local-only users:

```bash
gal workspace init personal
gal scan
gal approve
gal sync
```

For connected users:

```bash
gal auth login
gal workspace connect Scheduler-Systems
gal workspace pull
gal sync
```

For repo-specific overrides:

```bash
gal approve --project
gal sync
```

## Public Repo Rollout

The public repo rollout should happen in stages:

1. Publish the scope model and CLI behavior in public docs
2. Publish shared schemas, config formats, and generated-file mappings
3. Publish the local config resolver and sync logic that do not require private backend code
4. Publish the CLI source for local-first flows into this repository
5. Keep proprietary GAL Cloud and org approval backend logic private

This keeps the public repo truthful while still allowing incremental extraction of the CLI.

## PR Policy For Public Work

Changes pushed to this public repository should follow these rules:

- do not claim the CLI source is public until the relevant source actually lands here
- document roadmap items as planned, not shipped, until the implementation is public
- keep install instructions accurate to the currently released CLI
- prefer additive docs and extraction steps over placeholder source trees
