#ifndef ADS1255_H
#define ADS1255_H

#include "stm32f3xx_hal.h"
#include "main.h"


void ADS1255_reset(SPI_HandleTypeDef* hspi);
void ADS1255_init(SPI_HandleTypeDef* hspi);
uint8_t ADC_rreg(SPI_HandleTypeDef* hspi, uint16_t cmd);
int32_t ADC_read_data(SPI_HandleTypeDef* hspi);

#endif