#include "appengine.h"

AppEngine::AppEngine(QObject *parent)
    : QObject{parent}
{

}

void AppEngine::ledOn()
{
    qDebug() << "LED on";
}

void AppEngine::ledOff()
{
    qDebug() << "LED off";
}

void AppEngine::ledFansOn()
{
    qDebug() << "LED fans on";
}

void AppEngine::ledFansOff()
{
    qDebug() << "LED fans off";
}

void AppEngine::caseFansOn()
{
    qDebug() << "Case fans on";
}

void AppEngine::caseFansOff()
{
    qDebug() << "Case fans off";
}
