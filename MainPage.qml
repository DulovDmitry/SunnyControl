import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    //signal reactorStatusChanged(int status)
    signal counterClicked(int counterIdentifier)

    property color baseColor: "#F5F5F5"
    property color headerTextColor: "#002ABF"

    property string pageText: "Page"
    property string headerText_ready: "Planning work time"
    property string headerText_working: "Remaining work time"

    property int daysValue_displayed: 0
    property int hoursValue_displayed: 0
    property int minutesValue_displayed: 0
    property int daysValue_scheduled: 0
    property int hoursValue_scheduled: 0
    property int minutesValue_scheduled: 0

    property int buttonsSpacing: 80
    property int counterElementsSpacing: 120

    property bool warmUpButtonPressed: false
    property bool startButtonPressed: false

    property date startTime
    property date endTime

    enum ReactorStatus {
        Ready,
        WarmingUp,
        Working
    }

    property int reactorStatus: MainPage.ReactorStatus.Ready

    function getMinutes() {
        return root.minutesValue_scheduled + root.hoursValue_scheduled*60 + root.daysValue_scheduled*24*60
    }

    onReactorStatusChanged: {
        let text = "Reactor status changed: "

        if (reactorStatus === MainPage.ReactorStatus.Ready) {
            text += "Ready"
        } else if (reactorStatus === MainPage.ReactorStatus.WarmingUp) {
            text += "Warming up"
        } else if (reactorStatus === MainPage.ReactorStatus.Working) {
            text += "Working"
        }

        writeToLog(text)
    }

    Rectangle {
        anchors.fill: parent;
        color: baseColor

        Text {
            id: header

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 80

            text: root.reactorStatus === MainPage.ReactorStatus.Working ? root.headerText_working : root.headerText_ready
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

                timeText: root.daysValue_displayed.toString()
                timeIntervalName: "Days"
                timeIntervalIdentifier: MyCounterElement.TimeIntervalName.Days

                rectColor: reactorStatus === MainPage.ReactorStatus.Working ? "#FFC7A7" : "#A7DFFF"
            }

            MyCounterElement {
                id: counterElement_2
                anchors.horizontalCenter: countersRow.horizontalCenter
                anchors.verticalCenter: countersRow.verticalCenter

                timeText: root.hoursValue_displayed.toString()
                timeIntervalName: "Hours"
                timeIntervalIdentifier: MyCounterElement.TimeIntervalName.Hours

                rectColor: reactorStatus === MainPage.ReactorStatus.Working ? "#FFC7A7" : "#A7DFFF"
            }

            MyCounterElement {
                id: counterElement_3
                anchors.right: countersRow.right
                anchors.verticalCenter: countersRow.verticalCenter

                timeText: root.minutesValue_displayed.toString()
                timeIntervalName: "Minutes"
                timeIntervalIdentifier: MyCounterElement.TimeIntervalName.Minutes

                rectColor: reactorStatus === MainPage.ReactorStatus.Working ? "#FFC7A7" : "#A7DFFF"
            }

            MouseArea {
                id: counterElement_1_MouseArea
                anchors.fill: counterElement_1

                onClicked: {
                    if (reactorStatus === MainPage.ReactorStatus.Working) return
                    root.counterClicked(counterElement_1.timeIntervalIdentifier)
                }
            }

            MouseArea {
                id: counterElement_2_MouseArea
                anchors.fill: counterElement_2

                onClicked: {
                    if (reactorStatus === MainPage.ReactorStatus.Working) return
                    root.counterClicked(counterElement_2.timeIntervalIdentifier)
                }
            }

            MouseArea {
                id: counterElement_3_MouseArea
                anchors.fill: counterElement_3

                onClicked: {
                    if (reactorStatus === MainPage.ReactorStatus.Working) return
                    root.counterClicked(counterElement_3.timeIntervalIdentifier)
                }
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

                property bool blinky: false

                width: 300
                height: 80
                anchors.left: parent.left

                radius: 15
                color: (root.reactorStatus === MainPage.ReactorStatus.Working) ? "#ededed" : (blinky ? "#ffc875" : "#FFEFC6")

                Text {
                    id: warmUpButtonText
                    anchors.centerIn: parent

                    text: (root.reactorStatus === MainPage.ReactorStatus.WarmingUp) ? "Warming up" : "Warm up"
                    font.pointSize: 32

                    color: (root.reactorStatus === MainPage.ReactorStatus.Working) ? "#acabab" : "#333333"
                }

                MouseArea {
                    id: warmUpButtonMouseArea

                    anchors.fill: parent

                    onClicked: {
                        if (root.startButtonPressed) return

                        root.warmUpButtonPressed = !root.warmUpButtonPressed
                        warmUpButtonColorChangingTimer.running = root.warmUpButtonPressed
                        warmUpButton.blinky = root.warmUpButtonPressed
                        console.log("warmUpButtonPressed = " + root.warmUpButtonPressed)
                        console.log("startButtonPressed = " + root.startButtonPressed)

                        if (root.warmUpButtonPressed) {
                            root.reactorStatus = MainPage.ReactorStatus.WarmingUp
                            //warmUpButton.color = "#d9d9d9"
                        } else {
                            root.reactorStatus = MainPage.ReactorStatus.Ready
                        }
                    }
                }

                Timer {
                    id: warmUpButtonColorChangingTimer

                    interval: 1000
                    repeat: true
                    running: false

                    onTriggered: {
                        //warmUpButton.color = (warmUpButton.color == "#d9d9d9") ? "#ffc875" : "#d9d9d9"
                        warmUpButton.blinky = !warmUpButton.blinky
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
                    id: startButtonMouseArea

                    anchors.fill: parent

                    onClicked: {
                        if ((root.daysValue_displayed + root.hoursValue_displayed + root.minutesValue_displayed) === 0) return

                        root.startButtonPressed =! root.startButtonPressed
                        root.warmUpButtonPressed = false
                        warmUpButtonColorChangingTimer.running = false
                        warmUpButton.blinky = false
                        //warmUpButton.color = "#ededed"

                        if (root.startButtonPressed) {
                            root.daysValue_scheduled = root.daysValue_displayed
                            root.hoursValue_scheduled = root.hoursValue_displayed
                            root.minutesValue_scheduled = root.minutesValue_displayed

                            root.startTime = new Date()
                            root.endTime = new Date(startTime.getTime() + getMinutes()*60*1000);
                            console.log("start time", root.startTime)
                            console.log("end time", endTime)
                            remainingTimeTimer.running = true

                            root.reactorStatus = MainPage.ReactorStatus.Working

                            let text = "The photoreactor has been scheduled for "
                            if (root.daysValue_displayed) {
                                text += root.daysValue_displayed + " days "
                            }
                            if (root.hoursValue_displayed) {
                                text += root.hoursValue_displayed + " hours "
                            }
                            if (root.minutesValue_displayed) {
                                text += root.minutesValue_displayed + " minutes "
                            }

                            writeToLog(text)
                        } else {
                            root.reactorStatus = MainPage.ReactorStatus.Ready
                            remainingTimeTimer.running = false

                            root.daysValue_displayed = root.daysValue_scheduled
                            root.hoursValue_displayed = root.hoursValue_scheduled
                            root.minutesValue_displayed = root.minutesValue_scheduled
                        }

                        //root.reactorStatusChanged(reactorStatus)
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

            Timer {
                id: remainingTimeTimer

                interval: 60000
                repeat: true
                running: false

                onTriggered: {
                    let currentTime = new Date()
                    let deltaTime = getMinutes()*60 - (currentTime - root.startTime) / 1000 // remaining time in seconds
                    console.log(deltaTime)

                    let minutes = Math.floor(((deltaTime+60)/60) % 60)
                    let hours = Math.floor((deltaTime+60)/60/60 % 24)
                    let days = Math.floor((deltaTime+60)/60/60/24)

                    root.daysValue_displayed = days.toString()
                    root.hoursValue_displayed = hours.toString()
                    root.minutesValue_displayed = minutes.toString()

                    if (deltaTime <= 0) {startButtonMouseArea.clicked(Qt.MouseEventCreatedDoubleClick)}
                }
            }
        }
    }
}
