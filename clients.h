#ifndef CLIENTS_H
#define CLIENTS_H

#include <QObject>

class Clients : public QObject
{

    Q_OBJECT
    Q_PROPERTY(uint id_client READ getId_client NOTIFY clients)
    Q_PROPERTY(QString nom_client READ getNom_client NOTIFY clients)
    Q_PROPERTY(QString prenom_client READ getPrenom_client NOTIFY clients)
    Q_PROPERTY(QString email READ getEmail_client NOTIFY clients)
    Q_PROPERTY(QString password READ getPassword_client NOTIFY clients)
    Q_PROPERTY(uint id_collier READ getId_collier_client NOTIFY clients)

public:
    explicit Clients(uint id_client, QString nom_client, QString prenom_client, QString email, QString password, uint id_collier, QObject *parent = nullptr);

    uint getId_client() const;
    QString getNom_client() const;
    QString getPrenom_client() const;
    QString getEmail_client() const;
    QString getPassword_client() const;
    uint getId_collier_client() const;

private:
    uint id_client;
    QString nom_client;
    QString prenom_client;
    QString email;
    QString password;
    uint id_collier_client;

signals:
    void clients();

public slots:
};

#endif // CLIENTS_H
