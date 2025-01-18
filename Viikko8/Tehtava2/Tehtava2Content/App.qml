// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects
import Tehtava2

Window {
    width: 800
    height: 800
    visible: true
    title: "Tehtava2"
    property int speed: 0
    property int maxSpeed: 260
    RadialGradient{
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#444444";
            }
            GradientStop {
                position: 1;
                color: "#181818";
            }
        }
    }
    Column {
        anchors.centerIn: parent
        SpeedGauge{
            id: speedGauge
            speed: speed
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50
            Pedal{
                anchors.bottom: parent.bottom
                id: brake
                pedalColor: "red"
                pedalHeight: 100
                onIsPressed: {
                    if(speed > 0){
                        speed-=1
                        speedGauge.changeSpeed(speed)
                    }
                }
            }
            Pedal{
                id: gas
                pedalColor: "green"
                onIsPressed: {
                    if(speed <= maxSpeed){
                        speed+=1
                        speedGauge.changeSpeed(speed)
                    }
                }
            }
        }
    }
}

