import QtQuick 2.15

import "."

AnimatedText {
    id: root
    color: typeof config !== "undefined" ? config.errorColor : "#ff6b6b"
    font.pixelSize: 14
    text: ""
    opacity: 0

    Behavior on opacity {
        NumberAnimation { duration: 300 }
    }

    Timer {
        id: hideTimer
        interval: 4000
        onTriggered: root.hide()
    }

    function show(message) {
        root.text = message !== undefined ? message : ""
        root.opacity = 1
        root.playFadeIn()
        hideTimer.restart()
    }

    function hide() {
        root.opacity = 0
    }
}
