import QtQuick 2.0

Rectangle {
    id: root

    property int status: 0
    // 0 - ready
    // 1 - working

    property color color_ready: "#D2EFFF"
    property color color_warmingUp: "#FFE2D2"
    property color color_working: "#FFE2D2"

    property string text_ready: "Photoreactor is ready to work"
    property string text_warmingUp: "Photoreactor is warming up"
    property string text_working: "Photoreactor is working"

    width: parent.width
    height: 50

    anchors.bottom: parent.bottom

    color: {
        if (status === MainPage.ReactorStatus.Ready) { return color_ready }
        else if (status === MainPage.ReactorStatus.WarmingUp) { return color_warmingUp }
        else if (status === MainPage.ReactorStatus.Working) { return color_working }
    }

    Text {
        id: statusText

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50

        font.pointSize: 17

        text: {
            if (status === MainPage.ReactorStatus.Ready) { return text_ready }
            else if (status === MainPage.ReactorStatus.WarmingUp) { return text_warmingUp }
            else if (status === MainPage.ReactorStatus.Working) { return text_working }
        }
    }

}
