import QtQuick 2.0

Rectangle {
    id: name
    signal doubClicked()
    signal rightClicked()
    width: parent.width
    height: textName.height + 0.9 * textName.height
    Text {
        id: textName
        anchors {
            left: parent.left
            leftMargin: 12
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 12
        color: "#000000"
        text:model.name
    }
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onDoubleClicked: name.doubClicked();
        onClicked: {
            if (mouse.button === Qt.RightButton)
            {
                name.rightClicked()
                contextMenu.visible = true
                contextMenu.x =mouseX
                contextMenu.y =mouseY + model.index*parent.height + colorRecta.y
            }
        }
    }
}
