# Scripts

Build a Release version, then start the application:

```bash
./scripts/build.sh
./scripts/start.sh
```

Both scripts accept an optional build directory. The default is `build`:

```bash
./scripts/build.sh /tmp/savvycan
./scripts/start.sh /tmp/savvycan
```

Build and run a Debug version (default build directory: `build-debug`):

```bash
./scripts/debug.sh
```

Use your IDE or debugger to set breakpoints in the Debug build.

The test runner configures the root CMake project with tests enabled, builds the
application and unit tests, then runs CTest with Qt's offscreen platform:

```bash
./scripts/test.sh
```

Pass a build directory to use a different location:

```bash
./scripts/test.sh /tmp/savvycan-tests
```

`scripts/run_tests.sh` remains available as the underlying test runner.

The translation scripts require the corresponding Qt Linguist tool on `PATH`.
They locate the project file relative to the script, so they can be run from
any working directory:

```bash
./scripts/build_translations.sh
./scripts/update_translations.sh
```
