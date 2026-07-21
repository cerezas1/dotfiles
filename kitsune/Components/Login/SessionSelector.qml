import QtQuick 2.15
import QtQuick.Controls 2.15

// Selector de sesion de escritorio (KDE Plasma, GNOME, etc.)
// Se llena automaticamente con sessionModel, que expone SDDM.
// Si solo hay una sesion instalada, se oculta (no tiene sentido mostrarlo).
ComboBox {
    id: control

    readonly property color accentColor: typeof config !== "undefined" ? config.accent : "#4e54c8"
    readonly property color textColor: typeof config !== "undefined" ? config.textColor : "#ffffff"
    readonly property color inputBgColor: typeof config !== "undefined" ? config.inputBgColor : "#33ffffff"

    model: typeof sessionModel !== "undefined" ? sessionModel : null
    textRole: "name"
    currentIndex: typeof sessionModel !== "undefined" ? sessionModel.lastIndex : -1
    visible: typeof sessionModel !== "undefined" && sessionModel.count > 1

    font.pixelSize: 13

    background: Rectangle {
        radius: 8
        color: control.inputBgColor
        border.width: 1
        border.color: control.activeFocus || control.popup.visible ? control.accentColor : "transparent"
    }

    contentItem: Text {
        text: control.displayText
        color: control.textColor
        leftPadding: 14
        rightPadding: 30
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
