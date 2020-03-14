import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import space.developers 1.0

ApplicationWindow {
    id: openImageWindow
    signal signalExit
    minimumWidth: 300
    minimumHeight: 300
    width: 400
    height: 400
    visible: true

    Rectangle {
        width: parent.width
        height: parent.height - anotherWindow_button.height
        color: "gray"

        WorkWithFiles {
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height
        }
    }

    Button {
        id: anotherWindow_button
        text: qsTr("Главное окно")
        width: 180
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            openImageWindow.close()
        }
    }
}
