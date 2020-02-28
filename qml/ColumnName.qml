import QtQuick 2.0

Rectangle {
    id: name
    signal doubclicked()
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
        text: model.name
    }
    MouseArea {
        anchors.fill: parent
        onDoubleClicked: doubclicked()
    }
}
