import QtQuick 2.0

Item {
    id: root

    property color baseColor: "#F5F5F5"
    property string pageText: "Page"
    property int counterElementsSpacing: 120
    property string headerText: "Planning exposure time"
    property color headerTextColor: "#002ABF"

    Rectangle {
        anchors.fill: parent;
        color: baseColor

        Text {
            id: header

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 80

            text: root.headerText
            font.pixelSize: 52
            color: headerTextColor
        }

        Rectangle {
            id: countersRow

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: header.bottom
            anchors.topMargin: 110

            width: counterElement_1.width * 3 + root.counterElementsSpacing * 2

            color: root.baseColor

            MyCounterElement {
                id: counterElement_1
                anchors.left: countersRow.left
                anchors.verticalCenter: countersRow.verticalCenter

                timeText: "2"
                timeIntervalName: "Days"
            }

            MyCounterElement {
                id: counterElement_2
                anchors.horizontalCenter: countersRow.horizontalCenter
                anchors.verticalCenter: countersRow.verticalCenter

                timeText: "15"
                timeIntervalName: "Hours"
            }

            MyCounterElement {
                id: counterElement_3
                anchors.right: countersRow.right
                anchors.verticalCenter: countersRow.verticalCenter

                timeText: "41"
                timeIntervalName: "Minutes"
            }

        }
    }
}
