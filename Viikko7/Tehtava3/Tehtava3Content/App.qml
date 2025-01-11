// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Tehtava3

Window {
    width:800
    height:800

    visible: true
    title: "Tehtava3"
    TrafficLights{
        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
        id: trafficLights
    }
    TrafficLightSwitch{
        x: 350
        y: 550
        onSwitched:{
            if(state=="ON"){
                trafficLights.turnOFF()
            }else{trafficLights.turnON()}
        }
    }
}
