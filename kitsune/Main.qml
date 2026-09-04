import QtQuick 6.0
import QtQuick.Window 6.0
import QtQuick.Effects 6.5
import "components/avatar"
import "components/Login"
import "components/Effects"

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#000000"
    focus: true

    readonly property real panelRatio: 0.30
       // ---- Wallpaper a pantalla completa (100%) ----
    Image {
        id: wallpaper
        anchors.fill: parent
        source: "wallpaper/current_wallpaper"
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        sourceSize.width: 1920
        sourceSize.height: 1080
        onStatusChanged: if (status === Image.Ready) panelBackdrop.scheduleUpdate()

        Rectangle {
            anchors.fill: parent
            color: "#111111"
            visible: wallpaper.status !== Image.Ready
        }
    }

    // ---- Panel de login: 30% derecho, con blur sobre el wallpaper ----
    Item {
        id: panel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width * root.panelRatio

        // Textura en vivo del wallpaper recortada a la zona del panel
        ShaderEffectSource {
            id: panelBackdrop
            sourceItem: wallpaper
            live: false
            hideSource: false
            sourceRect: Qt.rect(panel.x, panel.y, panel.width, panel.height)
            visible: false
        }

        // Wallpaper recortado + difuminado (blur) detrás del panel
        MultiEffect {
            anchors.fill: parent
            source: panelBackdrop
            blurEnabled: true
            blur: 1.0
            blurMax: 24
            autoPaddingEnabled: false
        }

        // Velo semitransparente para dar contraste al texto sobre el blur
        Rectangle {
            anchors.fill: parent
            color: "#00000070"
        }

        Column {
            anchors.centerIn: parent
            spacing: 24

            Avatar {
                id: avatar
                anchors.horizontalCenter: parent.horizontalCenter
                username: (typeof userModel !== "undefined" && userModel.lastUser) ? userModel.lastUser : ""
            }

            LoginPanel {
                id: loginPanel
                anchors.horizontalCenter: parent.horizontalCenter
                username: avatar.username
                onLoginRequested: function (password) {
                    if (typeof sddm !== "undefined") {
                        sddm.login(avatar.username, password,
                                   (typeof sessionModel !== "undefined" ? sessionModel.lastIndex : 0))
                    }
                }
            }
        }

        // ---- "Frases animadas" en la parte inferior del panel ----
        AnimatedPhrases {
            id: phrases
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
        }
    }

    // Limpia la contraseña si el login falla
    Connections {
        target: typeof sddm !== "undefined" ? sddm : null
        function onLoginFailed() {
            loginPanel.password = ""
        }
    }
}
