import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    color: "#F0F8FF"
    Rectangle {
        height: 20
        color: "#FFFFFF"
        width: parent.width
        anchors {
            left: parent.left
            leftMargin: 12
            verticalCenter: parent.verticalCenter
        }
        Label {
            id: label
            height: 20
            color: "black"
            anchors.leftMargin: 24
            font.pixelSize: 12
            font.bold: true
            text: dataModel.currentPath
        }
    }
}
