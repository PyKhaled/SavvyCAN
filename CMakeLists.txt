cmake_minimum_required(VERSION 3.21)
project(SavvyCAN VERSION 1.0 LANGUAGES C CXX)

set(QT_MIN_VERSION 6.4)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC_SEARCH_PATHS ${CMAKE_CURRENT_SOURCE_DIR}/src/ui)

option(USE_DBUS "Enable DBus support" OFF)
option(BUILD_TESTS "Build test target" OFF)
option(USE_SANITIZER "Enable sanitizers for Debug builds" OFF)
option(USE_LIBUSB "pico-flexray (FlexRay over USB) support, if libusb-1.0 is found" ON)

find_package(Qt6 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Core Gui PrintSupport SerialBus SerialPort Widgets Help Network OpenGL Qml)
find_package(OpenGL REQUIRED)

if(Qt6_VERSION VERSION_LESS ${QT_MIN_VERSION})
    message(FATAL_ERROR "Qt version ${Qt6_VERSION} found, but ${QT_MIN_VERSION} or higher is required")
endif()

# Function for setting debug and sanitizer flags
function(set_debug_sanitizer_options target_name)
    if(CMAKE_BUILD_TYPE STREQUAL Debug)
        target_compile_options(${target_name} PRIVATE -Wall -Wextra -g -O0)
        if(USE_SANITIZER)
            target_compile_options(${target_name} PRIVATE -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer)
            target_link_options(${target_name} PRIVATE -fsanitize=address -fsanitize=undefined)
        endif()
    endif()
endfunction()

if(USE_DBUS AND UNIX AND NOT APPLE)
    find_package(Qt6 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS DBus)
endif()

qt_standard_project_setup()

