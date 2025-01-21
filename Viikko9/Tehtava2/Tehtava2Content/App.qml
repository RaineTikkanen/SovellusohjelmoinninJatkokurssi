// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Tehtava2

Window {
    width: 500
    height: 500

    visible: true
    title: "Tehtava2"

    Item{
        id: container
        anchors.fill: parent
        state: "off"
        MagicRectangle{
            id: rect1
            color1: "red"
            anchors.verticalCenter: container.verticalCenter

        }
        MagicRectangle{
            id: rect2
            anchors.verticalCenter: container.verticalCenter
        }
        states: [
            State{
                name: "off"
                PropertyChanges {
                    rect1{
                        rectState: "state2"
                    }
                    rect2{
                        rectState: "state2"
                    }
                    buttonColor{
                        color: "red"
                    }
                }
                AnchorChanges{
                    target: rect1
                    anchors.right: undefined
                    anchors.left: container.left
                }
                AnchorChanges{
                    target: rect2
                    anchors.left: undefined
                    anchors.right: container.right
                }
            },
            State{
                name: "on"
                PropertyChanges {
                    rect1{
                        rectState: "state1"
                    }
                    rect2{
                        rectState: "state1"
                    }
                    buttonColor{
                        color: "green"
                    }
                }
                AnchorChanges{
                    target: rect1
                    anchors.left: undefined
                    anchors.right: container.horizontalCenter
                }
                AnchorChanges{
                    target: rect2
                    anchors.right: undefined
                    anchors.left: container.horizontalCenter
                }
            }
        ]
        transitions: [
            Transition{
                AnchorAnimation {
                    duration: 500
                    easing.type: Easing.InElastic
                    easing.amplitude: 1.5
                    easing.period: 0.7
                }
            }

        ]
        Item{
            id: powerButton
            anchors.horizontalCenter: container.horizontalCenter
            anchors.bottom: container.bottom
            anchors.bottomMargin: 50
            height:50
            width: 50
            Rectangle{
                id: buttonColor
                anchors.centerIn: parent
                width: 50
                height: 50
                radius: 50
                color: "red"
            }
            Image{
                anchors.centerIn: parent
                source: "powerButton.png"
                width: 50
                height: 50
                mipmap: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    container.state==="off" ? container.state = "on": container.state = "off"
                }
            }

        }


    }
}

