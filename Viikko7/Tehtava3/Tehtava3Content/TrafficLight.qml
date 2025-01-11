import QtQuick
import QtQuick.Controls

Item {
    width: 100
    height: 100
    property string lightColor: "grey"
    property string lightState: "ON"
    Rectangle{
        id: light
        state: lightState
        anchors.fill:parent
        radius: parent.width
        color: lightColor
        states: [
            State {
                name: "ON"
                PropertyChanges {
                    target: light; opacity: 1
                }
            },
            State {
                name: "OFF"
                PropertyChanges {
                    target: light; opacity: 0.2
                }
            }
        ]
        transitions:[
            Transition {
                to: "*"

                OpacityAnimator {
                    target: light; duration: 200
                }

            }
        ]

    }
}
