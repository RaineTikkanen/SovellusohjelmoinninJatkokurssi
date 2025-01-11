// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Tehtava2

Window {
    width: 500
    height: 500
    visible: true
    title: "Tehtava2"
    property string backgroundColor: "red"
    Rectangle{
        id: background
        anchors.fill: parent
        opacity: 0.5
        color: backgroundColor
        Behavior on color {
            ColorAnimation{
                duration: 300
            }
        }
    }
    Column{
        anchors.centerIn: parent
        padding: 10
        spacing: 10
        Button{
            buttonColor: "lightblue"
            buttonText: "Change background color"
            onButtonClicked: {
                if(backgroundColor==="red"){
                    backgroundColor="green"
                }else{
                    backgroundColor="red"
                }
            }
        }
        Button{
            buttonText: "Greet"
            buttonColor: "lightgreen"
            onButtonClicked: console.log("Hello")
        }
    }
}

