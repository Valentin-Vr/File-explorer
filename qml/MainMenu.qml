import QtQuick 2.0
import QtQuick.Controls 2.5


Column {

    MenuBar {
        id: menuBar
        anchors.top: parent.top
        width: parent.width
        height:20
    }


    Rectangle {
        width: parent.width
        height:30
        anchors.bottom:  parent.bottom
        color: "#F0F8FF"
        Row {
            anchors.fill: parent

            ButtonBack {
                id:back
                width: 30
                height:30        
            }
            PathMenu {
                anchors.right: parent.right
                width: parent.width-back.width
                height:parent.height
            }
        }
    }
}
