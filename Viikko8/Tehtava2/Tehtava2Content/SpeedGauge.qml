import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects


Item {
    id: root
    width: childrenRect.width
    height: childrenRect.height
    property int rotationMin: -135
    property int rotationMax: 135
    property int speed: 0
    property int maxSpeed: 260
    property int needleRotation: rotationMin
    property string gaugeColor: "blue"

    function changeSpeed(speed){
        needleRotation=speed*(rotationMax-rotationMin)/maxSpeed+rotationMin
    }

    Image {
        id: gauge
        source: "gauge.png"
        width: 500
        height: 500
        RadialGradient{
            id: background
            width: parent.width
            height: parent.height
            opacity: 0.7
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: gaugeColor;
                }
                GradientStop {
                    position: 0.3;
                    color: "transparent";
                }
            }
        }
        Image {
            id: needle
            source: "needlered.png"
            transformOrigin: Item.Bottom
            anchors.bottom:  gauge.verticalCenter
            anchors.horizontalCenter: gauge.horizontalCenter
            rotation: needleRotation
            Behavior on rotation {
                NumberAnimation{
                    duration: 100
                }
            }
        }
        Rectangle{
            id: gaugeCenter
            anchors.centerIn: parent
            color: "black"
            width: 50
            height: 50
            radius: 50
        }
    }
    Glow {
        anchors.fill: gauge
        radius: 100
        samples: 200
        spread: 0.2
        color: gaugeColor
        source: gauge
    }
}
