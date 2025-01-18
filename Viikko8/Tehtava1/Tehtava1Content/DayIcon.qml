import QtQuick
import QtQuick.Controls

Item {
    id: root
    property int dayNumber: 0
    property int size: 50
    property string iconColor: "lightgrey"
    signal iconClicked
    width: childrenRect.width
    height: childrenRect.height
    Rectangle{
        id: background
        width: parent.size
        height: parent.size
        radius: parent.size/10
        color: iconColor
        Text{
            id: dayNumberText
            anchors.centerIn: parent
            text: dayNumber
            font.pixelSize: root.size/1.5
        }
        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale=0.95
            onReleased: {
                iconClicked()
                parent.scale=1
            }
        }
    }
}
