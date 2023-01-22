#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>
#include <QDebug>

class AppEngine : public QObject
{
    Q_OBJECT
public:
    explicit AppEngine(QObject *parent = nullptr);

    Q_INVOKABLE void ledOn();
    Q_INVOKABLE void ledOff();
    Q_INVOKABLE void ledFansOn();
    Q_INVOKABLE void ledFansOff();
    Q_INVOKABLE void caseFansOn();
    Q_INVOKABLE void caseFansOff();

signals:

};

#endif // APPENGINE_H
