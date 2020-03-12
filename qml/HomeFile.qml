import QtQuick 2.0
import QtQuick.Controls 2.5

Column {

    MainMenu {
        id: mainMenu
        width: parent.width
        height: 70
    }

    NewTable {
        width: parent.width
        height: parent.height-mainMenu.height
    }
}
