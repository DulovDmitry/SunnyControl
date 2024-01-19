import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    signal clicked()

    property bool isActive: true

    property int pageNumber: 0

    property string activeColor: "#000000"
    property string inactiveColor: "#909090"
    property color gradientShadowColor: "#aaaaaa"
    property color barColor: parent.color

    property string buttonText: "button"

    property int fontSize: 20
    property int buttonHeight: 50
    property int bottomMargin: 8

    width: myText.width + 50
    height: buttonHeight

    Rectangle {
        id: verticalGradient

        anchors.fill: parent

        gradient:
            Gradient {
                GradientStop {
                    position: 1.0
                    color: {
                        if (isActive) { return gradientShadowColor }
                        else { return Qt.rgba(0, 0, 0, 0) }
                    }
                }

                GradientStop {
                    position: 0.66
                    color: Qt.rgba(0, 0, 0, 0)
                }
            }
    }

    Rectangle {
        id: horizontalCorrectingGradient

        anchors.fill: parent

        color: Qt.rgba(0,0,0,0)

        LinearGradient {
            anchors.fill: parent
            start: Qt.point(parent.width, 0)
            end: Qt.point(0, 0)
            gradient: Gradient {
                GradientStop {
                    position: 1.0
                    color: {
                        if (isActive) { return barColor }
                        else { return Qt.rgba(0, 0, 0, 0) }
                    }
                }

                GradientStop {
                    position: 0.75
                    color: Qt.rgba(0, 0, 0, 0)
                }

                GradientStop {
                    position: 0.25
                    color: Qt.rgba(0, 0, 0, 0)
                }

                GradientStop {
                    position: 0
                    color: {
                        if (isActive) { return barColor }
                        else { return Qt.rgba(0, 0, 0, 0) }
                    }
                }
            }
        }
    }

    Text {
        id: myText
        text: parent.buttonText

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.bottomMargin
        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: parent.fontSize

        color: {
            if (isActive) {
                return activeColor
            } else {
                return inactiveColor
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.parent.pageButtonClicked(root)
            root.clicked()
        }
    }
}
