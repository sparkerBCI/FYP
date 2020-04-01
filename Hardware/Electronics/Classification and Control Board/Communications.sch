EESchema Schematic File Version 4
LIBS:Classification and Contol Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7400 2150 2    50   Input ~ 0
TX
Wire Wire Line
	7400 2250 7100 2250
Wire Wire Line
	7400 2150 7100 2150
$Comp
L My_Regulator_Linear:MCP1755T-5002E_SOT223-5 U3
U 1 1 5EB779BE
P 5600 5000
F 0 "U3" H 5950 5165 50  0000 C CNN
F 1 "MCP1755T-5002E_SOT223-5" H 5950 5074 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-6" H 6050 4250 50  0001 C CNN
F 3 "" H 6050 4250 50  0001 C CNN
	1    5600 5000
	1    0    0    -1  
$EndComp
NoConn ~ 7100 2350
NoConn ~ 7100 2450
NoConn ~ 7100 2550
NoConn ~ 7100 2650
NoConn ~ 7100 2750
NoConn ~ 7100 2850
NoConn ~ 7100 3350
NoConn ~ 7100 3450
NoConn ~ 7100 3550
NoConn ~ 5500 3250
NoConn ~ 5500 3050
NoConn ~ 5500 2850
Wire Wire Line
	5500 2450 5250 2450
Wire Wire Line
	5500 2550 5250 2550
Text Label 5250 2450 0    50   ~ 0
D+
Text Label 5250 2550 0    50   ~ 0
D-
Text Label 3700 2450 0    50   ~ 0
GND
Wire Wire Line
	5500 3550 5500 3850
Wire Wire Line
	5000 3850 5500 3850
Connection ~ 5500 3850
Text Label 5000 3850 0    50   ~ 0
GND
Wire Wire Line
	6200 1850 6200 1550
$Comp
L Device:C C67
U 1 1 5EB79F1D
P 6950 1700
F 0 "C67" H 7050 1700 50  0000 L CNN
F 1 "100n" H 7050 1600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6988 1550 50  0001 C CNN
F 3 "~" H 6950 1700 50  0001 C CNN
	1    6950 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C65
U 1 1 5EB79F24
P 6550 1700
F 0 "C65" H 6650 1700 50  0000 L CNN
F 1 "10n" H 6650 1600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6588 1550 50  0001 C CNN
F 3 "~" H 6550 1700 50  0001 C CNN
	1    6550 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1550 6550 1550
Wire Wire Line
	6400 1850 6400 1550
Wire Wire Line
	6400 1550 6550 1550
Connection ~ 6550 1550
Wire Wire Line
	6550 1850 6950 1850
Connection ~ 6950 1850
Text Label 6750 1550 0    50   ~ 0
+5V
Text Label 7850 1850 0    50   ~ 0
GND
$Comp
L Device:C C62
U 1 1 5EB7BC88
P 4900 5350
F 0 "C62" H 5015 5396 50  0000 L CNN
F 1 "100n" H 5015 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4938 5200 50  0001 C CNN
F 3 "~" H 4900 5350 50  0001 C CNN
	1    4900 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C60
U 1 1 5EB7BDC6
P 4500 5350
F 0 "C60" H 4615 5396 50  0000 L CNN
F 1 "4.7u" H 4615 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4538 5200 50  0001 C CNN
F 3 "~" H 4500 5350 50  0001 C CNN
	1    4500 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C64
U 1 1 5EB7BE5E
P 5300 5350
F 0 "C64" H 5415 5396 50  0000 L CNN
F 1 "10n" H 5415 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5338 5200 50  0001 C CNN
F 3 "~" H 5300 5350 50  0001 C CNN
	1    5300 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C70
U 1 1 5EB7D21E
P 7400 5350
F 0 "C70" H 7515 5396 50  0000 L CNN
F 1 "100n" H 7515 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7438 5200 50  0001 C CNN
F 3 "~" H 7400 5350 50  0001 C CNN
	1    7400 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C68
U 1 1 5EB7D22C
P 7000 5350
F 0 "C68" H 7115 5396 50  0000 L CNN
F 1 "4.7u" H 7115 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7038 5200 50  0001 C CNN
F 3 "~" H 7000 5350 50  0001 C CNN
	1    7000 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C71
