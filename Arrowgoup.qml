import QtQuick 2.11
import SightSeeing_small 1.0

Item {
    width: parent.width
    height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter
    property alias paranirunning: _parAnimation.running

    Text {
        id: _pfeil
        text: "\uf102"
        color: "#fff"
        font.family: Constants.fontSolidFamily
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    ParallelAnimation {
        id: _parAnimation
        running: true
        NumberAnimation {
            target: _pfeil
            property: "y"
            duration: 2000
            from: y
            to: y - 30
            easing.type: Easing.OutExpo
            loops: Animation.Infinite
        }
        OpacityAnimator {
            target: _pfeil
            from: 1
            to: 0
            duration: 2000
            loops: Animation.Infinite
            easing.type: Easing.OutExpo
        }
    }

    function stoparrow() {
        _parAnimation.stop()
        _pfeil.visible = false
    }

    function startarrow() {
        setTimeout(function () {
            _parAnimation.start()
            _pfeil.visible = true
        }, 1500)
    }

    // sleep function :D
    Timer {
        id: timer
        running: false
        repeat: false

        property var callback

        onTriggered: callback()
    }

    function setTimeout(callback, delay) {
        if (timer.running) {
            console.error("nested calls to setTimeout are not supported!")
            return
        }
        timer.callback = callback
        // note: an interval of 0 is directly triggered, so add a little padding
        timer.interval = delay + 1
        timer.running = true
    }
}
