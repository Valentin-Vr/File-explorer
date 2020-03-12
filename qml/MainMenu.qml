import QtQuick 2.0
import QtQuick.Controls 2.5


Column {
    property var icons:["/imeg/home","/imeg/back"]
    property color backgroundColor: "transparent"

    MenuBar {
        width: parent.width
        height:40
        Menu {
            title: qsTr("&File")
            Action { text: qsTr("&Open...") }
            Action { text: qsTr("&Save") }
            Action { text: qsTr("Save &As...") }
            MenuSeparator { }
            Action { text: qsTr("&Quit") }
        }
        Menu {
            title: qsTr("&Edit")
            Action { text: qsTr("Cu&t") }
            Action { text: qsTr("&Copy") }
            Action { text: qsTr("&Paste") }
        }
        Menu {
            title: qsTr("&Help")
            Action { text: qsTr("&About") }
        }
    }

    Row {
        width: parent.width
        height:30
        Row {
            id: namesButton
            height: parent.height
            width: 70
            spacing: 2
            Repeater {
                model: icons
                delegate: MasterButton {
                    width: parent.width / icons.length
                    onClicked: executeButtonEvent(model.index)
                }
            }
        }

        PathMenu {
            width: parent.width-namesButton.width
            height:parent.height
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
        case 0: //  Home
            dataModel.goHome()
            break
        case 1: //  Back
            dataModel.goBack()
            break

        }
    }
}
