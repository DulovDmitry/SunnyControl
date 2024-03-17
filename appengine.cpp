#include "appengine.h"

#define LED1_PIN 3
#define LED2_PIN 4
#define LED_COOLERS_PIN 9
#define CASE_FANS_PIN 10

AppEngine::AppEngine(QObject *parent)
    : QObject{parent},
      m_logText(""),
      m_dateTimeFormat("[dd.MM.yyyy | hh:mm:ss]"),
      m_dateTime()
{
    writeToLog("The program has been started");

#ifdef Q_OS_LINUX
    wiringPiSetup();

    pinMode(LED1_PIN, OUTPUT);
    pinMode(LED2_PIN, OUTPUT);
    pinMode(LED_COOLERS_PIN, OUTPUT);
    pinMode(CASE_FANS_PIN, OUTPUT);

    digitalWrite(LED1_PIN, LOW);
    digitalWrite(LED2_PIN, LOW);
    digitalWrite(LED_COOLERS_PIN, LOW);
    digitalWrite(CASE_FANS_PIN, LOW);
#endif

    writeToLog("wiringPiSetup() completed");
    writeToLog("All pins are configured");

}

void AppEngine::led1On()
{
    writeToLog("LED #1 turned on");

#ifdef Q_OS_LINUX
    digitalWrite(LED1_PIN, HIGH);
#endif
}

void AppEngine::led1Off()
{
    writeToLog("LED #1 turned off");

#ifdef Q_OS_LINUX
    digitalWrite(LED1_PIN, LOW);
#endif
}

void AppEngine::led2On()
{
    writeToLog("LED #2 turned on");

#ifdef Q_OS_LINUX
    digitalWrite(LED2_PIN, HIGH);
#endif
}

void AppEngine::led2Off()
{
    writeToLog("LED #2 turned off");

#ifdef Q_OS_LINUX
    digitalWrite(LED2_PIN, LOW);
#endif
}

void AppEngine::ledCoolersOn()
{
    writeToLog("LED coolers turned on");

#ifdef Q_OS_LINUX
    digitalWrite(LED_COOLERS_PIN, HIGH);
#endif
}

void AppEngine::ledCoolersOff()
{
    writeToLog("LED coolers turned off");

#ifdef Q_OS_LINUX
    digitalWrite(LED_COOLERS_PIN, LOW);
#endif
}

void AppEngine::caseFansOn()
{
    writeToLog("Case fans turned on");

#ifdef Q_OS_LINUX
    digitalWrite(CASE_FANS_PIN, HIGH);
#endif
}

void AppEngine::caseFansOff()
{
    writeToLog("Case fans turned off");

#ifdef Q_OS_LINUX
    digitalWrite(CASE_FANS_PIN, LOW);
#endif
}

void AppEngine::writeToLog(QString logInfo)
{
    m_logText += m_dateTime.currentDateTime().toString(m_dateTimeFormat) + " " + logInfo + "\n";
    emit logTextChanged();
}

const QString &AppEngine::dateTimeFormat() const
{
    return m_dateTimeFormat;
}
