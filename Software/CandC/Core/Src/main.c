/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
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
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "DCT.h"
#include "svm_predict.h"

//#define PRINTING_MODEL
//#define PRINTING_COEFFS
#ifndef EPOCH_LENGTH_SAMPLES
  #define EPOCH_LENGTH_SAMPLES 256
#endif
#define CHARS_PER_SAMPLE 11
#define SVM_SCALE_FACTOR 100000
//#define EEG_SCALE_FACTOR 1
#define EEG_SCALE_FACTOR 100000
#define ADC_VREF 3.3
#define ADC_MAX_COUNT 4095
#define FEEDBACK_GAIN 6
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
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim4;

UART_HandleTypeDef huart4;
DMA_HandleTypeDef hdma_uart4_rx;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM4_Init(void);
static void MX_UART4_Init(void);
/* USER CODE BEGIN PFP */
void open_hand(void);
void close_hand(void);
double convert_ADC_to_volts(uint32_t);
double ohms_law(double, double);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

unsigned char RX_data[EPOCH_LENGTH_SAMPLES * CHARS_PER_SAMPLE] = {0};
double parsed_epoch_data[EPOCH_LENGTH_SAMPLES] = {0};
Linear_SVM_Model SVM;
uint32_t adc_values[7];        /**< The ADC Values are saved here */

int parse_buffer(void) {
	char delim[] = "\n";
	char *ptr = strtok((char*)RX_data, delim);
	int sample_number = 0;
	while(ptr != NULL)
	{
		long value = atol(ptr);
		if (SVM.complete) { // this should be svm.complete
			parsed_epoch_data[sample_number] = ((double)value) / EEG_SCALE_FACTOR;
		}
		else {
			parsed_epoch_data[sample_number] = ((double)value) / SVM_SCALE_FACTOR;
		}
		sample_number++;
		ptr = strtok(NULL, delim);
	}
	return sample_number;
}

void process_sample(double coeffs[]) {
    parse_buffer();
	// Process this epoch
	int number_of_samples = sizeof(parsed_epoch_data) / sizeof(double);

	dct_test(coeffs, parsed_epoch_data, number_of_samples);
#ifdef PRINTING_COEFFS
	//This is just printing
	for (int i = 0; i < number_of_samples; i++) {
		char data_string[CHARS_PER_SAMPLE] = {0};
		snprintf(data_string,  CHARS_PER_SAMPLE, "%010lf", coeffs[i]);
		HAL_UART_Transmit(&huart4, (unsigned char *)data_string, CHARS_PER_SAMPLE, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char *)"\n\r", 3, 0xFFFF);
	}
#endif

}

#ifdef PRINTING_MODEL
void print_model(Linear_SVM_Model* model) {
	if (model->complete) {
		char weight_str[255] = {0};
		HAL_UART_Transmit(&huart4, (unsigned char *)"Weights\n\r", 10, 0xFFFF);
		for (int i = 0; i < EPOCH_LENGTH_SAMPLES; i++) {
			snprintf(weight_str, 11, "%010ld", (long)(model->weight_vector[i]*1000));
			HAL_UART_Transmit(&huart4, (unsigned char *)weight_str, 11, 0xFFFF);
			HAL_UART_Transmit(&huart4, (unsigned char *)"\r\n", 3, 0xFFFF);
		}

		char scale_str[255] = {0};
		char offset_str[255] = {0};
		char dimension_str[255] = {0};
		snprintf(scale_str, 11, "%010ld", (long)(model->scale * 1000));
		snprintf(offset_str, 11, "%010ld", (long)(model->offset * 1000));
		snprintf(dimension_str, 11, "%010ld", (long)(model->dimension * 1000));

		HAL_UART_Transmit(&huart4, (unsigned char*)"Scale: ", 7, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char*)scale_str, 11, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char*)"\n\r", 3, 0xFFFF);

		HAL_UART_Transmit(&huart4, (unsigned char*)"Offset: ", 8, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char*)offset_str, 11, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char*)"\n\r", 3, 0xFFFF);

		HAL_UART_Transmit(&huart4, (unsigned char*)"Dimension: ", 11, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char*)dimension_str, 11, 0xFFFF);
		HAL_UART_Transmit(&huart4, (unsigned char*)"\n\r", 3, 0xFFFF);
	}

}
#endif

void build_model(void) {
	parse_buffer();
	if (SVM.has_vector == 0) {
		/* Load the weight vector */
		int number_of_weights = sizeof(parsed_epoch_data) / sizeof(double);   // Get the number of coefficients in the weight vector
		double vect[number_of_weights];      // This is an array to hold the weights once converted to double from long
		for (int i = 0; i < number_of_weights; i++) {
			vect[i] = (parsed_epoch_data[i]); // Convert the weight to double then divide by the scale factor
		}
		//SVM->weight_vector = malloc(number_of_weights * sizeof(double));
		memcpy(SVM.weight_vector, vect, sizeof(vect));   // Store the scaled weights into the model, SVM.weight_vector is no longer NULL
		SVM.has_vector = 1;
	}
	else {
		/* Load the offset, scale and dimension */
		SVM.scale = (parsed_epoch_data[0]);
		SVM.offset = (parsed_epoch_data[1]);
		SVM.dimension = (parsed_epoch_data[2]);
		SVM.complete = 1;
#ifdef PRINTING_MODEL
		print_model(SVM);
#endif
	}
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
	if (SVM.complete) { //should be complete not not complete
		double coeffs[EPOCH_LENGTH_SAMPLES] = {0};
        process_sample(coeffs);
        double prediction = Linear_SVM_Predict(&SVM, coeffs);
        if (prediction < 0) {
        	open_hand();
        }
        else {
        	close_hand();
        }
	}
	else {        //This happens when we haven't got the model yet
		/* Get the model */
		build_model();
	}
	HAL_UART_Receive_IT(&huart4, RX_data, EPOCH_LENGTH_SAMPLES * CHARS_PER_SAMPLE); // Start listening. You now have 1 epoch to process this epoch
}

