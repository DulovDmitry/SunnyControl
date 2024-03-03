import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    property color baseColor: "#F5F5F5"
    //property string logText: ""

    Rectangle {
        id: baseRect
        anchors.fill: parent

        color: baseColor

        Rectangle {
            id: textAreaRect

            anchors.fill: parent
            anchors.topMargin: 65
            anchors.bottomMargin: 65
            anchors.leftMargin: 15
            anchors.rightMargin: 15

            color: "#FFFFFF"
            border.color: "#D5D5D5"
            border.width: 2

            ScrollView {
                id: scrollView
                anchors.fill: parent
                anchors.margins: 7

                TextArea {
                    id: textArea
                    text: logText   // property from AppEngine class
                    font.pointSize: 15
                    color: "black"
                    enabled: false
                }
            }
        }
    }
}
