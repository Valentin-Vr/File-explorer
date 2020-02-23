import QtQuick 2.0
import QtGraphicalEffects 1.12



Rectangle {}




//    border.color: "#0000CD"
//    RadialGradient {
//        anchors.fill: parent
//        gradient: Gradient {
//            GradientStop { position: 0.0; color: "transparent" }
//            GradientStop { position: 0.99; color: targetArea.pressed  ? "#0000CD" :  "transparent"}
//        }
//



//    width: parent.width
//    height: parent.height
//    Rectangle {
//        id: name
//        signal clickedName()
//        width: parent.width*0.8
//        height: textName.height + 0.9 * textName.height
//        color: colorRecta.color
//        Text {
//            id: textName
//            anchors {
//                left: parent.left
//                leftMargin: 12
//                verticalCenter: parent.verticalCenter
//            }
//            font.pixelSize: 12
//            color: "#000000"
//            text: model.name
//        }
//        MouseArea {
//            id: targetAreaName
//            anchors.fill: parent
//            onClicked: name.clickedName()
//        }
//    }

//    Rectangle {
//        id: flags
//        width: parent.width*0.2
//        height: parent.height
//        color: colorRecta.color
//        signal clickedName()
//        Text {
//            id: textflags
//            anchors {
//                left: parent.left
//                leftMargin: 12
//                verticalCenter: parent.verticalCenter
//            }
//            font.pixelSize: 12
//            color: "#000000"
//            text: model.flag
//        }

//        MouseArea {
//            id: targetAreaflags
//            anchors.fill: parent
//            onClicked: flags.clickedName()
//        }
//    }
//}
//MouseArea {
//    anchors.fill: parent
//    onDoubleClicked: root.doubclicked()
//}
