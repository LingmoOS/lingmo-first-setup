#ifndef VERSION_H
#define VERSION_H

#include <QObject>
#include <QString>
#include <QSysInfo>
#include <qqml.h>

class SysVersion : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString version READ version CONSTANT)

public:
    explicit SysVersion(QObject *parent = nullptr);

    QString version();

private:
    qlonglong calculateTotalRam() const;
};

#endif // VERSION_H