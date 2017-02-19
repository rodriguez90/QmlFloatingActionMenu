import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQml 2.2

import "../fam"

Window {
    id: windowRootId
    visible: true
    width: isMobile ? Screen.desktopAvailableWidth : Screen.desktopAvailableWidth / 4
    height: isMobile ? Screen.desktopAvailableHeight : Screen.desktopAvailableHeight / 3
    color: "HONEYDEW"
    title: qsTr(" Floating Action Menu Test ")

    property int counter: 1
    property bool isMobile: (Qt.platform.os === "android"
                             || Qt.platform.os === "ios"
                             || Qt.platform.os === "winphone"
                             || Qt.platform.os === "blackberry")

    property alias labelIdtext: labelId.text

    signal menuSelected(string contextId, bool isClosed)
    signal buttonSelected(string contextId, int modelIndex)

    Row {
        id: rowId
        anchors.centerIn: parent
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: button1Id
            implicitWidth: windowRootId.width / 4
            implicitHeight: windowRootId.height / 8
            style: ButtonStyle {
                label: Text {
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "MS UI Gothic"
                    font.pointSize: 18
                    color: "red"
                    text: "ABC"
                }
            }
        }
        Label {
            id: labelId
            visible: true
            text: qsTr("Counter: ") + counter
            font.bold: true
            font.pixelSize: 16
            color: "peru"
            horizontalAlignment: Text.AlignHCenter
            width: windowRootId.width / 4
            height: windowRootId.height / 4
            FloatingActionMenu {
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: (labelId.width - floatingActionMenu.buttonWidth)/2
                floatingActionMenu.iconColor: "#FF8C00"
                floatingActionMenu.buttonWidth: 50
                floatingActionMenu.labelWidth: 0
                floatingActionMenu.iconUrl: "qrc:/image/check.png"
                onMenuItemSelected: {
                    ++counter
                    labelIdtext = "Counter:" + counter
                }
            }
        }
        Rectangle {
            id: rectId
            radius: 10
            border.width: 10
            border.color: "wheat"
            color: "PAPAYAWHIP"
            anchors.bottom: parent.bottom
            implicitWidth: windowRootId.width / 4
            implicitHeight: windowRootId.height / 4
        }
    }

    FloatingActionMenu {
        floatingActionButtons: ButtonsBottomRight
        floatingActionMenu: MenuBottomRight
        onMenuItemSelected: menuSelected("MenuBottomRight", isClosed)
        onButtonItemSelected: buttonSelected("ButtonsBottomRight", modelIndex)
    }

    FloatingActionMenu {
        anchors.left: parent.left
        floatingActionButtons: ButtonsBottomLeft
        floatingActionMenu: MenuBottomLeft
        onMenuItemSelected: menuSelected("MenuBottomLeft", isClosed)
        onButtonItemSelected: buttonSelected("ButtonsBottomLeft", modelIndex)
    }

    FloatingActionMenu {
        anchors.bottom: windowRootId.top
        anchors.right: windowRootId.left
        floatingActionMenu.isLabelBeforeButton: false
        floatingActionMenu.iconUrl: "qrc:/image/edit.png"
        floatingActionMenu.labelBackColor: "white"
        floatingActionMenu.labelWidth: 130
        floatingActionMenu.buttonsAboveMenu: false
        onMenuItemSelected: console.log("onMenuItemSelected called")
        onButtonItemSelected: {
            if (modelIndex === 2) {
                if (famSettings.isOpen())
                    famSettings.close()
                else
                    famSettings.open()
            }
        }
        floatingActionButtons: ListModel {
            ListElement {
                description: "Add"
                iconUrl: "qrc:/image/add.png"
                iconColor: "DIMGRAY"
            }
            ListElement {
                description: "Remove"
                iconUrl: "qrc:/image/delete.png"
                iconColor: "GRAY"
            }
            ListElement {
                description: "Toggle Settings"
                iconUrl: "qrc:/image/settings.png"
                iconColor: "FUCHSIA"
            }
        }
    }
    FloatingActionMenu {
        id: famSettings
        anchors.bottom: windowRootId.top
        anchors.left: windowRootId.right
        floatingActionMenu.buttonWidth: 50
        floatingActionMenu.iconUrl: "qrc:/image/settings.png"
        floatingActionMenu.iconColor: "PURPLE"
        floatingActionMenu.buttonsAboveMenu: false
        floatingActionButtons: ListModel {
            ListElement {
                description: "Sound On"
                iconUrl: "qrc:/image/volumeon.png"
                iconColor: "darkorchid"
            }
            ListElement {
                description: "Sound Off"
                iconUrl: "qrc:/image/volumeoff.png"
                iconColor: "darkorchid"
            }
        }
    }
}
