#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for parca-dev/docs
# Runs on existing source tree (no clone). Installs deps, builds.

# --- Node version ---
echo "[INFO] Node version: $(node --version)"

# --- Package manager + dependencies ---
echo "[INFO] Installing root dependencies..."
yarn install --frozen-lockfile

# Install plugin dependencies (node-fetch is not hoisted to root)
echo "[INFO] Installing plugin dependencies..."
cd docusaurus-github-releases-plugin
yarn install --frozen-lockfile
cd ..

# --- Build ---
echo "[INFO] Building site..."
yarn build

echo "[DONE] Build complete."
