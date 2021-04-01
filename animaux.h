#ifndef ANIMAUX_H
#define ANIMAUX_H

#include <QObject>
#include <QDate>

class Animaux : public QObject
{
    Q_OBJECT
    Q_PROPERTY(uint id_animal READ getId_animal NOTIFY animaux)
    Q_PROPERTY(QString nom READ getNom_animal NOTIFY animaux)
    Q_PROPERTY(QString naissance_animal READ getNaissance_animal NOTIFY animaux)
    Q_PROPERTY(QString type_animal READ getType_animal NOTIFY animaux)
    Q_PROPERTY(uint distance READ getDistance_animal NOTIFY animaux)
    Q_PROPERTY(uint id_collier READ getId_collier_animal NOTIFY animaux)
    Q_PROPERTY(QString id_utilisateur READ getId_utilisateur_animal NOTIFY animaux)

public:
    explicit Animaux(uint id_animal, QString nom, QDate naissance_animal, QString type_animal, uint distance, uint id_collier, uint id_utilisateur, QObject *parent = nullptr);

    uint getId_animal() const;
    QString getNom_animal() const;
    QString getNaissance_animal() const;
    QString getType_animal() const;
    uint getDistance_animal() const;
    uint getId_collier_animal() const;
    uint getId_utilisateur_animal() const;

private:
    uint id_animal;
    QString nom;
    QDate naissance_animal;
    QString type_animal;
    uint distance;
    uint id_collier;
    uint id_utilisateur;

signals:
    void animaux();

public slots:
};

#endif // ANIMAUX_H
