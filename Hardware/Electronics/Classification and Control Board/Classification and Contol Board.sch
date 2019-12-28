EESchema Schematic File Version 4
LIBS:Classification and Contol Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6250 1450 6850 1450
Wire Wire Line
	6250 1550 6850 1550
Text Label 6500 1450 0    50   ~ 0
UART4_TX
Text Label 6500 1550 0    50   ~ 0
UART4_RX
$Comp
L MCU_ST_STM32F4:STM32F407VGTx U1
U 1 1 5E06F553
P 5350 3850
F 0 "U1" H 5350 964 50  0000 C CNN
F 1 "STM32F407VGTx" H 5350 873 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 4650 1250 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 5350 3850 50  0001 C CNN
	1    5350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1450 3800 1450
Wire Wire Line
	6250 2850 6850 2850
Wire Wire Line
	6300 2750 6850 2750
Text Label 6650 2750 0    50   ~ 0
SWDIO
Text Label 6650 2850 0    50   ~ 0
SWCLK
Wire Wire Line
	6250 3450 6850 3450
Text Label 6700 3450 0    50   ~ 0
SWO
Text Label 3800 1450 0    50   ~ 0
NRST
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 5E06F6DA
P 9900 2600
F 0 "J1" H 9873 2480 50  0000 R CNN
F 1 "Conn_01x06_Male" H 9873 2571 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 9900 2600 50  0001 C CNN
F 3 "~" H 9900 2600 50  0001 C CNN
	1    9900 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 2300 9150 2300
Wire Wire Line
	9700 2400 9150 2400
Wire Wire Line
	9700 2500 9150 2500
Wire Wire Line
	9700 2600 9150 2600
Wire Wire Line
	9700 2700 9150 2700
Wire Wire Line
	9700 2800 9150 2800
Text Label 9150 2300 0    50   ~ 0
SWO
Text Label 9150 2400 0    50   ~ 0
NRST
Text Label 9150 2500 0    50   ~ 0
SWDIO
Text Label 9150 2600 0    50   ~ 0
GND
Text Label 9150 2700 0    50   ~ 0
SWCLK
Text Label 9150 2800 0    50   ~ 0
3V3
$EndSCHEMATC
