import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: appli
    visible: true

    SwipeView {
        id: vueBalayage
        anchors.fill: parent
        currentIndex: 0

        Item {
                id: page1

                Page1Form {
                    id: page1Form

                    Column {
                        id: mainColumn
                        x: 0
                        y: 0
                        width: appli.width
                        height: appli.height

                        Rectangle {
                            id: rectangleBas
                            color: "#c5002256"
                            height: appli.height
                            width: appli.width

                            //Rectangle blanc
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
									text: "Profil"
                                    anchors.top: bienvenue.top
                                    anchors.topMargin: bienvenue.height * 0.1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                //Ouvrir les options
                                ToolButton {
                                    id: option
                                    visible: true
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.topMargin: 3
                                    anchors.rightMargin: 3

                                    background: Image {
                                        id: name
										source: "images/menu2.png"
                                    }

                                    onClicked: {
                                        parametre.open()
                                    }
                                }

                                Grid {
                                    id: grid
                                    columns: 2
                                    spacing: 4
                                    anchors.left: bienvenue.left
                                    anchors.leftMargin: 0.1 * bienvenue.width
                                    anchors.top: profil.bottom
                                    anchors.topMargin: profil.height
                                    width: bienvenue.width * 0.9
                                    height: 0.8 * profil.height


                                    Text {
                                        id:nom
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.22
                                        height: 0.8 * profil.height
										text: "Nom"
                                        width: prenom.width
                                    }

                                    Text {
                                        id:nom1
                                        height: 0.8 * profil.height
                                        width: grid.width - prenom.width
                                        text: Database.name
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.22
                                        horizontalAlignment: Text.AlignHCenter
                                    }

                                    Text {
                                        id:prenom
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.22
                                        height: 0.8 * profil.height
										text: "Prénom"
                                    }

                                    Text {
                                        id:prenom1
                                        height: 0.8 * profil.height
                                        width: grid.width - prenom.width
										text: Database.lastname
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.22
                                        horizontalAlignment: Text.AlignHCenter
                                    }

                                    Text {
                                        id:mail
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.22
                                        height: 0.8 * profil.height
                                        width: prenom.width
										text: "Mail"
                                    }

                                    Text {
                                        id:mail1
                                        height: mail.height
                                        width: grid.width - prenom.width
										text: Database.mail
                                        horizontalAlignment: Text.AlignHCenter
                                        topPadding: 4
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.13
                                    }

                                    Text {
                                        id:avatar
                                        color: "#707070"
                                        font.pointSize: rectangleHaut.height * 0.22
                                        width: prenom.width
                                        height: 2.4 * profil.height
										text: "Avatar"
                                    }

                                    //Photo de profil arrondie
                                    Rectangle {
										width: 2.4 * profil.height
                                        height: 2.4 * profil.height
                                        color: "transparent"

										Rectangle {
                                            id: imageSource
                                            anchors.fill: parent
                                            anchors.rightMargin: - parent.width * 0.25
                                            anchors.bottomMargin: rectangle.top
                                            anchors.leftMargin: parent.width * 0.25

                                            Image {
                                                anchors.fill: parent
												source: "images/wtf.jpg"
                                                fillMode: Image.PreserveAspectCrop
                                            }
                                            visible: false
                                            layer.enabled: true
                                        }

                                        Rectangle {
                                            id: maskLayer
                                            anchors.fill: parent
                                            anchors.leftMargin: parent.width * 0.25
                                            anchors.rightMargin: - parent.width * 0.25
                                            anchors.bottomMargin: rectangle.top
											radius: parent.width / 2
                                            color: "red"
                                            border.color: "#707070"
                                            layer.enabled: true
                                            layer.samplerName: "maskSource"
                                            layer.effect: ShaderEffect {
                                                property var colorSource: imageSource
                                                fragmentShader: "
                                                    uniform lowp sampler2D colorSource;
                                                    uniform lowp sampler2D maskSource;
                                                    uniform lowp float qt_Opacity;
                                                    varying highp vec2 qt_TexCoord0;
                                                    void main() {
                                                        gl_FragColor =
                                                            texture2D(colorSource, qt_TexCoord0)
                                                            * texture2D(maskSource, qt_TexCoord0).a
                                                            * qt_Opacity;
                                                    }
                                                "
                                            }

                                        }

                                        Rectangle {
                                            anchors.fill: parent
                                            anchors.rightMargin: - parent.width * 0.25
                                            anchors.bottomMargin: rectangle.top
                                            anchors.leftMargin: parent.width * 0.25
                                            radius: parent.width / 2
                                            border.color: "#c5002256"
                                            border.width: 2
                                            color: "transparent"
                                        }
                                    }
                                }

                                //Rectangle de la liste des colliers
                                Rectangle {
                                    id: rectangle
                                    height: bienvenue.height * 0.35
                                    border.color: "#707070"
                                    border.width: 5
                                    anchors.top: profil.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.topMargin: bienvenue.height * 0.4
                                    width: bienvenue.width * 0.8

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

                                Button {
                                       id: modifier
									   text: "Modifier"
                                       anchors.top: rectangle.bottom
									   anchors.topMargin: (5 + ajouter.height) / 8
                                       anchors.horizontalCenter: parent.horizontalCenter
									   height: ajouter.height * 2

                                       contentItem: Text {
                                           text: modifier.text
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
                                           //ouvrir la page ModifProfil
                                           stackView.push("ModifProfil.qml")
                                       }
                                }
                            }
                        }
                    }

                    //Paramètre visible après avoir cliquer sur l'icône paramètre
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
								text: "Carte"
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
                                    //ouvrir la page principale
                                    stackView.push("Principale.qml")
                                    //fermer le drawer après l'actionnement
                                    parametre.close()
                                }
                            }

                            Button {
                                id:deco
								text: "Deconnexion"
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
                                    //ouvrir la page d'accueil
									Database.deconnexion()
                                    stackView.push("Accueil.qml")
                                    //fermer le drawer après l'actionnement
                                    parametre.close()
                                }
                            }

                            Button {
                                anchors.bottom: traitnoir.top
                                anchors.right: parent.right

                                background: Image {
                                    id: fermerparametre
									source: "images/croix.png"
                                }

                                onClicked: {
                                    //fermer le drawer après l'actionnement
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
								text: "Vitesse moyenne"
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
								text: "Vitesse Actuelle"
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
                        }
                    }
                }
                }

         Item {                     //page de droite du slider
                id: page2

                Page2Form {
                    id: page2Form

                    Column {
                        id: mainColumnp2
                        x: 0
                        y: 0
                        width: appli.width
                        height: appli.height

                        Rectangle {
                            id: rectangleBasp2
                            color: "#c5002256"
                            height: appli.height
                            width: appli.width

                            //Rectangle Blanc
                            Rectangle {
                                id: bienvenuep2
                                color: "#ffffffff"
                                radius: 11
                                anchors.fill: parent
                                anchors.rightMargin: parent.width * 0.1
                                anchors.leftMargin: parent.width * 0.1
                                anchors.bottomMargin: parent.width * 0.15
                                anchors.topMargin: parent.width * 0.15

                                Text {
                                    id: listAnimauxtxt
                                    color: "#707070"
                                    font.pointSize: rectangleHaut.height * 0.3
									text: "Liste des animaux"
                                    anchors.top: bienvenuep2.top
                                    anchors.topMargin: bienvenuep2.height * 0.1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                ToolButton {
                                    id: optionp2
                                    visible: true
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.topMargin: 3
                                    anchors.rightMargin: 3

                                    background: Image {
                                        id: namep2
										source: "images/menu2.png"
                                    }

                                    onClicked: {
                                        //ouvrir le drawer paramètre de la page 2
                                        parametrep2.open()
                                    }
								}

                                Rectangle {
									id: rectangleanimal
									anchors.top: listAnimauxtxt.bottom
									anchors.topMargin: 20
									width: parent.width
									anchors.horizontalCenter: parent.horizontalCenter
									anchors.bottom: ajouterp2.top
									anchors.bottomMargin: 10
									border.color: "#707070"

									Row {
										ListView {
											id: resultats
											width: rectangleanimal.width
											height: rectangleanimal.height
											focus: true
											snapMode: ListView.SnapOneItem
											highlightRangeMode: ListView.StrictlyEnforceRange
											highlightMoveDuration: 250
											orientation: ListView.Horizontal
											boundsBehavior: Flickable.StopAtBounds
											model: ListModel {
												ListElement {component: "Listeanimaux.qml"}
											}
											delegate: Loader {
												width: resultats.width
												height: resultats.height
												source: component
												asynchronous: true
											}
										}
									}
                                }

                                Button {
                                       id: ajouterp2
                                       width: modifier.width
									   text: "Ajouter"
                                       height: modifier.height
                                       anchors.bottom: parent.bottom
                                       anchors.bottomMargin: (5 + ajouter.height) / 2
                                       anchors.horizontalCenter: parent.horizontalCenter

                                       contentItem: Text {
                                           text: ajouterp2.text
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
                                           //Ouvrir la page Ajoutanimal
                                           stackView.push("Ajoutanimal.qml")
                                       }
                                }
                            }
                        }
                    }
                }

                //paramètre du drawer de la page 2
                Drawer {
                    id: parametrep2
                    width: parent.width * (2/3)
                    height: parent.height - rectangleHaut.height
                    y: rectangleHaut.height
                    edge: Qt.RightEdge

                    Rectangle {
                        color: "#002256"
                        width: parametrep2.width
                        height: parametrep2.height

                        Button {
                            id:gestioncomptep2
							text: "Carte"
                            width: 0.8 * parametrep2.width
                            height: 0.06 * parent.height
                            anchors.top: parent.top
                            anchors.topMargin: 0.05 * parent.height
                            anchors.horizontalCenter: parent.horizontalCenter

                            contentItem: Text {
                                id: txtgestioncomptep2
                                text: gestioncomptep2.text
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
                                stackView.push("Principale.qml")
                                parametrep2.close()
                            }
                        }

                        Button {
                            id:decop2
							text: "Deconnexion"
                            width: 0.8 * parametrep2.width
                            height: 0.06 * parent.height
                            anchors.top: gestioncomptep2.top
                            anchors.topMargin: 0.15 * parent.height
                            anchors.horizontalCenter: parent.horizontalCenter

                            contentItem: Text {
                                id: txtdecop2
                                text: decop2.text
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
								Database.deconnexion()
                                stackView.push("Accueil.qml")
                                parametrep2.close()
                            }
                        }

                        Button {
                            anchors.bottom: traitnoirp2.top
                            anchors.right: parent.right

                            background: Image {
                                id: fermerparametrep2
								source: "images/croix.png"
                            }

                            onClicked: {
                                parametrep2.close()
                            }
                        }

                        Rectangle {
                            id: traitnoirp2
                            color: "#000000"
                            height: 1
                            border.width: 1
                            width: parametrep2.width
                            anchors.top: decop2.top
                            anchors.topMargin: 0.15 * parent.height
                        }

                        Text {
                            id: vmoytxtp2
							text: "Vitesse moyenne"
                            color: "#ffffff"
                            width: parametrep2.width
                            horizontalAlignment: Text.AlignHCenter
                            anchors.top: traitnoirp2.bottom
                            anchors.topMargin: 0.07 * parent.height
                            font.pixelSize: decop2.height * 0.5
                        }

                        Rectangle {
                            id: vmoyp2
                            width: 0.8 * parent.width
                            height: decop2.height
                            anchors.top: vmoytxtp2.bottom
                            anchors.topMargin: (0.07 * parent.height) * 0.25
                            anchors.horizontalCenter: parent.horizontalCenter
                            radius: 11
                        }

                        Text {
                            id: vactutxtp2
							text: "Vitesse Actuelle"
                            color: "#ffffff"
                            width: parametrep2.width
                            horizontalAlignment: Text.AlignHCenter
                            anchors.top: vmoyp2.bottom
                            anchors.topMargin: 0.07 * parent.height
                            font.pixelSize: decop2.height * 0.5
                        }

                        Rectangle {
                            id: vactup2
                            width: 0.8 * parent.width
                            height: decop2.height
                            anchors.top: vactutxtp2.bottom
                            anchors.topMargin: (0.07 * parent.height) * 0.25
                            anchors.horizontalCenter: parent.horizontalCenter
                            radius: 11
                        }
                    }
                }
			}
	   }

            //rond qui permettent de voir sur quelle page on est
    PageIndicator {
        id: indicateur
        count: vueBalayage.count
        currentIndex: vueBalayage.currentIndex
        anchors.top: vueBalayage.top
        anchors.topMargin: appli.height * 0.08
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:32}
}
##^##*/
