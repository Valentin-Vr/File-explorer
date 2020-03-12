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
                        workWithFiles.filePath(model.path)
                        workWithFiles.openFile(model.path, model.flag)
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
