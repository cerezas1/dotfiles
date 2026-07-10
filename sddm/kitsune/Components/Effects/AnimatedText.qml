import QtQuick 2.15

Text {
    id: root
    color: "#ffffff"
    opacity: 0

    NumberAnimation {
        id: fadeIn
        target: root
        property: "opacity"
        from: 0
        to: 1
        duration: 600
        easing.type: Easing.InOutQuad
    }

    function playFadeIn() {
        fadeIn.start()
    }

    Component.onCompleted: playFadeIn()
}
