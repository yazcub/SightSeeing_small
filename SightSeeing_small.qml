import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    id: rootwindow
    visible: true
    width: 440
    height: 640
    title: qsTr("Hello World")

    property variant textArr: ["Ayasofya", "Kiz Kulesi", "Skyland Tower", "Sultanahmet"]
    property variant imagesArr: ["ayasofya.jpg", "kizkulesi.jpg", "skyland_tower.jpeg", "sultaahmet.jpg"]
    property int lastpos
    property int actualindex: 0

    ImageMenu {
        id: _imagemenu
        anchors.fill: parent
        noValue: actualindex+1
        titleValue: textArr[actualindex]
        imageName: "images/" + imagesArr[actualindex]
    }

    FooterMenu {
//        width: parent.width
//        height: parent.height / 11
        width: parent.width
        height: parent.height

        anchors.bottom: parent.bottom
    }

    MouseArea {
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
            }
        }
    }
}
