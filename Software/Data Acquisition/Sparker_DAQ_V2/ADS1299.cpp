/*! ******************************************************************************************
 *  @file ADS1299.cpp
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


#include "pins_arduino.h"
#include "ADS1299.h"

/*! ******************************************************************************************
 * @brief Sets up the interface to the ADS1299, including SPI settings, pinmodes, etc.
 * 
 * @param[in] DRDY_pin                        - The Arduino Pin number of the Data Ready Pin
 * @param[in] CS_pin                          - The Arduino Pin number of the Chip Select Pin
 *********************************************************************************************/
void ADS1299::setup(int DRDY_pin, int CS_pin){
    
    /* Set up SPI Interface */
    pinMode(SCK, OUTPUT);                        /* Set the serial clock pin as output */
    pinMode(MOSI, OUTPUT);                       /* Set the MOSI pin as output */
    pinMode(SS, OUTPUT);                              /* Set the CS pin as output */
    
    digitalWrite(SCK, LOW);                     /* Initially set the SCLK pin to LOW */
    digitalWrite(MOSI, LOW);                        /* Initially set the MOSI pin to LOW */
    digitalWrite(SS, HIGH);                      /* Initially set the CS Pin to LOW */
    
    /* Set SPI Control Register */
    SPCR |= _BV(MSTR);                           /* Set the Arduino as SPI Master */
    SPCR |= _BV(SPE);                            /* Enable the SPI */
    
    /* Set Clock Divider */
    SPCR = (SPCR & ~SPI_CLOCK_MASK) | (SPI_CLOCK_DIV16 & SPI_CLOCK_MASK);  /* Want 1MHz SPI Clock. 16MHz / 16 = 1 MHz */
    SPSR = (SPSR & ~SPI_2XCLOCK_MASK) | ((SPI_CLOCK_DIV16 >> 2) & SPI_2XCLOCK_MASK);
    
    /* Set SPI Mode 1 (Polarity = 0, Phase = 1) */
    SPCR = (SPCR & ~SPI_MODE_MASK) | SPI_DATA_MODE;
    
    /* Set Bit Order to MSB First */
    SPCR &= ~(_BV(DORD));
       
    /* Initialise DRDY and CS Pins */
    DRDY = DRDY_pin;                               /* Save the desired Data Ready pin */
    CS = CS_pin;                                   /* Save the desired Chip Select pin */
    pinMode(DRDY, INPUT);                          /* Set the DRDY pin as an input */
    pinMode(CS, OUTPUT);                           /* Set the CS pin as an output */
    
    tCLK = 0.000666;                                /* Define the Clock period as 666ns */
    outputCount = 0;                                /* Initially the number of outputs that have occurred is 0 */
}

/*! ******************************************************************************************
 * @brief Takes the ADS1299 out of standby mode and waits the requisite number of clock cycles.
 *********************************************************************************************/
void ADS1299::WAKEUP() {
    digitalWrite(CS, LOW);                      /* Take CS LOW */
    transfer(_WAKEUP);                          /* Transfer the WAKEUP opcode */
    digitalWrite(CS, HIGH);                      /* Take CS HIGH, transmission has ended */
    delay(4.0*tCLK);                           /* Need to wait 4 clock cycles before sending another command */
}

/*! ******************************************************************************************
 * @brief Puts the ADS1299 in standby mode.
 *********************************************************************************************/
void ADS1299::STANDBY() {
    digitalWrite(CS, LOW);
    transfer(_STANDBY);
    digitalWrite(CS, HIGH);
}

/*! ******************************************************************************************
 * @brief Resets the ADS1299 and waits the requisite number of clock cycles.
 *********************************************************************************************/
void ADS1299::RESET() {
    digitalWrite(CS, LOW);                    /* Take CS LOW */
    transfer(_RESET);                              /* Transfer the RESET opcode */
    delay(10);                                 /* Wait 10ms at least */
    delay(18.0*tCLK);                        /* Wait another 18 clock cycles just to be safe */
    digitalWrite(CS, HIGH);                         /* Take CS HIGH, the transmission has ended */
}

/*! ******************************************************************************************
 * @brief Starts data conversions if the START pin is LOW 
 *********************************************************************************************/
void ADS1299::START() {
    digitalWrite(CS, LOW);            /* Take CS LOW */
    transfer(_START);                  /* Transfer the START opcode */
    digitalWrite(CS, HIGH);              /* Take CS HIGH, the transmission has ended */
}

