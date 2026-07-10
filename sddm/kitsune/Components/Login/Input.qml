import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: control
    property bool isPassword: false

    echoMode: isPassword ? TextInput.Password : TextInput.Normal
    color: "#ffffff"
    font.pixelSize: 16
    selectionColor: "#4e54c8"
    placeholderTextColor: "#aaaaaa"
    leftPadding: 14
    rightPadding: 14
    topPadding: 10
    bottomPadding: 10

    background: Rectangle {
        radius: 8
        color: "#33ffffff"
        border.width: 1
        border.color: control.activeFocus ? "#4e54c8" : "transparent"
    }
}
