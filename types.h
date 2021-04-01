#ifndef TYPES_H
#define TYPES_H

#include <QObject>

class Types : public QObject
{

    Q_OBJECT
    Q_PROPERTY(uint id_type READ getId_type NOTIFY types)
    Q_PROPERTY(QString type READ getType_type NOTIFY types)

public:
    explicit Types(uint id_type, QString type, QObject *parent = nullptr);

    uint getId_type() const;
    QString getType_type() const;

private:
    uint id_type;
    QString type;

signals:
    void types();

public slots:
};

#endif // TYPES_H
