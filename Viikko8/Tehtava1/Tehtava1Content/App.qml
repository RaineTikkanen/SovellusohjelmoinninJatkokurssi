// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects
import Tehtava1

Window {
    width: 800
    height: 800

    visible: true
    title: "Tehtava1"

    Calendar{
        id: calendar
        anchors.centerIn: parent
        onDayClicked:(day) => {
                         dayView.openDayView(day)
        }
    }
    Rectangle{
        id: shade
        anchors.fill: parent
        color: "black"
        opacity: 0
        Behavior on opacity{
            NumberAnimation {
                duration: 200
            }
        }
        MouseArea {
            anchors.fill: parent
            enabled: parent.opacity > 0 ? true : false
            onClicked: dayView.closeDayView()
        }
    }

    DayView{
        id: dayView
        visible: true
        anchors.centerIn: parent
        itemHeight: 300
        itemWidth: 350
        onDayViewOpen: shade.opacity=0.5
        onDayViewClose: shade.opacity=0
    }
}