qt_add_executable(SavvyCAN WIN32 MACOSX_BUNDLE
    src/analysis/bisectwindow.cpp src/analysis/bisectwindow.h
    src/io/blfhandler.cpp src/io/blfhandler.h
    src/app/windows/croplogdialog.cpp src/app/windows/croplogdialog.h
    src/protocols/isotp_handler.cpp src/protocols/isotp_handler.h
    src/protocols/handler_factory.cpp src/protocols/handler_factory.h
    src/protocols/isotp_message.h
    src/protocols/j1939_handler.cpp src/protocols/j1939_handler.h
    src/protocols/obd2_pids.cpp src/protocols/obd2_pids.h
    src/protocols/obd2_poller.cpp src/protocols/obd2_poller.h
    src/protocols/obd2_dbc.cpp src/protocols/obd2_dbc.h
    src/protocols/uds_handler.cpp src/protocols/uds_handler.h
    src/core/can_structs.cpp src/core/can_structs.h
    src/core/can_trigger_structs.h
    src/app/windows/canbridgewindow.cpp src/app/windows/canbridgewindow.h
    src/app/windows/candatagrid.cpp src/app/windows/candatagrid.h
    src/core/canfilter.cpp src/core/canfilter.h
    src/core/canframemodel.cpp src/core/canframemodel.h
    src/core/config.h
    src/connections/canbus.cpp src/connections/canbus.h
    src/connections/canconconst.h
    src/connections/canconfactory.cpp src/connections/canconfactory.h
    src/connections/canconmanager.cpp src/connections/canconmanager.h
    src/connections/canconnection.cpp src/connections/canconnection.h
    src/connections/canconnectionmodel.cpp src/connections/canconnectionmodel.h
    src/connections/canlogserver.cpp src/connections/canlogserver.h
    src/connections/canserver.cpp src/connections/canserver.h
    src/connections/picoflexray.cpp src/connections/picoflexray.h
    src/connections/picoflexrayparser.cpp src/connections/picoflexrayparser.h
    src/connections/connectionwindow.cpp src/connections/connectionwindow.h
    src/connections/gvretserial.cpp src/connections/gvretserial.h
    src/connections/lawicel_serial.cpp src/connections/lawicel_serial.h
    src/connections/mqtt_bus.cpp src/connections/mqtt_bus.h
    src/connections/newconnectiondialog.cpp src/connections/newconnectiondialog.h
    src/connections/serialbusconnection.cpp src/connections/serialbusconnection.h
    src/connections/socketcand.cpp src/connections/socketcand.h
    src/dbc/dbc_classes.cpp src/dbc/dbc_classes.h
    src/dbc/dbchandler.cpp src/dbc/dbchandler.h
    src/dbc/dbcloadsavewindow.cpp src/dbc/dbcloadsavewindow.h
    src/dbc/dbcmaineditor.cpp src/dbc/dbcmaineditor.h
    src/dbc/dbcmessageeditor.cpp src/dbc/dbcmessageeditor.h
    src/dbc/dbcnodeduplicateeditor.cpp src/dbc/dbcnodeduplicateeditor.h
    src/dbc/dbcnodeeditor.cpp src/dbc/dbcnodeeditor.h
    src/dbc/dbcnoderebaseeditor.cpp src/dbc/dbcnoderebaseeditor.h
    src/dbc/dbcsignaleditor.cpp src/dbc/dbcsignaleditor.h
    src/core/filterutility.cpp src/core/filterutility.h
    src/analysis/udsfirmwareuploaderwindow.cpp src/analysis/udsfirmwareuploaderwindow.h
    src/io/framefileio.cpp src/io/framefileio.h
    src/app/windows/lognotes.cpp src/app/windows/lognotes.h
    src/app/windows/lognotesdialog.cpp src/app/windows/lognotesdialog.h
    src/app/windows/lognotespanel.cpp src/app/windows/lognotespanel.h
    src/app/windows/markerpresets.cpp src/app/windows/markerpresets.h
    src/app/windows/markerpresetsdialog.cpp src/app/windows/markerpresetsdialog.h
    src/core/shortcutcheck.cpp src/core/shortcutcheck.h
    src/app/windows/frameplaybackobject.cpp src/app/windows/frameplaybackobject.h
    src/app/windows/frameplaybackwindow.cpp src/app/windows/frameplaybackwindow.h
    src/app/windows/framesenderobject.cpp src/app/windows/framesenderobject.h
    src/app/windows/framesenderwindow.cpp src/app/windows/framesenderwindow.h
    src/integrations/github/githubaccountdialog.cpp src/integrations/github/githubaccountdialog.h
    src/integrations/github/githubbrowserdialog.cpp src/integrations/github/githubbrowserdialog.h
    src/integrations/github/githubcache.cpp src/integrations/github/githubcache.h
    src/integrations/github/githubclient.cpp src/integrations/github/githubclient.h
    src/integrations/github/githubdeviceflow.cpp src/integrations/github/githubdeviceflow.h
    src/integrations/github/githubhelp.h
    src/integrations/github/githubsettings.cpp src/integrations/github/githubsettings.h
    src/app/helpwindow.cpp src/app/helpwindow.h
    src/scripting/jsedit.cpp src/scripting/jsedit.h
    src/app/main.cpp
    src/app/mainsettingsdialog.cpp src/app/mainsettingsdialog.h
    src/app/mainwindow.cpp src/app/mainwindow.h
    src/app/windows/motorcontrollerconfigwindow.cpp src/app/windows/motorcontrollerconfigwindow.h
    third_party/qmqtt/qmqtt.h
    third_party/qmqtt/qmqtt_client.cpp third_party/qmqtt/qmqtt_client.h third_party/qmqtt/qmqtt_client_p.cpp third_party/qmqtt/qmqtt_client_p.h
    third_party/qmqtt/qmqtt_frame.cpp third_party/qmqtt/qmqtt_frame.h
    third_party/qmqtt/qmqtt_global.h
    third_party/qmqtt/qmqtt_message.cpp third_party/qmqtt/qmqtt_message.h third_party/qmqtt/qmqtt_message_p.h
    third_party/qmqtt/qmqtt_network.cpp third_party/qmqtt/qmqtt_network_p.h
    third_party/qmqtt/qmqtt_networkinterface.h
    third_party/qmqtt/qmqtt_routedmessage.h
    third_party/qmqtt/qmqtt_router.cpp third_party/qmqtt/qmqtt_router.h
    third_party/qmqtt/qmqtt_routesubscription.cpp third_party/qmqtt/qmqtt_routesubscription.h
    third_party/qmqtt/qmqtt_socket.cpp third_party/qmqtt/qmqtt_socket_p.h
    third_party/qmqtt/qmqtt_socketinterface.h
    third_party/qmqtt/qmqtt_ssl_socket.cpp third_party/qmqtt/qmqtt_ssl_socket_p.h
    third_party/qmqtt/qmqtt_timer.cpp third_party/qmqtt/qmqtt_timer_p.h
    third_party/qmqtt/qmqtt_timerinterface.h
    third_party/qmqtt/qmqtt_websocket.cpp third_party/qmqtt/qmqtt_websocket_p.h
    third_party/qmqtt/qmqtt_websocketiodevice.cpp third_party/qmqtt/qmqtt_websocketiodevice_p.h
    src/io/pcaplite.cpp src/io/pcaplite.h
    src/analysis/qcpaxistickerhex.cpp src/analysis/qcpaxistickerhex.h
    third_party/qcustomplot/qcustomplot.cpp third_party/qcustomplot/qcustomplot.h
    src/analysis/dbccomparatorwindow.cpp src/analysis/dbccomparatorwindow.h
    src/analysis/discretestatewindow.cpp src/analysis/discretestatewindow.h
    src/analysis/filecomparatorwindow.cpp src/analysis/filecomparatorwindow.h
    src/analysis/flowviewwindow.cpp src/analysis/flowviewwindow.h
    src/analysis/frameinfowindow.cpp src/analysis/frameinfowindow.h
    src/analysis/fuzzingwindow.cpp src/analysis/fuzzingwindow.h
    src/analysis/graphingwindow.cpp src/analysis/graphingwindow.h
    src/analysis/isotp_interpreterwindow.cpp src/analysis/isotp_interpreterwindow.h
    src/analysis/newgraphdialog.cpp src/analysis/newgraphdialog.h
    src/analysis/rangestatewindow.cpp src/analysis/rangestatewindow.h
    src/analysis/searchwindow.cpp src/analysis/searchwindow.h
    src/analysis/sniffer/SnifferDelegate.cpp src/analysis/sniffer/SnifferDelegate.h
    src/analysis/sniffer/snifferitem.cpp src/analysis/sniffer/snifferitem.h
    src/analysis/sniffer/sniffermodel.cpp src/analysis/sniffer/sniffermodel.h
    src/analysis/sniffer/snifferwindow.cpp src/analysis/sniffer/snifferwindow.h
    src/analysis/temporalgraphwindow.cpp src/analysis/temporalgraphwindow.h
    src/analysis/udsscanwindow.cpp src/analysis/udsscanwindow.h
    src/analysis/obd2window.cpp src/analysis/obd2window.h
    src/scripting/scriptcontainer.cpp src/scripting/scriptcontainer.h
    src/app/windows/scriptingwindow.cpp src/app/windows/scriptingwindow.h
    src/analysis/signalviewerwindow.cpp src/analysis/signalviewerwindow.h
    src/core/simplecrypt.cpp src/core/simplecrypt.h
    src/app/windows/triggerdialog.cpp src/app/windows/triggerdialog.h src/ui/triggerdialog.ui
    src/core/utility.cpp src/core/utility.h
    src/utils/HexSpinBox.h
    src/utils/lfqueue.h
    resources/images.qrc resources/icons.qrc
    src/ui/bisectwindow.ui src/ui/canbridgewindow.ui src/ui/candatagrid.ui src/ui/connectionwindow.ui src/ui/dbccomparatorwindow.ui src/ui/dbcloadsavewindow.ui src/ui/dbcmaineditor.ui src/ui/dbcmessageeditor.ui src/ui/dbcnodeduplicateeditor.ui src/ui/dbcnodeeditor.ui src/ui/dbcnoderebaseeditor.ui src/ui/dbcsignaleditor.ui src/ui/discretestatewindow.ui src/ui/filecomparatorwindow.ui src/ui/udsfirmwareuploaderwindow.ui src/ui/flowviewwindow.ui src/ui/frameinfowindow.ui src/ui/frameplaybackwindow.ui src/ui/framesenderwindow.ui src/ui/fuzzingwindow.ui src/ui/graphingwindow.ui src/ui/helpwindow.ui src/ui/isotp_interpreterwindow.ui src/ui/mainsettingsdialog.ui src/ui/mainwindow.ui src/ui/motorcontrollerconfigwindow.ui src/ui/newconnectiondialog.ui src/ui/newgraphdialog.ui src/ui/rangestatewindow.ui src/ui/scriptingwindow.ui src/ui/searchwindow.ui src/ui/signalviewerwindow.ui src/ui/snifferwindow.ui src/ui/temporalgraphwindow.ui src/ui/udsscanwindow.ui
)

