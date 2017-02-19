import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

Repeater {
    id: floatingActionButtonsId

    signal selected(int modelIndex)

    RowLayout {
        id: fabsRowId
        state: famRootId.state

        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: fabsRowId
                    opacity: 1
                }
            },
            State {
                name: "noshow"
                PropertyChanges {
                    target: fabsRowId
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    properties: "opacity"
                    duration: famRootId.state
                              === "noshow" ? 100 * (floatingActionButtonsId.model.count
                                                    - index) : 100 * index
                    easing.type: Easing.Linear
                }
            }
        ]

        FloatingActionLabel {
            id: labelButtonId
            visible: isLabelBeforeButton
        }
        FloatingActionButton {
            id: fabId
        }
        FloatingActionLabel {
            id: buttonLabelId
            visible: !isLabelBeforeButton
        }
    }
}
