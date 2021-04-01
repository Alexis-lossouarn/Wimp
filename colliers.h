#ifndef COLLIERS_H
#define COLLIERS_H

#include <QObject>

class Colliers : public QObject
{

    Q_OBJECT
    Q_PROPERTY(uint id_collier READ getId_collier NOTIFY colliers)
    Q_PROPERTY(uint numero_collier READ getNumero_collier NOTIFY colliers)
    Q_PROPERTY(uint id_client READ getId_client_collier NOTIFY colliers)
    Q_PROPERTY(uint id_animal READ getId_animal_collier NOTIFY colliers)

public:
    explicit Colliers(uint id_collier, uint numero_collier, uint id_client, uint id_animal, QObject *parent = nullptr);

    uint getId_collier() const;
    uint getNumero_collier() const;
    uint getId_client_collier() const;
    uint getId_animal_collier() const;

private:
    uint id_collier;
    uint numero_collier;
    uint id_client;
    uint id_animal;

signals:
    void colliers();

public slots:
};

#endif // COLLIERS_H
