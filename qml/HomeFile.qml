import QtQuick 2.0
import QtQuick.Controls 2.5

Column {

    MainMenu {
        id: meinMenu
        width: parent.width
        height: 70
    }

    NewTable {
        width: parent.width
        height: parent.height-meinMenu.height
    }
}
