import QtQuick 2.9
import QtQuick.Controls 2.5
<<<<<<< HEAD
import QtQuick.Layouts 1.11
import space.developers 1.0
=======

>>>>>>> 10da46e02a4cc9c62f8f2fe9b8d2b15623941cab
Column {
    property var icons: ["/imeg/home","/imeg/back"]
    property color backgroundColor: "transparent"
<<<<<<< HEAD

//    SimplMenu {
//        id:simplMenu
//        visible: true
//        width: parent.width
//        height:40
//    }


=======
    
>>>>>>> 10da46e02a4cc9c62f8f2fe9b8d2b15623941cab
    MenuBar {
        width: parent.width
        height: 40
        
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


        delegate: MenuBarItem {
            id: menuBarItem

            contentItem: Text {
                text: menuBarItem.text
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Row {
        width: parent.width
<<<<<<< HEAD
        height:30
        spacing: 4
=======
        height: 30
        
>>>>>>> 10da46e02a4cc9c62f8f2fe9b8d2b15623941cab
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
            width: parent.width - namesButton.width
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
