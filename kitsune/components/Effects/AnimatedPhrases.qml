import QtQuick 6.0

// AnimatedPhrases.qml
Item {
    id: animatedPhrases

    property var phrases: [
        "Bienvenido de nuevo",
        "La constancia vence lo que la dicha no alcanza",
        "Cada línea de código cuenta una historia",
        "Hoy es un buen día para crear algo nuevo"
    ]
    property int currentIndex: 0
    property int intervalMs: 6000

    width: parent ? parent.width : 300
    height: phraseText.implicitHeight

    Text {
        id: phraseText
        anchors.centerIn: parent
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: animatedPhrases.phrases[animatedPhrases.currentIndex]
        color: "#e0e0e0"
        font.family: "FiraCode"
        font.pixelSize: 14
        font.italic: true
        opacity: 1

        Behavior on opacity {
            NumberAnimation { duration: 500 }
        }
    }

    Timer {
        interval: animatedPhrases.intervalMs
        running: animatedPhrases.phrases.length > 1
        repeat: true
        onTriggered: {
            phraseText.opacity = 0
            fadeTimer.start()
        }
    }

    Timer {
        id: fadeTimer
        interval: 500
        repeat: false
        onTriggered: {
            animatedPhrases.currentIndex = (animatedPhrases.currentIndex + 1) % animatedPhrases.phrases.length
            phraseText.opacity = 1
        }
    }
}
