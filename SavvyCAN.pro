#-------------------------------------------------
#
# Project created by QtCreator 2015-04-25T22:57:44
#
#-------------------------------------------------

!versionAtLeast(QT_VERSION, 6.5.0) {
    error("Current version of Qt ($${QT_VERSION}) is too old, this project requires Qt 6.5 or newer")
}

QT = core gui printsupport qml serialbus serialport widgets help network opengl dbus

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT

CONFIG += c++17
CONFIG += NO_UNIT_TESTS

DEFINES += QCUSTOMPLOT_USE_OPENGL

TARGET = SavvyCAN
TEMPLATE = app

INCLUDEPATH += \
    src \
    src/app \
    src/app/windows \
    src/core \
    src/io \
    src/protocols \
    src/connections \
    src/dbc \
    src/analysis \
    src/analysis/sniffer \
    src/integrations/github \
    src/scripting \
    src/utils \
    third_party/qmqtt \
    third_party/qcustomplot

QMAKE_INFO_PLIST = packaging/Info.plist.template
ICON = resources/icons/SavvyIcon.icns

SOURCES += src/app/main.cpp\
    src/app/windows/canbridgewindow.cpp \
    src/app/windows/croplogdialog.cpp \
    src/connections/canlogserver.cpp \
    src/connections/canserver.cpp \
    src/connections/picoflexray.cpp \
    src/connections/picoflexrayparser.cpp \
    src/connections/lawicel_serial.cpp \
    src/connections/mqtt_bus.cpp \
    src/dbc/dbcnodeduplicateeditor.cpp \
    src/app/windows/framesenderobject.cpp \
    third_party/qmqtt/qmqtt_client.cpp \
    third_party/qmqtt/qmqtt_client_p.cpp \
    third_party/qmqtt/qmqtt_frame.cpp \
    third_party/qmqtt/qmqtt_message.cpp \
    third_party/qmqtt/qmqtt_network.cpp \
    third_party/qmqtt/qmqtt_router.cpp \
    third_party/qmqtt/qmqtt_routesubscription.cpp \
    third_party/qmqtt/qmqtt_socket.cpp \
    third_party/qmqtt/qmqtt_ssl_socket.cpp \
    third_party/qmqtt/qmqtt_timer.cpp \
    third_party/qmqtt/qmqtt_websocket.cpp \
    third_party/qmqtt/qmqtt_websocketiodevice.cpp \
    src/analysis/qcpaxistickerhex.cpp \
    src/analysis/dbccomparatorwindow.cpp \
    src/app/mainwindow.cpp \
    src/core/canframemodel.cpp \
    src/core/simplecrypt.cpp \
    src/app/windows/triggerdialog.cpp \
    src/core/utility.cpp \
    third_party/qcustomplot/qcustomplot.cpp \
    src/app/windows/frameplaybackwindow.cpp \
    src/app/windows/candatagrid.cpp \
    src/app/windows/framesenderwindow.cpp \
    src/io/framefileio.cpp \
    src/app/windows/lognotes.cpp \
    src/app/windows/lognotesdialog.cpp \
    src/app/windows/lognotespanel.cpp \
    src/app/windows/markerpresets.cpp \
    src/app/windows/markerpresetsdialog.cpp \
    src/core/shortcutcheck.cpp \
    src/integrations/github/githubaccountdialog.cpp \
    src/integrations/github/githubbrowserdialog.cpp \
    src/integrations/github/githubcache.cpp \
    src/integrations/github/githubclient.cpp \
    src/integrations/github/githubdeviceflow.cpp \
    src/integrations/github/githubsettings.cpp \
    src/app/mainsettingsdialog.cpp \
    src/app/windows/scriptingwindow.cpp \
    src/scripting/scriptcontainer.cpp \
    src/core/canfilter.cpp \
    src/core/can_structs.cpp \
    src/app/windows/motorcontrollerconfigwindow.cpp \
    src/connections/canconnection.cpp \
    src/connections/serialbusconnection.cpp \
    src/connections/canconfactory.cpp \
    src/connections/gvretserial.cpp \
    src/connections/socketcand.cpp \
    src/connections/canconmanager.cpp \
    src/analysis/sniffer/snifferitem.cpp \
    src/analysis/sniffer/sniffermodel.cpp \
    src/analysis/sniffer/snifferwindow.cpp \
    src/dbc/dbcmessageeditor.cpp \
    src/dbc/dbc_classes.cpp \
    src/dbc/dbchandler.cpp \
    src/dbc/dbcloadsavewindow.cpp \
    src/dbc/dbcmaineditor.cpp \
    src/dbc/dbcnodeeditor.cpp \
    src/dbc/dbcsignaleditor.cpp \
    src/dbc/dbcnoderebaseeditor.cpp \
    src/analysis/discretestatewindow.cpp \
    src/analysis/filecomparatorwindow.cpp \
    src/analysis/flowviewwindow.cpp \
    src/analysis/frameinfowindow.cpp \
    src/analysis/fuzzingwindow.cpp \
    src/analysis/isotp_interpreterwindow.cpp \
    src/analysis/rangestatewindow.cpp \
    src/analysis/udsscanwindow.cpp \
    src/analysis/obd2window.cpp \
    src/connections/canbus.cpp \
    src/connections/canconnectionmodel.cpp \
    src/connections/connectionwindow.cpp \
    src/analysis/graphingwindow.cpp \
    src/analysis/newgraphdialog.cpp \
    src/analysis/searchwindow.cpp \
    src/analysis/bisectwindow.cpp \
    src/analysis/signalviewerwindow.cpp \
    src/protocols/isotp_handler.cpp \
    src/protocols/j1939_handler.cpp \
    src/protocols/obd2_pids.cpp \
    src/protocols/obd2_poller.cpp \
    src/protocols/obd2_dbc.cpp \
    src/protocols/uds_handler.cpp \
    src/protocols/handler_factory.cpp \
    src/scripting/jsedit.cpp \
    src/app/windows/frameplaybackobject.cpp \
    src/app/helpwindow.cpp \
    src/io/blfhandler.cpp \
    src/analysis/sniffer/SnifferDelegate.cpp \
    src/connections/newconnectiondialog.cpp \
    src/analysis/temporalgraphwindow.cpp \
    src/analysis/udsfirmwareuploaderwindow.cpp \
    src/core/filterutility.cpp \
    src/io/pcaplite.cpp

