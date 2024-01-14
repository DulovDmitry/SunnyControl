import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Switch {
    id: root

    property color checkedColor: "#0ACF97"
    property color unCheckedColor: "#FFFFFF"

    width: backRect.width
    height: backRect.height

    indicator: Rectangle {
        id: backRect
        width: 100
        height: 50
        radius: height / 2
        color: root.checked ? checkedColor : unCheckedColor
        opacity: enabled ? 1 : 0.5
        border.width: 2
        border.color: root.checked ? checkedColor : "#BBBBBB"

        Behavior on color {
            ColorAnimation {
                from: backRect.color
                to: (backRect.color === checkedColor) ? unCheckedColor : checkedColor
                duration: 200
            }
        }

        Rectangle {
            x: root.checked ? parent.width - width - 2 : 1
            width: root.checked ? parent.height - 4 : parent.height - 2
            height: width
            radius: width / 2
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            border.color: "#999999"
            border.width: 1
            opacity: enabled ? 1 : 0.5

            Behavior on x {
                NumberAnimation { duration: 200 }
            }
        }
    }
}
