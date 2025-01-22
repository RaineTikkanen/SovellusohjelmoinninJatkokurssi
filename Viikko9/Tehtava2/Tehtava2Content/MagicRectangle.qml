import QtQuick
import QtQuick.Controls

Rectangle {
    id: rect
    width: 100
    height: 100
    property string color1: "blue"
    property string color2: "grey"
    property string rectState: "state2"
    state: rectState

    states: [
        State {
            name: "state1"
            PropertyChanges {
                rect.color: color1
                rect.radius: 5
            }
        },
        State {
            name: "state2"
            PropertyChanges {
                rect.color: color2
                rect.radius: 50
            }
        }
    ]
    transitions: [
        Transition{
            PropertyAnimation{
                properties: "radius, color"
                duration: 200
            }
        }
    ]
    MouseArea{
        anchors.fill: parent
        onClicked: rect.rectState === "state1" ? rect.rectState="state2" : rect.rectState="state1"
    }
}
