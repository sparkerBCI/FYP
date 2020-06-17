/*! ******************************************************************************************
 *  @file ADS1299.h
 *
 *  @brief This file holds the ADS1299_Module class function definitions.
 *
 *  All the getters and setters are here. There are also functions to send commands to the device. 
 *  The functions to write raw data to the registers are private to try to limit what people can 
 *  throw at the device (some register bits are reserved, and may cause *undefined behaviour* 
 *  if they are changed).
 *
 *  @author Sam Parker
 *
 *  Copyright (c) Sam Parker 2020 <br/> All rights reserved.
 *
 *********************************************************************************************/

#ifndef ____ADS1299__
#define ____ADS1299__

#include <stdio.h>
#include <Arduino.h>
#include <avr/pgmspace.h>
#include "Definitions.h"


class ADS1299 {
public:

/*! ******************************************************************************************
 * @brief Sets up the interface to the ADS1299, including SPI settings, pinmodes, etc.
 * 
 * @param[in] DRDY_pin                        - The Arduino Pin number of the Data Ready Pin
 * @param[in] CS_pin                          - The Arduino Pin number of the Chip Select Pin
 *********************************************************************************************/
    void setup(int _DRDY, int _CS);
    
/*! ******************************************************************************************
 * @brief Takes the ADS1299 out of standby mode and waits the requisite number of clock cycles.
 *********************************************************************************************/
    void WAKEUP();

/*! ******************************************************************************************
 * @brief Puts the ADS1299 in standby mode.
 *********************************************************************************************/
    void STANDBY();

/*! ******************************************************************************************
 * @brief Resets the ADS1299 and waits the requisite number of clock cycles.
 *********************************************************************************************/
    void RESET();

/*! ******************************************************************************************
 * @brief Starts data conversions if the START pin is LOW 
 *********************************************************************************************/
    void START();

/*! ******************************************************************************************
 * @brief Stops data conversions if the START pin is LOW
 *********************************************************************************************/
    void STOP();
    
/*! ******************************************************************************************
 * @brief Tells the ADS1299 to output data as soon as it's ready 
 *********************************************************************************************/
    void RDATAC();

/*! ******************************************************************************************
 * @brief Stops continuous reading mode 
 *********************************************************************************************/
    void SDATAC();

/*! ******************************************************************************************
 * @brief Reads a single sample from the ADS1299
 *********************************************************************************************/
    void RDATA();
    
/*! ******************************************************************************************
 * @brief Reads the device ID from the ADS1299.
 * 
 * First stops, then enables continuous readback
 * 
 * @return int                     - The device ID
 *********************************************************************************************/
    int getDeviceID();

/*! ******************************************************************************************
 * @brief Reads the contents of the regiter at the provided address
 * 
 * First stops, then enables continuous readback
 * 
 * @param[in] _address              - The address of the register to read
 * 
 * @return byte                     - The register contents
 *********************************************************************************************/
    byte RREG(byte _address);

/*! ******************************************************************************************
 * @brief Write to a register in the ADS1299
 * 
 * @param[in] _address               - The address of the register to write to
 * @param[in] _value                 - The value to write to that address
 * 
 *********************************************************************************************/
    void WREG(byte _address, byte _value); 

/*! ******************************************************************************************
 * @brief Prints a human readable register name to the serial port
 * 
 * @param[in] address                  - The address of the register to print. Prints nothing
 *                                       if the address does not match.
 * 
 *********************************************************************************************/
    void printRegisterName(byte _address);

/*! ******************************************************************************************
 * @brief Reads 1 channel sample, if data is available.
 * 
 * @return long                        - Channel 1 data if available, -1 if no data is available
 * 
 *********************************************************************************************/
    long updateData();
    
/*! ******************************************************************************************
 * @brief Executes a bidirectional SPI transfer
 * 
 * @param[in] data                  - A byte to send from Master to Slave
 * 
 * @returns byte                    - A byte recieved from the Slave
 * 
 *********************************************************************************************/
    byte transfer(byte _data);
    
    float tCLK;                               /**< The ADs1299 clock period */
    int DRDY, CS;                             /**< The Arduino Pin Numbers of the Data Ready and Chip Select pins respectively */
    unsigned long outputCount;                /**< The number of samples that have been output */
    
};

#endif
