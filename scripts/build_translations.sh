#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# To add this tool in Qt Creator:
# Category: Linguist
# Name: Release Translations (lrelease)
# Executable: lrelease
# Arguments: SavvyCAN.pro
# Working Directory: %{ActiveProject:Path}

if ! command -v lrelease >/dev/null 2>&1; then
    echo "Error: lrelease was not found on PATH. Install the Qt Linguist tools first." >&2
    exit 1
fi

echo "Generating .qm files..."

(cd "$PROJECT_ROOT" && lrelease -verbose SavvyCAN.pro)

echo ".qm files generated."
