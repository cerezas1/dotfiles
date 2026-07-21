import QtQuick 2.15

Item {
    id: root
    property string source: ""
    width: 96
    height: 96

    readonly property string defaultAvatar: "../../Assets/imagen/icon.jpg"

    Rectangle {
        id: frame
        anchors.fill: parent
        radius: width / 2
        color: typeof config !== "undefined" ? config.boxColor : "#2a2a3e"
        border.color: typeof config !== "undefined" ? config.textColor : "#ffffff"
        border.width: 2
        clip: true

        Image {
            id: image
            anchors.fill: parent
            anchors.margins: 3
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            source: root.source && root.source.length > 0 ? root.source : root.defaultAvatar
        }
    }
}
