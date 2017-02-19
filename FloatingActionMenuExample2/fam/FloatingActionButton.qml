import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Material 2.1

RoundButton {
    Layout.preferredWidth: fabWidth
    Layout.preferredHeight: fabWidth
    highlighted: true
    Material.accent: model.iconColor
    opacity: 1.0
    anchors.left: isLabelBeforeButton ? undefined : parent.left
    anchors.leftMargin: isLabelBeforeButton ? undefined : descriptionPadding

    onClicked: {
        famRootId.state = "noshow"
        startAnimations()
        floatingActionButtonsId.selected(index)
    }
    Image {
        id: fabImageId
        anchors.fill: parent
        anchors.margins: fabMargin
        source: model.iconUrl
    }
}
