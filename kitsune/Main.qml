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
    color: typeof config !== "undefined" ? config.baseColor : "#1a1a2e"
    opacity: 0

    readonly property string bgSource: typeof config !== "undefined" ? config.background : "backgrounds/Vampire.jpg"
    readonly property color overlayColor: typeof config !== "undefined" ? config.overlayColor : "#000000"
    readonly property real overlayOpacity: typeof config !== "undefined" ? parseFloat(config.overlayOpacity) : 0.35

    Image {
        id: background
        anchors.fill: parent
        source: Qt.resolvedUrl(root.bgSource)
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        visible: status === Image.Ready

        SequentialAnimation on scale {
            loops: Animation.Infinite
            NumberAnimation { from: 1.0; to: 1.06; duration: 25000; easing.type: Easing.InOutSine }
            NumberAnimation { from: 1.06; to: 1.0; duration: 25000; easing.type: Easing.InOutSine }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: root.overlayColor
        opacity: root.overlayOpacity
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
            loginBox.shake()
        }
    }

    NumberAnimation {
        id: introFade
        target: root
        property: "opacity"
        from: 0
        to: 1
        duration: 700
        easing.type: Easing.OutQuad
    }

    Component.onCompleted: {
        loginBox.userField.forceActiveFocus()
        introFade.start()
    }
}
