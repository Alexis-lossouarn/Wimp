#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtSql>
#include <QSqlDatabase>


class mainwindow
{
public:
    mainwindow();

private:
    QSqlDatabase db;
};

#endif // MAINWINDOW_H