if(APPLE)
    set(APP_ICON_MACOS "${CMAKE_CURRENT_SOURCE_DIR}/resources/icons/SavvyIcon.icns")
    set_source_files_properties(${APP_ICON_MACOS} PROPERTIES
        MACOSX_PACKAGE_LOCATION "Resources"
    )
    target_sources(SavvyCAN PRIVATE ${APP_ICON_MACOS})
    set_target_properties(SavvyCAN PROPERTIES
        MACOSX_BUNDLE_ICON_FILE SavvyIcon.icns
        MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/packaging/Info.plist.cmake"
    )
endif()

target_include_directories(SavvyCAN PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/app
    ${CMAKE_CURRENT_SOURCE_DIR}/src/app/windows
    ${CMAKE_CURRENT_SOURCE_DIR}/src/core
    ${CMAKE_CURRENT_SOURCE_DIR}/src/io
    ${CMAKE_CURRENT_SOURCE_DIR}/src/dbc
    ${CMAKE_CURRENT_SOURCE_DIR}/src/analysis
    ${CMAKE_CURRENT_SOURCE_DIR}/src/analysis/sniffer
    ${CMAKE_CURRENT_SOURCE_DIR}/src/integrations/github
    ${CMAKE_CURRENT_SOURCE_DIR}/src/scripting
    ${CMAKE_CURRENT_SOURCE_DIR}/src/utils
    ${CMAKE_CURRENT_SOURCE_DIR}/third_party/qmqtt
    ${CMAKE_CURRENT_SOURCE_DIR}/third_party/qcustomplot
)

