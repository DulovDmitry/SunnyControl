import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 240  //240
    height: 135 // 135
    //title: qsTr("Hello World")
    color: "lightgrey"
    flags: Qt.FramelessWindowHint

    function popPage() {
        stackView.pop();
    }

//    header: ToolBar {
//        height: 70
//        ToolButton {
//            visible: stackView.depth > 1
//            text: "<"
//            anchors.verticalCenter: parent.verticalCenter
//            onClicked: {
//                popPage();
//            }
//        }

//        Text {
//            id: pageTitle
//            text: stackView.currentItem.title
//            font.pointSize: 24
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter
//        }

//        Image {
//            id: logoImage
//            width: 100
//            height: parent.height
//            fillMode: Image.PreserveAspectFit
//            smooth: true
//            source: "qrc:/Sunny logo.png"
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.right: parent.right
//        }
//    }

//    footer: Rectangle {
//        id: bottomStatusBar
//        color: "lightgreen"
//        width: window.width
//        height: 70
//        //anchors.bottom: parent.bottom

//        Text {
//            id: statusText
//            text: qsTr("Status: ready")
//            font.pointSize: 12
//            anchors.centerIn: parent
//        }
//    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homePage
    }

    MyPage {
        id: homePage
        backgroundColor: "#F2F2F2"

//        Text {
//            anchors.centerIn: parent
//            text: window.width + " " + window.height
//            font {
//                pixelSize: window.height/10
//            }
//        }

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
