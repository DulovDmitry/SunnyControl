import QtQuick 2.0

Rectangle {
    id: root

    property int status: 0
    // 0 - ready
    // 1 - working

    property color color_ready: "#D2EFFF"
    property color color_working: "#FFE2D2"

    property string text_ready: "Photoreactor is ready to work"
    property string text_working: "Photoreactor is working"

    width: parent.width
    height: 50

    anchors.bottom: parent.bottom

    color: {
        if (status === 0) { return color_ready }
        else if (status === 1) { return color_working }
    }

    Text {
        id: statusText

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50

        font.pointSize: 17

        text: {
            if (status === 0) { return text_ready }
            else if (status === 1) { return text_working }
        }
    }

}
