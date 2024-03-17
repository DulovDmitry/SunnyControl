import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window

    visible: true
    width: 1024
    height: 600
    color: "black"
    flags: Qt.FramelessWindowHint

    property var numberKeyboardDialogHolder: null

    function pageSelectionButtonClicked(pageNumber) {
        manualControlPage.switchersEnabled = false

        if (pageNumber === 0) { stackView.clear(); stackView.push(mainPage) }
        else if (pageNumber === 1) { stackView.clear(); stackView.push(manualControlPage) }
        else if (pageNumber === 2) { stackView.clear(); stackView.push(logsPage) }
        else if (pageNumber === 3) { stackView.clear(); stackView.push(fourthPage) }
    }

    function reactorStatusChanged() {
        statusBar.status = mainPage.reactorStatus
    }

    function createNumberKeyboardDialog(counterIdentifier) {
        if (numberKeyboardDialogHolder === null) {
            //var component = Qt.createComponent("NumberKeyboard.qml")
            var component = Qt.createComponent("qrc:/NumberKeyboard.qml")
            numberKeyboardDialogHolder = component.createObject(window, {"x":0, "y":0})
            if (numberKeyboardDialogHolder) {
                numberKeyboardDialogHolder.counterToBeChanged = counterIdentifier
                numberKeyboardDialogHolder.destroyMe.connect(window.destroyNumberKeyboardDialog)
                numberKeyboardDialogHolder.sendValue.connect(window.setCounterValue)
            }
        }
    }

    function destroyNumberKeyboardDialog() {
        if (numberKeyboardDialogHolder !== null) {
            numberKeyboardDialogHolder.destroy()
            numberKeyboardDialogHolder = null
        }
    }

    function setCounterValue(value) {
        if (numberKeyboardDialogHolder === null) return

        if (numberKeyboardDialogHolder.counterToBeChanged === MyCounterElement.TimeIntervalName.Days) {
            if (value > 99) value = 99
            mainPage.daysValue_displayed = value
        } else if (numberKeyboardDialogHolder.counterToBeChanged === MyCounterElement.TimeIntervalName.Hours) {
            if (value > 23) value = 23
            mainPage.hoursValue_displayed = value
        } else if (numberKeyboardDialogHolder.counterToBeChanged === MyCounterElement.TimeIntervalName.Minutes) {
            if (value > 59) value = 59
            mainPage.minutesValue_displayed = value
        }
    }

    StackView {
        id: stackView

        anchors.fill: parent
        initialItem: mainPage
    }

    MainPage {
        id: mainPage
        visible: false

        anchors.fill: parent

        onReactorStatusChanged: {
            window.reactorStatusChanged()
            manualControlPage.changeSwitchersState(mainPage.reactorStatus)
            statusBar.finishTime = mainPage.endTime
        }
        onCounterClicked: (counterIdentifier) => window.createNumberKeyboardDialog(counterIdentifier)
    }

    ManualControlPage {
        id: manualControlPage
        visible: false

        anchors.fill: parent
    }

    LogsPage {
        id: logsPage
        visible: false

        anchors.fill: parent

    }

    PageSelectionBar {
        id: pageSelectionBar

        buttonBottomMargin: 0
        buttonLeftMargin: 0
        fontSize: 19
        buttonHeight: 50
        baseColor: "#DFDFDF"

        onButtonClicked: (pageNumber) => pageSelectionButtonClicked(pageNumber)

    }

    StatusBar {
        id: statusBar

        status: 0
    }
}
