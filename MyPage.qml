import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Page {
    id: root
    property alias backgroundColor: backgroungRect.color
    property string centerText: "Page"
    //property string pageTitle: "Page"

    title: centerText

    background: Rectangle {
        id: backgroungRect

    }



    Text {
        id: debugText
        text: centerText
        font.pointSize: 24
        anchors.centerIn: parent
    }

    Keys.onBackPressed: {
        popPage();
    }

    Keys.onEscapePressed: {
        popPage();
    }
}
