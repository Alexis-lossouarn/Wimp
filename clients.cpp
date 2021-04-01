#include "clients.h"

Clients::Clients(uint id_client, QString nom_client, QString prenom_client, QString email, QString password, uint id_collier, QObject *parent)
{
}

uint Clients::getId_client() const
{
    return id_client;
}

QString Clients::getNom_client() const
{
    return nom_client;
}

QString Clients::getPrenom_client() const
{
    return prenom_client;
}

QString Clients::getEmail_client() const
{
    return email;
}

QString Clients::getPassword_client() const
{
    return password;
}

uint Clients::getId_collier_client() const
{
    return id_collier_client;
}
