import QtQuick 2.12
import QtQuick.Controls 2.0

Button {
    id: root

    property int radius: 0
    property int buttonHeight: 0
    property int buttonWidth: 0
    property int number: 0

    height: buttonHeight
    width: buttonWidth

    Text {
        text: number.toString()
        font.pointSize: 35
        anchors.centerIn: parent
        color: "#222222"
    }
}
