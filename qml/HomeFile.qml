import QtQuick 2.0

Column {

    MainMenu {
        id:meinMenu
        width: parent.width
        height: 50
    }

    NewTable {
        width: parent.width
        height: parent.height-meinMenu.height
    }

}
