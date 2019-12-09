/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "i2c.h"
#include "spi.h"
#include "usart.h"
#include "usb_device.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <usbd_cdc_if.h>
#include <TLC59208.h>
#include <ADS1255.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
uint8_t START_MEASUREMENT;
int32_t measurements[8];
uint8_t output_message[100];

uint8_t wakeup[20] = "WAKEUP\r\n";
uint8_t ok[20] = "CMD=OK\r\n";
uint8_t error[20] = "CMD=ERROR\r\n";
uint8_t unknown[20] = "CMD=UNKNOWN\r\n";
uint8_t cmd1[20] = "CMD=1\r\n";
uint8_t cmd2[20] = "CMD=2\r\n";
uint8_t measure_finish[20] = "MEASURE=FINISH\r\n";

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
void measurePlastic();
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */
  

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_SPI3_Init();
  MX_I2C1_Init();
  MX_USB_DEVICE_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
  HAL_Delay(500);

  //initialize led driver and analog digital converter
  TLC59208_init(&hi2c1);
  ADS1255_init(&hspi3);

  HAL_Delay(500);

  CDC_Transmit_FS(wakeup, strlen((char *)wakeup));
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    if(START_MEASUREMENT)
    {
      measurePlastic();
    }
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
    measurements[0] = ADC_read_data(&hspi3);
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL3;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB|RCC_PERIPHCLK_I2C1;
  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_HSI;
  PeriphClkInit.USBClockSelection = RCC_USBCLKSOURCE_PLL_DIV1_5;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
  HAL_RCC_MCOConfig(RCC_MCO, RCC_MCO1SOURCE_HSI, RCC_MCODIV_1);
}

/* USER CODE BEGIN 4 */
void CDC_Receive_Callback(uint8_t *buf, uint32_t len)
{

  if(strncmp((char *)buf, cmd1, strlen((char *)buf)) == 0){
  //start measurement "CMD=1"
    CDC_Transmit_FS(ok, strlen((char *)ok));
    START_MEASUREMENT = 1;

  }else{
    if(strncmp((char *)buf, cmd2, strlen((char *)buf)) == 0){
    //start demo blink lights "CMD=1"
      CDC_Transmit_FS(ok, strlen((char *)ok));
    }else{
    //the command is unknown
      CDC_Transmit_FS(unknown, strlen((char *)unknown));
    }
  }
  
  HAL_GPIO_TogglePin(orangeLED_GPIO_Port, orangeLED_Pin);
}

void measurePlastic(){
  memset(output_message,'0',sizeof(output_message));
  for(int j = 0; j<3; j++)
  {
    for(int i = 0; i<8; i++)
    {
          HAL_GPIO_TogglePin(greenLED_GPIO_Port,greenLED_Pin);
          if(j == 1){
            TLC59208_writeSingleLED(&hi2c1, i, 0xFF);
          }else{
            TLC59208_writeSingleLED(&hi2c1, i, 0x00);
          }
          measurements[i] = 0;
          measurements[i] = ADC_read_data(&hspi3);
          TLC59208_writeSingleLED(&hi2c1, i, 0x00);
    }
    
    switch(j){
      case 0:
        sprintf(output_message, "MEASURE=PRE %d %d %d %d %d %d %d %d\r\n", measurements[0], measurements[1], measurements[2], measurements[3], measurements[4], measurements[5], measurements[6], measurements[7] );
        break;
      case 1:
        sprintf(output_message, "MEASURE=VALUE %d %d %d %d %d %d %d %d\r\n", measurements[0], measurements[1], measurements[2], measurements[3], measurements[4], measurements[5], measurements[6], measurements[7] );
        break;
      case 2:
        sprintf(output_message, "MEASURE=POST %d %d %d %d %d %d %d %d\r\n", measurements[0], measurements[1], measurements[2], measurements[3], measurements[4], measurements[5], measurements[6], measurements[7] );
        break;
      default:
        sprintf(output_message, "MEASURE=OTHER %d %d %d %d %d %d %d %d\r\n", measurements[0], measurements[1], measurements[2], measurements[3], measurements[4], measurements[5], measurements[6], measurements[7] );
        break;
    }
    
    CDC_Transmit_FS(output_message, strlen((char *)output_message));
  }
  HAL_Delay(10);
  CDC_Transmit_FS(measure_finish, strlen((char *)measure_finish));
  START_MEASUREMENT = 0;
  HAL_GPIO_WritePin(greenLED_GPIO_Port,greenLED_Pin, SET);
  HAL_GPIO_WritePin(orangeLED_GPIO_Port, orangeLED_Pin, SET);

}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  while(1){}
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(char *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
