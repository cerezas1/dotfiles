import QtQuick 6.0
import "../Buttons"

// LoginPanel.qml
Item {
    id: loginPanel

    property string username: ""
    property alias password: passwordField.text
    signal loginRequested(string password)

    width: 260
    height: passwordBox.height + loginButton.height + 16

    Rectangle {
        id: passwordBox
        width: 260
        height: 40
        radius: 4
        color: "#ffffff"
        border.color: "#888888"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        TextInput {
            id: passwordField
            anchors.fill: parent
            anchors.margins: 8
            echoMode: TextInput.Password
            font.family: "FiraCode"
            font.pixelSize: 14
            color: "#000000"
            clip: true
            focus: true
            onAccepted: loginPanel.loginRequested(text)

            Text {
                anchors.fill: parent
                text: "contraseña"
                color: "#999999"
                font.family: "FiraCode"
                font.pixelSize: 14
                visible: passwordField.text.length === 0
            }
        }
    }

    LoginButton {
        id: loginButton
        anchors.top: passwordBox.bottom
        anchors.topMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Iniciar sesión"
        onClicked: loginPanel.loginRequested(passwordField.text)
    }
}
