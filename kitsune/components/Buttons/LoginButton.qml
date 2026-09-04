import QtQuick 6.0

// LoginButton.qml
Rectangle {
    id: button

    property string text: "Iniciar sesión"
    signal clicked()

    width: 260
    height: 44
    radius: 6
    color: mouseArea.containsMouse ? "#3a3a3a" : "#262626"
    border.color: "#555555"
    border.width: 1

    Behavior on color {
        ColorAnimation { duration: 150 }
    }

    Text {
        anchors.centerIn: parent
        text: button.text
        color: "#ffffff"
        font.family: "FiraCode"
        font.pixelSize: 15
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: button.clicked()
    }
}
