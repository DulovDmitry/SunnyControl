import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle {
    id: root

    signal buttonClicked(int pageNumber)

    property int buttonBottomMargin: 0
    property int buttonLeftMargin: 0
    property int fontSize: 19
    property int buttonHeight: 50
    property color baseColor: "#DFDFDF"

    function pageButtonClicked(clickedButton) {
        mainPageButton.isActive = false
        manualControlPageButton.isActive = false
        infoPageButton.isActive = false
        stirringPageButton.isActive = false

        clickedButton.isActive = true
    }

    width: parent.width
    height: 50
    anchors.top: parent.top

    color: baseColor

    SystemDateTime {
        id: systemDateTime

        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    PageSelectionButton {
        id: mainPageButton
        pageNumber: 0

        isActive: true
        buttonText: "Main page"
        fontSize: parent.fontSize
        buttonHeight: parent.buttonHeight

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.buttonBottomMargin
        anchors.left: parent.left
        anchors.leftMargin: parent.buttonLeftMargin + 25

        onClicked: root.buttonClicked(pageNumber)
    }

    PageSelectionButton {
        id: manualControlPageButton
        pageNumber: 1

        isActive: false
        buttonText: "Manual control"
        fontSize: parent.fontSize
        buttonHeight: parent.buttonHeight

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.buttonBottomMargin
        anchors.left: mainPageButton.right
        anchors.leftMargin: parent.buttonLeftMargin

        onClicked: root.buttonClicked(pageNumber)
    }

    PageSelectionButton {
        id: infoPageButton
        pageNumber: 2

        isActive: false
        buttonText: "Info"
        fontSize: parent.fontSize
        buttonHeight: parent.buttonHeight

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.buttonBottomMargin
        anchors.left: manualControlPageButton.right
        anchors.leftMargin: parent.buttonLeftMargin

        onClicked: root.buttonClicked(pageNumber)
    }

    PageSelectionButton {
        id: stirringPageButton
        pageNumber: 3

        isActive: false
        buttonText: "Stirring"
        fontSize: parent.fontSize
        buttonHeight: parent.buttonHeight

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.buttonBottomMargin
        anchors.left: infoPageButton.right
        anchors.leftMargin: parent.buttonLeftMargin

        onClicked: root.buttonClicked(pageNumber)
    }
}