HEADERS  += src/app/mainwindow.h \
    src/core/can_structs.h \
    src/app/windows/canbridgewindow.h \
    src/app/windows/croplogdialog.h \
    src/core/canframemodel.h \
    src/connections/canlogserver.h \
    src/connections/canserver.h \
    src/connections/picoflexray.h \
    src/connections/picoflexrayparser.h \
    src/connections/lawicel_serial.h \
    src/connections/socketcand.h \
    src/connections/mqtt_bus.h \
    src/dbc/dbcnodeduplicateeditor.h \
    src/dbc/dbcnoderebaseeditor.h \
    src/app/windows/framesenderobject.h \
    third_party/qmqtt/qmqtt.h \
    third_party/qmqtt/qmqtt_client.h \
    third_party/qmqtt/qmqtt_client_p.h \
    third_party/qmqtt/qmqtt_frame.h \
    third_party/qmqtt/qmqtt_global.h \
    third_party/qmqtt/qmqtt_message.h \
    third_party/qmqtt/qmqtt_message_p.h \
    third_party/qmqtt/qmqtt_network_p.h \
    third_party/qmqtt/qmqtt_networkinterface.h \
    third_party/qmqtt/qmqtt_routedmessage.h \
    third_party/qmqtt/qmqtt_router.h \
    third_party/qmqtt/qmqtt_routesubscription.h \
    third_party/qmqtt/qmqtt_socket_p.h \
    third_party/qmqtt/qmqtt_socketinterface.h \
    third_party/qmqtt/qmqtt_ssl_socket_p.h \
    third_party/qmqtt/qmqtt_timer_p.h \
    third_party/qmqtt/qmqtt_timerinterface.h \
    third_party/qmqtt/qmqtt_websocket_p.h \
    third_party/qmqtt/qmqtt_websocketiodevice_p.h \
    src/analysis/qcpaxistickerhex.h \
    src/analysis/dbccomparatorwindow.h \
    src/core/simplecrypt.h \
    src/app/windows/triggerdialog.h \
    src/core/utility.h \
    third_party/qcustomplot/qcustomplot.h \
    src/app/windows/frameplaybackwindow.h \
    src/app/windows/candatagrid.h \
    src/app/windows/framesenderwindow.h \
    src/core/can_trigger_structs.h \
    src/io/framefileio.h \
    src/app/windows/lognotes.h \
    src/app/windows/lognotesdialog.h \
    src/app/windows/lognotespanel.h \
    src/app/windows/markerpresets.h \
    src/app/windows/markerpresetsdialog.h \
    src/core/shortcutcheck.h \
    src/integrations/github/githubaccountdialog.h \
    src/integrations/github/githubbrowserdialog.h \
    src/integrations/github/githubcache.h \
    src/integrations/github/githubclient.h \
    src/integrations/github/githubdeviceflow.h \
    src/integrations/github/githubhelp.h \
    src/integrations/github/githubsettings.h \
    src/core/config.h \
    src/app/mainsettingsdialog.h \
    src/app/windows/scriptingwindow.h \
    src/scripting/scriptcontainer.h \
    src/core/canfilter.h \
    src/utils/HexSpinBox.h \
    src/utils/lfqueue.h \
    src/app/windows/motorcontrollerconfigwindow.h \
    src/connections/canconnection.h \
    src/connections/serialbusconnection.h \
    src/connections/canconconst.h \
    src/connections/canconfactory.h \
    src/connections/gvretserial.h \
    src/connections/canconmanager.h \
    src/analysis/sniffer/snifferitem.h \
    src/analysis/sniffer/sniffermodel.h \
    src/analysis/sniffer/snifferwindow.h \
    src/dbc/dbc_classes.h \
    src/dbc/dbchandler.h \
    src/dbc/dbcloadsavewindow.h \
    src/dbc/dbcmaineditor.h \
    src/dbc/dbcsignaleditor.h \
    src/dbc/dbcmessageeditor.h \
    src/dbc/dbcnodeeditor.h \
    src/analysis/discretestatewindow.h \
    src/analysis/filecomparatorwindow.h \
    src/analysis/flowviewwindow.h \
    src/analysis/frameinfowindow.h \
    src/analysis/fuzzingwindow.h \
    src/analysis/isotp_interpreterwindow.h \
    src/analysis/rangestatewindow.h \
    src/analysis/udsscanwindow.h \
    src/analysis/obd2window.h \
    src/connections/canbus.h \
    src/connections/canconnectionmodel.h \
    src/connections/connectionwindow.h \
    src/analysis/graphingwindow.h \
    src/analysis/newgraphdialog.h \
    src/analysis/bisectwindow.h \
    src/analysis/signalviewerwindow.h \
    src/protocols/isotp_handler.h \
    src/protocols/j1939_handler.h \
    src/protocols/obd2_pids.h \
    src/protocols/obd2_poller.h \
    src/protocols/obd2_dbc.h \
    src/protocols/uds_handler.h \
    src/protocols/handler_factory.h \
    src/protocols/isotp_message.h \
    src/scripting/jsedit.h \
    src/app/windows/frameplaybackobject.h \
    src/app/helpwindow.h \
    src/io/blfhandler.h \
    src/analysis/sniffer/SnifferDelegate.h \
    src/connections/newconnectiondialog.h \
    src/analysis/temporalgraphwindow.h \
    src/analysis/udsfirmwareuploaderwindow.h \
    src/analysis/searchwindow.h \
    src/core/filterutility.h \
    src/io/pcaplite.h

