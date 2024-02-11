import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    property color baseColor: "#F5F5F5"
    property color fontColor_enabled: "#333344"
    property color fontColor_disabled: "#9999AA"
    property color switcherColor: Qt.lighter("#2b99b9")

    property bool switchersEnabled: false

    property int switchLabelFontSize: 30

    function changeSwitchersState(reactorStatus) {
        console.log("ManualControlPage, changeSwitchersState ", reactorStatus)
        if (reactorStatus === MainPage.ReactorStatus.Ready) {
            led1_switch.checked = false
            led2_switch.checked = false
            coolers_switch.checked = false
            //root.switchersEnabled = false
        } else {
            led1_switch.checked = true
            led2_switch.checked = true
            coolers_switch.checked = true
            //root.switchersEnabled = false
        }
    }

    Rectangle {
        id: baseRectangle
        anchors.fill: parent;
        color: baseColor

        Grid {
            columns: 2
            rowSpacing: 60
            columnSpacing: 30

            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.verticalCenter: parent.verticalCenter

            Text {
                text: "LED #1"
                color: switchersEnabled ? fontColor_enabled : fontColor_disabled
                font.pointSize: switchLabelFontSize
            }
            MySwitch {
                id: led1_switch
                enabled: switchersEnabled
                checkedColor: switcherColor

                onCheckedChanged: {
                    if (led1_switch.checked === true) {
                        //ledOn()
                    } else {
                        //ledOff()
                    }
                }
            }

            Text {
                text: "LED #2"
                color: switchersEnabled ? fontColor_enabled : fontColor_disabled
                font.pointSize: switchLabelFontSize
            }
            MySwitch {
                id: led2_switch
                enabled: switchersEnabled
                checkedColor: switcherColor
            }

            Text {
                text: "LED coolers"
                color: switchersEnabled ? fontColor_enabled : fontColor_disabled
                font.pointSize: switchLabelFontSize
            }
            MySwitch {
                id: coolers_switch
                enabled: switchersEnabled
                checkedColor: switcherColor
            }

            Text {
                text: "Case coolers"
                color: switchersEnabled ? fontColor_enabled : fontColor_disabled
                font.pointSize: switchLabelFontSize
            }
            MySwitch {
                id: fans_switch
                enabled: switchersEnabled
                checkedColor: switcherColor
            }
        }

        Button {
            id: lockButton

            //checkable: true

            display: AbstractButton.TextBesideIcon
            text: root.switchersEnabled ? "Unlocked" : "Locked"
            font.pointSize: 15

            icon.source: root.switchersEnabled ? "qrc:/icons/unlocked_256.png" : "qrc:/icons/locked_256.png"

            height: 60
            width: 150
            anchors.top: parent.top
            anchors.topMargin: 70
            anchors.right: parent.right
            anchors.rightMargin: 20

            background: Rectangle {
                color: root.switchersEnabled ? "#d9d9d9" : "#ffc875"
                radius: 10
            }

            onClicked: root.switchersEnabled = !root.switchersEnabled
        }

        DropShadow {
            anchors.fill: lockButton
            cached: true
            radius: 10
            samples: 32
            color: "#80808080"
            source: lockButton
        }
    }
}
