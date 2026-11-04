#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${1:-"$PROJECT_ROOT/build"}"

if [[ "$BUILD_DIR" != /* ]]; then
    BUILD_DIR="$PWD/$BUILD_DIR"
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
    APP_PATH="$BUILD_DIR/SavvyCAN.app"
    if [[ ! -d "$APP_PATH" ]]; then
        echo "Error: $APP_PATH was not found. Run scripts/build.sh first." >&2
        exit 1
    fi
    exec open "$APP_PATH"
fi

APP_PATH="$BUILD_DIR/SavvyCAN"
if [[ ! -x "$APP_PATH" ]]; then
    echo "Error: $APP_PATH was not found. Run scripts/build.sh first." >&2
    exit 1
fi

exec "$APP_PATH"
