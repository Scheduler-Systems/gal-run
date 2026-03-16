import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { homedir } from 'node:os';
import { dirname, join, parse, resolve } from 'node:path';

function validatePathString(value, label) {
  if (typeof value !== 'string') {
    throw new TypeError(`${label} must be a string`);
  }

  if (!value.trim()) {
    throw new Error(`${label} cannot be empty`);
  }

  if (value.includes('\0')) {
    throw new Error(`${label} cannot contain a null byte`);
  }

  return value;
}

function validatePathSegment(name, label) {
  const value = validatePathString(name, label).trim();

  if (
    value === '.' ||
    value === '..' ||
    value.includes('/') ||
    value.includes('\\')
  ) {
    throw new Error(`${label} must be a single path segment`);
  }

  return value;
}

function firstDefinedValue(values) {
  for (const value of values) {
    if (typeof value === 'string' && value.trim()) {
      return value.trim();
    }
  }
  return null;
}

export function getGalRoot({ homeDir = homedir() } = {}) {
  return join(resolve(validatePathString(homeDir, 'Home directory')), '.gal');
}

export function getGalStateDir(options = {}) {
  return join(getGalRoot(options), 'state');
}

export function getCurrentWorkspacePath(options = {}) {
  return join(getGalStateDir(options), 'current-workspace.json');
}

export function getWorkspacesDir(options = {}) {
  return join(getGalRoot(options), 'workspaces');
}

export function sanitizeWorkspaceName(name) {
  return validatePathSegment(name, 'Workspace name');
}

export function getWorkspaceDir(workspaceName, options = {}) {
  return join(getWorkspacesDir(options), sanitizeWorkspaceName(workspaceName));
}

export function getWorkspaceConfigPath(workspaceName, options = {}) {
  return join(getWorkspaceDir(workspaceName, options), 'config.yaml');
}

export function getWorkspaceSyncStatePath(workspaceName, options = {}) {
  return join(getWorkspaceDir(workspaceName, options), 'sync-state.json');
}

export function readCurrentWorkspaceSelection(options = {}) {
  const statePath = getCurrentWorkspacePath(options);
  if (!existsSync(statePath)) {
    return null;
  }

  try {
    const parsed = JSON.parse(readFileSync(statePath, 'utf-8'));
    return typeof parsed.workspace === 'string' && parsed.workspace.trim()
      ? sanitizeWorkspaceName(parsed.workspace)
      : null;
  } catch {
    return null;
  }
}

export function writeCurrentWorkspaceSelection(workspaceName, options = {}) {
  const stateDir = getGalStateDir(options);
  mkdirSync(stateDir, { recursive: true });
  const payload = {
    workspace: sanitizeWorkspaceName(workspaceName),
  };
  writeFileSync(
    getCurrentWorkspacePath(options),
    `${JSON.stringify(payload, null, 2)}\n`,
    'utf-8'
  );
}

export function resolveActiveWorkspace({
  explicitWorkspace,
  projectWorkspaceRef,
  gitOwner,
  currentWorkspace,
  fallbackWorkspace = 'personal',
} = {}) {
  const selected = firstDefinedValue([
    explicitWorkspace,
    projectWorkspaceRef,
    gitOwner,
    currentWorkspace,
    fallbackWorkspace,
  ]);

  return sanitizeWorkspaceName(selected || 'personal');
}

export function getProjectGalDir(projectRoot) {
  return join(resolve(validatePathString(projectRoot, 'Project root')), '.gal');
}

export function getProjectConfigPath(projectRoot) {
  return join(getProjectGalDir(projectRoot), 'config.yaml');
}

export function getProjectSyncStatePath(projectRoot) {
  return join(getProjectGalDir(projectRoot), 'sync-state.json');
}

export function findProjectRoot(
  startPath = process.cwd(),
  {
    additionalMarkers = ['.claude', '.gal'],
  } = {}
) {
  const resolvedStartPath = resolve(validatePathString(startPath, 'Start path'));
  const root = parse(resolvedStartPath).root;

  let currentPath = resolvedStartPath;
  while (true) {
    if (existsSync(join(currentPath, '.git'))) {
      return currentPath;
    }

    if (currentPath === root) {
      break;
    }

    currentPath = dirname(currentPath);
  }

  const markers = additionalMarkers.map((marker) =>
    validatePathSegment(marker, 'Project marker')
  );

  currentPath = resolvedStartPath;
  while (true) {
    if (markers.some((marker) => existsSync(join(currentPath, marker)))) {
      return currentPath;
    }

    if (currentPath === root) {
      break;
    }

    currentPath = dirname(currentPath);
  }

  return resolvedStartPath;
}
