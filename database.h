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
    Q_PROPERTY(QStringList listedatesanimaux READ getDatesanimaux)
    Q_PROPERTY(QStringList listetypesanimaux READ getTypesanimaux)
    Q_PROPERTY(QStringList listeAnimaux READ getAnimaux_list)
    Q_PROPERTY(QString typeanimal READ getTypeanimal)

public:
    Database(QObject *parent = nullptr);
    virtual ~Database();

    //BDD
    Q_INVOKABLE bool executerRequete(QString requete);

    //Table client
    Q_INVOKABLE bool profilExist(QString email, QString mdp);
    Q_INVOKABLE bool creerCompte(QString nom, QString prenom, QString email, QString mdp);

    //Table animal
    Q_INVOKABLE bool creerAnimal(QString nomAnimal, QString naissance, QString type, QString distance);
    Q_INVOKABLE bool animalExist(QString nomAnimal);


    //Table client
    QString getMail();
    QString getNom();
    QString getPrenom();
    uint getIdu();
    QString getPassword();

    //Table types
    QStringList getTypes();

    //Table animaux
    QStringList getTypesanimaux();
    QStringList getDatesanimaux();
    QStringList getAnimaux_list();
    QString getTypeanimal();


private:
    //BDD
    QSqlDatabase db;
    bool erreurConnexion;

    //Table client
    QString email;
    QString mail;
    QString password;
    QString mdp;
    int id_client;
    QString name;
    QString lastname;

    //Table type
    QStringList listeTypes;

    //Table animal
    QStringList listeAnimaux;
    QStringList listetypesanimaux;
    QStringList listedatesanimaux;
    QString nom_Animal;
    int id_animal;
    QString date_animal;
    QString type_animal;

    bool recuperer(QString requete, QStringList &donnees);

public slots:
};

#endif // DATABASE_H
