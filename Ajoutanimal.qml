import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:ajoutanimal
    visible: true

    Rectangle {
        id: rectangleBas
        color: "#c5002256"
        height: parent.height
        width: parent.width

        //Retcangle Blanc
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
                id: profil
                color: "#707070"
                font.pointSize: rectangleHaut.height * 0.3
				text: "Ajouter un animal"
                anchors.top: bienvenue.top
                anchors.topMargin: bienvenue.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id:nomanimal
                anchors.left: bienvenue.left
                horizontalAlignment: Text.AlignHCenter
                anchors.top: profil.bottom
                anchors.topMargin: profil.height
                color: "#707070"
                font.pointSize: rectangleHaut.height * 0.22
                height: 0.8 * profil.height
				text: "Nom de L'animal"
                width: bienvenue.width
            }

            Rectangle {
                id: nomanimalRectangle
                width: bienvenue.width * 0.9
                height: nomanimal.height
                radius: 10
                border.color: "#707070"
                border.width: 1
                anchors.top: nomanimal.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 2

                //Ecrire le nom de l'animal
                TextInput {
                    id: nomanimalInput
                    width: bienvenue.width * 0.9
                    height: nomanimal.height
                    anchors.horizontalCenter: nomanimalRectangle.horizontalCenter
                    anchors.verticalCenter: nomanimalRectangle.verticalCenter
                    font.pixelSize: rectangleHaut.height * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: nomanimalRectangle.top
                    anchors.topMargin: 2
                }
            }

            Text {
                id:anneeanimal
                anchors.left: bienvenue.left
                horizontalAlignment: Text.AlignHCenter
                anchors.top: nomanimalRectangle.bottom
                anchors.topMargin: profil.height * 0.25
                color: "#707070"
                font.pointSize: rectangleHaut.height * 0.22
                height: 0.8 * profil.height
				text: "Année de naissance"
                width: bienvenue.width
            }

            Rectangle {
                id: anneeanimalRectangle
                width: bienvenue.width * 0.9
                height: nomanimal.height
                radius: 10
                border.color: "#707070"
                border.width: 1
                anchors.top: anneeanimal.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 2

                //Date renvoyer par le calendrier
                Text {
                    id: anneeanimalInput
                    width: anneeanimalRectangle * 0.9
					text: (monthPicker3.month == 0) ? "" : "Né le : "+dayPicker3.day+"/"+monthPicker3.month+"/"+yearPicker3.year
                    height: anneeanimal.height
                    anchors.horizontalCenter: anneeanimalRectangle.horizontalCenter
                    anchors.verticalCenter: anneeanimalRectangle.verticalCenter
                    font.pixelSize: rectangleHaut.height * 0.25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.top: anneeanimalRectangle.top
                    anchors.topMargin: 2
                }

                ToolButton {
                    id: anneebutton
                    anchors.right: anneeanimalRectangle.right
                    anchors.rightMargin: 5
                    width: 0.1 * anneeanimalRectangle.width
                    height: 0.8 * anneeanimalRectangle.height
                    anchors.verticalCenter: anneeanimalRectangle.verticalCenter

                    background: Image {
                        id :flecheor
                        source: "flecheor.png"
                    }

                    onClicked: {
                        menuCalendrier3.open()
                    }

                }
            }

            Text {
                id:typeanimal
                anchors.left: bienvenue.left
                horizontalAlignment: Text.AlignHCenter
                anchors.top: anneeanimalRectangle.bottom
                anchors.topMargin: profil.height * 0.25
                color: "#707070"
                font.pointSize: rectangleHaut.height * 0.22
                height: 0.8 * profil.height
				text: "Type de l'animal"
                width: bienvenue.width
            }

			ComboBox {
				id: typeanimalRectangle
				model: Database.listeTypes
				width: bienvenue.width * 0.9
				height: nomanimal.height
				anchors.top: typeanimal.bottom
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.topMargin: 2

				background:  Rectangle {
					radius: 10
					border.color: "#707070"
					border.width: 1
				}

                indicator: Image {
                    id: flechegris
                    source: "fleche.png"
                    width: flecheor.width *.9
                    height: flecheor.height
                    anchors.right: typeanimalRectangle.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: typeanimalRectangle.verticalCenter
                }
			}

            Text {
                id:distancetxt
                horizontalAlignment: Text.AlignHCenter
                anchors.top: typeanimalRectangle.bottom
                anchors.topMargin: profil.height * 0.5
                color: "#707070"
                font.pointSize: rectangleHaut.height * 0.22
                height: 0.8 * profil.height
				text: "Distance Maximale"
                anchors.right: bienvenue.right
                anchors.rightMargin: 0.25 * bienvenue.width
                anchors.left: bienvenue.left
                anchors.leftMargin: 0.25 * bienvenue.width
            }

            //changer la distance
            Slider {
                id: sliderdistance
                anchors.top: distancetxt.bottom
                anchors.topMargin: 5
                clip: false
                anchors.horizontalCenter: parent.horizontalCenter
                value: 150
                to: 500
                width: typeanimalRectangle.width
                height: typeanimalRectangle.height
                stepSize: 25

                background: Rectangle {
                    id:backgroundslider
                    y: (sliderdistance.height - height) / 2
                    width: sliderdistance.width
                    height: sliderdistance.height
                    radius: 7
					border.color: "transparent"
                    color: "transparent"
                    anchors.left: sliderdistance.left
                    anchors.leftMargin: (sliderdistance.value < 275) ? backgroundslider.width / 28 : - backgroundslider.width / 56

                    Rectangle {
                        id: vertslider
                        width: sliderdistance.visualPosition * parent.width
                        height: parent.height
                        color: "#2CC71A"
                        radius: 11
                    }
                }

                contentItem: Text {
					text: sliderdistance.value + "m"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    width: (vertslider.width < (0.25 * sliderdistance.width)) ? sliderdistance.width : vertslider.width
                }

            }

            Row {
                id:boutonsbas
                width: bienvenue.width
                anchors.bottom: bienvenue.bottom
				height: vertslider.height * 2

                Button {
                   id: ajouter
				   width: annuler.width
				   text: "Ajouter"
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.leftMargin: bienvenue.width * 0.0875
				   height: annuler.height
                   anchors.left: boutonsbas.left
                   anchors.bottom: boutonsbas.bottom
                   anchors.bottomMargin: 10

                   contentItem: Text {
                       text: ajouter.text
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
					   if (nomanimalInput.text == "" || anneeanimalInput.text == "" || typeanimal.text == "" || collierInput.text == "") console.log("Champ(s) vide(s)")

					   else {
						   console.log(typeanimalRectangle.currentText)
						   console.log(sliderdistance.value)
                           Database.creerAnimal(nomanimalInput.text, (yearPicker3.year+"-"+monthPicker3.month+"-"+dayPicker3.day), typeanimalRectangle.currentText, sliderdistance.value)
						   stackView.push("Gestion.qml")
					   }
                   }
                }

                   Button {
                      id: annuler
					  width: parent.width * 0.4
					  text: "Annuler"
					  height: parent.height * 0.4
                      anchors.right: boutonsbas.right
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.rightMargin: bienvenue.width * 0.0875
                      anchors.bottom: boutonsbas.bottom
                      anchors.bottomMargin: 10

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
                          stackView.push("Gestion.qml")
                      }
                }
            }
        }
    }

    Menu {
        id: menuCalendrier3
        width : anneeanimalRectangle.width
        height : anneeanimalRectangle.height * 10
        y: (anneeanimalRectangle.height + anneeanimal.height + nomanimalRectangle.height + nomanimal.height + profil.height) * 2 + anneeanimalRectangle.height
        x: 2 * flecheor.width - 2

        Text {
            id: textdate3
			text: "Né le :"
            height: 0.2 * menuCalendrier3.height
            width: menuCalendrier3.width
            anchors.top: menuCalendrier3.Top
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: rectangleHaut.height * 0.3
            color: "#707070"
        }

        Row {
            id: rowText3
            height: 0.1 * menuCalendrier3.height
            anchors.top: textdate3.bottom

            Text {
                id: textAnnee3
				text: "Année"
                width: yearPicker3.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textMois3
				text: "Mois"
                anchors.left: textAnnee3.right
                width: monthPicker3.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textJour3
				text: "Jour"
                anchors.left: textMois3.right
                width: dayPicker3.width
                horizontalAlignment: Text.AlignHCenter
            }
        }



        YearPicker {
            id: yearPicker3
            width: (1/3) * menuCalendrier3.width
            height: menuCalendrier3.height - rowText3.height - textdate3.height - okButton3.height
            anchors.top: rowText3.bottom
            endYear: 2021
            startYear: endYear - 30
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    yearPicker3.year = (new Date(currentJob.date)).getFullYear()
                }
                else {
                    yearPicker3.year = (new Date).getFullYear()
                }
            }
        }

        MonthPicker {
            id: monthPicker3
            width: (1/3) * menuCalendrier3.width
            height: menuCalendrier3.height - rowText3.height - textdate3.height - okButton3.height
            anchors.left: yearPicker3.right
            anchors.top: rowText3.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    monthPicker3.month = (new Date(currentJob.date)).getMonth()
                }
                else {
                    monthPicker3.month = (new Date).getMonth()
                }
            }
        }

        DayPicker {
            id: dayPicker3
            width: (1/3) * menuCalendrier3.width
            height: menuCalendrier3.height - rowText3.height - textdate3.height - okButton3.height
            anchors.left: monthPicker3.right
            anchors.top: rowText3.bottom
            daysInMonth: (new Date(yearPicker3.year, monthPicker3.month + 1, 0)).getDate()
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    dayPicker3.day = (new Date(currentJob.date)).getDate()
                }
                else {
                    dayPicker3.day = (new Date).getDate()
                }
            }
        }

        Button {
           id: okButton3
           width: dayPicker3.width
		   text: "OK"
           height: textJour3.height * 1.5
           anchors.left: monthPicker3.right
           anchors.top: dayPicker3.bottom

           contentItem: Text {
               text: okButton3.text
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
               color: "#b3a36d"
           }

           onClicked: {
               //Ouvre la page Gestion
               if (monthPicker3.month != 0){
               console.log("Année :" + yearPicker3.year)
               console.log("Mois :" + monthPicker3.month)
               console.log("Jour :" + dayPicker3.day)
               menuCalendrier3.close()
               }
               else {
                   console.log("Erreur")
               }
           }
     }

    }
}
