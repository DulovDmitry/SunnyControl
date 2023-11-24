import QtQuick 2.0

Item {
    id: root

    property color baseColor: "#F5F5F5"
    property string pageText: "Page"

    Rectangle {
        anchors.fill: parent;
        color: baseColor

        Text {
            id: myText
            text: pageText
            font.pointSize: 40
            anchors.centerIn: parent
            color: "black"
        }
    }
}
