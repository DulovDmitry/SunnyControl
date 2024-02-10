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
        console.log("Clicked at " + pageNumber + " page")

        if (pageNumber === 0) { stackView.clear(); stackView.push(mainPage) }
        else if (pageNumber === 1) { stackView.clear(); stackView.push(manualControlPage) }
        else if (pageNumber === 2) { stackView.clear(); stackView.push(thirdPage) }
        else if (pageNumber === 3) { stackView.clear(); stackView.push(fourthPage) }
    }

    function reactorStatusChanged() {
        console.log(mainPage.reactorStatus)
        statusBar.status = mainPage.reactorStatus
    }

    function createNumberKeyboardDialog(number) {
        if (numberKeyboardDialogHolder === null) {
            var component = Qt.createComponent("NumberKeyboard.qml")
            numberKeyboardDialogHolder = component.createObject(window, {"x":0, "y":0})
            if (numberKeyboardDialogHolder) {
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
        if (value > 99) value = 99

        console.log(value)
        mainPage.hoursValue = value
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

        onReactorStatusChanged: window.reactorStatusChanged()
        onCounterClicked: (number) => window.createNumberKeyboardDialog(number)
    }

    ManualControlPage {
        id: manualControlPage
        visible: false

        anchors.fill: parent
    }

//    MainPage {
//        id: thirdPage
//        visible: false

//        pageText: "Page 3"

//        anchors.fill: parent
//    }

//    MainPage {
//        id: fourthPage
//        visible: false

//        pageText: "Page 4"

//        anchors.fill: parent
//    }

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


//    function popPage() {
//        stackView.pop();
//    }

//    function ledFunction(buttonStatus) {
//        if (buttonStatus) {
//            ledOn()
//        } else {
//            ledOff()
//        }
//    }

//    function ledFansFunction(buttonStatus) {
//        if (buttonStatus) {
//            ledFansOn()
//        } else {
//            ledFansOff()
//        }
//    }

//    function caseFansFunction(buttonStatus) {
//        if (buttonStatus) {
//            caseFansOn()
//        } else {
//            caseFansOff()
//        }
//    }

//    StackView {
//        id: stackView
//        anchors.fill: parent
//        initialItem: homePage
//    }

//    MyPage {
//        id: testpage
//        backgroundColor: "white"

//        Rectangle {
//            width: 1024
//            height: 50
//            anchors.top: parent.top;
//            color: "#555555"
//        }

//        Rectangle {
//            width: 1024
//            height: 50
//            anchors.bottom: parent.bottom;
//            color: "red"
//        }

//    }

//    MyPage {
//        id: homePage
//        visible: false
//        backgroundColor: "#F2F2F2"


//        MyStatusBar {
//            color: "#CCFF66"
//        }

//        MySpinbox {
//            id: hoursSpinbox
//            maxCount: 99
//            x: window.width/5
//            y: window.width/30
//        }

//        Text {
//            text: ":"
//            font.pixelSize: window.height/10
//            leftPadding: window.height/40
//            anchors.left: hoursSpinbox.right
//            anchors.verticalCenter: hoursSpinbox.verticalCenter
//        }

//        MySpinbox {
//            id: minutesSpinbox
//            maxCount: 59
//            x: hoursSpinbox.x + window.width/7
//            y: hoursSpinbox.y
//        }

//        Text {
//            text: "Время"
//            font.pixelSize: window.height/12
//            rightPadding: window.height/20
//            anchors.right: hoursSpinbox.left
//            anchors.verticalCenter: hoursSpinbox.verticalCenter
//        }

//        /*
//        Button {
//            width: window.width/20
//            height: window.height/20
//            x: window.width/20
//            y: window.height/20
//            Text {
//                text: "Page 1"
//                anchors.centerIn: parent
//            }
//            onClicked: {
//                stackView.push(page1)
//            }
//        }

//        Button {
//            width: 100
//            height: 50
//            x: 50
//            y: 250
//            Text {
//                text: "Page 2"
//                anchors.centerIn: parent
//            }
//            onClicked: {
//                stackView.push(page2)
//            }
//        }
//        */
//    }

//    MyPage {
//        id: page1
//        visible: false
//        backgroundColor: "lightpink"
//        //centerText: "Page1"
//    }

//    MyPage {
//        id: page2
//        visible: false
//        backgroundColor: "lightgrey"
//        //centerText: "Page2"
//    }
}
