// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Tehtava3

Window {
    id: window
    width: 1800
    height: 800

    visible: true
    title: "Tehtava3"

    property var balls: []

    Canvas{
        id: canvas
        anchors.fill: parent
        onPaint:{
            var ctx= getContext("2d")
            ctx.clearRect(0,0,width,height)
            for(var i; i<balls.length; i++){
                ctx.beginPath()
                ctx.arc(balls[i].X, balls[i].Y, ballD, 0, Math.PI*2)
                ctx.fillStyle = balls[i].color
            }
            ctx.fill()
        }
    }
    Timer{
        interval: 30
        running: true
        repeat: true
        onTriggered: {
            for(var i; i<balls.length; i++){
                balls[i].X += balls[i].VX
                balls[i].Y += balls[i].VY
                if(balls[i].X-ballD < 0){
                    balls[i].VX=randomSpeed()
                    balls[i].VY=randomSpeed()*plusOrMinus()
                }
                if(balls[i].X>=canvas.width-ballD){
                    balls[i].VX=-randomSpeed()
                    balls[i].VY=randomSpeed()*plusOrMinus()
                }
                if(balls[i].Y-ballD < 0){
                    balls[i].VY=randomSpeed()
                    balls[i].VX=randomSpeed()*plusOrMinus()
                }
                if(balls[i].Y>=canvas.height-ballD){
                    balls[i].VY=-randomSpeed()
                    balls[i].VX=randomSpeed()*plusOrMinus()
                }
                canvas.requestPaint()
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
        balls.push({
                         "VX": randomSpeed(),
                         "VY": randomSpeed(),
                         "X": Math.floor(Math.random()*window.width),
                         "Y": Math.floor(Math.random()*window.height),
                         "color": getRandomColor()
                     })
            console.log(balls.length)
        }
    }

    function getRandomColor() {
      var letters = '0123456789ABCDEF';
      var color = '#';
      for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
      }
      return color;
    }

    function randomSpeed(){
        return Math.floor(Math.random()*20)
    }

    function plusOrMinus(){
        return Math.round(Math.random()) ? 1 : -1
    }
    property string letters: '0123456789ABCDEF'
    property int ballD: 20
}




