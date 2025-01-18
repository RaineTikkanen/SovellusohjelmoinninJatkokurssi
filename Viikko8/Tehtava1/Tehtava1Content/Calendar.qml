import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: children.width
    height: children.height
    signal dayClicked(day: int)
    Column {
        anchors.centerIn: parent
        Text{
            text: "Tammikuu"
            font.pixelSize: 40
            padding: 10
        }
        Grid{
            id: calendar
            rowSpacing: 10
            columnSpacing: 10
            columns: 7
            padding: 10
            Repeater {
                model: 31
                DayIcon{
                    dayNumber: index+1
                    onIconClicked: dayClicked(index+1)
                }
            }
        }
    }
}
