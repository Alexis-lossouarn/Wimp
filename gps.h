#ifndef GPS_H
#define GPS_H

#include <QObject>
#include <QDateTime>


class Gps : public QObject
{

    Q_OBJECT
    Q_PROPERTY(uint id_gps READ getId_gps NOTIFY gps)
    Q_PROPERTY(uint id_animal READ getId_animal_gps NOTIFY gps)
    Q_PROPERTY(uint id_collier READ getId_collier_gps NOTIFY gps)
    Q_PROPERTY(uint latitude READ getLatitude_gps NOTIFY gps)
    Q_PROPERTY(uint longitude READ getLongitude_gps NOTIFY gps)
    Q_PROPERTY(uint altitude READ getAltitude_gps NOTIFY gps)
    Q_PROPERTY(QString date READ getDate_gps NOTIFY gps)

public:
    explicit Gps(uint id_gps, uint id_animal, uint id_collier, uint latitude, uint longitude, uint altitude, QDateTime date, QObject *parent = nullptr);

    uint getId_gps() const;
    uint getId_animal_gps() const;
    uint getId_collier_gps() const;
    uint getLatitude_gps() const;
    uint getLongitude_gps() const;
    uint getAltitude_gps() const;
    QString getDate_gps() const;

private:

    uint id_gps;
    uint id_animal;
    uint id_collier;
    uint latitude;
    uint longitude;
    uint altitude;
    QDateTime date;

signals:
    void gps();
};

#endif // GPS_H
