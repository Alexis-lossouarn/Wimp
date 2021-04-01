#include "database.h"
#include "animaux.h"
#include "clients.h"
#include "colliers.h"
#include "gps.h"
#include "types.h"

Database::Database(QObject *parent) : QObject(parent), erreurConnexion(false)
{

    qDebug() << QSqlDatabase::drivers();
    db = QSqlDatabase::addDatabase(DRIVER_BDD);

    db.setHostName(IP_BDD);
    db.setUserName(USER_BDD);
    db.setPassword(PASSWORD_BDD);
    db.setDatabaseName(NOM_BDD);

    if(db.open()) {
        erreurConnexion = false;
        qDebug() << "Ok - ouverture de la base de donnée";
    }
    else {
        erreurConnexion = true;
        qDebug() << "Echec d'ouverture de la base de donnée";
        qDebug() << db.lastError();
    }
}

Database::~Database()
{
}

bool Database::creerAnimal(QString nomAnimal, QString naissance, QString type, QString distance, QString idUtilisateur)
{
    qDebug() << distance << idUtilisateur;
    QSqlQuery r;

    if(db.isOpen())
    {
        bool retour = r.exec("INSERT INTO animaux (nom, naissance_animal, type_animal, distance, id_utilisateur) VALUES ('" + nomAnimal + "', '" + naissance + "','" + type + "', " + distance + ", " + idUtilisateur + ")");
        return retour;
    }
    return false;
}

bool Database::creerCompte(QString nom, QString prenom , QString email, QString mdp)
{
    QSqlQuery r;

    if(db.isOpen())
    {
        bool retour = r.exec("INSERT INTO clients (nom, prenom, email, password) VALUES ('" + nom + "', '" + prenom + "','" + email + "', '" + mdp + "')");
        return retour;
    }
    return false;
}

bool Database::profilExist(QString email, QString mdp)
{
    QSqlQuery r;
    r.prepare("SELECT * FROM clients WHERE email = (:em) AND password = (:pw)");
    r.bindValue(":em", email);
    r.bindValue(":pw", mdp);
    int existe = 0;
    r.exec();

    if(r.size() != 0)
    {
        this->email = email;
        this->password = mdp;
        return existe;
    }

    else {
        existe = 1;
        return existe;
    }
}

QString Database::getMail()
{
    mail = this->email;
    return mail;
}

QString Database::getPassword()
{
    mdp = this->email;
    return mdp;
}

uint Database::getIdu()
{
    QSqlQuery r;
    r.prepare("SELECT * FROM clients WHERE email = (:em) AND password = (:pw)");
    r.bindValue(":em", this->email);
    r.bindValue(":pw", this->password);
    r.exec();
    r.first();

    int idClient = r.record().indexOf("id_client");
    idutilisateur = r.value(idClient).toUInt();
    return idutilisateur;
}

QString Database::getNom()
{
    QSqlQuery r;
    r.prepare("SELECT * FROM clients WHERE email = (:em) AND password = (:pw)");
    r.bindValue(":em", this->email);
    r.bindValue(":pw", this->password);
    r.exec();
    r.first();

    int idName = r.record().indexOf("nom");

    name = r.value(idName).toString();
    qDebug() << name;
    return name;
}

QString Database::getPrenom()
{
    QSqlQuery r;
    r.prepare("SELECT * FROM clients WHERE email = (:em) AND password = (:pw)");
    r.bindValue(":em", this->email);
    r.bindValue(":pw", this->password);
    r.exec();
    r.first();

    int idPrenom = r.record().indexOf("prenom");

    lastname = r.value(idPrenom).toString();
    return lastname;
}

bool Database::executerRequete(QString requete)
{

    QSqlQuery r;

    if(db.isOpen())
    {
        bool retour = r.exec(requete);
        return retour;
    }
    return false;
}

QStringList Database::getTypes()
{
    QSqlQuery r;
    r.exec("SELECT * FROM types");
    r.first();
    int idType = r.record().indexOf("type");
    listeTypes = r.value(idType).toStringList();

    while (r.next()) {
        listeTypes += r.value(idType).toStringList();
    }
    return listeTypes;
}

QStringList Database::getAnimaux(QString id_client)
{
    QSqlQuery r;
    r.exec("SELECT * FROM animaux WHERE id_utilisateur = '" + id_client + "'");
    r.first();

    int idNom = r.record().indexOf("nom");
    listeTypes = r.value(idNom).toStringList();

    int idType = r.record().indexOf("type_animal");
    listeTypes += r.value(idType).toStringList();

    int idNee = r.record().indexOf("naissance_animal");
    listeTypes += r.value(idNee).toStringList();

    int idDistance = r.record().indexOf("distance");
    listeTypes += r.value(idDistance).toStringList();

    int idCollier = r.record().indexOf("id_collier");
    listeTypes += r.value(idCollier).toStringList();

    while (r.next()) {
        listeTypes += r.value(idNom).toStringList() + r.value(idType).toStringList() + listeTypes += r.value(idNee).toStringList() + listeTypes += r.value(idDistance).toStringList() + listeTypes += r.value(idCollier).toStringList();
    }
    qDebug() << listeTypes
    return listeTypes;
}

/*
bool Database::creerCompte(QString requete, QString mdp, QString email)
{
    QSqlQuery r;
    QString mail = email;
    QString hash = QString("%1").arg(QString(QCryptographicHash::hash(mdp.toUtf8(),QCryptographicHash::Sha512).toHex()));

    if(db.isOpen())
    {
        bool retour = r.exec(requete);
        qDebug() << hash;
        r.exec("UPDATE clients SET password = '" + hash + "' WHERE email = '" + mail + "'");
        return retour;
    }
    return false;
}
*/
