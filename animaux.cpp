#include "animaux.h"

Animaux::Animaux(QString nom_animal, QString naissance_animal, QString type_animal, double distance, uint id_collier, QObject *parent)
{
}

uint Animaux::getId_animal() const
{
    return id_animal;
}

QString Animaux::getNom_animal() const
{
    return nom_animal;
}

QString Animaux::getNaissance_animal() const
{
    return naissance_animal.toString("Le dd/MM/yyyy");
}

QString Animaux::getType_animal() const
{
    return type_animal;
}

double Animaux::getDistance_animal() const
{
    return distance;
}

uint Animaux::getId_collier_animal() const
{
    return id_collier;
}

uint Animaux::getId_utilisateur_animal() const
{
    return id_utilisateur;
}
