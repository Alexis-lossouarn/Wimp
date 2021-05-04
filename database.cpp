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

bool Database::recuperer(QString requete, QStringList &donnees)
{

    QSqlQuery r;
    bool retour;

    if (db.isOpen())
    {
        retour = r.exec(requete);
        if(retour)
        {
            while (r.next())
            {
                donnees << r.value(0).toString();
            }
            return true;
        }
        else
        {
            qDebug() << "aucuns arguments !";
            return false;
        }
    }
    else return false;
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
    if(db.isOpen())
    {
        QSqlQuery r;
        r.prepare("SELECT * FROM clients WHERE email = (:em) AND password = (:pw)");
        r.bindValue(":em", email);
        r.bindValue(":pw", mdp);
        int existe = 0;
        r.exec();

        if(r.size() != 0)
        {
            r.first();
            this->email = email;
            this->password = mdp;
            id_client = r.value(0).toInt();
            name = r.value(1).toString();
            lastname =r.value(2).toString();
            return existe;

        }

        else {
            existe = 1;
            return existe;
        }
    }
    else return 1;
}

QString Database::getMail()
{
    mail = this->email;
    qDebug() << type_animal;
    return mail;
}

QString Database::getPassword()
{
    mdp = this->password;
    return mdp;
}

uint Database::getIdu()
{
    return this->id_client;
}

QString Database::getNom()
{
    return this->name;
}

QString Database::getPrenom()
{
    return this->lastname;
}

QStringList Database::getTypes()
{
    recuperer("SELECT type FROM types", listeTypes);
    return listeTypes;
}

bool Database::creerAnimal(QString nomAnimal, QString naissance, QString type, QString distance)
{
    if(db.isOpen())
    {
        QSqlQuery r;

        if(db.isOpen())
        {
            qDebug() << this->id_client;
            r.prepare("INSERT INTO animaux (nom_animal, naissance_animal, type_animal, distance, id_utilisateur) VALUES ('" + nomAnimal + "', '" + naissance + "','" + type + "', " + distance + ", (:id))");
            r.bindValue(":id", this->id_client);
            bool retour = r.exec();
            return retour;
        }
        return false;
    }
    else return false;
}

QStringList Database::getAnimaux_list()
{
    if(db.isOpen())
    {
        QSqlQuery r;
        r.prepare("SELECT nom_animal FROM animaux WHERE id_utilisateur = (:id)");
        r.bindValue(":id", this->id_client);

        bool retour = r.exec();
        if(retour)
        {
            while (r.next())
            {
                listeAnimaux << r.value(0).toString();
            }
            return listeAnimaux;
        }
        else
        {
            qDebug() << "aucuns arguments !";
            return listeAnimaux;
        }
    }
    else return listeAnimaux;
}

QStringList Database::getTypesanimaux()
{
    if(db.isOpen())
    {
        QSqlQuery r;
        r.prepare("SELECT type_animal FROM animaux WHERE id_utilisateur = (:id)");
        r.bindValue(":id", this->id_client);

        bool retour = r.exec();
        if(retour)
        {
            while (r.next())
            {
                listetypesanimaux << r.value(0).toString();
            }
            return listetypesanimaux;
        }
        else
        {
            qDebug() << "aucuns arguments !";
            return listetypesanimaux;
        }
    }
    else return listetypesanimaux;
}

QStringList Database::getDatesanimaux()
{
    if(db.isOpen())
    {
        QSqlQuery r;
        r.prepare("SELECT date_animal FROM animaux WHERE id_utilisateur = (:id)");
        r.bindValue(":id", this->id_client);

        bool retour = r.exec();
        if(retour)
        {
            while (r.next())
            {
                listedatesanimaux << r.value(0).toString();
            }
            return listedatesanimaux;
        }
        else
        {
            qDebug() << "aucuns arguments !";
            return listedatesanimaux;
        }
    }
    else return listedatesanimaux;
}


bool Database::animalExist(QString nomAnimal)
{
    if(db.isOpen())
    {
        QSqlQuery r;
        r.prepare("SELECT * FROM animaux WHERE nom_animal = (:na) AND id_utilisateur = (:id)");
        r.bindValue(":na", nomAnimal);
        r.bindValue(":id", this->id_client);
        int existe = 0;
        r.exec();

        if(r.size() != 0)
        {
            r.first();
            id_animal = r.value(0).toInt();
            nom_Animal = nomAnimal;
            type_animal = r.value(3).toString();
            date_animal =r.value(2).toString();
            return existe;
        }

        else {
            existe = 1;
            return existe;
        }
    }
    else return 1;
}

QString Database::getTypeanimal()
{
    QSqlQuery r;
    r.prepare("SELECT type_animal FROM animaux WHERE nom_animal = (:na) AND id_utilisateur = (:id)");
    r.bindValue(":na", this->nom_Animal);
    r.bindValue(":id", this->id_client);
    int existe = 0;
    r.exec();

    if(r.size() != existe)
    {
        r.first();
        type_animal = r.value(0).toString();
    }
    qDebug() << type_animal;
    return type_animal;
}



