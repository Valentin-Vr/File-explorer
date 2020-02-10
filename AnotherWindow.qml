import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import newType 1.0

Window {
    signal signalExit   // Задаём сигнал
    width:480
    height:320

//     Кнопка для открытия главного окна приложения
    Button {
        id: anotherWindow_button
        text: qsTr("Главное окно")
        width: 180
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            openFile.signalExit() // Вызываем сигнал
        }
        z: 1
    }

    Rectangle {
        width: parent.width
        height: parent.height - anotherWindow_button.height
        x: 0
        y: 0

        NewType {
            anchors.fill: parent
//            color: "blue"
        }
    }
}
