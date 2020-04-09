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
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "UartRingbuffer.h"
#include "cosine_transform.h"
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define EPOCH_TIME_SECONDS 1
#define REFERENCE_VOLTAGE_VOLTS 4.5
#define GAIN_SETTING 24.0
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim4;

UART_HandleTypeDef huart2;
UART_HandleTypeDef huart3;
DMA_HandleTypeDef hdma_usart2_rx;
DMA_HandleTypeDef hdma_usart3_rx;
DMA_HandleTypeDef hdma_usart3_tx;

/* USER CODE BEGIN PV */

#ifdef __GNUC__
	#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
	#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

PUTCHAR_PROTOTYPE
{
	HAL_UART_Transmit(&huart2, (uint8_t*)&ch, 1, 0xFFFF);
	return ch;
}

void user_pwm_setvalue(long value);
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_TIM4_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM3_Init(void);
static void MX_USART3_UART_Init(void);
/* USER CODE BEGIN PFP */

unsigned long allocate_sample(unsigned long*, unsigned long*, unsigned long [][524]);
int parse_sample(unsigned char [], unsigned long*, unsigned long*);
int get_time_section(unsigned int, unsigned long [], double, unsigned long, unsigned long [][524]);
unsigned long convert_twos_compliment_to_decimal(unsigned long);
double convert_sample_to_voltage(unsigned long);
void convert_epoch_to_volts(unsigned long[], double[]);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
uint32_t adc_values[7] = {0}; //to store the adc values


float get_voltage(uint32_t adc_reading) {
	return ((float)adc_reading * 3.3 / (float)32768);  // since 3.3V system and 15 bit adc resolution
}


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
  MX_DMA_Init();
  MX_TIM4_Init();
  MX_USART2_UART_Init();
  MX_ADC1_Init();
  MX_TIM3_Init();
  MX_USART3_UART_Init();
  /* USER CODE BEGIN 2 */
  HAL_ADC_Start_DMA(&hadc1, adc_values, 7); //start the adc in dma mode


  Ringbuf_init();
  HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_1);
//  long pwm_value = 0;
//  int step = 0;

  unsigned char buffer_data[40] = {0};
  int byte_num = 0;
  unsigned long all_samples[2][524];
  unsigned long current_sample = 0;
  int buffer_filled = 0;


  /* USER CODE END 2 */
 
 

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

	  if (IsDataAvailable()) {
		  if (byte_num >= 40) {
			  byte_num = 0;
		  }
		  buffer_data[byte_num] = Uart_read();

          if (buffer_data[byte_num] == '\n' || buffer_data[byte_num] == '\r') {
        	  unsigned long this_sample;
        	  unsigned long this_sample_id;
        	  printf("Parsing sample...\r\n");
        	  int parse_success = parse_sample(buffer_data, &this_sample_id, &this_sample);
        	  if (parse_success) {
        		  printf("Parsed the sample\r\n");
        		  current_sample = allocate_sample(&this_sample_id, &this_sample, all_samples);
        		  printf("\r\nSo far we have:\n\r");
        		  for (unsigned long i = 0; i <= current_sample; i++) {
        			  printf("Sample %lu:\r\n", i);
        			  printf("\tSample ID:\t %lu\r\n", all_samples[0][i]);
        			  printf("\tCH1:\t %lu\r\n", all_samples[1][i]);
        		  }
        		  if (current_sample >= (250 * EPOCH_TIME_SECONDS) - 1) {
        			  buffer_filled = 1;
        		  }
        		  if (buffer_filled) {
        			  unsigned long last_epoch[250 * EPOCH_TIME_SECONDS] = {0};
        			  double last_epoch_volts[250 * EPOCH_TIME_SECONDS] = {0};
        			  double *DCT_Coeffs;
        			  get_time_section(1, last_epoch, EPOCH_TIME_SECONDS, current_sample, all_samples);
        			  convert_epoch_to_volts(last_epoch, last_epoch_volts);
        			  DCT_Coeffs = cosine_transform_data(250 * EPOCH_TIME_SECONDS, last_epoch_volts);

        			  printf("These are the DCT Coeffs:\n\r");
        			  for (int i = 0; i < (250 * EPOCH_TIME_SECONDS); i++) {
        				  printf("\t%f\n\r", DCT_Coeffs[i]);
        			  }
        			  printf("\n\r");
        		  }

              }
          byte_num = 0;
          }
          else {
        	  byte_num++;
        	  printf("Byte Num: %d\r\n", byte_num);

          }
//		  Uart_write(data);
//		  if (data == '\r') {
//			  double* DCT_Coeffs;
//			  double signal[10] = {1.23, 1.45, 5.656, 23.65, 2.56, 34.54, 6.43, 1.34, 8.98, 10.00};
//			  DCT_Coeffs = cosine_transform_data(10, signal);
//			  for (int i = 0; i < 10; i++) {
//				  printf("This is the coefficient:");
//				  printf("%lf\r\n", DCT_Coeffs[i]);
//			  }
//		  }


	  }


