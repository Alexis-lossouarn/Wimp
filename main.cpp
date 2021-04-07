#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Database", new Database());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QSqlQuery query("SELECT * FROM animaux");
    //query.exec("INSERT INTO clients VALUES (18, 'Lossouarn', 'Alexis', 'alexou22340@gmail.com', '1234q', 1)");
    while (query.next()) {
            uint id = query.value(0).toUInt();
            QString nom = query.value(1).toString();
            QDate naissance = query.value(2).toDate();
            QString type = query.value(3).toString();
            double distance = query.value(4).toDouble();
            uint collier = query.value(5).toUInt();
            uint util = query.value(6).toUInt();

            qDebug() << id << nom << naissance << type << distance << collier << util;
            while(query.next())
                {
                    for(int x=0; x < query.record().count(); ++x)
                    {
                        qDebug () << query.value(x);
                    }
                }
        }

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();


}
