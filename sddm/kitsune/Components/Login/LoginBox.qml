import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

Rectangle {
    id: box
    width: 340
    height: content.height + 60
    radius: 16
    color: "#26232946"
    border.color: "#33ffffff"
    border.width: 1

    property alias userField: userInput
    property alias passwordField: passwordInput

    Column {
        id: content
        width: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30
        spacing: 16

        Avatar {
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Input {
            id: userInput
            width: parent.width
            placeholderText: qsTr("Usuario")
            text: typeof userModel !== "undefined" ? userModel.lastUser : ""
            KeyNavigation.tab: passwordInput
        }

        Input {
            id: passwordInput
            width: parent.width
            isPassword: true
            placeholderText: qsTr("Contraseña")
            KeyNavigation.tab: loginButton
            Keys.onReturnPressed: loginButton.clicked()
        }

        Button {
            id: loginButton
            width: parent.width
            text: qsTr("Iniciar sesión")

            background: Rectangle {
                radius: 8
                color: loginButton.pressed ? "#3a3fa0" : "#4e54c8"
            }

            contentItem: Text {
                text: loginButton.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }

            onClicked: {
                if (typeof sddm !== "undefined")
                    sddm.login(userInput.text, passwordInput.text, sessionModel.lastIndex)
            }
        }
    }
}
