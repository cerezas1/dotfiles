import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: control
    property bool isPassword: false

    readonly property color accentColor: typeof config !== "undefined" ? config.accent : "#4e54c8"
    readonly property real baseFontSize: typeof config !== "undefined" ? parseFloat(config.fontSize) : 14

    echoMode: isPassword ? TextInput.Password : TextInput.Normal
    color: typeof config !== "undefined" ? config.textColor : "#ffffff"
    font.pixelSize: baseFontSize + 2
    selectionColor: accentColor
    placeholderTextColor: typeof config !== "undefined" ? config.placeholderColor : "#aaaaaa"
    leftPadding: 14
    rightPadding: 14
    topPadding: 10
    bottomPadding: 10

    background: Rectangle {
        radius: 8
        color: typeof config !== "undefined" ? config.inputBgColor : "#33ffffff"
        border.width: 1
        border.color: control.activeFocus ? control.accentColor : "transparent"

        Behavior on border.color {
            ColorAnimation { duration: 150 }
        }
    }
}
