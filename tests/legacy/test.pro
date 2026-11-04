QT += core gui serialbus widgets testlib serialbus


CONFIG += c++11

INCLUDEPATH += ../../src ../../src/core ../../src/io ../../src/connections

SOURCES += \
    tst_lfqueue.cpp \
    tst_blf.cpp \
    main.cpp \
    tst_cancon.cpp \
    ../../src/io/blfhandler.cpp \
    ../../src/core/can_structs.cpp \
    ../../src/connections/canconfactory.cpp \
    ../../src/connections/canconnection.cpp \
    ../../src/connections/gvretserial.cpp \
    ../../src/connections/socketcand.cpp \
    ../../src/connections/canbus.cpp


#HEADERS += \
#    ../../src/utils/lfqueue.h

target.path= .
INSTALLS += target

HEADERS += \
    tst_lfqueue.h \
    tst_blf.h \
    tst_cancon.h \
    ../../src/io/blfhandler.h \
    ../../src/core/can_structs.h \
    ../../src/connections/canconconst.h \
    ../../src/connections/canconfactory.h \
    ../../src/connections/canconnection.h \
    ../../src/connections/gvretserial.h \
    ../../src/connections/socketcand.h \
    ../../src/connections/canbus.h
