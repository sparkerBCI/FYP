EESchema Schematic File Version 4
LIBS:Classification and Contol Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7400 2150 2    79   Input ~ 0
TX
Text HLabel 7400 2250 2    79   Output ~ 0
RX
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
F 2 "" H 6050 4250 50  0001 C CNN
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
$Comp
L Device:R R26
U 1 1 5EB78162
P 7750 2900
F 0 "R26" H 7820 2946 50  0000 L CNN
F 1 "150" H 7820 2855 50  0000 L CNN
F 2 "" V 7680 2900 50  0001 C CNN
F 3 "~" H 7750 2900 50  0001 C CNN
	1    7750 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R27
U 1 1 5EB781D1
P 8150 2900
F 0 "R27" H 8220 2946 50  0000 L CNN
F 1 "150" H 8220 2855 50  0000 L CNN
F 2 "" V 8080 2900 50  0001 C CNN
F 3 "~" H 8150 2900 50  0001 C CNN
	1    8150 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5EB782E5
P 7750 2400
F 0 "D4" V 7788 2283 50  0000 R CNN
F 1 "LED" V 7697 2283 50  0000 R CNN
F 2 "" H 7750 2400 50  0001 C CNN
F 3 "~" H 7750 2400 50  0001 C CNN
	1    7750 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D5
U 1 1 5EB78376
P 8150 2400
F 0 "D5" V 8188 2283 50  0000 R CNN
F 1 "LED" V 8097 2283 50  0000 R CNN
F 2 "" H 8150 2400 50  0001 C CNN
F 3 "~" H 8150 2400 50  0001 C CNN
	1    8150 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 2550 7750 2750
Wire Wire Line
	8150 2550 8150 2750
Wire Wire Line
	7750 2250 7750 2100
Wire Wire Line
	7750 2100 8150 2100
Wire Wire Line
	8150 2100 8150 2250
Text Label 7850 2100 0    50   ~ 0
+5V
Text Label 5000 3850 0    50   ~ 0
GND
Wire Wire Line
	7750 3150 7750 3050
Wire Wire Line
	8150 3250 8150 3050
Wire Wire Line
	7750 3150 7100 3150
Wire Wire Line
	7100 3250 8150 3250
Wire Wire Line
	6200 1850 6200 1550
$Comp
L Device:C C69
U 1 1 5EB79F16
P 7400 1700
F 0 "C69" H 7500 1700 50  0000 L CNN
F 1 "10u" H 7500 1600 50  0000 L CNN
F 2 "" H 7438 1550 50  0001 C CNN
F 3 "~" H 7400 1700 50  0001 C CNN
	1    7400 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C67
U 1 1 5EB79F1D
P 6950 1700
F 0 "C67" H 7050 1700 50  0000 L CNN
F 1 "100n" H 7050 1600 50  0000 L CNN
F 2 "" H 6988 1550 50  0001 C CNN
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
F 2 "" H 6588 1550 50  0001 C CNN
F 3 "~" H 6550 1700 50  0001 C CNN
	1    6550 1700
	1    0    0    -1  
$EndComp
Connection ~ 6950 1550
Wire Wire Line
	6950 1550 6550 1550
Wire Wire Line
	7400 1550 6950 1550
Wire Wire Line
	6400 1850 6400 1550
Wire Wire Line
	6400 1550 6550 1550
Connection ~ 6550 1550
Wire Wire Line
	6550 1850 6950 1850
Connection ~ 6950 1850
Wire Wire Line
	6950 1850 7400 1850
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
F 2 "" H 4938 5200 50  0001 C CNN
F 3 "~" H 4900 5350 50  0001 C CNN
	1    4900 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C58
U 1 1 5EB7BD4E
P 4100 5350
F 0 "C58" H 4215 5396 50  0000 L CNN
F 1 "10u" H 4215 5305 50  0000 L CNN
F 2 "" H 4138 5200 50  0001 C CNN
F 3 "~" H 4100 5350 50  0001 C CNN
	1    4100 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C60
U 1 1 5EB7BDC6
P 4500 5350
F 0 "C60" H 4615 5396 50  0000 L CNN
F 1 "4.7u" H 4615 5305 50  0000 L CNN
F 2 "" H 4538 5200 50  0001 C CNN
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
F 2 "" H 5338 5200 50  0001 C CNN
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
F 2 "" H 7438 5200 50  0001 C CNN
F 3 "~" H 7400 5350 50  0001 C CNN
	1    7400 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C66
U 1 1 5EB7D225
P 6600 5350
F 0 "C66" H 6715 5396 50  0000 L CNN
F 1 "10u" H 6715 5305 50  0000 L CNN
F 2 "" H 6638 5200 50  0001 C CNN
F 3 "~" H 6600 5350 50  0001 C CNN
	1    6600 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C68
U 1 1 5EB7D22C
P 7000 5350
F 0 "C68" H 7115 5396 50  0000 L CNN
F 1 "4.7u" H 7115 5305 50  0000 L CNN
F 2 "" H 7038 5200 50  0001 C CNN
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
F 2 "" H 7838 5200 50  0001 C CNN
F 3 "~" H 7800 5350 50  0001 C CNN
	1    7800 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5500 4500 5500
