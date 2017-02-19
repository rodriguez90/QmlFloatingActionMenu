import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Material 2.1



RowLayout {
    id: famRowId

    signal selected(bool isClosed)

    property alias floatingActionMenuRotation: famRotationId
    property alias floatingActionMenuUpRotation: famUpRotationId
    property alias floatingActionMenuAnimation: famAnimationId
    property int animationDuration: 300


    Item {
        Layout.preferredWidth: labelWidth
        Layout.preferredHeight: parent.height / 2
        opacity: 0
        visible: isLabelBeforeButton
    }

    RoundButton {
        id: famId
        anchors.right: parent.right
        anchors.rightMargin: isLabelBeforeButton ? fabMargin / 2 : undefined
        Layout.preferredWidth: famWidth
        Layout.preferredHeight: famWidth
        highlighted: true
        Material.accent: famIconColor
        hoverEnabled: true
        opacity: 1.0
        onClicked: {
            famRootId.state = famRootId.state === "noshow" ? "show" : "noshow"
            startAnimations()
            famRowId.selected(famRootId.state === "noshow")
        }

        Image {
            id: famImageId
            anchors.fill: parent
            anchors.margins: famMargin
            source: famImage
            RotationAnimator {
                id: famRotationId
                running: false
                easing.type: Easing.Linear
                target: famImageId
                from: famRootId.state === "noshow" ? 360 : 0
                to: famRootId.state === "noshow" ? 0 : 270
                duration: animationDuration
            }
            RotationAnimator {
                id: famUpRotationId
                running: false
                easing.type: Easing.Linear
                target: famImageId
                from: famRootId.state === "noshow" ? 360 : 0
                to: famRootId.state === "noshow" ? 0 : 270
                duration: animationDuration
            }
            SequentialAnimation {
                id: famAnimationId
                running: false
                NumberAnimation {
                    target: famImageId
                    property: "opacity"
                    to: 0.5
                    duration: animationDuration
                }
                NumberAnimation {
                    target: famImageId
                    property: "opacity"
                    to: 1.0
                    duration: animationDuration
                }
            }
        }
    }
}
