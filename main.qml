import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    id:mainwindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string x: "value"


    Rectangle{
        id:bigrectangle
        width: parent.width
        height: parent.height - 100
        color: "grey"

        ListView{
            model: myData
            width: bigrectangle.width - smallrectangle.width
            height: bigrectangle.height

            delegate: Rectangle {
                width: bigrectangle.width / 4
                height: 30
                id: rectangle1
                border.color: area.pressed ? "gold" : "black"

                Text {
                    id: textDelegate
                    anchors.centerIn: parent
                    text: model.name
                }

                MouseArea{
                    id: area
                    anchors.fill: parent
                    onClicked: {
                        console.log(model.name)
                        label2.text = model.name
                    }
                    onDoubleClicked: {
                        myData.nextFolder(model.name)
                        console.log("Левая клавиша мыши нажата дважды")
                    }
                    //                    onReleased: {
                    //                        if (parent.color != "gold") {
                    //                            parent.color = "gold"
                    //                        }
                    //                    }
                }
            }
        }

        Rectangle{
            z: 2
            id: smallrectangle
            width: 150
            height: 150
            x:bigrectangle.width / 4
            y: 0

            Grid {
                rows: 2
                columns: 1

                TextField {
                    id: label1
                    color: "black"
                    text:""
                    height:smallrectangle.height / 2
                    width:smallrectangle.width
                }

                Button {
                    id: button1
                    text:"Clear"
                    height:smallrectangle.height / 2
                    width: smallrectangle.width
                    onClicked: {
                        label1.clear()
                    }
                }
            }
        }
    }

    Rectangle{
        z: 2
        id: smallrectangle2
        width: parent.width / 4
        height: parent.height / 1.5
        x: parent.width - smallrectangle2.width

        Grid {
            id: grid1
            rows: 8
            columns: 1
            anchors.centerIn: parent
            spacing: 2

            TextField {
                id: textfield3
                color: "black"
                text:""
                height:smallrectangle2.height / grid1.rows
                width:smallrectangle2.width
            }

            Rectangle {
                color: "yellow"
                border.color: "darkgreen"
                border.width: 2
                height:smallrectangle2.height / grid1.rows
                width:smallrectangle2.width

                Label {
                    id: label2
                    color: "black"
                    font.bold: true
                    text: "Тут что-то должно быть"
                }
            }

            Button {
                id: button2
                text: "Open"
                height:parent.height / grid1.rows
                width: smallrectangle2.width
                onClicked: {
                    myData.openFile(textfield3.text)
                    label2.text = myData.label2
                }
            }

            Button {
                id: button3
                text: "Create"
                height:smallrectangle2.height / grid1.rows
                width: smallrectangle2.width
                onClicked: {
                    myData.createFile(textfield3.text)
                }
            }

            Button {
                id: button4
                text: "Delete"
                height:smallrectangle2.height / grid1.rows
                width: smallrectangle2.width
                onClicked: {
                    myData.removeFile(textfield3.text)
                }
            }

            Button {
                id: button5
                text: "Open Image"
                height:smallrectangle2.height / grid1.rows
                width: smallrectangle2.width
                onClicked: {
                    myData.pressButton();
                    openFile.show()
                    mainwindow.hide()
                }

            }
            Button {
                id: button6
                text: "Rename File"
                height:smallrectangle2.height / grid1.rows
                width: smallrectangle2.width
                onClicked: {
                    myData.renameFile(label2.text, label1.text)
                }
            }
            Button {
                id: button7
                text: "Previous folder"
                height:smallrectangle2.height / grid1.rows
                width: smallrectangle2.width
                onClicked: {
                    myData.previousFolder()
                }
            }
        }
    }

    Image {
        id: photo
        source: "qrc:/creator-gs-01.png"
        x: 0
        y: bigrectangle.height
    }

    AnotherWindow {
        id: openFile
        title: qsTr("")
        onSignalExit: {
            openFile.close()
            mainwindow.show()
        }
    }
}

