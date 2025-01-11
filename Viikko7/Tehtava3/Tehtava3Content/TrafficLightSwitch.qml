import QtQuick
import QtQuick.Controls

Item {
    id: toggleSwitch
    width: 100
    height: 50
    property string backgroundColor: "lightgrey"
    property int animationDuration: 100
    signal switched
    state: "OFF"
    Rectangle {
        id: background
        anchors.fill: parent
        color: backgroundColor
        radius: parent.height
        Behavior on color {
            ColorAnimation {target: background; duration: animationDuration*4}
        }
    }
    Rectangle {
        property int diameter: parent.height*0.8
        anchors.verticalCenter: parent.verticalCenter
        id: button
        color: "grey"
        width: diameter
        height: diameter
        radius: diameter
        Behavior on color {
            ColorAnimation {target: button; duration: animationDuration*2}
        }
        Behavior on x {
            NumberAnimation{
                easing.type: Easing.InBounce
                duration: animationDuration
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            switched()
            if(toggleSwitch.state === "ON"){
                toggleSwitch.state="OFF"
            }else{toggleSwitch.state="ON"}
        }
    }

    states: [
        State {
            name: "OFF"
            PropertyChanges {target: button; x: diameter*0.1}
            PropertyChanges {target: button; color: "red"}
            PropertyChanges {target: background; color: "pink"}
        },
        State {
            name: "ON"
            PropertyChanges {target: button; x: parent.width-diameter*1.1}
            PropertyChanges {target: button; color: "green"}
            PropertyChanges {target: background; color: "lightgreen"}

        }
    ]
}
