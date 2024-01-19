import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    property color baseColor: "#F5F5F5"
    property string pageText: "Page"
    property int counterElementsSpacing: 120
    property string headerText: "Planning exposure time"
    property color headerTextColor: "#002ABF"
    property int buttonsSpacing: 80
    property bool warmUpButtonPressed: false
    property bool startButtonPressed: false

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

        Item {
            id: countersRow

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: header.bottom
            anchors.topMargin: 110

            width: counterElement_1.width * 3 + root.counterElementsSpacing * 2

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

        Item {
            id: buttonsRow

            width: warmUpButton.width + startButton.width + root.buttonsSpacing
            height: warmUpButton.height

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 90

            Rectangle {
                id: warmUpButton

                width: 300
                height: 80
                anchors.left: parent.left

                radius: 15
                color: root.startButtonPressed ? "#ededed" : "#d9d9d9"

                Text {
                    id: warmUpButtonText
                    anchors.centerIn: parent

                    text: root.warmUpButtonPressed ? "Warming up" : "Warm up"
                    font.pointSize: 32

                    color: root.startButtonPressed ? "#acabab" : "#000000"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (!root.startButtonPressed) {
                            root.warmUpButtonPressed =! root.warmUpButtonPressed
                            warmUpButton.color = "#d9d9d9"
                            warmUpButtonColorChangingTimer.running = root.warmUpButtonPressed ? true : false
                        }
                    }
                }

                Timer {
                    id: warmUpButtonColorChangingTimer

                    interval: 1000
                    repeat: true
                    running: false

                    onTriggered: {
                        warmUpButton.color = (warmUpButton.color == "#d9d9d9") ? "#ffc875" : "#d9d9d9"
                    }
                }
            }

            DropShadow {
                anchors.fill: warmUpButton
                cached: true
                verticalOffset: 4
                radius: 10
                samples: 16
                color: "#80808080"
                source: warmUpButton
            }

            Rectangle {
                id: startButton

                width: 300
                height: 80
                anchors.right: parent.right

                radius: 15
                color: root.startButtonPressed ? "#FF9D9D" : "#CEFF9D"

                Text {
                    id: startButtonText
                    anchors.centerIn: parent

                    text: root.startButtonPressed ? "Stop" : "Start"
                    font.pointSize: 32
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.startButtonPressed =! root.startButtonPressed
                    }
                }
            }

            DropShadow {
                anchors.fill: startButton
                cached: true
                verticalOffset: 4
                radius: 10
                samples: 16
                color: "#80808080"
                source: startButton
            }
        }
    }
}
