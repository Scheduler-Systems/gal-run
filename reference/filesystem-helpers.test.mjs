import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, readFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import test from 'node:test';

import {
  findProjectRoot,
  getCurrentWorkspacePath,
  getProjectConfigPath,
  getWorkspaceConfigPath,
  readCurrentWorkspaceSelection,
  resolveActiveWorkspace,
  writeCurrentWorkspaceSelection,
} from './filesystem-helpers.mjs';

test('workspace helper paths use ~/.gal/workspaces/<workspace>', () => {
  const homeDir = '/tmp/gal-home';
  assert.equal(
    getWorkspaceConfigPath('scheduler-systems', { homeDir }),
    '/tmp/gal-home/.gal/workspaces/scheduler-systems/config.yaml'
  );
  assert.equal(
    getCurrentWorkspacePath({ homeDir }),
    '/tmp/gal-home/.gal/state/current-workspace.json'
  );
});

test('current workspace selection round-trips through ~/.gal/state/current-workspace.json', () => {
  const homeDir = mkdtempSync(join(tmpdir(), 'gal-home-'));

  writeCurrentWorkspaceSelection('scheduler-systems', { homeDir });

  assert.equal(
    readCurrentWorkspaceSelection({ homeDir }),
    'scheduler-systems'
  );

  const statePath = getCurrentWorkspacePath({ homeDir });
  const raw = JSON.parse(readFileSync(statePath, 'utf-8'));
  assert.deepEqual(raw, { workspace: 'scheduler-systems' });
});

test('resolveActiveWorkspace honors explicit, project, git, current, then fallback order', () => {
  assert.equal(
    resolveActiveWorkspace({
      explicitWorkspace: 'explicit',
      projectWorkspaceRef: 'project',
      gitOwner: 'owner',
      currentWorkspace: 'current',
      fallbackWorkspace: 'personal',
    }),
    'explicit'
  );

  assert.equal(
    resolveActiveWorkspace({
      projectWorkspaceRef: 'project',
      gitOwner: 'owner',
      currentWorkspace: 'current',
      fallbackWorkspace: 'personal',
    }),
    'project'
  );

  assert.equal(
    resolveActiveWorkspace({
      currentWorkspace: 'current',
    }),
    'current'
  );
});

test('findProjectRoot prefers .git markers when scanning upward', () => {
  const projectRoot = mkdtempSync(join(tmpdir(), 'gal-project-'));
  const nested = join(projectRoot, 'src', 'utils');

  mkdirSync(join(projectRoot, '.git'));
  mkdirSync(nested, { recursive: true });

  assert.equal(findProjectRoot(nested), projectRoot);
  assert.equal(
    getProjectConfigPath(projectRoot),
    join(projectRoot, '.gal', 'config.yaml')
  );
});

test('findProjectRoot falls back to local markers for non-git projects', () => {
  const projectRoot = mkdtempSync(join(tmpdir(), 'gal-local-project-'));
  const nested = join(projectRoot, 'docs', 'notes');

  mkdirSync(join(projectRoot, '.claude'));
  mkdirSync(nested, { recursive: true });

  assert.equal(findProjectRoot(nested), projectRoot);
});
