import QtQuick 2.15

import "."

Item {
    id: root
    width: label.width
    height: label.height

    property var frases: [
        qsTr("C A N O N P E G A S U S"),
        qsTr("N O T H I N G"),
        qsTr("M I L U U U U U ~")
    ]
    property int currentIndex: 0

    AnimatedText {
        id: label
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 16
        color: "#dddddd"
        text: root.frases[root.currentIndex]
    }

    Timer {
        interval: 6000
        running: true
        repeat: true
        onTriggered: {
            root.currentIndex = (root.currentIndex + 1) % root.frases.length
            label.text = root.frases[root.currentIndex]
            label.playFadeIn()
        }
    }
}
