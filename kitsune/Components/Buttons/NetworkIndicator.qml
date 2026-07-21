import QtQuick 2.15

Item {
    id: root
    width: 28
    height: 28

    // Nota: SDDM no expone el estado de red de forma nativa en QML.
    // Este componente es un indicador estatico como punto de partida.
    // Para un estado real se necesitaria un script/daemon externo que
    // escriba a un archivo y un FileSystemWatcher (via C++) que lo lea,
    // o sondear con un Process externo, lo cual SDDM no permite por
    // defecto en QML puro.

    Image {
        anchors.fill: parent
        source: "../../Assets/icons/network.svg"
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }
}
