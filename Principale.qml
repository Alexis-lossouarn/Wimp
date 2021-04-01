import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.12
import QtPositioning 5.12
import QtLocation 5.12


Item {

    Rectangle {
        id: rectangleMilieu
        width: window.width
        height: window.height * 0.3
        color: "#c5002256"

        Column {
            id: optionMilieu
            height: rectangleMilieu.height
            width: rectangleMilieu.width

            Row {
                id: row1Milieu
                width: parent.width
                height: rectangleMilieu.height * 0.5

                Rectangle {
                    id: animalobserve
                    width: 0.7 * parent.width
                    height: row1Milieu.height * 0.5
                    radius: 15
                    border.color: "#707070"
                    border.width: 1
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: animalobserve.height * 0.2
                    anchors.horizontalCenter: parent.horizontalCenter

                    ToolButton {
                        id: choixAnimal
                        height: fleche.height
                        opacity: 0.5
                        width: fleche.width
                        anchors.right: animalobserve.right
                        anchors.rightMargin: 6
                        flat: false
                        highlighted: false
                        display: AbstractButton.TextBesideIcon
                        clip: false
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            //ouvre le menu de choix de l'animal
                            choixtypeanimal.open()
                        }

                        Image {
                            id: fleche
                            source: "fleche.png"
                        }
                    }

                    Text {
                        id: nomAnimal
                        text: qsTr("Animal observé")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: animalobserve.height * 0.5
                        font.family: "Segoe UI"
                        anchors.leftMargin: 5
                        width: (9/10) * animalobserve.width
                        color: "#707070"
                        anchors.left: animalobserve.left
                    }

                }
            }

            Row {
                id: row2Milieu
                height: rectangleMilieu.height * 0.3
                width: parent.width
                anchors.bottom: row3Milieu.top
                anchors.bottomMargin: 0

                Rectangle {
                    id:rectangleTypeanimal
                    width: parent.width * 0.4
                    height: row2Milieu.height * (2/3)
                    border.color: "#707070"
                    border.width: 1
                    color: "#b3a36d"
                    radius: 7.2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width / (25/1.5)

                    Text {
                        id: typedelanimal
                        text: qsTr("Type de l'animal")
                        width: rectangleTypeanimal.width
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: rectangleTypeanimal.height * 0.3
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Rectangle {
                    id: rectangleAgeanimal
                    width: parent.width * 0.4
                    height: row2Milieu.height * (2/3)
                    opacity: 1
                    color: "#b3a36d"
                    border.color: "#707070"
                    border.width: 1
                    radius: 7.2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: parent.width / (25/1.5)

                    Text {
                        id: ageanimal
                        text: qsTr("Age")
                        anchors.verticalCenter: parent.verticalCenter
                        width: rectangleAgeanimal.width
                        color: "#ffffff"
                        anchors.right: parent.right
                        font.pixelSize: rectangleTypeanimal.height * 0.3
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            Row {
                id: row3Milieu
                height: rectangleMilieu.height * 0.2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                width: parent.width

                Rectangle {
                    id: rectangleCalendrier
                    height: row3Milieu.height
                    radius: 2
                    width: (9/10) * parent.width
                    border.color: "#707070"
                    border.width: 1
                    anchors.left: parent.left

                    Text {
                        id: textecalendrier
                        text : (monthPicker.month == 0 || monthPicker2.month == 0 ) ? qsTr("Période à observer") : qsTr("du "+yearPicker.year+"/"+monthPicker.month+"/"+dayPicker.day+" à "+hourPicker.hour+"h"+minutePicker.minute+" jusqu'au "+yearPicker2.year+"/"+monthPicker2.month+"/"+dayPicker2.day+" à "+hourPicker2.hour+"h"+minutePicker2.minute)
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        width: rectangleCalendrier.width * 0.8
                        color: "#82000000"
                        font.pixelSize: (yearPicker.year == 0 || yearPicker2.year == 0 ) ? ageanimal.height * 0.8 : ageanimal.height * 0.7
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Segoe UI"
                    }

                    ToolButton {
                        id: ouvrircalendrier
                        height: flecheor.height
                        width: flecheor.width
                        opacity: 0.5
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: rectangleCalendrier.right
                        anchors.rightMargin: 6

                        onClicked: {
                            //ouvre le menu de choix de l'animal
                            menuCalendrier.open()
                        }

                        Image {
                            id: flecheor
                            source: "flecheor.png"
                        }
                    }
                }

                ToolButton {
                    id : option
                    height: ouvrircalendrier.height
                    width: ouvrircalendrier.height
                    visible: true
                    text: "\u2630"      //le texte représente l'icône des parametres
                    anchors.right: parent.right
                    anchors.verticalCenter: ouvrircalendrier.verticalCenter
                    anchors.rightMargin: 8
                    onClicked: {
                        //ouvre les paramètres
                        parametre.open()
                    }

                    contentItem: Text {
                        id: optionicone
                        text: option.text
                        color: "#ffffff"
                        width: option.width
                        height: option.height
                        font.pixelSize: option.width
                        anchors.horizontalCenter: parent.horizontalCenter

                    }

                    background: Rectangle {
                        color: "transparent"
                    }
                }
            }
        }
    }

    // Rectangle qui correspond à la carte Open Street
	Rectangle {
		id: rectangleBas
		anchors.top: rectangleMilieu.bottom
		width: window.width
		height: window.height * 0.6
		color: "black"
	}

    //les paramètres :
    Drawer {
        id: parametre
        width: parent.width * (2/3)
        height: parent.height - rectangleHaut.height
        y: rectangleHaut.height
        edge: Qt.RightEdge

        Rectangle {
            color: "#002256"
            width: parametre.width
            height: parametre.height

            Button {
                id:gestioncompte
                text: qsTr("Gestion du compte")
                width: 0.8 * parametre.width
                height: 0.06 * parent.height
                anchors.top: parent.top
                anchors.topMargin: 0.05 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                contentItem: Text {
                    id: txtgestioncompte
                    text: gestioncompte.text
                    opacity: enabled ? 1.0 : 0.3
                    color: "#000000"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: "#ffffff"
                    radius: 11
                }

                onClicked: {
                    //Ouvre la page Gestion
                    stackView.push("Gestion.qml")
                    //Ferme les paramètres dès l'actionnement du bouton
                    parametre.close()
                }
            }

            Button {
                id:deco
                text: qsTr("Deconnexion")
                width: 0.8 * parametre.width
                height: 0.06 * parent.height
                anchors.top: gestioncompte.top
                anchors.topMargin: 0.15 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                contentItem: Text {
                    id: txtdeco
                    text: deco.text
                    opacity: enabled ? 1.0 : 0.3
                    color: "#000000"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: "#ffffff"
                    radius: 11
                }

                onClicked: {
                    //Ouvre la page Accueil
                    stackView.push("Accueil.qml")
                    //Ferme les paramètres dès l'actionnement du bouton
                    parametre.close()
                }
            }

            Button {
                anchors.bottom: traitnoir.top
                anchors.right: parent.right

                background: Image {
                    id: fermerparametre
                    source: "croix.png"
                }

                onClicked: {					
                    //Ferme les paramètres dès l'actionnement du bouton
                    parametre.close()
                }
            }

            Rectangle {
                id: traitnoir
                color: "#000000"
                height: 1
                border.width: 1
                width: parametre.width
                anchors.top: deco.top
                anchors.topMargin: 0.15 * parent.height
            }

            Text {
                id: vmoytxt
                text: qsTr("Vitesse moyenne")
                color: "#ffffff"
                width: parametre.width
                horizontalAlignment: Text.AlignHCenter
                anchors.top: traitnoir.bottom
                anchors.topMargin: 0.07 * parent.height
                font.pixelSize: deco.height * 0.5
            }

            Rectangle {
                id: vmoy
                width: 0.8 * parent.width
                height: deco.height
                anchors.top: vmoytxt.bottom
                anchors.topMargin: (0.07 * parent.height) * 0.25
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 11
            }

            Text {
                id: vactutxt
                text: qsTr("Vitesse Actuelle")
                color: "#ffffff"
                width: parametre.width
                horizontalAlignment: Text.AlignHCenter
                anchors.top: vmoy.bottom
                anchors.topMargin: 0.07 * parent.height
                font.pixelSize: deco.height * 0.5
            }

            Rectangle {
                id: vactu
                width: 0.8 * parent.width
                height: deco.height
                anchors.top: vactutxt.bottom
                anchors.topMargin: (0.07 * parent.height) * 0.25
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 11
            }

            ToolButton {
                id: retrouver
                width: vactu.width
                height: vactu.height
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0.02 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                background: Rectangle {
                radius: 11
                color: "#EB5B5B"
                }

                contentItem: Text {
                    id: retrouvertxt
                    text: qsTr("Retrouver")
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: deco.height * 0.5
                }
            }
        }
    }

    //Liste du choix des animaux
    Menu {
		id: choixtypeanimal
        leftMargin: parent.width * 0.15
        y: rectangleTypeanimal.height * 1.98
        width: animalobserve.width

		ScrollView {
			height: typedelanimal.height * 9
			clip: true
			ScrollBar.horizontal: ScrollBar.AlwaysOff
			ScrollBar.vertical.policy: ScrollBar.AlwaysOn

			Rectangle {
				id:animal1
				width :choixtypeanimal.availableWidth
				height: row3Milieu.height
				border.color: "#707070"
				border.width: 1
				color: "#ffffff"

				Text {
					id: typeAnimal1
					text: qsTr("Type 1")
					anchors.verticalCenter: parent.verticalCenter
					width: rectangleTypeanimal.width
					anchors.right: parent.right
					font.pixelSize: typedelanimal.height
					font.family: "Segoe UI"
					horizontalAlignment: Text.AlignHCenter
					anchors.horizontalCenter: parent.horizontalCenter
					color: "#707070"
				}
			}

			Rectangle {
				id:animal2
				anchors.top: animal1.bottom
				width :choixtypeanimal.availableWidth
				height: row3Milieu.height
				border.color: "#707070"
				border.width: 1
				color: "#ffffff"

				Text {
					id: typeAnimal2
					text: qsTr("Type 2")
					anchors.verticalCenter: parent.verticalCenter
					width: rectangleTypeanimal.width
					anchors.right: parent.right
					font.pixelSize: typedelanimal.height
					font.family: "Segoe UI"
					horizontalAlignment: Text.AlignHCenter
					anchors.horizontalCenter: parent.horizontalCenter
					color: "#707070"
				}
			}

			Rectangle {
				id:animal3
				anchors.top: animal2.bottom
				width :choixtypeanimal.availableWidth
				height: row3Milieu.height
				border.color: "#707070"
				border.width: 1
				color: "#ffffff"

				Text {
					id: typeAnimal3
					text: qsTr("Type 3")
					anchors.verticalCenter: parent.verticalCenter
					width: rectangleTypeanimal.width
					anchors.right: parent.right
					font.pixelSize: typedelanimal.height
					font.family: "Segoe UI"
					horizontalAlignment: Text.AlignHCenter
					anchors.horizontalCenter: parent.horizontalCenter
					color: "#707070"
				}
			}

			Rectangle {
				id:animal4
				anchors.top: animal3.bottom
				width :choixtypeanimal.availableWidth
				height: row3Milieu.height
				border.color: "#707070"
				border.width: 1
				color: "#ffffff"

				Text {
					id: typeAnimal4
					text: qsTr("Type 4")
					anchors.verticalCenter: parent.verticalCenter
					width: rectangleTypeanimal.width
					anchors.right: parent.right
					font.pixelSize: typedelanimal.height
					font.family: "Segoe UI"
					horizontalAlignment: Text.AlignHCenter
					anchors.horizontalCenter: parent.horizontalCenter
					color: "#707070"
				}
			}
		}
	}

    //Calendrier pour sélectionner les dates
    Menu {
        id: menuCalendrier
        width : rectangleCalendrier.width
        height : rectangleCalendrier.height * 5
        y:rectangleMilieu.height

        Text {
            id: textdate1
            text: qsTr("A partir du :")
            height: 0.2 * menuCalendrier.height
            width: menuCalendrier.width
            anchors.top: menuCalendrier.Top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: animalobserve.height * 0.5
            color: "#707070"
        }

        Row {
            id: rowText
            height: 0.2 * menuCalendrier.height
            anchors.top: textdate1.bottom

            Text {
                id: textAnnee1
                text: qsTr("Année")
                width: yearPicker.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textMois1
                text: qsTr("Mois")
                anchors.left: textAnnee1.right
                width: monthPicker.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textJour1
                text: qsTr("Jour")
                anchors.left: textMois1.right
                width: dayPicker.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textHeure1
                text: qsTr("Heure")
                anchors.left: textJour1.right
                width: hourPicker.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textMinute1
                text: qsTr("Minutes")
                anchors.left: textHeure1.right
                width: minutePicker.width
                horizontalAlignment: Text.AlignHCenter
            }
        }



        YearPicker {
            id: yearPicker
            width: parent.width * .2
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.top: rowText.bottom
            endYear: 2021
            startYear: endYear - 20
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    yearPicker.year = (new Date(currentJob.date)).getFullYear()
                }
                else {
                    yearPicker.year = (new Date).getFullYear()
                }
            }
        }

        MonthPicker {
            id: monthPicker
            width: parent.width * .2
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: yearPicker.right
            anchors.top: rowText.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    monthPicker.month = (new Date(currentJob.date)).getMonth()
                }
                else {
                    monthPicker.month = (new Date).getMonth()
                }
            }
        }

        DayPicker {
            id: dayPicker
            width: parent.width * .1833
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: monthPicker.right
            anchors.top: rowText.bottom
            daysInMonth: (new Date(yearPicker.year, monthPicker.month + 1, 0)).getDate()
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    dayPicker.day = (new Date(currentJob.date)).getDate()
                }
                else {
                    dayPicker.day = (new Date).getDate()
                }
            }
        }

        HourPicker {
            id: hourPicker
            width: parent.width * 0.1833
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: dayPicker.right
            anchors.top: rowText.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    hourPicker.hour = (new Date(currentJob.date)).getHours()
                }
                else {
                    hourPicker.hour = (new Date).getHours()
                }
            }
        }

        MinutePicker {
            id: minutePicker
            width: parent.width * 0.2333
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: hourPicker.right
            anchors.top: rowText.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    minutePicker.minute = (new Date(currentJob.date)).getMinutes()
                }
                else {
                    minutePicker.minute = (new Date).getMinutes()
                }
            }
        }

        Button {
           id: okButton
           width: minutePicker.width
           text: qsTr("OK")
           height: textMinute1.height * 1.5
           anchors.left: hourPicker.right
           anchors.top: minutePicker.bottom

           contentItem: Text {
               text: okButton.text
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
               if (monthPicker.month != 0){
               menuCalendrier2.open()
               console.log("Année :" + yearPicker.year)
               console.log("Mois :" + monthPicker.month)
               console.log("Jour :" + dayPicker.day)
               console.log("Heure :" + hourPicker.hour)
               console.log("Minutes :" + minutePicker.minute)
               menuCalendrier.close()
               }
               else console.log("Erreur")
           }
     }

    }

    Menu {
        id: menuCalendrier2
        width : rectangleCalendrier.width
        height : rectangleCalendrier.height * 5
        y:rectangleMilieu.height

        Text {
            id: textdate2
            text: qsTr("Jusqu'au :")
            height: 0.2 * menuCalendrier.height
            width: menuCalendrier2.width
            anchors.top: menuCalendrier2.Top
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: animalobserve.height * 0.5
            color: "#707070"
        }

        Row {
            id: rowText2
            height: 0.2 * menuCalendrier2.height
            anchors.top: menuCalendrier2.Top

            Text {
                id: textAnnee2
                text: qsTr("Année")
                width: yearPicker2.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textMois2
                text: qsTr("Mois")
                anchors.left: textAnnee2.right
                width: monthPicker2.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textJour2
                text: qsTr("Jour")
                anchors.left: textMois2.right
                width: dayPicker2.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textHeure2
                text: qsTr("Heure")
                anchors.left: textJour2.right
                width: hourPicker2.width
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: textMinute2
                text: qsTr("Minutes")
                anchors.left: textHeure2.right
                width: minutePicker2.width
                horizontalAlignment: Text.AlignHCenter
            }
        }



        YearPicker {
            id: yearPicker2
            width: parent.width * .2
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.top: rowText2.bottom
            endYear: 2021
            startYear: endYear - 20
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    yearPicker2.year = (new Date(currentJob.date)).getFullYear()
                }
                else {
                    yearPicker2.year = (new Date).getFullYear()
                }
            }
        }

        MonthPicker {
            id: monthPicker2
            width: parent.width * .2
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: yearPicker2.right
            anchors.top: rowText2.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    monthPicker2.month = (new Date(currentJob.date)).getMonth()
                }
                else {
                    monthPicker2.month = (new Date).getMonth()
                }
            }
        }

        DayPicker {
            id: dayPicker2
            width: parent.width * .1833
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: monthPicker2.right
            anchors.top: rowText2.bottom
            daysInMonth: (new Date(yearPicker2.year, monthPicker2.month + 1, 0)).getDate()
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    dayPicker2.day = (new Date(currentJob.date)).getDate()
                }
                else {
                    dayPicker2.day = (new Date).getDate()
                }
            }
        }

        HourPicker {
            id: hourPicker2
            width: parent.width * 0.1833
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: dayPicker2.right
            anchors.top: rowText2.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    hourPicker2.hour = (new Date(currentJob.date)).getHours()
                }
                else {
                    hourPicker2.hour = (new Date).getHours()
                }
            }
        }

        MinutePicker {
            id: minutePicker2
            width: parent.width * 0.2333
            height: menuCalendrier.height - rowText.height - textdate1.height - okButton.height
            anchors.left: hourPicker2.right
            anchors.top: rowText2.bottom
            onSubmit: {
                dateTimePage.forward()
            }
            onAbort: {
                stack.pop()
            }
            Component.onCompleted: {
                if (currentJob.date)	{
                    minutePicker2.minute = (new Date(currentJob.date)).getMinutes()
                }
                else {
                    minutePicker2.minute = (new Date).getMinutes()
                }
            }
        }

        Button {
           id: okButton2
           width: minutePicker2.width
           text: qsTr("OK")
           height: textMinute2.height * 1.5
           anchors.left: hourPicker2.right
           anchors.top: minutePicker2.bottom

           contentItem: Text {
               text: okButton2.text
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
               if (monthPicker2.month == 0){
                   console.log("Choissisez un mois non nul")
               }

               else if (yearPicker2.year < yearPicker.year){
                   console.log("Choissisez une année au moin aussi grande que celle précédente")
               }

               else if (yearPicker2.year == yearPicker.year && monthPicker2.month < monthPicker.month){
                       console.log("Choissisez un mois au moin aussi grand que celui précédent")
               }

               else if (monthPicker2.month == monthPicker.month && dayPicker2.day < dayPicker.day){
                        console.log("Choissisez un jour au moin aussi grand que celui précédent")
               }

               else if (dayPicker2.day == dayPicker.day && hourPicker2.hour < hourPicker.hour){
                            console.log("Choissisez une heure au moin aussi grande que celle précédente")
               }

               else if (hourPicker2.hour == hourPicker.hour && minutePicker2.minute < minutePicker.minute){
                                console.log("Choissisez des minutes au moin aussi grandes que celles précédentes")
               }

               else {
                    menuCalendrier2.close()
                    console.log("Année :" + yearPicker2.year)
                    console.log("Mois :" + monthPicker2.month)
                    console.log("Jour :" + dayPicker2.day)
                    console.log("Heure :" + hourPicker2.hour)
                    console.log("Minutes :" + minutePicker2.minute)
               }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