FORMS    += src/ui/candatagrid.ui \
    src/ui/triggerdialog.ui \
    src/ui/canbridgewindow.ui \
    src/ui/dbcnodeduplicateeditor.ui \
    src/ui/dbccomparatorwindow.ui \
    src/ui/dbcmessageeditor.ui \
    src/ui/connectionwindow.ui \
    src/ui/dbcloadsavewindow.ui \
    src/ui/dbcmaineditor.ui \
    src/ui/dbcnoderebaseeditor.ui \
    src/ui/dbcsignaleditor.ui \
    src/ui/dbcnodeeditor.ui \
    src/ui/discretestatewindow.ui \
    src/ui/filecomparatorwindow.ui \
    src/ui/flowviewwindow.ui \
    src/ui/frameinfowindow.ui \
    src/ui/frameplaybackwindow.ui \
    src/ui/framesenderwindow.ui \
    src/ui/fuzzingwindow.ui \
    src/ui/graphingwindow.ui \
    src/ui/isotp_interpreterwindow.ui \
    src/ui/mainsettingsdialog.ui \
    src/ui/mainwindow.ui \
    src/ui/motorcontrollerconfigwindow.ui \
    src/ui/newgraphdialog.ui \
    src/ui/rangestatewindow.ui \
    src/ui/scriptingwindow.ui \
    src/ui/searchwindow.ui \
    src/ui/snifferwindow.ui \
    src/ui/udsscanwindow.ui \
    src/ui/bisectwindow.ui \
    src/ui/signalviewerwindow.ui \
    src/ui/helpwindow.ui \
    src/ui/newconnectiondialog.ui \
    src/ui/temporalgraphwindow.ui \
    src/ui/udsfirmwareuploaderwindow.ui
    
RESOURCES += \
    resources/icons.qrc \
    resources/images.qrc

win32-msvc* {
   LIBS += opengl32.lib
}

# libusb-1.0 for the pico-flexray connection (optional: without it SavvyCAN builds without pico-flexray support)
packagesExist(libusb-1.0) {
   CONFIG += link_pkgconfig
   PKGCONFIG += libusb-1.0
   DEFINES += HAVE_LIBUSB
}

win32-g++ {
   LIBS += libopengl32
}

unix {
   isEmpty(PREFIX) {
      PREFIX=/usr/local
   }
   target.path = $$PREFIX/bin
   shortcutfiles.files=packaging/SavvyCAN.desktop
   shortcutfiles.path = $$PREFIX/share/applications
   INSTALLS += shortcutfiles
   DISTFILES += packaging/SavvyCAN.desktop
}

windows {
RC_ICONS=resources/icons/SavvyIcon.ico
}

examplefiles.files=examples
examplefiles.path = $$PREFIX/share/savvycan/examples
INSTALLS += examplefiles

iconfiles.files=resources/icons
iconfiles.path = $$PREFIX/share
INSTALLS += iconfiles

helpfiles.files=help/*
helpfiles.path = $$PREFIX/share/savvycan/help
INSTALLS += helpfiles

INSTALLS += target

# undocumented magic to avoid relative filenames in temporary makefiles
QMAKE_PROJECT_DEPTH = 0

TRANSLATIONS += \
    translations/SavvyCAN_en.ts \
    translations/SavvyCAN_pt_BR.ts

DISTFILES += \
    translations/pt_BR.qph

