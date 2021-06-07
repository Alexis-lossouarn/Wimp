import QtQuick 2.15
import QtQuick.Controls 2.15


ApplicationWindow {
    id: window
    width: 287
    height: 614
    visible: true
	title: "Wimp"

    //rectangle du haut avec les logos qui sera le même pour toutes les pages
    header: Rectangle {
        id: rectangleHaut
        width: window.width
        height: window.height * 0.1

        Row {
            id: entete
            height: rectangleHaut.height
            width: rectangleHaut.width

            Text {
                id: wimpLogo
				text: "WIMP"
                anchors.verticalCenter: parent.verticalCenter
                font.family: "Poor Richard"
                font.pointSize: rectangleHaut.height * 0.4
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: logoChien
                x: entete.width - (entete.width * 0.28)
                y: 0 - (entete.height * 0.45)
                width: entete.width * 0.4
                height: entete.height * 1.7
				source: "images/dogo.png"
                clip: true
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: logoLoupe
                width: entete.width * 0.2
                height: entete.height
                anchors.left: parent.left
				source: "images/WIMP-logo.png"
                clip: true
                fillMode: Image.PreserveAspectFit
            }
        }
    }


    StackView {
        id: stackView
        //Force à démarrer sur la page Accueil
        initialItem: "Accueil.qml"
        anchors.fill: parent
    }
}
