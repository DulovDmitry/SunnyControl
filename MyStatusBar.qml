import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle {
    property string status: "Готов к работе"

    color: "white"
    width: window.width/3
    height: window.height
    anchors.right: parent.right

    Rectangle {
        id: left_border
        width: 1
        height: window.height
        color: "#808080"
        anchors.right: parent.left
    }

    Text {
        id: status_text
        text: status
        font {
            pixelSize: parent.height/15
            family: "Helvetica"
        }
        y: parent.height/10
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
