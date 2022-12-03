import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 240  //240
    height: 135 // 135
    title: qsTr("Hello World")
    color: "lightcyan"
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
        backgroundColor: "lightcyan"
        centerText: window.width + " " + window.height

        Button {
            width: 20
            height: 20
            x: 10
            y: 10
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
    }

    MyPage {
        id: page1
        visible: false
        backgroundColor: "lightpink"
        centerText: "Page1"
    }

    MyPage {
        id: page2
        visible: false
        backgroundColor: "lightgrey"
        centerText: "Page2"
    }
}
