import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:modifprofil

	Timer {
		id: timervide
		repeat: false
		interval: 0

		onTriggered: {
			videText.text = "Champ(s) vide(s) !"
			videRectangle.visible = true
		}
	}

	Timer {
		id: timervide2
		repeat: false
		interval: 2000

		onTriggered: {
			videText.text = ""
			videRectangle.visible = false
		}
	}

        Rectangle {
            id: rectangleBas
            color: "#c5002256"
            height: parent.height
            width: parent.width

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

				Rectangle {
					id:videRectangle
					border.color: "red"
					border.width: 1
					visible: false
					width: videText.implicitWidth * 1.3
					height: nom.height
					radius: 8
					anchors.bottom: profil.top
					anchors.bottomMargin: 10
					anchors.horizontalCenter: parent.horizontalCenter

					Text {
						id: videText
						text: ""
						color: "red"
						width: parent.width
						height: parent.height
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
					}
				}

                Text {
                    id: profil
                    color: "#707070"
                    font.pointSize: rectangleHaut.height * 0.3
					text: "Profil"
                    anchors.top: bienvenue.top
                    anchors.topMargin: bienvenue.height * 0.1
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Grid {
                    id: grid
                    columns: 2
					spacing: 3
                    anchors.left: bienvenue.left
                    anchors.leftMargin: 0.1 * bienvenue.width
                    anchors.top: profil.bottom
                    anchors.topMargin: profil.height
                    width: bienvenue.width * 0.9

                    Text {
                        id:nom
                        color: "#707070"
                        height: 0.8 * profil.height
						text: "Nom"
                        width: prenom.width
                    }

                    Rectangle {
						id: rectangle1
                        height: profil.height
                        width: grid.width * 0.95 - prenom.width
                        border.width: 1
                        radius: 11
                        border.color: "#707070"

                        TextInput {
                            id:nom1
							text: Database.name
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#707070"
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Text {
                        id:prenom
                        color: "#707070"
                        height: 0.8 * profil.height
						text: "Prénom"
                    }

                    Rectangle {
                        id: rectangle2
                        height: profil.height
						width: grid.width * 0.95 - prenom.width
                        border.width: 1
                        radius: 11
                        border.color: "#707070"

                        TextInput {
                            id:prenom1
							text: Database.lastname
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#707070"
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Text {
                        id:mail
                        color: "#707070"
                        height: 0.8 * profil.height
                        width: prenom.width
						text: "Mail"
                    }



					Text {
						id:mail1
						height: profil.height
						width: grid.width * 0.95 - prenom.width
						color: "#707070"
						text: Database.mail
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
					}

				}

				Rectangle {
					id:rectangle
					width: bienvenue.width * 0.8
					anchors.top: grid.bottom
					anchors.topMargin: 0.5 * nom.height
					anchors.bottom: boutonsbas.top
					anchors.bottomMargin: valider.height
					anchors.horizontalCenter: bienvenue.horizontalCenter
					border.color: "grey"
					border.width: 5

					Text {
						id: listColliers
						text: "Liste des colliers"
						anchors.top: parent.top
						anchors.topMargin: 5
						color: "#707070"
						anchors.horizontalCenter: parent.horizontalCenter
					}

					//Trait pour le design
					Rectangle {
						id: trait
						height: 1
						border.color: "#707070"
						border.width: 1
						width: listColliers.width * 0.9
						anchors.horizontalCenter: parent.horizontalCenter
						anchors.top: listColliers.bottom
						color: "#707070"
					}

					Button {
						id: ajouter
						anchors.left: rectangle.left
						anchors.right: rectangle.right
						anchors.rightMargin: 5
						anchors.bottom: rectangle.bottom
						anchors.bottomMargin: 5
						anchors.leftMargin: 5
						text: "Ajouter"
						height: listColliers.height

						background: Rectangle {
							color: "#2CC71A"
						}

						contentItem: Text {
							text: ajouter.text
							color: "#ffffffff"
							horizontalAlignment: Text.AlignHCenter
							verticalAlignment: Text.AlignVCenter
						}

						onClicked: {
							//ouvrir la page Ajoutanimal
							stackView.push("Colliers.qml")
						}

					}
				}

				Row {
					id:boutonsbas
					width: bienvenue.width
					anchors.bottom: bienvenue.bottom
					anchors.bottomMargin: profil.height * 0.5

					Button {
					   id: valider
					   text: "Valider"
					   anchors.verticalCenter: parent.verticalCenter
					   anchors.leftMargin: bienvenue.width * 0.0875
					   anchors.left: boutonsbas.left
					   width: nom.width * 2
					   height: nom.height

					   contentItem: Text {
						   text: valider.text
						   opacity: enabled ? 1.0 : 0.3
						   color: "#ffffffff"
						   horizontalAlignment: Text.AlignHCenter
						   verticalAlignment: Text.AlignVCenter
						   elide: Text.ElideRight
					   }

					   background: Rectangle {
						   implicitWidth: 100
						   implicitHeight: 40
						   opacity: enabled ? 1 : 0.3
						   color: "#b3a36d00"
						   radius: 11
					   }

					   onClicked: {

						   if(nom1.text != "" || prenom1.text != "")
						   {
							   while(Database.name !== nom1.text || Database.lastname !== prenom1.text)
							   {
								   Database.executerRequete("UPDATE clients SET nom = '" + nom1.text + "' WHERE email = '" + Database.mail + "'")
								   Database.executerRequete("UPDATE clients SET prenom = '" + prenom1.text + "' WHERE email = '" + Database.mail + "'")
							   }
							   //Ouvre la page Gestion
							   stackView.push("Gestion.qml")
						   }
						   else
						   {
								timervide.start();
							   timervide2.start();
						   }
					   }
					}

					   Button {
						  id: annuler
						  text: "Annuler"
						  height: valider.height
						  width: valider.width
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