U 1 1 5EB7D233
P 7800 5350
F 0 "C71" H 7915 5396 50  0000 L CNN
F 1 "10n" H 7915 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7838 5200 50  0001 C CNN
F 3 "~" H 7800 5350 50  0001 C CNN
	1    7800 5350
	1    0    0    -1  
$EndComp
Connection ~ 4500 5500
Wire Wire Line
	4500 5500 4900 5500
Connection ~ 4900 5500
Wire Wire Line
	4900 5500 5300 5500
Connection ~ 5300 5500
Wire Wire Line
	5300 5500 5950 5500
Connection ~ 7000 5500
Wire Wire Line
	7000 5500 7400 5500
Connection ~ 7400 5500
Wire Wire Line
	7400 5500 7800 5500
Wire Wire Line
	5950 5350 5950 5500
Connection ~ 5950 5500
Wire Wire Line
	7800 5150 7800 5200
Wire Wire Line
	7400 5200 7400 5150
Connection ~ 7400 5150
Wire Wire Line
	7400 5150 7800 5150
Wire Wire Line
	7000 5200 7000 5150
Connection ~ 7000 5150
Wire Wire Line
	7000 5150 7400 5150
Wire Wire Line
	5500 5200 5300 5200
Connection ~ 4500 5200
Connection ~ 4900 5200
Wire Wire Line
	4900 5200 4500 5200
Connection ~ 5300 5200
Wire Wire Line
	5300 5200 4900 5200
Wire Wire Line
	5500 5100 5300 5100
Wire Wire Line
	5300 5100 5300 5200
Text HLabel 3700 5200 0    50   Input ~ 0
VIN
Text HLabel 3700 5500 0    50   Input ~ 0
GND
Text Label 6150 5500 0    50   ~ 0
GND
Text Label 7600 5150 0    50   ~ 0
+5V
$Comp
L Device:R R28
U 1 1 5EB8714C
P 8200 5150
F 0 "R28" V 7993 5150 50  0000 C CNN
F 1 "150" V 8084 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8130 5150 50  0001 C CNN
F 3 "~" H 8200 5150 50  0001 C CNN
	1    8200 5150
	0    1    1    0   
$EndComp
$Comp
L Device:LED D6
U 1 1 5EB871F6
P 8550 5300
F 0 "D6" V 8588 5183 50  0000 R CNN
F 1 "LED" V 8497 5183 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 8550 5300 50  0001 C CNN
F 3 "~" H 8550 5300 50  0001 C CNN
	1    8550 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 5500 8550 5500
Wire Wire Line
	8550 5500 8550 5450
Connection ~ 7800 5500
Wire Wire Line
	8550 5150 8350 5150
Wire Wire Line
	8050 5150 7800 5150
Connection ~ 7800 5150
$Comp
L Connector:USB_B_Mini J10
U 1 1 5EB8D146
P 5500 6950
F 0 "J10" H 5555 7417 50  0000 C CNN
F 1 "USB_B_Mini" H 5555 7326 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Wuerth_629105150521" H 5650 6900 50  0001 C CNN
F 3 "~" H 5650 6900 50  0001 C CNN
	1    5500 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7350 5500 7350
Connection ~ 5500 7350
Wire Wire Line
	5500 7350 6050 7350
Wire Wire Line
	5800 7050 6050 7050
Wire Wire Line
	5800 6950 6050 6950
NoConn ~ 5800 6750
NoConn ~ 5800 7150
Text Label 5950 6950 0    50   ~ 0
D+
Text Label 5950 7050 0    50   ~ 0
D-
Text Label 5900 7350 0    50   ~ 0
GND
Text HLabel 2050 6750 0    50   Input ~ 0
BT_TX
Text HLabel 2050 6850 0    50   Input ~ 0
BT_RX
$Comp
L Device:C C63
U 1 1 5EB9949F
P 5000 2300
F 0 "C63" H 4800 2300 50  0000 L CNN
F 1 "10n" H 4800 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5038 2150 50  0001 C CNN
F 3 "~" H 5000 2300 50  0001 C CNN
	1    5000 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C61
U 1 1 5EB994A6
P 4550 2300
F 0 "C61" H 4350 2300 50  0000 L CNN
F 1 "100n" H 4350 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4588 2150 50  0001 C CNN
F 3 "~" H 4550 2300 50  0001 C CNN
	1    4550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2150 4550 2150
