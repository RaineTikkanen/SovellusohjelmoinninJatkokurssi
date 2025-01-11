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
    }
    MouseArea{
        anchors.fill: parent
        onPressed:{
            buttonArea.scale=0.95
            buttonArea.opacity=0.9
        }
        onReleased: {
            buttonArea.scale=1
            buttonArea.opacity=1
            buttonClicked()
        }
    }
}
