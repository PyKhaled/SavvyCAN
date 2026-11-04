#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# To add this tool in Qt Creator:
# Category: Linguist
# Name: Update Translations (lupdate)
# Executable: lupdate
# Arguments: -project SavvyCAN.pro
# Working Directory: %{ActiveProject:Path}

if ! command -v lupdate >/dev/null 2>&1; then
    echo "Error: lupdate was not found on PATH. Install the Qt Linguist tools first." >&2
    exit 1
fi

echo "Updating translation files..."

(cd "$PROJECT_ROOT" && lupdate -verbose SavvyCAN.pro)

echo "Translation files updated."
