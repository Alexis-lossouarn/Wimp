#include "gps.h"

Gps::Gps(uint id_gps, uint id_animal, uint id_collier, uint latitude, uint longitude, uint altitude, QDateTime date, QObject *parent)
{
}

uint Gps::getId_gps() const
{
    return id_gps;
}

uint Gps::getId_animal_gps() const
{
    return id_animal;
}

uint Gps::getId_collier_gps() const
{
    return id_collier;
}

uint Gps::getLatitude_gps() const
{
    return latitude;
}

uint Gps::getLongitude_gps() const
{
    return longitude;
}

uint Gps::getAltitude_gps() const
{
    return altitude;
}

QString Gps::getDate_gps() const
{
    return date.toString("Le dd/MM/yyyy à hh:mm");
}
