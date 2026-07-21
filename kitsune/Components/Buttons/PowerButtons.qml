import QtQuick 2.15
import QtQuick.Controls 2.15

Row {
    id: root
    spacing: 20

    Button {
        id: powerBtn
        text: "⏻"
        font.pixelSize: 20
        flat: true
        hoverEnabled: true
        scale: hovered ? 1.15 : 1.0
        opacity: hovered ? 1.0 : 0.75
        onClicked: if (typeof sddm !== "undefined") sddm.powerOff()

        Behavior on scale {
            NumberAnimation { duration: 120; easing.type: Easing.OutBack }
        }
        Behavior on opacity {
            NumberAnimation { duration: 120 }
        }

        ToolTip.text: qsTr("Apagar")
        ToolTip.visible: hovered
    }

    Button {
        id: rebootBtn
        text: "⟳"
        font.pixelSize: 20
        flat: true
        hoverEnabled: true
        scale: hovered ? 1.15 : 1.0
        opacity: hovered ? 1.0 : 0.75
        onClicked: if (typeof sddm !== "undefined") sddm.reboot()

        Behavior on scale {
            NumberAnimation { duration: 120; easing.type: Easing.OutBack }
        }
        Behavior on opacity {
            NumberAnimation { duration: 120 }
        }

        ToolTip.text: qsTr("Reiniciar")
        ToolTip.visible: hovered
    }

    Button {
        id: suspendBtn
        text: "⏾"
        font.pixelSize: 20
        flat: true
        hoverEnabled: true
        scale: hovered ? 1.15 : 1.0
        opacity: hovered ? 1.0 : 0.75
        visible: typeof sddm !== "undefined" && sddm.canSuspend
        onClicked: if (typeof sddm !== "undefined") sddm.suspend()

        Behavior on scale {
            NumberAnimation { duration: 120; easing.type: Easing.OutBack }
        }
        Behavior on opacity {
            NumberAnimation { duration: 120 }
        }

        ToolTip.text: qsTr("Suspender")
        ToolTip.visible: hovered
    }
}
