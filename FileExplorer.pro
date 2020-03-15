QT += quick core gui multimedia
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11
DEFINES += QT_DEPRECATED_WARNINGS
SOURCES += \
        src/contextmenu.cpp \
        src/executionfile.cpp \
        src/fileslist.cpp \
        src/main.cpp \
        src/simplemenu.cpp

RESOURCES += qml/qml.qrc
QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
   src/contextmenu.h \
   src/data.h \
   src/executionfile.h \
   src/fileslist.h \
   src/simplemenu.h

DISTFILES +=
