import QtQuick

Item{
    property color buttonColor: "grey"
    property string buttonText: "Click me"
    signal buttonClicked
    width: text.width*1.5
    height: text.height*2
    Rectangle{
        id: buttonArea
        anchors.fill: parent
        color: buttonColor
        radius: text.font.pixelSize*0.8
        Text{
            id: text
            anchors.centerIn: parent
            text: buttonText
        }
        Behavior on scale {
            NumberAnimation{
                duration: 100
            }
        }
    }
    MouseArea{
        enabled: parent.opacity > 0 ? true : false
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
