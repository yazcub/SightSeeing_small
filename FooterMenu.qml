import QtQuick 2.11
import QtGraphicalEffects 1.0
import SightSeeing_small 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Item {
    id: itemroot
    width: parent.width
    height: parent.height

    property string desctext
    signal menuclicked

    Rectangle {
        id: _rectangle
        width: parent.width
        height: parent.height / 11
        color: "#fff"
        anchors.top: parent.top
        anchors.topMargin: parent.height - _rectangle.height

        Rectangle {
            id: circleinner
            clip: true
            color: "#f84a17"
            anchors.centerIn: parent

            width: 0
            height: 0
            scale: 0
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("clicked")
                if (itemroot.state != "opendesc") {
                    itemroot.state = "opendesc"
                    menuclicked()
                } else {
                    itemroot.state="closedesc"
                    menuclicked()
                }
            }
        }
    }

    Rectangle {
        id: _circle
        height: _rectangle.height / 1.3
        width: _rectangle.width / 10
        anchors.verticalCenter: _rectangle.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        radius: 100
        color: "#f84a17"
    }

    Text {
        id: _circleicon
        text: "\uf1d8"
        anchors.centerIn: _circle
        font.pixelSize: 17
        color: "#fff"
        z: 2
    }

    Rectangle {
        width: parent.width
        height: parent.height - _rectangle.height
        anchors.top: _rectangle.bottom
        color: "#fff"
        Flickable {
            anchors.fill: parent
            contentWidth: parent.width; contentHeight: parent.height
            flickableDirection: Flickable.VerticalFlick
            TextArea.flickable: TextArea {
                text:  desctext
                wrapMode: Text.Wrap
                readOnly: true
                textFormat: TextEdit.RichText
                anchors.margins:-1
                topPadding: 40
                leftPadding: 35
                rightPadding: 35
            }
        }
        z: 3
    }

    DropShadow {
        id: dropShadow2
        anchors.fill: _circle
        horizontalOffset: 2
        verticalOffset: 2
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: _circle
    }

    Text {
        id: _buttontext
        anchors.centerIn: _rectangle
        text: "Explore this Sight"
        font.family: Constants.fontPoppinsRegularFamily
        font.pixelSize: 13
        font.bold: true
        opacity: 1
    }

    Text {
        id: _circlebacktext
        text: "Back to Sights"
        anchors.top: _circle.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 5 //-((_circle.height / 2) + (_circlebacktext.height/2))
        font.family: Constants.fontPoppinsRegularFamily
        font.pixelSize: 13
        font.bold: true
        color: "#fff"
        z: 2
    }

    states: [
        State {
            name: "opendesc"
            PropertyChanges {
                target: _rectangle
                anchors.topMargin: 0
            }
            PropertyChanges {
                target: _buttontext
                opacity: 0
            }
            PropertyChanges {
                target: dropShadow2
                visible: false
            }

            PropertyChanges {
                target: circleinner
                width: 10
                height: 1
            }
        },
        State {
            name: "closedesc"
            PropertyChanges {
                target: _rectangle
                anchors.topMargin: parent.height - _rectangle.height
            }
            PropertyChanges {
                target: _buttontext
                opacity: 1
            }
            PropertyChanges {
                target: circleinner
                width: 10
                height: 1
            }
            PropertyChanges {
                target: dropShadow2
                visible: false
            }
        }
    ]

    property bool trigger: false
    onTriggerChanged: triggerChangeProc()

    transitions: [
        Transition {
            from: "*"
            to: "opendesc"
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation {
                        target: _circle
                        property: "anchors.leftMargin"
                        duration: 200
                        from: anchors.leftMargin
                        to: (parent.width / 2) - (_circle.width / 2)
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: _buttontext
                        property: "opacity"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                NumberAnimation {
                    target: circleinner
                    property: "scale"
                    duration: 300
                    easing.type: Easing.InQuad
                    to: 60
                }

                NumberAnimation {
                    property: "anchors.topMargin"
                    duration: 800
                    easing.type: Easing.OutQuint
                }

                NumberAnimation {
                    target: _circleicon
                    property: "anchors.verticalCenterOffset"
                    duration: 200
                    easing.type: Easing.InOutQuad
                    from: anchors.verticalCenterOffset
                    to: -50
                }

                NumberAnimation {
                    target: _circlebacktext
                    property: "anchors.topMargin"
                    duration: 100
                    easing.type: Easing.OutQuint
                    from: anchors.topMargin
                    to: -((_circle.height / 2) + (_circlebacktext.height / 2))
                }
            }
        },
        Transition {
            from: "*"
            to: "closedesc"
            SequentialAnimation {
                NumberAnimation {
                    target: _circlebacktext
                    property: "anchors.topMargin"
                    duration: 100
                    easing.type: Easing.OutQuint
                    from: anchors.topMargin
                    to: 5
                }

                NumberAnimation {
                    target: _circleicon
                    property: "anchors.verticalCenterOffset"
                    duration: 200
                    easing.type: Easing.InOutQuad
                    from: -50 //anchors.verticalCenterOffset
                    to: 0
                }

                NumberAnimation {
                    target: circleinner
                    property: "scale"
                    duration: 300
                    easing.type: Easing.InQuad
                    to: 0
                }

                NumberAnimation {
                    property: "anchors.topMargin"
                    duration: 800
                    easing.type: Easing.OutQuint
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: _circle
                        property: "anchors.leftMargin"
                        duration: 200
                        from: (parent.width / 2) - (_circle.width / 2)
                        to: 20
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: _buttontext
                        property: "opacity"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                PropertyAction {
                    target:itemroot
                    property:"trigger"
                    value: "true"
                }
            }
        }
    ]

    function triggerChangeProc(){
        dropShadow2.visible = true
        trigger = false
    }
}
