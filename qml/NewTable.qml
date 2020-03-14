import QtQuick 2.0
import QtQuick.Controls 1.0

import space.developers 1.0

Rectangle {
    id:colorRecta
    color: "#F0F8FF" // crimson

    TableView {
        id: view

        anchors.margins: 5
        anchors.fill: parent
        model: dataModel
        clip: true

        TableViewColumn {
            width: parent.width*0.8
            title: "Name"
            delegate: ColumnName {
                onDoubclicked: {
                    if(model.flag === "<папка>") {
                        dataModel.updateData(model.path)
                    }
                    else {
                        if (model.flag === "jpg" || model.flag === "png" || model.flag === "jpeg") {
                            workWithFiles.openImage(model.path)
                            var component = Qt.createComponent("FileOpenWindow.qml")
                            var window = component.createObject("root")
                            window.show()
                        }
                        else {
                            workWithFiles.openFile(model.path)
                        }
                    }
                }
            }
        }

        TableViewColumn {
            width: parent.width*0.2
            title: "Flag"
            delegate: ColumnFlag {
            }
        }
    }
}
