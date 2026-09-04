import QtQuick 6.0

// Avatar.qml
// Círculo de avatar. Carga siempre icon.jpg desde la misma carpeta en la
// que vive este archivo (components/avatar/icon.jpg). Si no existe o no
// carga, se muestra el texto "Avatar" como respaldo.
Item {
    id: avatarRoot

    property string username: ""
    property int diameter: 140

    width: diameter
    height: diameter + usernameLabel.implicitHeight + 12

    Rectangle {
        id: avatarCircle
        width: avatarRoot.diameter
        height: avatarRoot.diameter
        radius: width / 2
        color: "#2b2b2b"
        border.color: "#ffffff"
        border.width: 2
        clip: true
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: avatarImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            // Ruta fija: icon.jpg junto a Avatar.qml. QML resuelve las
            // rutas relativas contra la ubicación de este archivo, así
            // que no hace falta anteponer ninguna carpeta.
            source: "icon.jpg"
        }

        Text {
            anchors.centerIn: parent
            text: "Avatar"
            color: "#ffffff"
            font.family: "FiraCode"
            font.pixelSize: 16
            visible: avatarImage.status !== Image.Ready
        }
    }

    Text {
        id: usernameLabel
        anchors.top: avatarCircle.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: parent.horizontalCenter
        text: avatarRoot.username
        color: "#ffffff"
        font.family: "FiraCode"
        font.pixelSize: 18
    }
}
