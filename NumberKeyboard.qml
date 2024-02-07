import QtQuick 2.12

Rectangle {
    id: root
    anchors.fill: parent

    color: Qt.rgba(0, 0, 0, 0.33)

    Rectangle {
        id: baseRect

        property int buttonHeight: (baseRect.height - textField.height) /4
        property int buttonWidth: baseRect.width / 3

        property color buttonColor: "#ff0000"

        anchors.centerIn: parent
        height: 450
        width: 300

        color: "black"
        radius: 25

        Rectangle {
            id: textField

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: parent.width
            height: 130

            color: "white"

            radius: 25
        }

        Grid {
            columns: 3
            rowSpacing: 0
            columnSpacing: 0

            anchors.top: textField.bottom

            Rectangle {
                id: button_1

                width: baseRect.buttonWidth
                height: baseRect.buttonHeight
                color: baseRect.buttonColor
            }
        }
    }
}
