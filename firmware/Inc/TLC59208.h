#ifndef TLC59208_H
#define TLC59208_H

#include "stm32f3xx_hal.h"

#define OFF 0x00 //off value for LED brightness control
#define ON 0xFF  //on value for LED brightness control
#define TLC59208_SLAVE_ADDRESS 0x40 // I2C slave address on nir scope

typedef struct TLC59208_configuration {
  uint8_t control;
  uint8_t mode[2];
  uint8_t pwm[8];
  uint8_t grppwm;
  uint8_t grpfreq;
  uint8_t ledout[2];
  uint8_t subadr[3];
  uint8_t allcalladr;
};

//init function
void TLC59208_init(I2C_HandleTypeDef* hi2c);

//write specific LEDs brightness
void TLC59208_writeSingleLED(I2C_HandleTypeDef* hi2c, uint8_t led, uint8_t duty_cycle);


#endif