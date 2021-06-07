import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

Rectangle {
	id: listeAnimaux
	width: parent.width
	anchors.fill: parent
	color: "#cfcfcf"
	ListView {
		anchors.fill: parent
		spacing: 10
		anchors.margins: 5
		model: Database.animaux
		delegate:
			ItemDelegate {
			width: parent.width
			height: colonne.implicitHeight
			Column {
				id: colonne
				padding: 5
				Text { text: '<b>Température : ' + model.modelData.id_animal + ' °C</b>'; font.italic: true }
			}
		}
		focus: true
		clip: true
		ScrollIndicator.vertical: ScrollIndicator { }
	}
}