/*! ******************************************************************************************
 * @brief Stops data conversions if the START pin is LOW
 *********************************************************************************************/
void ADS1299::STOP() {
    digitalWrite(CS, LOW);                   /* Take CS LOW */
    transfer(_STOP);                      /* Transfer the STOP opcode */
    digitalWrite(CS, HIGH);                /* Take CS HIGH, the transmission has ended */
}

/*! ******************************************************************************************
 * @brief Tells the ADS1299 to output data as soon as it's ready 
 *********************************************************************************************/
void ADS1299::RDATAC() {
    digitalWrite(CS, LOW);                 /* Take CS LOW */
    transfer(_RDATAC);                    /* Transfer the RDATAC opcode */
    digitalWrite(CS, HIGH);                    /* Take CS HIGH, the transmission has ended */
}

/*! ******************************************************************************************
 * @brief Stops continuous reading mode 
 *********************************************************************************************/
void ADS1299::SDATAC() {
    digitalWrite(CS, LOW);                     /* Take CS LOW */
    transfer(_SDATAC);                         /* Transfer the SDATAC opcode */
    digitalWrite(CS, HIGH);                    /* Take CS HIGH, the transmission has ended */
}

/*! ******************************************************************************************
 * @brief Reads a single sample from the ADS1299
 *********************************************************************************************/
void ADS1299::RDATA() {
    digitalWrite(CS, LOW);                    /* Take CS LOW */
    transfer(_RDATA);                         /* Transfer the RDATA opcode */
    digitalWrite(CS, HIGH);                  /* Take CS HIGH, the transmission has ended */
}

/*! ******************************************************************************************
 * @brief Reads the device ID from the ADS1299.
 * 
 * First stops, then enables continuous readback
 * 
 * @return int                     - The device ID
 *********************************************************************************************/
int ADS1299::getDeviceID() {
    digitalWrite(CS, LOW);                  /* Take CS LOW */
    transfer(_SDATAC);                       /* Stop continuous data reading if it is enabled */
    transfer(_RREG);                         /* Tell the ADS1299 we want to read regsiter 0*/
    transfer(0x00);                          /* We want to read 1 byte */
    byte data = transfer(0x00);              /* Generate the clock cycles so the ADS1299 can put its data on the bus */
    transfer(_RDATAC);                       /* Enable continuous data reading */
    digitalWrite(CS, HIGH);                  /* Take CS HIGH, the transmission has ended */
    return ((data & 0b00001100) >> 2);       /* Isolate the ID bits, and shift them all the way to the right */
}

/*! ******************************************************************************************
 * @brief Reads the contents of the regiter at the provided address
 * 
 * First stops, then enables continuous readback
 * 
 * @param[in] _address              - The address of the register to read
 * 
 * @return byte                     - The register contents
 *********************************************************************************************/
byte ADS1299::RREG(byte _address) {
    byte opcode1 = _RREG + _address;      /* Modify the RREG opcode to include information about the register we want to read */
    digitalWrite(CS, LOW);                         /* Take CS LOW */
    transfer(_SDATAC);                      /* Stop continuous data reading */
    transfer(opcode1);                     /* Send the ADS1299 the modified opcode */
    transfer(0x00);                          /* We want to read 1 register */
    byte data = transfer(0x00);             /* Generate the SCLK cycles so the ADS1299 can put its data on the bus */
    transfer(_RDATAC);                  /* Start continous data reading */
    digitalWrite(CS, HIGH);                    /* Take CS HIGH, the transmission has ended */
    return data;                           /* Return the received contents */
}

/*! ******************************************************************************************
 * @brief Write to a register in the ADS1299
 * 
 * @param[in] _address               - The address of the register to write to
 * @param[in] _value                 - The value to write to that address
 * 
 *********************************************************************************************/
void ADS1299::WREG(byte _address, byte _value) {
    byte opcode1 = _WREG + _address;                  /* Modify the opcode to include which address we are writing to */
    digitalWrite(CS, LOW);                            /* Take CS LOW  */
    transfer(opcode1);                                /* Transfer the modified opcode */
    transfer(0x00);                                   /* We want to read  1 register */
    transfer(_value);                                 /* Transfer the new value to the ADS1299  */
    digitalWrite(CS, HIGH);                           /* Take CS  HIGH, the transmission has ended */

}

