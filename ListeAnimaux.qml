import QtQuick 2.9
import QtQuick.Window 2.10
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Rectangle {
    id: infoAnimaux
    anchors.fill: parent
    color: "#cfcfcf"

    ListView {

        anchors.fill: parent
        spacing: 10
        anchors.margins: 5
        model: Database.listedatesanimaux
        delegate: ItemDelegate {

            width: parent.width
            height: parent.height
            Column {
                id: colonne
                padding: 5
                Text { text: '<b> Animal : </b>'; font.italic: true}
                Text { text: '<b> Animaux : </b>'; font.italic: true}
            }
        }
        focus: true
        clip: true
        ScrollIndicator.vertical: ScrollIndicator {}
    }
}
