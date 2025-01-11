// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import Tehtava3



Window {
    width: 700
    height: 700


    visible: true
    title: "Tehtava3"

    Rectangle{
        id: rect
        anchors.centerIn: parent
        width: 600
        height: 600
        color: "lightgrey"
        radius: 10
        Column{
            anchors.centerIn: parent
            Text{

                id: text
                text: "Hello World!"
                padding: 16
            }
            Button{
                text: "Press Me"
                onClicked:{
                    text.text="pressed"
                    rect.rotation +=90
                    rect.color = "blue"
                }
            }
        }

    }


}

