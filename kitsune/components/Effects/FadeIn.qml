import QtQuick 6.0

// FadeIn.qml
// Uso: FadeIn { target: miItem; running: true }
NumberAnimation {
    property: "opacity"
    from: 0
    to: 1
    duration: 500
    easing.type: Easing.OutCubic
}
