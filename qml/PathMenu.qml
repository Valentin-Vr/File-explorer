import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    color:backgroundColor

        TextField {
            anchors.centerIn:parent
            id: label
            width: parent.width - 10
            height: 25
            color: "black"
            anchors.leftMargin: 24
            font.pixelSize: 12
            font.bold: true
            text: dataModel.currentPath
        }

}
