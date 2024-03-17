#ifndef INA219_H
#define INA219_H

#include <iostream>
#include <linux/i2c-dev.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <bitset>

#define REG_CONFIG          0x00
#define REG_SHUNT_VOLTAGE   0x01
#define REG_BUS_VOLTAGE     0x02
#define REG_POWER           0x03
#define REG_CURRENT         0x04
#define REG_CALIBRATION     0x05

#define RESET_CONFIGURATION 0x8000

#define MODE_SHUNT_AND_BUS_CONTINUOUS   0x0007
#define SHUNT_ADC_12BIT_128SAMPLES      0x0078
#define BUS_ADC_12BIT_128SAMPLES        0x0780
#define BUS_ADC_12BIT                   0x0180
#define PGA_GAIN_8                      0x1800
#define BUS_VOLTAGE_RANGE_32V           0x2000

class INA219
{
public:
    INA219(uint8_t address);
    ~INA219();

    bool begin();
    uint16_t getVoltage();
    double getCurrent();
    uint16_t getConfig();
    uint16_t getCalibration();

private:
    uint16_t readRegister(uint8_t registerNumber);
    bool writeToRegister(uint8_t registerNumber, uint16_t value);
    bool setCalibration(uint16_t calibrationValue);
    bool setConfiguration(uint16_t configurationValue);
    bool reset();

    uint8_t m_address;
    int m_file;
};

#endif // INA219_H