/*! ******************************************************************************************
 * @brief Reads 1 channel sample, if data is available.
 * 
 * @return long                        - Channel 1 data if available, -1 if no data is available
 * 
 *********************************************************************************************/
long ADS1299::updateData(){
    if(digitalRead(DRDY) == LOW){                             /* If there is data available */
        digitalWrite(CS, LOW);                                /* Take CS LOW */
        long output[9];                                       /* Create the array to hold the data from the SPI bus */
        long dataPacket;                                      /* This initially holds the first trnasferred byte, then is shifted to hold the full 24 bits */
        for(int i = 0; i<9; i++){                             /* Until all 9 24 bit values have been transferred */
            for(int j = 0; j<3; j++){                         /* 24 bits is 8 bytes */
                byte dataByte = transfer(0x00);               /* Recieve a byte */
                dataPacket = (dataPacket<<8) | dataByte;      /* Shift the recieved byte up to make room for the next one */
            }
            output[i] = dataPacket;                           /* Once all the shifting is done, save the byte into the array */
            dataPacket = 0;                                   /* Reset the data packet back to 0, we need to read a new 24 bit number */
        }
        digitalWrite(CS, HIGH);                               /* Take the CS pin HIGH, the transmission has ended */
        outputCount++;                                        /* We have recieved another sample, increment the output count */
        return (output[1]);                                   /* Return the Channel 1 data */
    }
    return -1;                                                /* Otherwise, there was no data to read, return -1 */
}

/*! ******************************************************************************************
 * @brief Prints a human readable register name to the serial port
 * 
 * @param[in] address                  - The address of the register to print. Prints nothing
 *                                       if the address does not match.
 * 
 *********************************************************************************************/
void ADS1299::printRegisterName(byte address) {
    if(address == ID){
        Serial.print("ID");
    }
    else if(address == CONFIG1){
        Serial.print("CONFIG1");
    }
    else if(address == CONFIG2){
        Serial.print("CONFIG2");
    }
    else if(address == CONFIG3){
        Serial.print("CONFIG3");
    }
    else if(address == LOFF){
        Serial.print("LOFF");
    }
    else if(address == CH1SET){
        Serial.print("CH1SET");
    }
    else if(address == CH2SET){
        Serial.print("CH2SET");
    }
    else if(address == CH3SET){
        Serial.print("CH3SET");
    }
    else if(address == CH4SET){
        Serial.print("CH4SET");
    }
    else if(address == CH5SET){
        Serial.print("CH5SET");
    }
    else if(address == CH6SET){
        Serial.print("CH6SET");
    }
    else if(address == CH7SET){
        Serial.print("CH7SET");
    }
    else if(address == CH8SET){
        Serial.print("CH8SET");
    }
    else if(address == BIAS_SENSP){
        Serial.print("BIAS_SENSP");
    }
    else if(address == BIAS_SENSN){
        Serial.print("BIAS_SENSN");
    }
    else if(address == LOFF_SENSP){
        Serial.print("LOFF_SENSP");
    }
    else if(address == LOFF_SENSN){
        Serial.print("LOFF_SENSN");
    }
    else if(address == LOFF_FLIP){
        Serial.print("LOFF_FLIP");
    }
    else if(address == LOFF_STATP){
        Serial.print("LOFF_STATP");
    }
    else if(address == LOFF_STATN){
        Serial.print("LOFF_STATN");
    }
    else if(address == GPIO){
        Serial.print("GPIO");
    }
    else if(address == MISC1){
        Serial.print("MISC1");
    }
    else if(address == MISC2){
        Serial.print("MISC2");
    }
    else if(address == CONFIG4){
        Serial.print("CONFIG4");
    }
}

/*! ******************************************************************************************
 * @brief Executes a bidirectional SPI transfer
 * 
 * @param[in] data                  - A byte to send from Master to Slave
 * 
 * @returns byte                    - A byte recieved from the Slave
 * 
 *********************************************************************************************/
byte ADS1299::transfer(byte data) {
    SPDR = data;                          /* Set the output shift register to the byte to output */
    while (!(SPSR & _BV(SPIF)))           /* While the data is being output, do nothing */
        ;
    return SPDR;                          /* Return the value of the input shift register */
}
