import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle {
    id: pageSelectionBar

    property int buttonBottomMargin: 0
    property int buttonLeftMargin: 0
    property int fontSize: 19
    property int buttonHeight: 50
    property color baseColor: "#DFDFDF"

    width: parent.width
    height: 50
    anchors.top: parent.top

    color: baseColor

    function pageButtonClicked(pageNumber) {
        mainPageButton.isActive = false
        manualControlPageButton.isActive = false
        infoPageButton.isActive = false
        stirringPageButton.isActive = false

        if (pageNumber === 0) {
            mainPageButton.isActive = true
        } else if (pageNumber === 1) {
            manualControlPageButton.isActive = true
        } else if (pageNumber === 2) {
            infoPageButton.isActive = true
        } else if (pageNumber === 3) {
            stirringPageButton.isActive = true
        }

    }

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
    }
}
