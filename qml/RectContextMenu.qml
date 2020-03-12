import QtQuick 2.0
import space.developers 1.0
import QtQuick.Controls 2.5

Rectangle {
    id: rectContextMenu
    signal signalExit()
    width: 100
    height: 100
    color: "#DCDCDC"
    border.width: 2


    ListModel {
        id: contextModel

        ListElement {
            textItem: "Remove"
        }

        ListElement {
            textItem: "Rename"
        }

        ListElement {
            textItem: "Exit"
        }
    }

    ListView {
        id: view

        width: parent.width
        height: parent.height
        anchors.fill: parent
        model: contextModel
        clip: true
        highlightRangeMode: ListView.StrictlyEnforceRange

        delegate: ContextButton {
            id: button
            heightButton: view.height/3
            widthButton: view.width
            textButton: textItem
            onButtonClicked: {
                executeButtonEvent(model.index)
                dataModel.updateData(dataModel.currentPath)
            }
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
              case 0: // remove button
                  ContextMenu.removeFile(ContextMenu.path)
                  signalExit()
                  break
              case 1: // rename button
//                  renameWindow.visible = true
                  signalExit()
                  break
              case 2: // exit button
                  signalExit()
                  break
        }
    }
}
