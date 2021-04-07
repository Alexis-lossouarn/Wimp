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
        bool retour = r.exec("INSERT INTO animaux (nom_animal, naissance_animal, type_animal, distance, id_utilisateur) VALUES ('" + nomAnimal + "', '" + naissance + "','" + type + "', " + distance + ", " + idUtilisateur + ")");
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
    mdp = this->password;
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


QStringList Database::getAnimaux()
{
    QSqlQuery r;
    r.exec("SELECT * FROM animaux WHERE id_utilisateur = 1");
    r.first();

    int idNom = r.record().indexOf("nom_animal");
    listeAnimaux = r.value(idNom).toStringList();

    while (r.next()) {
        listeAnimaux += r.value(idNom).toStringList();
    }
    return listeAnimaux;
}

bool Database::animalExist(QString nomAnimal)
{
    QSqlQuery r;
    r.prepare("SELECT * FROM animaux WHERE nom_animal = (:na)");
    r.bindValue(":na", nomAnimal);
    int existe = 0;
    r.exec();
    qDebug() << this->nom_Animal;

    if(r.size() != 0)
    {
        this->nom_Animal = nomAnimal;
        return existe;
    }

    else {
        existe = 1;
        return existe;
    }
}

QString Database::getAgeAnimal()
{
    QSqlQuery r;
    qDebug() << this->nom_Animal;
        r.prepare("SELECT * FROM animaux WHERE nom_animal = 'KIKI'");
        r.exec();
        r.first();

        int Age_a = r.record().indexOf("naissance_animal");

        animal_age = r.value(Age_a).toString();

        return animal_age;
}

QString Database::getTypeAnimal()
{
    QSqlQuery r;
    qDebug() << this->nom_Animal;
        r.prepare("SELECT * FROM animaux WHERE nom_animal = 'KIKI'");
        r.exec();
        r.first();

        int Type_a = r.record().indexOf("type_animal");

        animal_type = r.value(Type_a).toString();

        return animal_type;
}

