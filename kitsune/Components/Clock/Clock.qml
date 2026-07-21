import QtQuick 2.15

Column {
    id: root
    spacing: 4

    QtObject {
        id: dateTime
        property date currentDateTime: new Date()
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateTime.currentDateTime = new Date()
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        color: typeof config !== "undefined" ? config.textColor : "#ffffff"
        font.pixelSize: 64
        font.weight: Font.Light
        text: Qt.formatTime(dateTime.currentDateTime, "hh:mm")
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        color: typeof config !== "undefined" ? config.subTextColor : "#dddddd"
        font.pixelSize: 18
        text: Qt.formatDate(dateTime.currentDateTime, "dddd, d MMMM yyyy")
    }
}
