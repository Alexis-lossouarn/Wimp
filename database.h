#ifndef DATABASE_H
#define DATABASE_H

#define DRIVER_BDD QString("QPSQL")
#define IP_BDD QString("192.168.15.145")
#define USER_BDD QString("postgres")
#define PASSWORD_BDD QString("root")
#define NOM_BDD QString("wimp")

#include <QtSql>

class Database : public QObject
{

    Q_OBJECT
    //Table client
    Q_PROPERTY(QString mail READ getMail)
    Q_PROPERTY(QString name READ getNom NOTIFY profilUpdated)
    Q_PROPERTY(QString lastname READ getPrenom NOTIFY profilUpdated)
    Q_PROPERTY(uint idutilisateur READ getIdu)
    Q_PROPERTY(QString mdp READ getPassword)

    //Table type
    Q_PROPERTY(QStringList listeTypes READ getTypes)

    //Table animal
    Q_PROPERTY(QStringList listeAnimaux READ getAnimaux_list)
    Q_PROPERTY(QString typeanimal READ getAnimal_type NOTIFY animalChanged)
    Q_PROPERTY(QString ageanimal READ getAnimal_age NOTIFY animalChanged)
    Q_PROPERTY(QVariant animaux READ getAnimaux NOTIFY animauxChanged)

public:
    Database(QObject *parent = nullptr);
    virtual ~Database();

    //BDD
    Q_INVOKABLE bool executerRequete(QString requete);

    //Table client
    Q_INVOKABLE bool profilExist(QString email, QString mdp);
    Q_INVOKABLE bool creerCompte(QString nom, QString prenom, QString email, QString mdp);
    Q_INVOKABLE bool deconnexion();

    //Table animal
    Q_INVOKABLE bool creerAnimal(QString nomAnimal, QString naissance, QString type, QString distance);
    Q_INVOKABLE bool animalExist(QString nomAnimal);
    Q_INVOKABLE bool lireAnimal();


    //Table client
    QString getMail();
    QString getNom();
    QString getPrenom();
    uint getIdu();
    QString getPassword();

    //Table types
    QStringList getTypes();

    //Table animaux
    QStringList getAnimaux_list();
    QString getAnimal_type();
    QString getAnimal_age();
    QVariant getAnimaux();


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
    QString nom_Animal;
    int id_animal;
    QString date_animal;
    QString type_animal;
    QList<QObject*> animaux;
    QString animal;


    bool recuperer(QString requete, QStringList &donnees);
    bool recuperer(QString requete, QVector<QStringList> &donnees);
    bool recuperer(QString requete, QString &donnees);

signals:
    void animalChanged();
    void utilisateurChanged();
    void animauxChanged();
    void profilUpdated();
    void colliersUpdated();
    void animauxUpdated();
};

#endif // DATABASE_H
