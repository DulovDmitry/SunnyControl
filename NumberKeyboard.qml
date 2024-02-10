import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    anchors.fill: parent

    signal sendValue(int value)
    signal destroyMe()

    function updateDisplayedNumber(number) {
        if (root.displayedNumber > 100) return

        displayedNumber = displayedNumber*10 + number
    }

    property int displayedNumber: 0

    color: Qt.rgba(0, 0, 0, 0.33)

    MouseArea {
        anchors.fill: root
        onClicked: destroyMe()
    }

    MouseArea {
        anchors.fill: baseRect
        onClicked: {
        }
    }

    Rectangle {
        id: baseRect

        property real buttonHeight: (baseRect.height - textBackgroundRect.height - grid.rowSpacing*3 - grid.anchors.topMargin) / 4
        property real buttonWidth: (baseRect.width - grid.columnSpacing*2 ) / 3

        anchors.centerIn: parent
        height: 450
        width: 300

        color: "#aaaaaa"
        radius: 25

        Rectangle {
            width: parent.width
            height: parent.radius
            anchors.bottom: textBackgroundRect.bottom
            color: textBackgroundRect.color
        }
        Rectangle {
            width: parent.width
            height: grid.anchors.topMargin
            anchors.top: textBackgroundRect.bottom
            color: "black"
        }

        Rectangle {
            id: textBackgroundRect

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: parent.width
            height: 130

            color: "#fefefe"

            radius: 25

            Text {
                id: textField

                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 25

                text: root.displayedNumber.toString()
                color: "#0C2D57"
                font.pointSize: 60
            }
        }

        Grid {
            id: grid
            columns: 3
            rowSpacing: 3
            columnSpacing: 3

            anchors.top: textBackgroundRect.bottom
            anchors.topMargin: 2

            MyNumberButton {
                id: button_1
                number: 1

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_2
                number: 2

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_3
                number: 3

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_4
                number: 4

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_5
                number: 5

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_6
                number: 6

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_7
                number: 7

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_8
                number: 8

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            MyNumberButton {
                id: button_9
                number: 9

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            Button {
                id: button_cancel

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                background: Shape {
                    ShapePath {
                        strokeWidth: -1
                        fillColor: "#e05144"

                        startX: 0; startY: 0
                        PathLine { x: button_cancel.width; y: 0 }
                        PathLine { x: button_cancel.width; y: button_cancel.height }
                        PathLine { x: baseRect.radius ; y: button_cancel.height }
                        PathArc {
                            x: 0; y: button_cancel.height - baseRect.radius
                            radiusX: baseRect.radius; radiusY: baseRect.radius
                        }
                        PathLine { x: 0; y: 0 }
                    }
                }

                onClicked: root.destroyMe()
            }

            MyNumberButton {
                id: button_0
                number: 0

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                onClicked: root.updateDisplayedNumber(number)
            }

            Button {
                id: button_ok

                height: baseRect.buttonHeight
                width: baseRect.buttonWidth

                background: Shape {
                    ShapePath {
                        strokeWidth: -1
                        fillColor: "#CEFF9D"

                        startX: 0; startY: 0
                        PathLine { x: button_cancel.width; y: 0 }
                        PathLine { x: button_cancel.width ; y: button_cancel.height - baseRect.radius }
                        PathArc {
                            x: button_cancel.width - baseRect.radius; y: button_cancel.height
                            radiusX: baseRect.radius; radiusY: baseRect.radius
                        }
                        PathLine { x: 0 ; y: button_cancel.height }
                        PathLine { x: 0; y: 0 }
                    }
                }

                onClicked: {
                    sendValue(root.displayedNumber)
                    destroyMe()
                }
            }
        }
    }

    DropShadow {
        anchors.fill: baseRect
        cached: true
        verticalOffset: 0
        transparentBorder: true
        radius: 25
        samples: 50
        spread: 0.5
        color: "#30000000"
        source: baseRect
    }
}
