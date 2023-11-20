import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 1024  //240
    height: 600 // 135
    //title: qsTr("Hello World")
    color: "lightgrey"
    flags: Qt.FramelessWindowHint

    function popPage() {
        stackView.pop();
    }

    function ledFunction(buttonStatus) {
        if (buttonStatus) {
            ledOn()
        } else {
            ledOff()
        }
    }

    function ledFansFunction(buttonStatus) {
        if (buttonStatus) {
            ledFansOn()
        } else {
            ledFansOff()
        }
    }

    function caseFansFunction(buttonStatus) {
        if (buttonStatus) {
            caseFansOn()
        } else {
            caseFansOff()
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: testpage
    }

    MyPage {
        id: testpage
        backgroundColor: "white"

        Rectangle {
            width: 1024
            height: 50
            anchors.top: parent.top;
            color: "red"
        }

        Rectangle {
            width: 1024
            height: 50
            anchors.bottom: parent.bottom;
            color: "red"
        }

        Button {
            id: ledButton
            x: window.width/15
            y: window.width/15
            height: window.height/5
            width: window.width/4

            checkable: true
            checked: false

            palette.button: "cyan"

            Text {
                text: 'LED'
                font {
                    pixelSize: parent.width/5
                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            onClicked: ledFunction(checked)
        }

        Button {
            id: ledFansButton
            x: window.width/15
            y: 3*window.width/15
            height: window.height/5
            width: window.width/4

            checkable: true
            checked: false

            palette.button: "cyan"

            Text {
                text: 'LED fans'
                font {
                    pixelSize: parent.width/5
                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            onClicked: ledFansFunction(checked)
        }

        Button {
            id: caseFansButton
            x: window.width/15
            y: 5*window.width/15
            height: window.height/5
            width: window.width/4

            checkable: true
            checked: false

            palette.button: "cyan"

            Text {
                text: 'Case fans'
                font {
                    pixelSize: parent.width/5
                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            onClicked: caseFansFunction(checked)
        }
    }

    MyPage {
        id: homePage
        visible: false
        backgroundColor: "#F2F2F2"


        MyStatusBar {
            color: "#CCFF66"
        }

        MySpinbox {
            id: hoursSpinbox
            maxCount: 99
            x: window.width/5
            y: window.width/30
        }

        Text {
            text: ":"
            font.pixelSize: window.height/10
            leftPadding: window.height/40
            anchors.left: hoursSpinbox.right
            anchors.verticalCenter: hoursSpinbox.verticalCenter
        }

        MySpinbox {
            id: minutesSpinbox
            maxCount: 59
            x: hoursSpinbox.x + window.width/7
            y: hoursSpinbox.y
        }

        Text {
            text: "Время"
            font.pixelSize: window.height/12
            rightPadding: window.height/20
            anchors.right: hoursSpinbox.left
            anchors.verticalCenter: hoursSpinbox.verticalCenter
        }

        /*
        Button {
            width: window.width/20
            height: window.height/20
            x: window.width/20
            y: window.height/20
            Text {
                text: "Page 1"
                anchors.centerIn: parent
            }
            onClicked: {
                stackView.push(page1)
            }
        }

        Button {
            width: 100
            height: 50
            x: 50
            y: 250
            Text {
                text: "Page 2"
                anchors.centerIn: parent
            }
            onClicked: {
                stackView.push(page2)
            }
        }
        */
    }

    MyPage {
        id: page1
        visible: false
        backgroundColor: "lightpink"
        //centerText: "Page1"
    }

    MyPage {
        id: page2
        visible: false
        backgroundColor: "lightgrey"
        //centerText: "Page2"
    }
}
