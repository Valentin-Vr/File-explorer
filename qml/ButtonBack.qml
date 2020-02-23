import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {
    id:clicBack
    color: "transparent"


    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.99; color: mouseArea.pressed ? "#00FF00" :  "transparent"}
        }
    }

    Image {
        id: icon
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: "/imeg/back"
    }


    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked:dataModel.updateData(dataModel.oldPath)
    }
}
