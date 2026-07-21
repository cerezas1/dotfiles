import QtQuick 2.15

// Aviso de Bloq Mayus. SDDM expone el objeto global "keyboard" con la
// propiedad booleana capsLock (disponible desde SDDM 0.19+). Si no existe
// (por ejemplo al previsualizar el QML fuera de SDDM), el aviso simplemente
// no se muestra en vez de dar error.
Row {
    id: root
    spacing: 6
    visible: typeof keyboard !== "undefined" && keyboard.capsLock

    readonly property color warnColor: typeof config !== "undefined" ? config.errorColor : "#ff6b6b"

    Text {
        text: "\u21EA"
        color: root.warnColor
        font.pixelSize: 15
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        text: qsTr("Bloq Mayús activado")
        color: root.warnColor
        font.pixelSize: 13
        anchors.verticalCenter: parent.verticalCenter
    }
}
