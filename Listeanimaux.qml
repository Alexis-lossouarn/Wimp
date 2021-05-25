import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

Rectangle {
	id: listeAnimaux
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
				Text { text: model.modelData.nom_animal; }
				Text { text: model.modelData.naissance_animal }
				Text { text: model.modelData.type_animal; }
				Text { text: model.modelData.distance; }
				Text { text: model.modelData.id_collier; }

			}
		}
		focus: true
		clip: true
		ScrollIndicator.vertical: ScrollIndicator { }
	}
}
