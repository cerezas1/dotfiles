import QtQuick 2.15
import QtQuick.Controls 2.15

Row {
    id: root
    spacing: 20

    Button {
        text: "⏻"
        font.pixelSize: 20
        flat: true
        hoverEnabled: true
        onClicked: if (typeof sddm !== "undefined") sddm.powerOff()

        ToolTip.text: qsTr("Apagar")
        ToolTip.visible: hovered
    }

    Button {
        text: "⟳"
        font.pixelSize: 20
        flat: true
        hoverEnabled: true
        onClicked: if (typeof sddm !== "undefined") sddm.reboot()

        ToolTip.text: qsTr("Reiniciar")
        ToolTip.visible: hovered
    }

    Button {
        text: "⏾"
        font.pixelSize: 20
        flat: true
        hoverEnabled: true
        visible: typeof sddm !== "undefined" && sddm.canSuspend
        onClicked: if (typeof sddm !== "undefined") sddm.suspend()

        ToolTip.text: qsTr("Suspender")
        ToolTip.visible: hovered
    }
}
