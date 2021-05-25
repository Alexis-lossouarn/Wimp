import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id:page
	Rectangle {
		id: rectangleBas
		color: "#c5002256"
		height: window.height - rectangleHaut.height
		width: window.width

		//Rectangle Blanc
		Rectangle {
			id: bienvenue
			color: "#ffffffff"
			radius: 11
			anchors.fill: parent
			anchors.rightMargin: parent.width * 0.1
			anchors.leftMargin: parent.width * 0.1
			anchors.bottomMargin: parent.width * 0.15
			anchors.topMargin: parent.width * 0.15

			Text {
				id: textAccueil
				color: "#707070"
				text: "Liste des colliers"
				anchors.top: parent.top
				anchors.topMargin: parent.width * 0.07
				anchors.horizontalCenter: parent.horizontalCenter
				font.family: "Poor Richard"
				font.pointSize: rectangleHaut.height * 0.3
			}

			Rectangle {
				id: trait
				width: textAccueil.width
				height: 1
				anchors.horizontalCenter: bienvenue.horizontalCenter
				border.color: "grey"
				color: "grey"
				anchors.top: textAccueil.bottom
			}

			Rectangle {
				id: rectanglecollier
				width: bienvenue.width * 0.9
				anchors.top: trait.bottom
				anchors.topMargin: trait.height * 16
				anchors.bottom: boutonsbas.top
				anchors.bottomMargin: trait.height * 8
				border.color: "grey"
				border.width: 2
				anchors.horizontalCenter: bienvenue.horizontalCenter
			}

			Row {
				id:boutonsbas
				height: valider.height
				width: bienvenue.width
				anchors.bottom: bienvenue.bottom
				anchors.bottomMargin: textAccueil.height * 0.3

				Button {
				   id: valider
				   width: textAccueil.width * 0.4
				   text: "Valider"
				   anchors.verticalCenter: parent.verticalCenter
				   anchors.leftMargin: bienvenue.width * 0.0875
				   height: 0.7 * textAccueil.height
				   anchors.left: boutonsbas.left

				   contentItem: Text {
					   text: valider.text
					   opacity: enabled ? 1.0 : 0.3
					   color: "#ffffffff"
					   horizontalAlignment: Text.AlignHCenter
					   verticalAlignment: Text.AlignVCenter
					   elide: Text.ElideRight
					   font.pixelSize: changeavatar.width * 0.18
				   }

				   background: Rectangle {
					   implicitWidth: 100
					   implicitHeight: 40
					   opacity: enabled ? 1 : 0.3
					   color: "#b3a36d00"
					   radius: 11
				   }

				   onClicked: {
					   //Ouvre la page Gestion
					   stackView.push("Gestion.qml")
				   }
				}

				   Button {
					  id: annuler
					  width: valider.width
					  text: "Annuler"
					  height: valider.height
					  anchors.right: boutonsbas.right
					  anchors.verticalCenter: parent.verticalCenter
					  anchors.rightMargin: bienvenue.width * 0.0875

					  contentItem: Text {
						  text: annuler.text
						  opacity: enabled ? 1.0 : 0.3
						  color: "#ffffffff"
						  horizontalAlignment: Text.AlignHCenter
						  verticalAlignment: Text.AlignVCenter
						  elide: Text.ElideRight
						  font.pixelSize: changeavatar.width * 0.18
					  }

					  background: Rectangle {
						  implicitWidth: 100
						  implicitHeight: 40
						  opacity: enabled ? 1 : 0.3
						  color: "#6C5947"
						  radius: 11
					  }

					  onClicked: {
						  //Ouvre la page Gestion
						  stackView.push("Gestion.qml")
					  }
				}
			}
		}
	}
}
