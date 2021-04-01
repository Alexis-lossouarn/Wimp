#include "colliers.h"



Colliers::Colliers(uint id_collier, uint numero_collier, uint id_client, uint id_animal, QObject *parent)
{
}

uint Colliers::getId_collier() const
{
    return id_collier;
}

uint Colliers::getNumero_collier() const
{
    return numero_collier;
}

uint Colliers::getId_client_collier() const
{
    return id_client;
}

uint Colliers::getId_animal_collier() const
{
    return id_animal;
}
