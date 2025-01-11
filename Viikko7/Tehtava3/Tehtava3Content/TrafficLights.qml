import QtQuick
import QtQuick.Controls

Item {
    id: trafficLights
    width: 150
    height: 400
    property bool goUp: false
    function turnON(){
        redLight.lightState = "ON"
        greenLight.lightState ="OFF"
        yellowLight.lightState="OFF"
        redTimer.running = true
        lightsOffTimer.running=false
    }
    function turnOFF(){
        redLight.lightState="OFF"
        greenLight.lightState="OFF"
        lightsOffTimer.running=true
        redTimer.running=false
        yellowTimer.running=false
        greenTimer.running=false
    }

    Rectangle{
        anchors.fill: parent
        radius: 5
        color: "Black"
        property bool goUp: false
        Column{
            anchors.centerIn: parent
            spacing: 20
            TrafficLight{
                id: redLight
                lightColor: "red"
                lightState: "OFF"
            }
            TrafficLight{
                id: yellowLight
                lightColor: "yellow"
                lightState: "OFF"
            }
            TrafficLight{
                id: greenLight
                lightColor: "green"
                lightState: "OFF"
            }
        }
    }
    Timer{
        id: redTimer
        interval: 4000
        running: false
        repeat: false
        onTriggered: {
            trafficLights.goUp=false
            yellowLight.lightState="ON"
            yellowTimer.running=true
        }
    }
    Timer{
        id: yellowTimer
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            if(trafficLights.goUp){
                redLight.lightState="ON"
                yellowLight.lightState="OFF"
                redTimer.running=true
            }else{
                redLight.lightState="OFF"
                yellowLight.lightState="OFF"
                greenLight.lightState="ON"
                greenTimer.running=true
            }
        }
    }
    Timer{
        id: greenTimer
        interval: 4000
        running: false
        repeat: false
        onTriggered: {
            greenLight.lightState="OFF"
            yellowLight.lightState="ON"
            yellowTimer.running=true
            trafficLights.goUp=true
        }
    }
    Timer {
        id: lightsOffTimer
        interval: 700
        running: true
        repeat: true
        onTriggered: {
            if(yellowLight.lightState=="ON"){
                yellowLight.lightState="OFF"
            }else{
                yellowLight.lightState="ON"
            }
        }
    }
}
