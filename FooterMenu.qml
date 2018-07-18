import QtQuick 2.11
import QtGraphicalEffects 1.0
import SightSeeing_small 1.0

Item {
    width: parent.width
    height: parent.height

    property string letter


    Rectangle {
        id: _rectangle
        width: parent.width
        height: parent.height / 11
        color: "#fff"
        anchors.top: parent.top
        anchors.topMargin:parent.height-_rectangle.height
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

        Text {
            text: "\uf1d8"
            anchors.centerIn: parent
            font.pixelSize: 17
            color: "#fff"
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height - _rectangle.height
        anchors.top: _rectangle.bottom
        color: "#666"
        Text {
            id: name
            text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat."
            wrapMode: Text.Wrap
            width: parent.width - 40
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }
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
        id: button
        anchors.centerIn: _rectangle
        text: "Explore this city"
        font.family: Constants.fontPoppinsRegularFamily
        font.pixelSize: 13
        font.bold: true
    }


//    states: {

//    }
}
