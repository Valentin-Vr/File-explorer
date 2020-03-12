import QtQuick 2.12
import QtQuick.Window 2.12
import space.developers 1.0

Window {
    property alias widthGlobal: mainWindow.width
    property alias heightGlobal: mainWindow.height
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("File explorer")
    color: "#F0F8FF" // crimson
    HomeFile {
        anchors.fill: parent
    }

    NewTable {
        id: dataModel
    }

    WorkFile {
        id: workFile
    }

    RectContextMenu {
        id: contextMenu
        visible: false
        onSignalExit: {
             contextMenu.visible = false
        }
    }

}

