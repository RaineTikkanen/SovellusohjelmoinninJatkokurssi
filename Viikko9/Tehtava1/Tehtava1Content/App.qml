// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Tehtava1

Window {
    width: 500
    height: 500

    visible: true
    title: "Tehtava1"

    ListModel {
        id: dataModel
    }

    Component{
        id: component
        Rectangle{
            color: "#e4e4e4"
            height: 25
            width: 150
            radius: 10
            Text{
                id: text
                anchors.centerIn: parent
                text: content
            }
        }
    }
    Column{
        anchors.centerIn: parent
        spacing: 10
        ListView{
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width:  150
            height: dataModel.count * (25+10)
            model: dataModel
            delegate: component
            Behavior on height {
                NumberAnimation{
                    duration: 100
                }
            }
        }
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            width: 150
            height: 35
            color: "#e6e6e6"
            border.color:"#a2a1a1"
            border.width: 3
            radius: 10
            TextInput{
                id: inputField
                padding: 25
                anchors.fill: parent
            }
        }
        Rectangle{
            id: button
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 50
            radius: 10
            color: "#c0bdbd"
            Text{
                id: buttontext
                anchors.centerIn: parent
                text: "Lisää"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dataModel.append({content:inputField.text})
                    inputField.text=""
                }
            }
        }
    }
    Text{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: "Listan koko: " + dataModel.count
    }
}

