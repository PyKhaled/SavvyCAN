# Scripts

The test runner configures the root CMake project with tests enabled, builds the
application and unit tests, then runs CTest with Qt's offscreen platform:

```bash
./scripts/run_tests.sh
```

Pass a build directory to use a different location:

```bash
./scripts/run_tests.sh /tmp/savvycan-tests
```

The translation scripts require the corresponding Qt Linguist tool on `PATH`.
They locate the project file relative to the script, so they can be run from
any working directory:

```bash
./scripts/build_translations.sh
./scripts/update_translations.sh
```
