import QtQuick 2.0

Item {
    id: root

    property int fontSize: 12
    property int dateTimeMargin: 3

    property string timeFormat: "hh:mm"
    property string dateFormat: "dd.MM.yyyy"

    width: dateText.width
    height: timeText.height + dateText.height + dateTimeMargin

    Text {
        id: timeText

        color: "black"
        font.pointSize: fontSize

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        text: Qt.formatTime(new Date(), timeFormat)
    }

    Text {
        id: dateText

        color: "black"
        font.pointSize: fontSize

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        text: Qt.formatDate(new Date(), dateFormat)
    }

    Timer {
        id: timer

        interval: 5000
        repeat: true
        running: true

        onTriggered: {
            timeText.text =  Qt.formatTime(new Date(), timeFormat)
            dateText.text =  Qt.formatDate(new Date(), dateFormat)
        }
    }

}