void user_pwm_setvalue(long value, TIM_HandleTypeDef* timer, uint32_t channel)
{
    TIM_OC_InitTypeDef sConfigOC;

    sConfigOC.OCMode = TIM_OCMODE_PWM1;
    sConfigOC.Pulse = value;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
    sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
    HAL_TIM_PWM_ConfigChannel(timer, &sConfigOC, channel);
    HAL_TIM_PWM_Start(timer, channel);
}

void close_hand(void) {
	  user_pwm_setvalue(32, &htim3, TIM_CHANNEL_1);
	  user_pwm_setvalue(28, &htim3, TIM_CHANNEL_2);
	  user_pwm_setvalue(25, &htim3, TIM_CHANNEL_3);
	  user_pwm_setvalue(25, &htim3, TIM_CHANNEL_4);
	  user_pwm_setvalue(25, &htim4, TIM_CHANNEL_1);
}

void open_hand(void) {
	  user_pwm_setvalue(11, &htim3, TIM_CHANNEL_1);
	  user_pwm_setvalue(11, &htim3, TIM_CHANNEL_2);
	  user_pwm_setvalue(11, &htim3, TIM_CHANNEL_3);
	  user_pwm_setvalue(11, &htim3, TIM_CHANNEL_4);
	  user_pwm_setvalue(12, &htim4, TIM_CHANNEL_1);
}

double convert_ADC_to_volts(uint32_t adc_count) {
	return ((double)adc_count * ((ADC_VREF) / (ADC_MAX_COUNT)) * FEEDBACK_GAIN);
}

double ohms_law(double volts, double resistance) {
	if (resistance) {
	return (volts / resistance);
	}
	return 0;
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
  MX_ADC1_Init();
  MX_TIM3_Init();
  MX_TIM4_Init();
  MX_UART4_Init();
  /* USER CODE BEGIN 2 */
  SVM.has_vector = 0;
  SVM.complete = 0;
  HAL_UART_Receive_IT(&huart4, RX_data, EPOCH_LENGTH_SAMPLES * CHARS_PER_SAMPLE);
  HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
  close_hand();

  HAL_ADC_Start_DMA(&hadc1, adc_values, 7);    /**< Starts the ADC in DMA Mode */

  /* USER CODE END 2 */
 
 

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  HAL_UART_Receive_IT(&huart4, RX_data, EPOCH_LENGTH_SAMPLES * CHARS_PER_SAMPLE);

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	  double index_volts = convert_ADC_to_volts(adc_values[1]);    // Read voltage after index sense resistor
	  double ref_volts = convert_ADC_to_volts(adc_values[0]);        // Read voltage before sense resistors
	  double index_current = ohms_law(ref_volts - index_volts, 0.05);   // Compute voltage drop, then divide by 50mOhm sense resistor
	  index_current *= 1000;
	  char index_current_ma[30];
	  snprintf(index_current_ma, 30, "Index Current mA:\t%010ld\n", (long)index_current);

	  index_volts *= 1000;
	  char index_volts_mv[30];
	  snprintf(index_volts_mv, 28, "Index Volts mV:\t%010ld\n", (long)index_volts);

	  ref_volts *= 1000;
	  char ref_volts_mv[30];
	  snprintf(ref_volts_mv, 29, "Supply Volts mV:\t%010ld\n", (long)ref_volts);


	  HAL_UART_Transmit(&huart4, (unsigned char *)index_current_ma, 12, 0xFFFF);
	  HAL_UART_Transmit(&huart4, (unsigned char *)index_volts_mv, 12, 0xFFFF);
	  HAL_UART_Transmit(&huart4, (unsigned char *)ref_volts_mv, 12, 0xFFFF);
	  HAL_Delay(1000);


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
  sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_13;
  sConfig.Rank = 2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_12;
  sConfig.Rank = 3;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_11;
  sConfig.Rank = 4;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
  */
  sConfig.Channel = ADC_CHANNEL_10;
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
  htim3.Init.Prescaler = 4800;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 324;
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
  sConfigOC.Pulse = 20;
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
  htim4.Init.Prescaler = 4800;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 324;
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
  sConfigOC.Pulse = 20;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM4_Init 2 */

  /* USER CODE END TIM4_Init 2 */
  HAL_TIM_MspPostInit(&htim4);

}

/**
  * @brief UART4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_UART4_Init(void)
{

  /* USER CODE BEGIN UART4_Init 0 */

  /* USER CODE END UART4_Init 0 */

  /* USER CODE BEGIN UART4_Init 1 */

  /* USER CODE END UART4_Init 1 */
  huart4.Instance = UART4;
  huart4.Init.BaudRate = 38400;
  huart4.Init.WordLength = UART_WORDLENGTH_8B;
  huart4.Init.StopBits = UART_STOPBITS_1;
  huart4.Init.Parity = UART_PARITY_NONE;
  huart4.Init.Mode = UART_MODE_TX_RX;
  huart4.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart4.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart4) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN UART4_Init 2 */

  /* USER CODE END UART4_Init 2 */

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
  /* DMA1_Stream2_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream2_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream2_IRQn);
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

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

}

/* USER CODE BEGIN 4 */

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
