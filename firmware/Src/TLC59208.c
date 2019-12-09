#include "TLC59208.h"

struct TLC59208_configuration tlc_config = {
  .control = 0x80,
  .mode[0] = 0x83,
  .mode[1] = 0x03,
  .pwm[0] = 0x00,
  .pwm[1] = 0x00,
  .pwm[2] = 0x00,
  .pwm[3] = 0x00,
  .pwm[4] = 0x00,
  .pwm[5] = 0x00,
  .pwm[6] = 0x00,
  .pwm[7] = 0x00,
  .grppwm = 0xFF,
  .grpfreq = 0x00,
  .ledout[0] = 0xAA,
  .ledout[1] = 0xAA,
  .subadr[0] = 0x92,
  .subadr[1] = 0x94,
  .subadr[2] = 0x98,
  .allcalladr = 0xD0
};

uint8_t buffer[9];

void TLC59208_init(I2C_HandleTypeDef* hi2c){
  if(HAL_I2C_Master_Transmit(hi2c, TLC59208_SLAVE_ADDRESS, &tlc_config, sizeof(tlc_config), 100) != HAL_OK){
    Error_Handler();
  }
}

// led is the number of the led 1:8, duty cycle means brightness value from 0 to 255
void TLC59208_writeSingleLED(I2C_HandleTypeDef* hi2c, uint8_t led, uint8_t duty_cycle){
  buffer[0] = 0xA2;
  for(uint8_t i = 0; i < 8; i++){
    if(i == led){
      buffer[i+1] = duty_cycle;
    }
  }
  
  if(HAL_I2C_Master_Transmit(hi2c, TLC59208_SLAVE_ADDRESS, &buffer, 9, 100) != HAL_OK){
    Error_Handler();
  }
}