//	  Uart_sendstring("CH0- ");
//	  Uart_write((adc_values[0]/1000)+48);
//	  Uart_write(((adc_values[0]%1000)/100)+48);
//	  Uart_write(((adc_values[0]%100)/10)+48);
//	  Uart_write(((adc_values[0]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("CH1- ");
//	  Uart_write((adc_values[1]/1000)+48);
//	  Uart_write(((adc_values[1]%1000)/100)+48);
//	  Uart_write(((adc_values[1]%100)/10)+48);
//	  Uart_write(((adc_values[1]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("CH2- ");
//	  Uart_write((adc_values[2]/1000)+48);
//	  Uart_write(((adc_values[2]%1000)/100)+48);
//	  Uart_write(((adc_values[2]%100)/10)+48);
//	  Uart_write(((adc_values[2]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("CH3- ");
//	  Uart_write((adc_values[3]/1000)+48);
//	  Uart_write(((adc_values[3]%1000)/100)+48);
//	  Uart_write(((adc_values[3]%100)/10)+48);
//	  Uart_write(((adc_values[3]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("CH4- ");
//	  Uart_write((adc_values[4]/1000)+48);
//	  Uart_write(((adc_values[4]%1000)/100)+48);
//	  Uart_write(((adc_values[4]%100)/10)+48);
//	  Uart_write(((adc_values[4]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("CH5- ");
//	  Uart_write((adc_values[5]/1000)+48);
//	  Uart_write(((adc_values[5]%1000)/100)+48);
//	  Uart_write(((adc_values[5]%100)/10)+48);
//	  Uart_write(((adc_values[5]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("CH6- ");
//	  Uart_write((adc_values[6]/1000)+48);
//	  Uart_write(((adc_values[6]%1000)/100)+48);
//	  Uart_write(((adc_values[6]%100)/10)+48);
//	  Uart_write(((adc_values[6]%10))+48);
//	  Uart_sendstring("\r\n");
//	  Uart_sendstring("\r\n");


//	  HAL_Delay(1000);
//	  if(pwm_value == 0) step = 100;
//	  if(pwm_value == 2000) step = -100;
//	  pwm_value += step;
//	  user_pwm_setvalue(pwm_value);
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

  /** Configure the main internal regulator output voltage 
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 168;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
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
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */
  /** Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion) 
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV4;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.ScanConvMode = ENABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 7;
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_0;
  sConfig.Rank = 1;
  sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_10;
  sConfig.Rank = 2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_11;
  sConfig.Rank = 3;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_12;
  sConfig.Rank = 4;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_13;
  sConfig.Rank = 5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_14;
  sConfig.Rank = 6;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_15;
  sConfig.Rank = 7;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 0;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 0;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */
  HAL_TIM_MspPostInit(&htim3);

}

/**
  * @brief TIM4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM4_Init(void)
{

  /* USER CODE BEGIN TIM4_Init 0 */

  /* USER CODE END TIM4_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM4_Init 1 */

  /* USER CODE END TIM4_Init 1 */
  htim4.Instance = TIM4;
  htim4.Init.Prescaler = 16;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 100;
  htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim4, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 50;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.Pulse = 0;
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM4_Init 2 */

  /* USER CODE END TIM4_Init 2 */
  HAL_TIM_MspPostInit(&htim4);

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief USART3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART3_UART_Init(void)
{

  /* USER CODE BEGIN USART3_Init 0 */

  /* USER CODE END USART3_Init 0 */

  /* USER CODE BEGIN USART3_Init 1 */

  /* USER CODE END USART3_Init 1 */
  huart3.Instance = USART3;
  huart3.Init.BaudRate = 115200;
  huart3.Init.WordLength = UART_WORDLENGTH_8B;
  huart3.Init.StopBits = UART_STOPBITS_1;
  huart3.Init.Parity = UART_PARITY_NONE;
  huart3.Init.Mode = UART_MODE_TX_RX;
  huart3.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart3.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART3_Init 2 */

  /* USER CODE END USART3_Init 2 */

}

