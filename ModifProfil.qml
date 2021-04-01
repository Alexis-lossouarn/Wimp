import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:modifprofil

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

                Text {
                    id: profil
                    color: "#707070"
                    font.pointSize: rectangleHaut.height * 0.3
                    text: qsTr("Profil")
                    anchors.top: bienvenue.top
                    anchors.topMargin: bienvenue.height * 0.1
                    anchors.horizontalCenter: parent.horizontalCenter
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
                        text: qsTr("Nom")
                        width: prenom.width
                    }

                    Rectangle {
                        id: rectangle1
                        height: 0.8 * profil.height
                        width: grid.width * 0.95 - prenom.width
                        border.width: 1
                        radius: 11
                        border.color: "#707070"

                        TextInput {
                            id:nom1
							text: Database.name
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#707070"
                            font.pointSize: rectangleHaut.height * 0.17
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Text {
                        id:prenom
                        color: "#707070"
                        font.pointSize: rectangleHaut.height * 0.22
                        height: 0.8 * profil.height
                        text: qsTr("Prénom")
                    }

                    Rectangle {
                        id: rectangle2
                        height: 0.8 * profil.height
                        width: grid.width * 0.95 - prenom.width
                        border.width: 1
                        radius: 11
                        border.color: "#707070"

                        TextInput {
                            id:prenom1
							text: Database.lastname
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#707070"
                            font.pointSize: rectangleHaut.height * 0.17
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Text {
                        id:mail
                        color: "#707070"
                        font.pointSize: rectangleHaut.height * 0.22
                        height: 0.8 * profil.height
                        width: prenom.width
                        text: qsTr("Mail")
                    }

                    Rectangle {
                        id: rectangle3
                        height: 0.8 * profil.height
                        width: grid.width * 0.95 - prenom.width
                        border.width: 1
                        radius: 11
                        border.color: "#707070"

                        TextInput {
                            id:mail1
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#707070"
							text: Database.mail
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pointSize: rectangleHaut.height * 0.13
                        }
                    }

                    Text {
                        id:avatar
                        color: "#707070"
                        font.pointSize: rectangleHaut.height * 0.22
                        width: prenom.width * 0.3
                        height: 2.4 * profil.height
                        text: qsTr("Avatar")
                    }

                    //Photo de profil arrondie
                    Rectangle {
                        width: 2.4 * profil.height
                        height: 2.4 * profil.height
                        color: "transparent"

                        Rectangle {
                            id: imageSource
                            anchors.fill: parent
                            anchors.bottomMargin: rectangle.top
                            anchors.leftMargin: parent.width * 0.1
                            anchors.topMargin: 0

                            Image {
                                anchors.fill: parent
                                source: "wtf.jpg"
                                fillMode: Image.PreserveAspectCrop
                            }
                            visible: false
                            layer.enabled: true
                        }

                        Rectangle {
                            id: maskLayer
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 0.1
                            anchors.bottomMargin: rectangle.top
                            anchors.topMargin: 0
                            radius: parent.width / 2
                            color: "white"
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
                            anchors.bottomMargin: rectangle.top
                            anchors.leftMargin: parent.width * 0.1
                            anchors.topMargin: 0
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
                        text: qsTr("Liste des colliers")
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        color: "#707070"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    //Design du trait dans le rectangle de la liste des colliers
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

                    Grid {
                        id: grid2
                        columns: 1
                        spacing: 4
                        anchors.top: trait.bottom
                        anchors.topMargin: trait.height * 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: rectangle.bottom
                        anchors.rightMargin: 5
                        anchors.leftMargin: 5
                        anchors.bottomMargin: listColliers.height * 1.1

                        Rectangle {
                            id: num1
                            border.color: "#707070"
                            border.width: 1
                            width: grid2.width
                            height: text1.height

                            Text {
                                id: text1
                                text: qsTr("0685548")
                            }

                            ToolButton {
                                width: 0.1 * grid2.width
                                height: num1.height * 0.8
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: 0

                                background: Image {
                                    id: img1
                                    source: "supprimer.png"
                                }
                            }
                        }

                        Rectangle {
                            id: num2
                            border.color: "#707070"
                            border.width: 1
                            anchors.top: num1.bottom
                            anchors.topMargin: 0
                            width: grid2.width
                            height: text1.height

                            Text {
                                id: text2
                                text: qsTr("5227537")
                            }

                            ToolButton {
                                width: 0.1 * grid2.width
                                height: num1.height * 0.8
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: 0

                                background: Image {
                                    id: img2
                                    source: "supprimer.png"
                                }
                            }
                        }

                        Rectangle {
                            id: num3
                            border.color: "#707070"
                            border.width: 1
                            anchors.top: num2.bottom
                            anchors.topMargin: 0
                            width: grid2.width
                            height: text1.height

                            Text {
                                id: text3
                                text: qsTr("0645235")
                            }

                            ToolButton {
                                width: 0.1 * grid2.width
                                height: num1.height * 0.8
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: 0

                                background: Image {
                                    id: img3
                                    source: "supprimer.png"
                                }
                            }
                        }

                        Rectangle {
                            id: num4
                            border.color: "#707070"
                            border.width: 1
                            anchors.top: num3.bottom
                            anchors.topMargin: 0
                            width: grid2.width
                            height: text1.height

                            Text {
                                id: text4
                                text: qsTr("1049823")
                            }

                            ToolButton {
                                width: 0.1 * grid2.width
                                height: num1.height * 0.8
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: 0

                                background: Image {
                                    id: img4
                                    source: "supprimer.png"
                                }
                            }
                        }
                    }
                }

                Row {
                    id:boutonsbas
                    anchors.top: rectangle.bottom
                    width: bienvenue.width
                    anchors.bottom: bienvenue.bottom

                    Button {
                       id: valider
                       width: ajouter.width * 0.4
                       text: qsTr("Valider")
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.leftMargin: bienvenue.width * 0.175
                       height: ajouter.height * 2
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

						   while(Database.name != nom1.text || Database.lastname != prenom1.text || Database.mail != mail1.text)
						   {
							   Database.executerRequete("UPDATE clients SET nom = '" + nom1.text + "' WHERE email = '" + Database.mail + "'")
							   Database.executerRequete("UPDATE clients SET prenom = '" + prenom1.text + "' WHERE email = '" + Database.mail + "'")
						   }

						   //Ouvre la page Gestion
						   stackView.push("Gestion.qml")
                       }
                    }

                       Button {
                          id: annuler
                          width: ajouter.width * 0.4
                          text: qsTr("Annuler")
                          height: ajouter.height * 2
                          anchors.right: boutonsbas.right
                          anchors.verticalCenter: parent.verticalCenter
                          anchors.rightMargin: bienvenue.width * 0.175

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
