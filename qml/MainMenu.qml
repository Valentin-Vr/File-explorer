import QtQuick 2.0
import QtQuick.Controls 2.5


Column {
    property var icons:["/imeg/home","/imeg/back"]
    property color backgroundColor: "transparent"
    MenuBar {
        id: menuBar
        width: parent.width
        height:20
    }

    Row {
        width: parent.width
        height:30
        spacing: 2
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
            anchors.right: parent.right
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
