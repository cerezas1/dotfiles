import QtQuick 2.15
import QtQuick.Window 2.15

import "Components/Clock"
import "Components/Login"
import "Components/Buttons"
import "Components/Effects"

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    color: "#1a1a2e"

    Image {
        id: background
        anchors.fill: parent
        source: Qt.resolvedUrl("backgrounds/Vampire.jpg")
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        visible: status === Image.Ready
    }

    // Capa oscura para mejorar la legibilidad del texto
    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.35
    }

    Clock {
        id: clock
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
    }

    FraseAnimada {
        id: frase
        anchors.top: clock.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    LoginBox {
        id: loginBox
        anchors.centerIn: parent
    }

    ErrorMassage {
        id: errorMessage
        anchors.top: loginBox.bottom
        anchors.topMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
    }

    NetworkIndicator {
        id: networkIndicator
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20
    }

    PowerButtons {
        id: powerButtons
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 30
    }

    Connections {
        target: typeof sddm !== "undefined" ? sddm : null
        function onLoginSucceeded() {
            errorMessage.hide()
        }
        function onLoginFailed() {
            errorMessage.show(qsTr("Usuario o contraseña incorrectos"))
        }
    }

    Component.onCompleted: {
        loginBox.userField.forceActiveFocus()
    }
}
