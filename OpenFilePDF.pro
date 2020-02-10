QT += quick
QT += widgets
CONFIG += c++11
DEFINES += QT_DEPRECATED_WARNINGS
SOURCES += \
        main.cpp \
        newwindow.cpp \
        openimage.cpp \
        openpdf.cpp

RESOURCES += qml.qrc
QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    newwindow.h \
    openimage.h \
    openpdf.h

DISTFILES +=
