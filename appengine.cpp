#include "appengine.h"

#define LED_PIN 19
#define LED_FANS_PIN 20
#define CASE_FANS_PIN 22

AppEngine::AppEngine(QObject *parent)
    : QObject{parent}
{
    wiringPiSetup();
//    pinMode(LED_PIN, OUTPUT);
//    pinMode(LED_FANS_PIN, OUTPUT);
//    pinMode(CASE_FANS_PIN, OUTPUT);
//    digitalWrite(LED_PIN, LOW);
//    digitalWrite(LED_FANS_PIN, LOW);
//    digitalWrite(CASE_FANS_PIN, LOW);
}

void AppEngine::ledOn()
{
    qDebug() << "LED on";
    //digitalWrite(LED_PIN, HIGH);

}

void AppEngine::ledOff()
{
    qDebug() << "LED off";
    //digitalWrite(LED_PIN, LOW);
}

void AppEngine::ledFansOn()
{
    qDebug() << "LED fans on";
    //digitalWrite(LED_FANS_PIN, HIGH);
}

void AppEngine::ledFansOff()
{
    qDebug() << "LED fans off";
    //digitalWrite(LED_FANS_PIN, LOW);
}

void AppEngine::caseFansOn()
{
    qDebug() << "Case fans on";
    //digitalWrite(CASE_FANS_PIN, HIGH);
}

void AppEngine::caseFansOff()
{
    qDebug() << "Case fans off";
    //digitalWrite(CASE_FANS_PIN, LOW);
}
