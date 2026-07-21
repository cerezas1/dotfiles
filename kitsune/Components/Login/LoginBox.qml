import QtQuick 2.15
import QtQuick.Controls 2.15

import "."

Rectangle {
    id: box
    width: 340
    height: content.height + 60
    radius: 16
    color: typeof config !== "undefined" ? config.boxColor : "#26232946"
    border.color: typeof config !== "undefined" ? config.boxBorderColor : "#33ffffff"
    border.width: 1

    property alias userField: userInput
    property alias passwordField: passwordInput
    property bool busy: false

    readonly property color accentColor: typeof config !== "undefined" ? config.accent : "#4e54c8"
    readonly property color accentPressedColor: typeof config !== "undefined" ? config.accentPressed : "#3a3fa0"
    readonly property color textColor: typeof config !== "undefined" ? config.textColor : "#ffffff"

    // Permite hacer temblar la caja (feedback visual de login fallido) sin
    // pelear con el anchors.centerIn que usa Main.qml sobre este componente
    transform: Translate { id: shakeTranslate }

    function shake() {
        shakeAnim.restart()
    }

    SequentialAnimation {
        id: shakeAnim
        NumberAnimation { target: shakeTranslate; property: "x"; to: -10; duration: 60 }
        NumberAnimation { target: shakeTranslate; property: "x"; to: 10; duration: 60 }
        NumberAnimation { target: shakeTranslate; property: "x"; to: -6; duration: 60 }
        NumberAnimation { target: shakeTranslate; property: "x"; to: 6; duration: 60 }
        NumberAnimation { target: shakeTranslate; property: "x"; to: 0; duration: 60 }
    }

    Connections {
        target: typeof sddm !== "undefined" ? sddm : null
        function onLoginFailed() {
            box.busy = false
        }
    }

    // Linea de brillo superior, efecto "borde de cristal"
    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 1
        height: 1
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#00ffffff" }
            GradientStop { position: 0.5; color: "#55ffffff" }
            GradientStop { position: 1.0; color: "#00ffffff" }
        }
    }

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
            enabled: !box.busy
            placeholderText: qsTr("Usuario")
            text: typeof userModel !== "undefined" ? userModel.lastUser : ""
            KeyNavigation.tab: passwordInput
        }

        Input {
            id: passwordInput
            width: parent.width
            enabled: !box.busy
            isPassword: true
            placeholderText: qsTr("Contraseña")
            KeyNavigation.tab: loginButton
            Keys.onReturnPressed: loginButton.clicked()
        }

        CapsLockWarning {
            anchors.horizontalCenter: parent.horizontalCenter
        }

        SessionSelector {
            id: sessionSelector
            width: parent.width
        }

        Button {
            id: loginButton
            width: parent.width
            enabled: !box.busy
            text: box.busy ? qsTr("Verificando...") : qsTr("Iniciar sesión")
            opacity: enabled ? 1.0 : 0.7

            Behavior on opacity {
                NumberAnimation { duration: 150 }
            }

            background: Rectangle {
                radius: 8
                color: loginButton.pressed ? box.accentPressedColor : box.accentColor
            }

            contentItem: Text {
                text: loginButton.text
                color: box.textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }

            onClicked: {
                if (typeof sddm !== "undefined") {
                    box.busy = true
                    var sessionIndex = typeof sessionModel !== "undefined"
                        ? sessionSelector.currentIndex
                        : 0
                    sddm.login(userInput.text, passwordInput.text, sessionIndex)
                }
            }
        }
    }
}
