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
	8150 1050 8750 1050
Wire Wire Line
	8150 1150 8750 1150
Text Label 8400 1050 0    50   ~ 0
UART4_TX
Text Label 8400 1150 0    50   ~ 0
UART4_RX
$Comp
L MCU_ST_STM32F4:STM32F407VGTx U1
U 1 1 5E06F553
P 7250 3450
F 0 "U1" H 7250 564 50  0000 C CNN
F 1 "STM32F407VGTx" H 7250 473 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 6550 850 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 7250 3450 50  0001 C CNN
	1    7250 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1050 5700 1050
Wire Wire Line
	8150 2450 8750 2450
Text Label 8550 2350 0    50   ~ 0
SWDIO
Text Label 8550 2450 0    50   ~ 0
SWCLK
Wire Wire Line
	8150 3050 8750 3050
Text Label 8600 3050 0    50   ~ 0
SWO
Text Label 5700 1050 0    50   ~ 0
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
Wire Wire Line
	8150 2350 8750 2350
Wire Wire Line
	8150 1650 8750 1650
Text Label 8400 1650 0    50   ~ 0
TIM3_CH1
Wire Wire Line
	8150 1750 8750 1750
Text Label 8400 1750 0    50   ~ 0
TIM3_CH2
Wire Wire Line
	8150 2750 8750 2750
Text Label 8400 2750 0    50   ~ 0
TIM3_CH3
Wire Wire Line
	8150 2850 8750 2850
Text Label 8400 2850 0    50   ~ 0
TIM3_CH4
Wire Wire Line
	6350 5650 5700 5650
Text Label 5700 5650 0    50   ~ 0
TIM4_CH1
Wire Wire Line
	6350 5750 5700 5750
Text Label 5700 5750 0    50   ~ 0
TIM4_CH2
Wire Wire Line
	6350 3650 5950 3650
$Comp
L Device:R R1
U 1 1 5E071C26
P 5800 3650
F 0 "R1" V 5593 3650 50  0000 C CNN
F 1 "R" V 5684 3650 50  0000 C CNN
F 2 "" V 5730 3650 50  0001 C CNN
F 3 "~" H 5800 3650 50  0001 C CNN
	1    5800 3650
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5E071C85
P 5500 3650
F 0 "D1" H 5491 3866 50  0000 C CNN
F 1 "LED" H 5491 3775 50  0000 C CNN
F 2 "" H 5500 3650 50  0001 C CNN
F 3 "~" H 5500 3650 50  0001 C CNN
	1    5500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3650 5200 3650
Wire Wire Line
	5200 3650 5200 4000
Wire Wire Line
	5200 4000 4950 4000
Text Label 4950 4000 0    50   ~ 0
GND
Wire Wire Line
	6350 4150 5950 4150
$Comp
L Device:R R2
U 1 1 5E07218C
P 5800 4150
F 0 "R2" V 5593 4150 50  0000 C CNN
F 1 "R" V 5684 4150 50  0000 C CNN
F 2 "" V 5730 4150 50  0001 C CNN
F 3 "~" H 5800 4150 50  0001 C CNN
	1    5800 4150
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5E072193
P 5500 4150
F 0 "D2" H 5491 4366 50  0000 C CNN
F 1 "LED" H 5491 4275 50  0000 C CNN
F 2 "" H 5500 4150 50  0001 C CNN
F 3 "~" H 5500 4150 50  0001 C CNN
	1    5500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4150 5200 4150
Wire Wire Line
	5200 4150 5200 4500
Wire Wire Line
	5200 4500 4950 4500
Text Label 4950 4500 0    50   ~ 0
GND
$Comp
L Regulator_Linear:AZ1117-3.3 U2
U 1 1 5E072D2F
P 2800 1750
F 0 "U2" H 2800 1992 50  0000 C CNN
F 1 "LDL1117S33R" H 2800 1901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2800 2000 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 2800 1750 50  0001 C CNN
	1    2800 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E073091
P 3400 1900
F 0 "C?" H 3515 1946 50  0000 L CNN
F 1 "C" H 3515 1855 50  0000 L CNN
F 2 "" H 3438 1750 50  0001 C CNN
F 3 "~" H 3400 1900 50  0001 C CNN
	1    3400 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E073130
P 3850 1900
F 0 "C?" H 3965 1946 50  0000 L CNN
F 1 "C" H 3965 1855 50  0000 L CNN
F 2 "" H 3888 1750 50  0001 C CNN
F 3 "~" H 3850 1900 50  0001 C CNN
	1    3850 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E073705
P 4300 1900
F 0 "C?" H 4415 1946 50  0000 L CNN
F 1 "C" H 4415 1855 50  0000 L CNN
F 2 "" H 4338 1750 50  0001 C CNN
F 3 "~" H 4300 1900 50  0001 C CNN
	1    4300 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E073C88
P 4750 1900
F 0 "C?" H 4865 1946 50  0000 L CNN
F 1 "C" H 4865 1855 50  0000 L CNN
F 2 "" H 4788 1750 50  0001 C CNN
F 3 "~" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E074A04
P 850 1900
F 0 "C?" H 965 1946 50  0000 L CNN
F 1 "C" H 965 1855 50  0000 L CNN
F 2 "" H 888 1750 50  0001 C CNN
F 3 "~" H 850 1900 50  0001 C CNN
	1    850  1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E074A0B
P 1300 1900
F 0 "C?" H 1415 1946 50  0000 L CNN
F 1 "C" H 1415 1855 50  0000 L CNN
F 2 "" H 1338 1750 50  0001 C CNN
F 3 "~" H 1300 1900 50  0001 C CNN
	1    1300 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E074A12
P 1750 1900
F 0 "C?" H 1865 1946 50  0000 L CNN
F 1 "C" H 1865 1855 50  0000 L CNN
F 2 "" H 1788 1750 50  0001 C CNN
F 3 "~" H 1750 1900 50  0001 C CNN
	1    1750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E074A19
P 2200 1900
F 0 "C?" H 2315 1946 50  0000 L CNN
F 1 "C" H 2315 1855 50  0000 L CNN
F 2 "" H 2238 1750 50  0001 C CNN
F 3 "~" H 2200 1900 50  0001 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2050 1300 2050
Connection ~ 1300 2050
Wire Wire Line
	1300 2050 1750 2050
Connection ~ 1750 2050
Wire Wire Line
	1750 2050 2200 2050
Connection ~ 2200 2050
Wire Wire Line
	2200 2050 2800 2050
Connection ~ 2800 2050
Wire Wire Line
	2800 2050 3400 2050
Connection ~ 3400 2050
Wire Wire Line
	3400 2050 3850 2050
Connection ~ 3850 2050
Wire Wire Line
	3850 2050 4300 2050
Connection ~ 4300 2050
Wire Wire Line
	4300 2050 4750 2050
Wire Wire Line
	4750 1750 4300 1750
Connection ~ 3400 1750
Wire Wire Line
	3400 1750 3100 1750
Connection ~ 3850 1750
Wire Wire Line
	3850 1750 3400 1750
Connection ~ 4300 1750
Wire Wire Line
	4300 1750 3850 1750
Wire Wire Line
	2500 1750 2200 1750
Connection ~ 1300 1750
Wire Wire Line
	1300 1750 850  1750
Connection ~ 1750 1750
Wire Wire Line
	1750 1750 1300 1750
Connection ~ 2200 1750
Wire Wire Line
	2200 1750 1750 1750
$EndSCHEMATC
