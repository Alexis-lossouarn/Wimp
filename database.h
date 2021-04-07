#ifndef DATABASE_H
#define DATABASE_H

#define DRIVER_BDD QString("QPSQL")
#define IP_BDD QString("postgresql-wimp.alwaysdata.net")
#define USER_BDD QString("wimp_alexis")
#define PASSWORD_BDD QString("S6?YXqPkn?c&z@at")
#define NOM_BDD QString("wimp_bdd")

#include <QtSql>

class Database : public QObject
{

    Q_OBJECT
    //Table client
    Q_PROPERTY(QString mail READ getMail)
    Q_PROPERTY(QString name READ getNom)
    Q_PROPERTY(QString lastname READ getPrenom)
    Q_PROPERTY(uint idutilisateur READ getIdu)
    Q_PROPERTY(QString mdp READ getPassword)

    //Table type
    Q_PROPERTY(QStringList listeTypes READ getTypes)

    //Table animal
    Q_PROPERTY(QStringList listeAnimaux READ getAnimaux)
    Q_PROPERTY(QString animal_age READ getAgeAnimal)
    Q_PROPERTY(QString animal_type READ getTypeAnimal)

public:
    Database(QObject *parent = nullptr);
    virtual ~Database();

    //BDD
    Q_INVOKABLE bool executerRequete(QString requete);

    //Table client
    Q_INVOKABLE bool profilExist(QString email, QString mdp);
    Q_INVOKABLE bool creerCompte(QString nom, QString prenom, QString email, QString mdp);

    //Table animal
    Q_INVOKABLE bool creerAnimal(QString nomAnimal, QString naissance, QString type, QString distance, QString idUtilisateur);
    Q_INVOKABLE bool animalExist(QString nomAnimal);


    //Table client
    QString getMail();
    QString getNom();
    QString getPrenom();
    uint getIdu();
    QString getPassword();

    //Table types
    QStringList getTypes();

    //Tables animal
    QStringList getAnimaux();
    QString getAgeAnimal();
    QString getTypeAnimal();


private:
    //BDD
    QSqlDatabase db;
    bool erreurConnexion;

    //Table client
    QString email;
    QString password;
    QString mail;
    QString name;
    QString lastname;
    uint idutilisateur;
    uint idclient;
    QString mdp;

    //Table type
    QStringList listeTypes;

    //Table animal
    QStringList listeAnimaux;
    QString nom_Animal;
    QString animal_age;
    QString animal_type;

public slots:
};

#endif // DATABASE_H
