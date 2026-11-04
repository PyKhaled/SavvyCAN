#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${1:-"$PROJECT_ROOT/build-debug"}"

if [[ "$BUILD_DIR" != /* ]]; then
    BUILD_DIR="$PWD/$BUILD_DIR"
fi

cmake -S "$PROJECT_ROOT" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Debug
cmake --build "$BUILD_DIR" --config Debug --parallel

if [[ "$(uname -s)" == "Darwin" ]]; then
    APP_PATH="$BUILD_DIR/SavvyCAN.app/Contents/MacOS/SavvyCAN"
else
    APP_PATH="$BUILD_DIR/SavvyCAN"
fi

if [[ ! -x "$APP_PATH" ]]; then
    echo "Error: Debug executable was not found at $APP_PATH." >&2
    exit 1
fi

exec "$APP_PATH"
