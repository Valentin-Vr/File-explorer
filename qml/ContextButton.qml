import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id: button

    signal buttonClicked()
    property int widthButton: 10
    property int heightButton: 30
    property int radiusButton: 2
    property color colorButton: "transparent"
    property string textButton: "Button"
    property color colorText: "#A98971"

    width: widthButton
    height: heightButton

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: colorButton }
            GradientStop { position: 0.99; color: mouseArea.pressed ? "#A85C60" :  colorButton}
        }
    }

    Rectangle {
        id: rectButton
        anchors.fill: parent
        color: colorButton
        border {
            color: "black"
            width: 2
        }
    }

    Text {
        anchors.centerIn: parent
        text: qsTr(textButton)
        color: colorText
        font {
            pixelSize: 10
            bold: true
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.buttonClicked()
    }


}