Connection ~ 4500 5500
Wire Wire Line
	4500 5500 4900 5500
Connection ~ 4900 5500
Wire Wire Line
	4900 5500 5300 5500
Connection ~ 5300 5500
Wire Wire Line
	5300 5500 5950 5500
Connection ~ 6600 5500
Wire Wire Line
	6600 5500 7000 5500
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
	5950 5500 6600 5500
Wire Wire Line
	6400 5150 6600 5150
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
	6600 5200 6600 5150
Connection ~ 6600 5150
Wire Wire Line
	6600 5150 7000 5150
Wire Wire Line
	5500 5200 5300 5200
Connection ~ 4500 5200
Wire Wire Line
	4500 5200 4100 5200
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
Wire Wire Line
	4100 5200 3700 5200
Connection ~ 4100 5200
Text HLabel 3700 5500 0    50   Input ~ 0
GND
Wire Wire Line
	4100 5500 3700 5500
Connection ~ 4100 5500
Text Label 6150 5500 0    50   ~ 0
GND
Text Label 7600 5150 0    50   ~ 0
+5V
$Comp
L Device:R R28
U 1 1 5EB8714C
P 8200 5150
F 0 "R28" V 7993 5150 50  0000 C CNN
F 1 "R" V 8084 5150 50  0000 C CNN
F 2 "" V 8130 5150 50  0001 C CNN
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
F 2 "" H 8550 5300 50  0001 C CNN
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
F 2 "" H 5650 6900 50  0001 C CNN
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
$Comp
L My_Switch:SW_DIP_x02 SW3
U 1 1 5EB95A02
P 1800 7000
F 0 "SW3" H 1800 7367 50  0000 C CNN
F 1 "BT Enable" H 1800 7276 50  0000 C CNN
F 2 "" H 1800 7000 50  0001 C CNN
F 3 "" H 1800 7000 50  0001 C CNN
	1    1800 7000
	1    0    0    -1  
$EndComp
Text HLabel 1500 7000 0    50   Input ~ 0
TX
Text HLabel 1500 6900 0    50   Input ~ 0
RX
$Comp
L Device:C C63
U 1 1 5EB9949F
P 5000 2300
F 0 "C63" H 4800 2300 50  0000 L CNN
F 1 "10n" H 4800 2200 50  0000 L CNN
F 2 "" H 5038 2150 50  0001 C CNN
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
F 2 "" H 4588 2150 50  0001 C CNN
F 3 "~" H 4550 2300 50  0001 C CNN
	1    4550 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C59
U 1 1 5EB994AD
P 4150 2300
F 0 "C59" H 3950 2300 50  0000 L CNN
F 1 "10u" H 3950 2200 50  0000 L CNN
F 2 "" H 4188 2150 50  0001 C CNN
F 3 "~" H 4150 2300 50  0001 C CNN
	1    4150 2300
	1    0    0    -1  
$EndComp
Connection ~ 4550 2150
Wire Wire Line
	4550 2150 4150 2150
Wire Wire Line
	5000 2150 4550 2150
Wire Wire Line
	5500 2150 5300 2150
Connection ~ 5000 2150
Wire Wire Line
	3700 2450 4150 2450
Connection ~ 4150 2450
Wire Wire Line
	4150 2450 4550 2450
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
P 2800 6800
F 0 "J9" H 2827 6776 50  0000 L CNN
F 1 "HC05" H 2827 6685 50  0000 L CNN
F 2 "" H 2800 6800 50  0001 C CNN
F 3 "~" H 2800 6800 50  0001 C CNN
	1    2800 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6900 2600 6900
Wire Wire Line
	2600 7000 2100 7000
NoConn ~ 2600 7100
NoConn ~ 2600 6600
Text Notes 2450 6900 0    50   ~ 0
TX
Text Notes 2450 7000 0    50   ~ 0
RX
Text Notes 2350 7100 0    50   ~ 0
STATE
Text Notes 2450 6600 0    50   ~ 0
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
	1200 6200 3150 6200
Wire Notes Line
	3150 6200 3150 7550
Wire Notes Line
	3150 7550 1200 7550
Wire Notes Line
	1200 7550 1200 6200
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
Text Notes 7350 2600 0    50   ~ 0
USB_RX\n(Red)
Text Notes 8350 2650 0    50   ~ 0
USB_TX\n(Green)
Text Notes 7700 3700 0    50   ~ 0
2V LED Voltage\n20mA\n5V - 2V = 3V\n3V / 20mA = 150 Ohms
Wire Notes Line
	3550 4000 8750 4000
Wire Notes Line
	3550 1150 8750 1150
Wire Wire Line
	2600 6800 2250 6800
Wire Wire Line
	2600 6700 2250 6700
Text Label 2400 6700 0    50   ~ 0
+5V
Text Label 2400 6800 0    50   ~ 0
GND
Wire Wire Line
	7400 1850 8000 1850
Connection ~ 7400 1850
Text Notes 5450 800  0    98   ~ 20
Communications
$EndSCHEMATC
