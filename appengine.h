#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>
#include <QDebug>
#include <QDateTime>

#ifdef Q_OS_LINUX
#include <wiringPi.h>
#include "/home/sunny/wiringOP/wiringPi/wiringPi.h"
#endif

class AppEngine : public QObject
{
    Q_OBJECT
public:
    explicit AppEngine(QObject *parent = nullptr);

    Q_INVOKABLE void led1On();
    Q_INVOKABLE void led1Off();
    Q_INVOKABLE void led2On();
    Q_INVOKABLE void led2Off();
    Q_INVOKABLE void ledCoolersOn();
    Q_INVOKABLE void ledCoolersOff();
    Q_INVOKABLE void caseFansOn();
    Q_INVOKABLE void caseFansOff();

    QString logText() {return m_logText;}
    const QString &dateTimeFormat() const;

    Q_PROPERTY(QString logText READ logText WRITE writeToLog NOTIFY logTextChanged)
    Q_PROPERTY(QString dateTimeFormat READ dateTimeFormat CONSTANT)

public slots:
    void writeToLog(QString logInfo);

private:
    QString m_logText;
    QString m_dateTimeFormat;
    QDateTime m_dateTime;


signals:
    void logTextChanged();

};

#endif // APPENGINE_H
