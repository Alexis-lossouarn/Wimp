import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

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
        border.width: 0
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

            Column {
                id: column
                height: bienvenue.height
                width: bienvenue.width

                //bouton retour
                Button {
                       id: retour
					   text: "retour"
                       anchors.top: bienvenue.top
                       anchors.rightMargin: 0
                       anchors.right: column.right
                       width: textAccueil.width * 0.4
					   height: textAccueil.height * 1.2

                       contentItem: Text {
                           text: retour.text
                           font: retour.font
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
                           //Reviens sur la page précédente
                           stackView.push("Accueil.qml")
                       }
                }

				Rectangle {
					id:videRectangle
					border.color: "red"
					border.width: 1
					visible: false
					width: videText.implicitWidth * 1.3
					height: textnom.height
					radius: 8
					anchors.bottom: textAccueil.top
					anchors.bottomMargin: 10
					anchors.right: retour.left
					anchors.rightMargin: 10
					anchors.left: bienvenue.left

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
                    id: textAccueil
                    color: "#707070"
					text: "Inscrivez-vous"
                    anchors.top: parent.top
                    anchors.topMargin: parent.width * 0.15
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Poor Richard"
                    font.pointSize: rectangleHaut.height * 0.3
                }

				Text {
					id: textnom
					color: "#707070"
					text: "Nom"
					anchors.top: textAccueil.top
					anchors.topMargin: parent.width * 0.2
					anchors.horizontalCenter: parent.horizontalCenter
					font.family: "Poor Richard"
					font.pointSize: rectangleHaut.height * 0.2
				}

				Rectangle {
					id: nomRectangle
					width: bienvenue.width * 0.8
					height: nomInput.implicitHeight * 1.3
					radius: 10
					border.color: "#707070"
					border.width: 1
					anchors.top: textnom.bottom
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.topMargin: 5

					TextInput {
						id: nomInput
						width: textAccueil.width * 0.9
						height: textnom.height
						anchors.horizontalCenter: nomRectangle.horizontalCenter
						anchors.verticalCenter: nomRectangle.verticalCenter
						font.pixelSize: rectangleHaut.height * 0.25
						horizontalAlignment: Text.AlignHCenter
						wrapMode: Text.Wrap
						anchors.verticalCenterOffset: 2
						anchors.horizontalCenterOffset: 0
					}
                }

                Text {
					id: textprenom
                    color: "#707070"
					text: "Prenom"
					anchors.top: nomRectangle.top
					anchors.topMargin: parent.width * 0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Poor Richard"
                    font.pointSize: rectangleHaut.height * 0.2
                }

                Rectangle {
					id: prenomRectangle
                    width: bienvenue.width * 0.8
					height: prenomInput.implicitHeight * 1.3
                    radius: 10
                    border.color: "#707070"
                    border.width: 1
					anchors.top: textprenom.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 5

                    TextInput {
						id: prenomInput
                        width: textAccueil.width * 0.9
						height: textnom.height
						wrapMode: Text.Wrap
						anchors.horizontalCenter: prenomRectangle.horizontalCenter
						anchors.verticalCenter: prenomRectangle.verticalCenter
                        font.pixelSize: rectangleHaut.height * 0.25
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenterOffset: 2
                        anchors.horizontalCenterOffset: 0
                    }
				}

                Text {
					id: textmail
                    color: "#707070"
					text: "Adresse Mail"
					anchors.top: prenomRectangle.top
					anchors.topMargin: parent.width * 0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Poor Richard"
                    font.pointSize: rectangleHaut.height * 0.2
                }

                Rectangle {
					id: mailRectangle
                    width: bienvenue.width * 0.8
					height: mailInput.implicitHeight * 1.3
                    radius: 10
                    border.color: "#707070"
                    border.width: 1
					anchors.top: textmail.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 5

                    TextInput {
						id: mailInput
                        width: textAccueil.width * 0.9
						height: textnom.height
						wrapMode: Text.Wrap
						anchors.horizontalCenter: mailRectangle.horizontalCenter
						anchors.verticalCenter: mailRectangle.verticalCenter
                        font.pixelSize: rectangleHaut.height * 0.25
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenterOffset: 2
                        anchors.horizontalCenterOffset: 0
                    }
                }

                Text {
					id: textmdp
                    color: "#707070"
					text: "Mot de passe"
					anchors.top: mailRectangle.top
					anchors.topMargin: parent.width * 0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Poor Richard"
                    font.pointSize: rectangleHaut.height * 0.2
                }

                Rectangle {
					id: mdpRectangle
                   width: bienvenue.width * 0.8
					height: mdpInput.implicitHeight * 1.3
                    radius: 10
                    border.color: "#707070"
                    border.width: 1
					anchors.top: textmdp.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 5

                    TextInput {
						id: mdpInput
                        width: textAccueil.width
						height: textnom.height
						wrapMode: Text.Wrap
						anchors.horizontalCenter: mdpRectangle.horizontalCenter
						anchors.verticalCenter: mdpRectangle.verticalCenter
                        font.pixelSize: rectangleHaut.height * 0.25
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenterOffset: 2
                        anchors.horizontalCenterOffset: 0
                    }
                }

                Text {
					id: textmdp2
                    color: "#707070"
					text: "Valider mot de passe"
					anchors.top: mdpRectangle.top
					anchors.topMargin: parent.width * 0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Poor Richard"
					font.pointSize: rectangleHaut.height * 0.2
                }

                Rectangle {
					id: mdp2Rectangle
                    width: bienvenue.width * 0.8
					height: mdp2Input.implicitHeight * 1.3
                    radius: 10
                    border.color: "#707070"
                    border.width: 1
					anchors.top: textmdp2.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 5

                    TextInput {
						id: mdp2Input
                        width: textAccueil.width
						height: textnom.height
						wrapMode: Text.Wrap
						anchors.horizontalCenter: mdp2Rectangle.horizontalCenter
						anchors.verticalCenter: mdp2Rectangle.verticalCenter
                        font.pixelSize: rectangleHaut.height * 0.25
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenterOffset: 2
                        anchors.horizontalCenterOffset: 0
                    }
                }                
            }
        }

		Button {
			   id: envoyer
			   width: 90
			   text: "Envoyer"
			   anchors.bottom: bienvenue.bottom
			   anchors.horizontalCenter: parent.horizontalCenter
			   height: 30

			   contentItem: Text {
				   text: envoyer.text
				   font: envoyerfont
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

					//Ouvre la page Principale
					//Database.executerRequete("INSERT INTO clients")
				   if(nomInput.text == "" || prenomInput.text == "" || mailInput.text == "" || mdpInput.text == "" || mdp2Input.text == "")
				   {
					   console.log("Champ vide")
					   timervide.start();
					   timervide2.start();
					}

					else if(mdpInput.text != mdp2Input.text) console.log("Mot de passes différents !")

					else
				   {
					   Database.creerCompte(prenomInput.text, nomInput.text, mailInput.text, mdpInput.text)
					   Database.profilExist(mailInput.text, mdpInput.text)
					   stackView.push("Principale.qml")
				   }

			   }
		}

        //Mention légales
        ToolButton {
            id: mentionLegales
            height: 32
            opacity: 1
			text: "Mention légales"
            anchors.bottom: parent.bottom
            clip: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 0
            font.pointSize: rectangleHaut.height * 0.1
            font.underline: true

            onClicked: {
                aPropos.open()
            }

            contentItem: Text {
                text: mentionLegales.text
                font: mentionLegales.font
                opacity: enabled ? 1.0 : 0.3
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 12
                elide: Text.ElideRight
                anchors.bottom: parent.bottom
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: "transparent"
                radius: 15
            }
		}
    }

    //Pop-up mention légales
    Dialog {
        id: aPropos
        modal: true
        focus: true
        title: "À propos"
        x: (window.width - width) / 2
        y: rectangleHaut.height
        width: Math.min(window.width, window.height) / 3 * 2
        height: bienvenue.height * 0.8
        contentHeight: message.height

        ScrollView {
            height: aPropos.height * 0.85
            clip: true
            ScrollBar.horizontal: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            Label {
                id: message
                width: aPropos.availableWidth
                text: "La seule contrepartie à l'utilisation de ces mentions légales, est l'engagement total à laisser le lien crédit subdelirium sur cette page de mentions légales.
Vos mentions légales :

1. Présentation du site.
En vertu de l'article 6 de la loi n° 2004-575 du 21 juin 2004 pour la confiance dans l'économie numérique, il est précisé aux utilisateurs du site www.wimp.com l'identité des différents intervenants dans le cadre de sa réalisation et de son suivi :
Propriétaire : WIMP –  – 5 rue emile le taillandier
Créateurs : Alexis Lossouarn, Alan Coiffard, Antoine Nourry, Erwan Mahé
Responsable publication : Alan Coiffard – alan.coiffar@gmail.com
Le responsable publication est une personne physique ou une personne morale.
Webmaster : Alan Coiffard – alan.coiffar@gmail.com
Hébergeur : ovh – 2 rue Kellermann – BP 80157 59053 ROUBAIX CEDEX 1
Crédits :
Le modèle de mentions légales est offert par Subdelirium.com Générateur de mentions légales

2. Conditions générales d’utilisation du site et des services proposés.
L’utilisation du site www.wimp.com implique l’acceptation pleine et entière des conditions générales d’utilisation ci-après décrites. Ces conditions d’utilisation sont susceptibles d’être modifiées ou complétées à tout moment, les utilisateurs du site sont donc invités à les consulter de manière régulière.
Ce site est normalement accessible à tout moment aux utilisateurs. Une interruption pour raison de maintenance technique peut être toutefois décidée par WIMP, qui s’efforcera alors de communiquer préalablement aux utilisateurs les dates et heures de l’intervention.
Le site www.wimp.com est mis à jour régulièrement par Alan Coiffard. De la même façon, les mentions légales peuvent être modifiées à tout moment : elles s’imposent néanmoins à l’utilisateur qui est invité à s’y référer le plus souvent possible afin d’en prendre connaissance.

3. Description des services fournis.
Le site www.wimp.com a pour objet de fournir une information concernant l’ensemble des activités de la société.
WIMP s’efforce de fournir sur le site www.wimp.com des informations aussi précises que possible. Toutefois, il ne pourra être tenue responsable des omissions, des inexactitudes et des carences dans la mise à jour, qu’elles soient de son fait ou du fait des tiers partenaires qui lui fournissent ces informations.
Tous les informations indiquées sur le site www.wimp.com sont données à titre indicatif, et sont susceptibles d’évoluer. Par ailleurs, les renseignements figurant sur le site www.wimp.com ne sont pas exhaustifs. Ils sont donnés sous réserve de modifications ayant été apportées depuis leur mise en ligne.

4. Limitations contractuelles sur les données techniques.
Le site utilise la technologie JavaScript.
Le site Internet ne pourra être tenu responsable de dommages matériels liés à l’utilisation du site. De plus, l’utilisateur du site s’engage à accéder au site en utilisant un matériel récent, ne contenant pas de virus et avec un navigateur de dernière génération mis-à-jour

5. Propriété intellectuelle et contrefaçons.
WIMP est propriétaire des droits de propriété intellectuelle ou détient les droits d’usage sur tous les éléments accessibles sur le site, notamment les textes, images, graphismes, logo, icônes, sons, logiciels.
Toute reproduction, représentation, modification, publication, adaptation de tout ou partie des éléments du site, quel que soit le moyen ou le procédé utilisé, est interdite, sauf autorisation écrite préalable de : WIMP.
Toute exploitation non autorisée du site ou de l’un quelconque des éléments qu’il contient sera considérée comme constitutive d’une contrefaçon et poursuivie conformément aux dispositions des articles L.335-2 et suivants du Code de Propriété Intellectuelle.

6. Limitations de responsabilité.
WIMP ne pourra être tenue responsable des dommages directs et indirects causés au matériel de l’utilisateur, lors de l’accès au site www.wimp.com, et résultant soit de l’utilisation d’un matériel ne répondant pas aux spécifications indiquées au point 4, soit de l’apparition d’un bug ou d’une incompatibilité.
WIMP ne pourra également être tenue responsable des dommages indirects (tels par exemple qu’une perte de marché ou perte d’une chance) consécutifs à l’utilisation du site www.wimp.com.
Des espaces interactifs (possibilité de poser des questions dans l’espace contact) sont à la disposition des utilisateurs. WIMP se réserve le droit de supprimer, sans mise en demeure préalable, tout contenu déposé dans cet espace qui contreviendrait à la législation applicable en France, en particulier aux dispositions relatives à la protection des données. Le cas échéant, WIMP se réserve également la possibilité de mettre en cause la responsabilité civile et/ou pénale de l’utilisateur, notamment en cas de message à caractère raciste, injurieux, diffamant, ou pornographique, quel que soit le support utilisé (texte, photographie…).

7. Gestion des données personnelles.
En France, les données personnelles sont notamment protégées par la loi n° 78-87 du 6 janvier 1978, la loi n° 2004-801 du 6 août 2004, l'article L. 226-13 du Code pénal et la Directive Européenne du 24 octobre 1995.
A l'occasion de l'utilisation du site www.wimp.com , peuvent êtres recueillies : l'URL des liens par l'intermédiaire desquels l'utilisateur a accédé au site www.wimp.com, le fournisseur d'accès de l'utilisateur, l'adresse de protocole Internet (IP) de l'utilisateur.
En tout état de cause WIMP ne collecte des informations personnelles relatives à l'utilisateur que pour le besoin de certains services proposés par le site www.wimp.com. L'utilisateur fournit ces informations en toute connaissance de cause, notamment lorsqu'il procède par lui-même à leur saisie. Il est alors précisé à l'utilisateur du site www.wimp.com l’obligation ou non de fournir ces informations.
Conformément aux dispositions des articles 38 et suivants de la loi 78-17 du 6 janvier 1978 relative à l’informatique, aux fichiers et aux libertés, tout utilisateur dispose d’un droit d’accès, de rectification et d’opposition aux données personnelles le concernant, en effectuant sa demande écrite et signée, accompagnée d’une copie du titre d’identité avec signature du titulaire de la pièce, en précisant l’adresse à laquelle la réponse doit être envoyée.
Aucune information personnelle de l'utilisateur du site www.wimp.com n'est publiée à l'insu de l'utilisateur, échangée, transférée, cédée ou vendue sur un support quelconque à des tiers. Seule l'hypothèse du rachat de WIMP et de ses droits permettrait la transmission des dites informations à l'éventuel acquéreur qui serait à son tour tenu de la même obligation de conservation et de modification des données vis à vis de l'utilisateur du site www.wimp.com.
Les bases de données sont protégées par les dispositions de la loi du 1er juillet 1998 transposant la directive 96/9 du 11 mars 1996 relative à la protection juridique des bases de données.

8. Liens hypertextes et cookies.
Le site www.wimp.com contient un certain nombre de liens hypertextes vers d’autres sites, mis en place avec l’autorisation de WIMP. Cependant, WIMP n’a pas la possibilité de vérifier le contenu des sites ainsi visités, et n’assumera en conséquence aucune responsabilité de ce fait.
La navigation sur le site www.wimp.com est susceptible de provoquer l’installation de cookie(s) sur l’ordinateur de l’utilisateur. Un cookie est un fichier de petite taille, qui ne permet pas l’identification de l’utilisateur, mais qui enregistre des informations relatives à la navigation d’un ordinateur sur un site. Les données ainsi obtenues visent à faciliter la navigation ultérieure sur le site, et ont également vocation à permettre diverses mesures de fréquentation.
Le refus d’installation d’un cookie peut entraîner l’impossibilité d’accéder à certains services. L’utilisateur peut toutefois configurer son ordinateur de la manière suivante, pour refuser l’installation des cookies :
Sous Internet Explorer : onglet outil (pictogramme en forme de rouage en haut a droite) / options internet. Cliquez sur Confidentialité et choisissez Bloquer tous les cookies. Validez sur Ok.
Sous Firefox : en haut de la fenêtre du navigateur, cliquez sur le bouton Firefox, puis aller dans l'onglet Options. Cliquer sur l'onglet Vie privée. Paramétrez les Règles de conservation sur :  utiliser les paramètres personnalisés pour l'historique. Enfin décochez-la pour  désactiver les cookies.
Sous Safari : Cliquez en haut à droite du navigateur sur le pictogramme de menu (symbolisé par un rouage). Sélectionnez Paramètres. Cliquez sur Afficher les paramètres avancés. Dans la section Confidentialité, cliquez sur Paramètres de contenu. Dans la section Cookies, vous pouvez bloquer les cookies.
Sous Chrome : Cliquez en haut à droite du navigateur sur le pictogramme de menu (symbolisé par trois lignes horizontales). Sélectionnez Paramètres. Cliquez sur Afficher les paramètres avancés. Dans la section Confidentialité, cliquez sur préférences.  Dans l'onglet Confidentialité, vous pouvez bloquer les cookies.

9. Droit applicable et attribution de juridiction.
Tout litige en relation avec l’utilisation du site www.wimp.com est soumis au droit français. Il est fait attribution exclusive de juridiction aux tribunaux compétents de Paris.

10. Les principales lois concernées.
Loi n° 78-17 du 6 janvier 1978, notamment modifiée par la loi n° 2004-801 du 6 août 2004 relative à l'informatique, aux fichiers et aux libertés.
Loi n° 2004-575 du 21 juin 2004 pour la confiance dans l'économie numérique.

11. Lexique.
Utilisateur : Internaute se connectant, utilisant le site susnommé.
Informations personnelles : « les informations qui permettent, sous quelque forme que ce soit, directement ou non, l'identification des personnes physiques auxquelles elles s'appliquent » (article 4 de la loi n° 78-17 du 6 janvier 1978).
"
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }
}
