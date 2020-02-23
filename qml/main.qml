import QtQuick 2.12
import QtQuick.Window 2.12
import space.developers 1.0

Window {
    id:mainwindow
    visible: true
    width: 640
    height: 480
    title: qsTr("File explorer")

    HomeFile {
        anchors.fill: parent
    }

    NewTable {
        id: dataModel
    }

    WorkFile {
        id: workFile
    }

}

