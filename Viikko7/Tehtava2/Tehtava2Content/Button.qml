import QtQuick
import QtQuick.Controls

Item{
    width: 200
    height: 50
    property color buttonColor: "grey"
    property string buttonText: "Click me"
    signal buttonClicked
    Rectangle{
        id: buttonArea
        anchors.fill: parent
        color: buttonColor
        radius: 10
        Text{
            anchors.centerIn: parent
            text: buttonText
        }
        Behavior on scale {
            NumberAnimation{
                duration: 100
            }
        }
        Behavior on opacity {
            OpacityAnimator{
                duration : 200
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onPressed:{
            buttonArea.scale=0.92
            buttonArea.opacity=0.8
        }
        onReleased: {
            buttonArea.scale=1
            buttonArea.opacity=1
            buttonClicked()
        }
    }
}