target_compile_definitions(SavvyCAN PRIVATE
    QCUSTOMPLOT_USE_OPENGL
)

if(CMAKE_BUILD_TYPE STREQUAL Release)
    target_compile_definitions(SavvyCAN PRIVATE QT_NO_DEBUG_OUTPUT)
endif()

set_debug_sanitizer_options(SavvyCAN)

target_link_libraries(SavvyCAN PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::PrintSupport
    Qt6::SerialBus
    Qt6::SerialPort
    Qt6::Widgets
    Qt6::Help
    Qt6::Network
    Qt6::OpenGL
    Qt6::Qml # for QJSEngine
    OpenGL::GL
)

if(USE_DBUS AND UNIX AND NOT APPLE)
    target_link_libraries(SavvyCAN PRIVATE Qt6::DBus)
endif()

# libusb-1.0 for the pico-flexray connection: pkg-config first, then a plain search (vcpkg, or set
# LIBUSB_INCLUDE_DIR/LIBUSB_LIBRARY by hand). Without it, SavvyCAN builds without pico-flexray support.
if(USE_LIBUSB)
    find_package(PkgConfig QUIET)
    if(PKG_CONFIG_FOUND)
        pkg_check_modules(LIBUSB QUIET IMPORTED_TARGET libusb-1.0)
    endif()
    if(LIBUSB_FOUND)
        target_link_libraries(SavvyCAN PRIVATE PkgConfig::LIBUSB)
    else()
        find_path(LIBUSB_INCLUDE_DIR libusb.h PATH_SUFFIXES libusb-1.0)
        find_library(LIBUSB_LIBRARY NAMES usb-1.0 libusb-1.0)
        if(LIBUSB_INCLUDE_DIR AND LIBUSB_LIBRARY)
            set(LIBUSB_FOUND TRUE)
            target_include_directories(SavvyCAN PRIVATE ${LIBUSB_INCLUDE_DIR})
            target_link_libraries(SavvyCAN PRIVATE ${LIBUSB_LIBRARY})
        endif()
    endif()
    if(LIBUSB_FOUND)
        target_compile_definitions(SavvyCAN PRIVATE HAVE_LIBUSB)
        message(STATUS "libusb-1.0 found: pico-flexray support enabled")
    else()
        message(STATUS "libusb-1.0 not found: pico-flexray support disabled")
    endif()
endif()

if(WIN32)
    set_target_properties(SavvyCAN PROPERTIES WIN32_EXECUTABLE TRUE)
    target_sources(SavvyCAN PRIVATE resources/icons/SavvyIcon.rc)
endif()

if(UNIX AND NOT APPLE)
    if(NOT DEFINED PREFIX)
        set(PREFIX "/usr/local")
    endif()
    install(TARGETS SavvyCAN RUNTIME DESTINATION ${PREFIX}/bin)
    install(FILES packaging/SavvyCAN.desktop DESTINATION ${PREFIX}/share/applications)
    install(DIRECTORY resources/icons/hicolor DESTINATION ${PREFIX}/share/icons)
    install(DIRECTORY examples DESTINATION ${PREFIX}/share/savvycan)
    install(DIRECTORY help DESTINATION ${PREFIX}/share/savvycan)
endif()

install(TARGETS SavvyCAN
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests/unit)
endif()