/** 
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void) 
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Stream1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream1_IRQn);
  /* DMA1_Stream3_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);
  /* DMA1_Stream5_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream5_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream5_IRQn);
  /* DMA2_Stream0_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOE, GPIO_PIN_9|GPIO_PIN_14, GPIO_PIN_RESET);

  /*Configure GPIO pins : PE9 PE14 */
  GPIO_InitStruct.Pin = GPIO_PIN_9|GPIO_PIN_14;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */
void user_pwm_setvalue(long value)
{
    TIM_OC_InitTypeDef sConfigOC;

    sConfigOC.OCMode = TIM_OCMODE_PWM1;
    sConfigOC.Pulse = value;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
    sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
    HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_1);
}

int parse_sample(unsigned char current_sample[], unsigned long *this_sample_id, unsigned long *channel_data) {
	unsigned int channel_data_length = 0;

    printf("Function called\r\n");

	for (int i = 0; i < 40; i++) {
		if (current_sample[i] == '\n' || current_sample[i] == '\r') {
			channel_data_length = i;
			printf("CDL: %u\r\n", channel_data_length);
			break;
		}
	}
	if ((channel_data_length == 0) || (channel_data_length % 4)) { /* If there is not a multiple of 4 bytes before hitting \n */
		printf("Outta here\r\n");
		return 0;
	}

	/* Save the Sample ID */
	*this_sample_id = (current_sample[0] << 24) + (current_sample[1] << 16) + (current_sample[2] << 8) + current_sample[3];

    /* From the length of the serial buffer, calculate the number of channels */
	unsigned int number_of_channels = 1;//(channel_data_length / 4) - 1;    /* We know there is a multiple of 4, so integer divide is ok. Subtract 1 for sample ID header word */
	printf("Num channels: %u\r\n", number_of_channels);

	for (int channel = 1; channel <= number_of_channels; channel++) {
		*channel_data = (current_sample[4 * channel] << 24)
				              + (current_sample[4 * channel + 1] << 16)
							  + (current_sample[4 * channel + 2] << 8)
							  + (current_sample[4 * channel + 3]);
		printf("Just got: %lu\r\n", *channel_data);
	}


	return 1;
}

unsigned long allocate_sample(unsigned long *this_sample_id, unsigned long *this_sample_channel_data, unsigned long all_samples_channel_data[][524]) {
	static unsigned long expected_sample_id = 1;
	if (*this_sample_channel_data != expected_sample_id)
    {
		printf("Mismatched Sample IDs!\r\n");
		/* Missing data, handle appropriately */
    }

	unsigned long index = (expected_sample_id - 1) % 524;

	all_samples_channel_data[0][index] = expected_sample_id;
	all_samples_channel_data[1][index] = *this_sample_channel_data;

	expected_sample_id++;
	return index;

}

int get_time_section(unsigned int channel, unsigned long channel_data[], double seconds, unsigned long initial_index, unsigned long all_channel_data[][524]) {
	unsigned long samples_to_read = (unsigned long)(seconds * 250);

	unsigned long current_index = initial_index;
	for (unsigned long samples_left = samples_to_read; samples_left > 0; samples_left--) {
		channel_data[samples_left - 1] = all_channel_data[channel][current_index];
		if (current_index == 0) {
			current_index = 524;
		}
		current_index--;
	}
	return 1;
}

unsigned long convert_twos_compliment_to_decimal(unsigned long twos_compliment) {
	static const int MODULO = 1 << 24;
	static const int MAX_VALUE = (1 << 23) - 1;

	if (twos_compliment > MAX_VALUE) {
		twos_compliment -= MODULO;
	}
	return twos_compliment;
}

double convert_sample_to_voltage(unsigned long sample) {
	unsigned long decimal = convert_twos_compliment_to_decimal(sample);
	return (decimal * (2 * REFERENCE_VOLTAGE_VOLTS / GAIN_SETTING) / (1<<24));

}

void convert_epoch_to_volts(unsigned long epoch[], double result[]) {
	for (int i = 0; i < (250 * EPOCH_TIME_SECONDS); i++) {
		result[i] = convert_sample_to_voltage(epoch[i]);
	}
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
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
