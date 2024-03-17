#include "ina219.h"

INA219::INA219(uint8_t address)
{
    m_address = address;
}

INA219::~INA219()
{

}

bool INA219::begin()
{
    int file;
    char filename[20];
    snprintf(filename, 19, "/dev/i2c-0");

    file = open(filename, O_RDWR);
    if (file < 0) {
        return false;
    }

    m_file = file;

    if (ioctl(file, I2C_SLAVE, m_address) < 0) {
        return false;
    }

    if (!reset()) {
        return false;
    }

    u_int16_t configuration = 0;
    configuration |= MODE_SHUNT_AND_BUS_CONTINUOUS;
    configuration |= SHUNT_ADC_12BIT_128SAMPLES;
    configuration |= BUS_ADC_12BIT_128SAMPLES;
    configuration |= PGA_GAIN_8;
    configuration |= BUS_VOLTAGE_RANGE_32V;

    if (!setConfiguration(configuration)) {
        return false;
    }

    if (!setCalibration(4096)) {
        return false;
    }

    return true;
}

uint16_t INA219::getVoltage()
{
    uint16_t res = readRegister(REG_BUS_VOLTAGE);

    // discard service bits and multiply by 4 in order to convert to mV
    res = ((res >> 3) << 2);

    return res;
}

double INA219::getCurrent()
{
    // get value from register, 100 uA per bit
    // the value obtained can be negative
    int16_t val = static_cast<int16_t>(readRegister(REG_CURRENT));

    // convert to mA: current = val * 100 uA / 1000
    return static_cast<double>(val) / 10;
}

uint16_t INA219::getConfig()
{
    return readRegister(REG_CONFIG);
}

uint16_t INA219::getCalibration()
{
    return readRegister(REG_CALIBRATION);
}

uint16_t INA219::readRegister(uint8_t registerNumber)
{
    uint16_t readValue;
    char buf[2] = {0};
    buf[0] = registerNumber;

    if(write(m_file, buf, 1) != 1) {
        return 0;
    }

    if (read(m_file, buf, 2) != 2) {
        return 0;
    }

    readValue = (buf[0] << 8) + buf[1];
    return readValue;
}

bool INA219::writeToRegister(uint8_t registerNumber, uint16_t value)
{
    uint8_t buf[3] = {0};
    buf[0] = registerNumber;
    buf[1] = value >> 8;
    buf[2] = value & 0xff;

    if(write(m_file, buf, 3) != 3) {
        return false;
    } else {
        return true;
    }
}

bool INA219::setCalibration(uint16_t calibrationValue)
{
    return writeToRegister(REG_CALIBRATION, calibrationValue);
}

bool INA219::setConfiguration(uint16_t configurationValue)
{
    return writeToRegister(REG_CONFIG, configurationValue);
}

bool INA219::reset()
{
    return writeToRegister(REG_CONFIG, RESET_CONFIGURATION);
}
