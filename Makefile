.PHONY: all build debug test

BUILD_DIR ?= build
TEST_BUILD_DIR ?= build-tests
DEBUG_BUILD_DIR ?= build-debug

all: build

build:
	./scripts/build.sh "$(BUILD_DIR)"

debug:
	./scripts/debug.sh "$(DEBUG_BUILD_DIR)"

test:
	./scripts/run_tests.sh "$(TEST_BUILD_DIR)"
