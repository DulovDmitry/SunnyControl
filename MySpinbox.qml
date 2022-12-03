import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle {
    id: spinbox
    property int number: 0
    property int maxCount: 100

    function incrementNumber() {
        number++
        if (number > maxCount) {
            number = 0
        }
    }

    function decrementNumber() {
        number--
        if (number < 0) {
            number = maxCount
        }
    }

    height: window.height/3
    width: window.width/10
    color: "#003366"

    Text {
        text: number
        color: "white"
        font.pixelSize: parent.width/1.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Button {
        id: incrementButton
        height: parent.height/3.5
        width: parent.width
        anchors.top: parent.top

        Rectangle {
            height: parent.height/1.5
            width: height/10
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            width: parent.height/1.5
            height: width/10
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        onPressed: incrementNumber()

        Timer {
            id: longPressTimer1

            interval: 250
            repeat: true
            running: false

            onTriggered: {
                incrementNumber()
            }
        }

        onPressedChanged: {
            if ( pressed ) {
                longPressTimer1.running = true;
            } else {
                longPressTimer1.running = false;
            }
        }
    }

    Button {
        id: decrementButton
        height: parent.height/3.5
        width: parent.width
        anchors.bottom: parent.bottom

        Rectangle {
            width: parent.height/1.5
            height: width/10
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        onPressed: decrementNumber()

        Timer {
            id: longPressTimer2

            interval: 250
            repeat: true
            running: false

            onTriggered: {
                decrementNumber()
            }
        }

        onPressedChanged: {
            if ( pressed ) {
                longPressTimer2.running = true;
            } else {
                longPressTimer2.running = false;
            }
        }
    }
}
