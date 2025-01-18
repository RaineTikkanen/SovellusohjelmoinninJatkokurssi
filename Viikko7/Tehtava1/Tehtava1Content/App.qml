// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import Tehtava1

Window {
    id: window
    width: 500
    height: 500

    visible: true
    title: "Tehtava1"

    property string city: "Tampere"
    property int temp: 0
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

    Rectangle{
        id: background
        anchors.centerIn: parent
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{position: 0.0; color: topColors[window.temp+19]}
            GradientStop{position: 1.0; color: bottomColors[window.temp+19]}
        }
        Rectangle{
            id: textBackground
            anchors.horizontalCenter: background.horizontalCenter
            y: 20
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
        Row{
            id: buttonRow
            anchors.top: textBackground.bottom
            anchors.horizontalCenter: background.horizontalCenter
            padding: 10
            RoundButton{
                contentItem: Text{
                    text: "Decrease temperature"
                    scale: parent.down ? 0.95 : 1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: window.textColors[textColorIndex]
                }

                background: Rectangle{
                    implicitWidth: 100
                    implicitHeight: 40
                    color: "grey"
                    opacity: 0.6
                    radius: 10
                    scale: parent.down ? 0.95 : 1
                }
                onClicked: {
                    if(temp > -19){window.temp -=1}
                }
            }
            Item{
                width: 10
                height:10
            }

            RoundButton{
                contentItem: Text{
                    text: "Increase temperature"
                    scale: parent.down ? 0.95 : 1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: window.textColors[textColorIndex]
                }

                background: Rectangle{
                    implicitWidth: 100
                    implicitHeight: 40
                    color: "grey"
                    opacity: 0.6
                    radius: 10
                    scale: parent.down ? 0.95 : 1
                }
                onClicked: {
                    if(temp < 20){window.temp +=1}
                }
            }
        }
        Image {
            id: name
            source: "/home/rainetikkanen/Desktop/SovellusohjelmoinninJatkokurssi/Viikko7/Tehtava1/Tehtava1Content/sun_3227250.png"
            width: 300
            height: 300
            anchors.top: buttonRow.bottom
            anchors.horizontalCenter: background.horizontalCenter
        }
    }
}
