import QtQuick

Item {
    id: root
    property int dayNumber: 0
    property string month: "Tammikuu"
    property int itemWidth
    property int itemHeight
    property int animationDuration: 150
    signal dayViewOpen
    signal dayViewClose
    width: childrenRect.width
    height: childrenRect.height

    function openDayView(day: int){
        if(background.state !== "OPEN"){
            background.state="OPEN"
            dayNumber=day
            dayViewOpen()
        }
    }
    function closeDayView(){
        background.state="CLOSED"
        dayViewClose()
    }
    Rectangle{
        id: background
        width: itemWidth
        height: itemHeight
        radius: itemWidth/10
        state: "CLOSED"
        Text{
            id: dayNumberText
            anchors.centerIn: parent
            text: "Day: " + dayNumber
            font.pixelSize: itemWidth/10
            Behavior on opacity {
                OpacityAnimator {
                    duration: animationDuration
                }
            }
        }
        Button{
            id: button
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 10
            onButtonClicked: closeDayView()
            buttonText: "Close"
            Behavior on opacity{
                NumberAnimation{
                    duration: animationDuration
                }
            }
        }
        Behavior on height {
            NumberAnimation {
                duration: animationDuration
            }
        }
        states: [
            State{
                name: "OPEN"
                PropertyChanges {target: dayNumberText; opacity: 1}
                PropertyChanges {target: button; opacity: 1}
                PropertyChanges {target: background; height: itemHeight}
            },
            State{
                name: "CLOSED"
                PropertyChanges {target: dayNumberText; opacity: 0}
                PropertyChanges {target: button; opacity: 0}
                PropertyChanges {target: background; height: 0}
            }
        ]
    }
}
