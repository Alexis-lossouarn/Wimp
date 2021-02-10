#include "mainwindow.h"

mainwindow::mainwindow()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSL");
    db.setHostName("127.0.0.0");
    db.setUserName("root");
    db.setPassword("");
    db.setDatabaseName("Wimp");

    if(db.open()) {
        qDebug() << "Connexion réussi !";
    }
    else {
        qDebug() << "Connexion échoué !";
    }
}
