#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${1:-"$PROJECT_ROOT/build-tests"}"

cmake -S "$PROJECT_ROOT" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTS=ON
cmake --build "$BUILD_DIR" --parallel 2
QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-offscreen}" ctest --test-dir "$BUILD_DIR" --output-on-failure
