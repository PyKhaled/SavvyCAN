Qt6 based cross platform canbus tool
(C) 2015-2026 Collin Kidder

A Qt6 based cross platform tool which can be used to load, save, and capture canbus frames.
This tool is designed to help with visualization, reverse engineering, debugging, and
capturing of canbus frames.

Please use the "Discussions" tab here on GitHub to ask questions and interact with the community.

Requires a resolution of at least 1024x768. Fully multi-monitor capable. Works on 4K monitors as well.

You are highly recommended to use the
[CANDue board from EVTV](http://store.evtv.me/proddetail.php?prod=ArduinoDueCANBUS&cat=23).

The CANDue board must be running the GVRET firmware which can also be found
within the collin80 repos.

It is now possible to use any Qt SerialBus driver (socketcan, Vector, PeakCAN, TinyCAN).

It should, however, be noted that use of a capture device is not required to make use
of this program. It can load and save in several formats:

1. BusMaster log file
2. Microchip log file
3. CRTD format (OVMS log file format from Mark Webb-Johnson)
4. GVRET native format
5. Generic CSV file (ID, D0 D1 D2 D3 D4 D5 D6 D7)
6. Vector Trace files
7. IXXAT Minilog files
8. CAN-DO Logs
9. Vehicle Spy log files
10. CANDump / Kayak (Read only)
11. PCAN Viewer (Read Only)
12. Wireshark socketcan PCAP file (Read only)

## Dependencies

Now this code does not depend on anything other than what is in the source tree or available
from the Qt installer.

Uses QCustomPlot available at:

http://www.qcustomplot.com/

However, this source code is integrated into the source for SavvyCAN and one isn't required
to download it separately.

The CMake build requires CMake 3.21 or newer, Qt 6.4 or newer with the Core,
Gui, PrintSupport, SerialBus, SerialPort, Widgets, Help, Network, OpenGL, and
QML modules, and OpenGL development files. libusb-1.0 is optional and enables
pico-flexray support when available. The qmake project requires Qt 6.5 or newer.

It appears that the current binary build for MacOS requires at least MacOS 10.15

## Build with CMake

Install CMake and Qt 6 with the modules listed above. Then configure and build:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release --parallel
```

Run the application from the build directory:

```sh
# Linux
./build/SavvyCAN

# macOS
open build/SavvyCAN.app
```

On Linux, `./install.sh` creates a desktop shortcut.

### Build with qmake

The qmake project is also available for Qt Creator and requires Qt 6.5 or newer:

```sh
qmake6 SavvyCAN.pro
make -j
```

## Build and run tests

Configure with `BUILD_TESTS=ON` to build the maintained unit-test suite along
with the application. The test runner script performs the configure, build, and
CTest steps:

```sh
./scripts/run_tests.sh
```

You can optionally pass a build directory:

```sh
./scripts/run_tests.sh /tmp/savvycan-tests
```

To run the steps manually:

```sh
cmake -S . -B build-tests -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTS=ON
cmake --build build-tests --parallel
QT_QPA_PLATFORM=offscreen ctest --test-dir build-tests --output-on-failure
```

The offscreen Qt platform lets widget tests run on machines without a display.

## Documentation

- [Application help](help/README.md) — user guides for windows and workflows.
- [Development roadmaps](docs/README.md) — feature plans and implementation
  notes.
- [Scripts](scripts/README.md) — test runner and translation utilities.

## Repository layout

- `src/` contains SavvyCAN application code, grouped by feature and subsystem.
- `third_party/` contains vendored QCustomPlot and QMQTT sources and notices.
- `tests/unit/` is the maintained CMake test suite; `tests/legacy/` holds the
  separate qmake test project.
- `resources/`, `help/`, `examples/`, and `translations/` hold application
  assets and user-facing data.
- `docs/`, `scripts/`, `tools/`, and `packaging/` hold developer documentation,
  maintenance scripts, utilities, and platform packaging files.

### Used Items Requiring Attribution

nodes by Adrien Coquet from the Noun Project

message by Vectorstall from the Noun Project

signal by shashank singh from the Noun Project

signal by juli from the Noun Project

signal by yudi from the Noun Project

Death by Adrien Coquet from the Noun Project
