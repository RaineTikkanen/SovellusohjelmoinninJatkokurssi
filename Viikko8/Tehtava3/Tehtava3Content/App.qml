// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import Tehtava3

Window {
    //insert apitoken here:
    property string apitoken: "45db5fa72e69fea5846b6a995fbe330f"
    id: window
    width: 800
    height: 800

    visible: true
    title: "Tehtava1"

    property string city: "Tampere"
    property int temp: 0
    property string desc: ""
    property string icon: ""
    property var bottomColors: ["#2e4aff", "#354dfb", "#3c51f6", "#4254f2", "#4856ee", "#4e59ea", "#545be5", "#595de1", "#5f5fdd", "#6560d8",
                                "#6a62d4", "#6f63d0", "#7564cb", "#7a65c7", "#7f66c2", "#8567be", "#8a68b9", "#8f68b5", "#9468b0", "#9969ac",
                                "#9e69a7", "#a369a2", "#a8699d", "#ad6998", "#b26893", "#b7688e", "#bc6789", "#c16784", "#c6667f", "#cb6579",
                                "#d06473", "#d5626d", "#da6167", "#df5f61", "#e45d5a", "#e95b52", "#ee594a", "#f35742", "#f85437", "#fd512b"]

    property var topColors: ["#667aff", "#6a7bfc","#6f7df9", "#737ef5", "#777ff2", "#7b80ef", "#7f81ec", "#8482e8", "#8883e5", "#8c84e2",
                             "#9085de", "#9485db", "#9886d8", "#9c87d4", "#a087d1", "#a488cd", "#a888ca", "#ab89c6", "#af89c3", "#b38abf",
                             "#b78abc", "#bb8ab8", "#bf8ab4", "#c38ab1", "#c68bad", "#ca8ba9", "#ce8ba5", "#d28ba1", "#d68a9d", "#d98a99",
                             "#dd8a95", "#e18a91", "#e58a8d", "#e88988", "#ec8984", "#f0887f", "#f4887a", "#f88775", "#fb8770", "#ff866b"]

    property var textColors: ["#152a4a", "#45154a", "#16522d", "#1d4207", "#4f030b"]
    property int textColorIndex: 0
    property int tempColorIndex: 0
    function temperatureColor(temp){
        if(temp<-19) {
            tempColorIndex=0
        }
        if(temp>20){
            tempColorIndex=39
        }
        else{
            tempColorIndex=temp+20
        }
    }

    Rectangle{
        id: background
        anchors.centerIn: parent
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{position: 0.0; color: topColors[tempColorIndex]}
            GradientStop{position: 1.0; color: bottomColors[tempColorIndex]}
        }
        Column{
            anchors.centerIn: parent
            spacing: 20
        Rectangle{
            id: headerBackground
            anchors.horizontalCenter: parent.horizontalCenter
            width: 400
            height: 100
            radius: 10
            color: "grey"
            opacity: 0.6
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(window.textColorIndex===window.textColors.length-1){
                        window.textColorIndex=0
                    }else{
                        window.textColorIndex+=1
                    }
                }
            }
            Text{
                id: header
                anchors.centerIn: parent
                font.pixelSize: 50
                text: city + " " + temp + "°C"
                color: textColors[textColorIndex]
            }
        }
        Rectangle{
            id: descriptionBackground
            anchors.horizontalCenter: parent.horizontalCenter
            width: description.width+20
            height: 50
            radius: 10
            color: "grey"
            opacity: 0.6
            Text{
                anchors.centerIn: parent
                id: description
                font.pixelSize: 30
                color: textColors[textColorIndex]
                text: desc
            }
        }
        Image {
            id: name
            source: icon
            width: 300
            height: 300
            anchors.horizontalCenter: parent.horizontalCenter
        }
        }
        Component.onCompleted: fetchWeatherData(apitoken)
    }
    function fetchWeatherData (token){
        const url = "https://api.openweathermap.org/data/2.5/weather?lat=61.4980214&lon=23.7603118&appid="+token
        const httpRequest = new XMLHttpRequest()
        httpRequest.open("GET", url)
        httpRequest.onreadystatechange = function() {
            if(httpRequest.readyState===httpRequest.DONE){
                if(httpRequest.status===200){
                    const response = JSON.parse(httpRequest.responseText)
                    temp = response.main.temp-272.15
                    temperatureColor(temp)
                    desc = response.weather[0].description
                    icon= "https://openweathermap.org/img/wn/"+ response.weather[0].icon +"@2x.png"
                }else{
                    console.log("Error fetching data")
                    console.log(httpRequest.status)
                }
            }
        }
        httpRequest.send()
    }
}
