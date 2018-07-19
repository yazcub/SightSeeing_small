import QtQuick 2.11
import QtQuick.Window 2.11
import SightSeeing_small 1.0

Window {
    id: rootwindow
    visible: true
    width: 440
    height: 640
    title: qsTr("Hello World")

    property variant textArr: ["Ayasofya", "Kiz Kulesi", "Skyland Tower", "Sultanahmet"]
    property variant imagesArr: ["ayasofya.jpg", "kizkulesi.jpg", "skyland_tower.jpeg", "sultaahmet.jpg"]
    property variant descriptArr: [Descriptions.ayasofya, Descriptions.kizkulesi, Descriptions.skylandtower, Descriptions.sultanahmet]
    property int lastpos
    property int actualindex: 0

    Arrowgoup {
        id: _arrowup
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: parent.width/2.05
        z:99
    }


    ImageMenu {
        id: _imagemenu
        anchors.fill: parent
        noValue: actualindex+1
        titleValue: textArr[actualindex]
        imageName: "images/" + imagesArr[actualindex]
        z:1
    }

    FooterMenu {
        id: _footermenu
        width: parent.width
        height: parent.height
        anchors.bottom: parent.bottom
        z:2
        desctext: descriptArr[actualindex]
        onMenuclicked: {
            // Stop arrow animation
            if(_arrowup.paranirunning==true)
                _arrowup.stoparrow()
            else _arrowup.startarrow()

            if (_mainmousearea.visible != true)
                _mainmousearea.visible = true
            else _mainmousearea.visible = false

        }
    }

    MouseArea {
        id: _mainmousearea
        anchors.fill: parent
        onPressed: {
            lastpos = mouseY
        }
        onReleased: {
            if (Math.abs(mouseY - lastpos) > 10) {
                if (lastpos > mouseY) {
                    console.log("up")
                    actualindex = actualindex + 1

                    if (actualindex > (imagesArr.length - 1))
                        actualindex = 0
                } else if (lastpos < mouseY) {
                    console.log("down")
                    actualindex = actualindex - 1

                    if (actualindex < 0)
                        actualindex = imagesArr.length - 1
                }

                _imagemenu.imageName = "images/" + imagesArr[actualindex]
                _imagemenu.titleValue = textArr[actualindex]
                _imagemenu.noValue = actualindex+1
                _footermenu.desctext = descriptArr[actualindex]
            }
        }
    }
}
