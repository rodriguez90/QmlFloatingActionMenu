import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import FloatingActionMenu 1.0

ColumnLayout {
    property FloatingActionMenu floatingActionMenu: FloatingActionMenu {
    }
    property int famWidth: floatingActionMenu.buttonWidth
    property string famIconColor: floatingActionMenu.iconColor
    property string famImage: floatingActionMenu.iconUrl
    property string famLabelBackColor: floatingActionMenu.labelBackColor
    property int labelWidth: floatingActionMenu.labelWidth
    property bool isLabelBeforeButton: floatingActionMenu.isLabelBeforeButton
    property bool buttonsAboveMenu: floatingActionMenu.buttonsAboveMenu

    property int famMargin: famWidth * .2
    property int fabWidth: famWidth * .8
    property int fabMargin: fabWidth * .2
    property int famHeight: calcFamHeight()
    readonly property int descriptionPadding: 4

    property alias floatingActionButtons: fabsId.model
    property alias floatingActionMenuRotation: famsId.floatingActionMenuRotation
    property alias floatingActionMenuUpRotation: famsUpId.floatingActionMenuRotation
    property alias floatingActionMenuAnimation: famsId.floatingActionMenuAnimation

    signal menuItemSelected(bool isClosed)
    signal buttonItemSelected(int modelIndex)

    id: famRootId
    visible: true
    width: famWidth + labelWidth
    height: famHeight
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.margins: famMargin
    state: "noshow"

    FloatingActionMenuButton {
        id: famsId
        visible: !buttonsAboveMenu
        onSelected: famRootId.menuItemSelected(isClosed)
    }
    FloatingActionButtons {
        id: fabsId
        onSelected: famRootId.buttonItemSelected(modelIndex)
    }

    FloatingActionMenuButton {
        id: famsUpId
        visible: buttonsAboveMenu
        onSelected: famRootId.menuItemSelected(isClosed)
    }

    function isOpen()
    {
      return famRootId.state === "show"
    }

    function open()
    {
        famRootId.state = "show"
    }

    function close()
    {
        famRootId.state = "noshow"
    }

    function calcFamHeight() {
        return (floatingActionButtons
                === undefined) ? (fabWidth + famMargin) : (fabWidth + famMargin)
                                 * (floatingActionButtons.count + 1)
    }

    function startAnimations() {
        floatingActionMenuAnimation.start()
        if (buttonsAboveMenu)
            floatingActionMenuUpRotation.start()
        else
            floatingActionMenuRotation.start()
    }
}
