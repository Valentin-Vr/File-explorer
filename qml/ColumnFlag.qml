import QtQuick 2.0

Rectangle {
    id: flag
    width: parent.width
    height: textflag.height + 0.9 * textflag.height
    Text {
        id: textflag
        anchors.centerIn: parent
        font.pixelSize: 12
        color: "#000000"
        text: model.flag
    }
}
