import QtQuick 2.11
import QtGraphicalEffects 1.0
import SightSeeing_small 1.0

Item {
    id: item1
    width: parent.width
    height: parent.height

    property int noValue
    property string titleValue
    property string imageName


    //    opacity: 1
    Image {
        id: _imagemenu
        source: imageName
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height
        z: 5

        onSourceChanged: {
            _changeanimation.running = true
        }

        ParallelAnimation {
            id: _changeanimation
            NumberAnimation {
                target: _imagemenu
                property: "y"
                duration: 200
                from: 50
                to: 0
                easing.type: Easing.OutExpo
            }
            NumberAnimation {
                target: item1
                property: "opacity"
                duration: 700
                from: 0
                to: 1
                easing.type: Easing.OutExpo
            }
        }
    }

    Colorize {
        anchors.fill: _imagemenu
        source: _imagemenu
        hue: 0
        saturation: 0
        lightness: -0.3
        z: 6
    }

    Text {
        id: _number
        text: "No. " + noValue
        color: "#fff"
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 25
        font.family: Constants.fontPoppinsRegularFamily
        z: 10
    }

    Rectangle {
        id: _line
        width: 3
        height: 60
        color: "#fff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: _number.bottom
        anchors.topMargin: 10
        z: 10
    }

    Text {
        id: _city
        text: titleValue
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: _line.bottom
        color: "#fff"
        font.pixelSize: 60
        font.family: Constants.fontTittiliumWebRegularFamily
        z: 10
        font.bold: true

        onTextChanged: {
            _textchangeanimation.running = true
        }

        SequentialAnimation {
            id: _textchangeanimation
            ParallelAnimation {
                NumberAnimation {
                    target: _city
                    property: "anchors.topMargin"
                    duration: 150
                    from: anchors.topMargin
                    to: anchors.topMargin - 80
                    easing.type: Easing.InOutQuad
                    running: false
                }
                OpacityAnimator {
                    target: _city
                    duration: 100
                    from: 1
                    to: 0
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: _city
                    property: "anchors.topMargin"
                    duration: 150
                    from: anchors.topMargin + 50
                    to: anchors.topMargin
                    easing.type: Easing.OutExpo
                    running: false
                }
                OpacityAnimator {
                    target: _city
                    duration: 150
                    from: 0
                    to: 1
                }
            }
        }
    }
}
