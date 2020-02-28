import QtQuick 2.0

Column {

    MainMenu {
        id:meinMenu
        anchors.top: parent.top
        width: parent.width
        height: 50
    }

    NewTable {
        anchors.top: meinMenu.bottom
        width: parent.width
        height: parent.height-meinMenu.height
    }

}
