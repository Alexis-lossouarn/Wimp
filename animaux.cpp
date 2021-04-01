#include "animaux.h"

Animaux::Animaux(uint id_animal, QString nom, QDate naissance_animal, QString type_animal, uint distance, uint id_collier, uint id_utilisateur, QObject *parent)
{
}

uint Animaux::getId_animal() const
{
    return id_animal;
}

QString Animaux::getNom_animal() const
{
    return nom;
}

QString Animaux::getNaissance_animal() const
{
    return naissance_animal.toString("Le dd/MM/yyyy");
}

QString Animaux::getType_animal() const
{
    return type_animal;
}

uint Animaux::getDistance_animal() const
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
