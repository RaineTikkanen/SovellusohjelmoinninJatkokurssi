import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects


Item {
    id: root
    property int pedalHeight: 140
    property int pedalWidth: 80
    property string pedalColor: "black"
    width: childrenRect.width
    height: childrenRect.height
    signal isPressed

    Rectangle{
        id: pedal
        width: pedalWidth
        height: pedalHeight
        color: "#444444"
        border.color: pedalColor
        radius: 10
        Rectangle {
            id: pedalInside
            anchors.fill: parent
            color: pedalColor
            opacity: 0.5
            radius: parent.radius
        }
    }
    Glow {
        id: pedalGlow
        anchors.fill: pedal
        radius: 20
        samples: 50
        spread: 0.2
        color: pedalColor
        source: pedal
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            pedal.scale=0.1
            pedalInside.opacity= 0.7
            pedalGlow.radius= 50
            pressedTimer.running=true
        }
        onReleased: {
            pedal.scale= 1
            pedalInside.opacity= 0.5
            pedalGlow.radius= 20
            pressedTimer.running=false
        }
    }
    Timer {
        id: pressedTimer
        interval: 10
        repeat: true
        onTriggered: isPressed()
    }
}
