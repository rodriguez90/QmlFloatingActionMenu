import QtQuick 2.6
import QtQuick.Window 2.2

import "fam"

Window {
    id: windowRootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    signal menuSelected(string contextId, bool isClosed)
    signal buttonSelected(string contextId, int modelIndex)

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }
    }

    TextEdit {
        id: textEdit
        text: qsTr("Enter some text...")
        verticalAlignment: Text.AlignVCenter
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        Rectangle {
            anchors.fill: parent
            anchors.margins: -10
            color: "transparent"
            border.width: 1
        }
    }

    FloatingActionMenu {
        id: famSettings
        anchors.bottom: windowRootId.top
        anchors.right: windowRootId.right
        floatingActionMenu.iconColor: "PURPLE"
        floatingActionMenu.buttonWidth: 50
        floatingActionMenu.isLabelBeforeButton: false
        floatingActionMenu.buttonsAboveMenu: false
        floatingActionButtons: ListModel {
            ListElement {
                description: "Sound On"
                iconUrl: "qrc:/volumeon.png"
                iconColor: "darkorchid"
            }
            ListElement {
                description: "Sound Off"
                iconUrl: "qrc:/volumeoff.png"
                iconColor: "darkorchid"
            }
        }
    }
    FloatingActionMenu {
        anchors.left: textEdit.left
        anchors.top: textEdit.bottom
        floatingActionMenu.labelWidth: 0
        floatingActionMenu.iconUrl: "qrc:/cloud.png"
        floatingActionMenu.iconColor: "powderblue"
    }

    FloatingActionMenu {
        floatingActionButtons: ButtonsBottomRight
        floatingActionMenu: MenuBottomRight
        onMenuItemSelected: menuSelected("MenuBottomRight", isClosed)
        onButtonItemSelected: buttonSelected("ButtonsBottomRight", modelIndex)
    }
}
