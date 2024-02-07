import QtQuick 2.12

Item {
    id: root

    property color rectColor: "#A7DFFF"
    property string timeText: "0"
    property string timeIntervalName: "Days"

    width: baseRect.width
    height: baseRect.height

    Rectangle {
        id: baseRect
        anchors.centerIn: parent

        width: 130
        height: 130
        radius: 10

        color: root.rectColor

        Text {
            id: counterText
            text: root.timeText
            anchors.centerIn: parent

            font.pointSize: 70
            font.family: "Bahnschrift SemiLight"
        }
    }

    Text {
        id: timeIntervalText

        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.top: baseRect.bottom
        anchors.topMargin: 5

        text: root.timeIntervalName
        font.family: "Bahnschrift SemiLight SemiConde"
        font.pointSize: 36
    }
}