Wire Wire Line
	5500 2150 5300 2150
Connection ~ 5000 2150
Connection ~ 4550 2450
Wire Wire Line
	4550 2450 5000 2450
Connection ~ 6300 3850
Wire Wire Line
	5500 3850 6100 3850
Wire Wire Line
	6300 3850 6100 3850
Connection ~ 6100 3850
Wire Wire Line
	6400 3850 6300 3850
Wire Wire Line
	6500 3850 6400 3850
Connection ~ 6400 3850
$Comp
L Interface_USB:FT232RL U4
U 1 1 5EB7785C
P 6300 2850
F 0 "U4" H 6300 2850 50  0000 C CNN
F 1 "FT232RL" H 6300 2750 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 6300 2850 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 6300 2850 50  0001 C CNN
	1    6300 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1550 5300 1550
Wire Wire Line
	5300 1550 5300 2150
Connection ~ 5300 2150
Wire Wire Line
	5300 2150 5000 2150
Text Notes 5400 1900 0    50   ~ 0
Want to drive UART\nat 3.3V  so connect \n3.3V to this pin
$Comp
L Connector:Conn_01x06_Female J9
U 1 1 5EBA19F1
P 2650 6850
F 0 "J9" H 2677 6826 50  0000 L CNN
F 1 "HC05" H 2677 6735 50  0000 L CNN
F 2 "Resonators:HC-05" H 2650 6850 50  0001 C CNN
F 3 "~" H 2650 6850 50  0001 C CNN
	1    2650 6850
	1    0    0    -1  
$EndComp
NoConn ~ 2450 6650
Text Notes 2300 6850 0    50   ~ 0
TX
Text Notes 2300 6750 0    50   ~ 0
RX
Text Notes 2200 6650 0    50   ~ 0
STATE
Text Notes 2300 7150 0    50   ~ 0
EN
Text Notes 1850 7450 0    50   ~ 0
STM32 works at 3.3V\nlevels, so don't need\na voltage divider here
Text Notes 1700 6450 0    79   ~ 0
Bluetooth Module
Text Notes 5400 6400 0    79   ~ 0
USB Port
Text Notes 5600 1400 0    79   ~ 0
UART to USB Interface
Text Notes 5250 4750 0    79   ~ 0
5V Voltage Regulator
Wire Notes Line
	3400 4600 8900 4600
Wire Notes Line
	8900 4600 8900 5700
Wire Notes Line
	8900 5700 3400 5700
Wire Notes Line
	3400 5700 3400 4600
Wire Notes Line
	3150 6200 3150 7550
Wire Notes Line
	5050 6200 6350 6200
Wire Notes Line
	6350 7550 5050 7550
Wire Notes Line
	8750 4000 8750 1150
Wire Notes Line
	3550 1150 3550 4000
Wire Notes Line
	5050 6200 5050 7550
Wire Notes Line
	6350 6200 6350 7550
Wire Notes Line
	3550 4000 8750 4000
Wire Notes Line
	3550 1150 8750 1150
Wire Wire Line
	2450 6950 2100 6950
Wire Wire Line
	2450 7050 2100 7050
Text Label 2250 7050 0    50   ~ 0
+5V
Text Label 2250 6950 0    50   ~ 0
GND
Text Notes 5450 800  0    98   ~ 20
Communications
Text Notes 8400 5100 0    50   ~ 0
+5V Status\n(Green)
Wire Wire Line
	6950 1850 8000 1850
Wire Wire Line
	3700 2450 4550 2450
Wire Wire Line
	3700 5200 4500 5200
Wire Wire Line
	3700 5500 4500 5500
Wire Wire Line
	5950 5500 7000 5500
Wire Wire Line
	6400 5150 7000 5150
NoConn ~ 7100 3150
NoConn ~ 7100 3250
Text HLabel 7400 2250 2    50   Input ~ 0
RX
NoConn ~ 2450 7150
Wire Notes Line
	1350 6200 1350 7550
Wire Wire Line
	2050 6850 2450 6850
Wire Wire Line
	2050 6750 2450 6750
Wire Notes Line
	3150 6200 1350 6200
Wire Notes Line
	1350 7550 3150 7550
$EndSCHEMATC
