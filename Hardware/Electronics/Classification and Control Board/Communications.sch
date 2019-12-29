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
Text HLabel 9950 4600 2    79   Input ~ 0
TX
Text HLabel 9950 4700 2    79   Output ~ 0
RX
Wire Wire Line
	9950 4700 9650 4700
Wire Wire Line
	9950 4600 9650 4600
$Comp
L My_Regulator_Linear:MCP1755T-5002E_SOT223-5 U?
U 1 1 5EB779BE
P 3150 6200
F 0 "U?" H 3500 6365 50  0000 C CNN
F 1 "MCP1755T-5002E_SOT223-5" H 3500 6274 50  0000 C CNN
F 2 "" H 3600 5450 50  0001 C CNN
F 3 "" H 3600 5450 50  0001 C CNN
	1    3150 6200
	1    0    0    -1  
$EndComp
NoConn ~ 9650 4800
NoConn ~ 9650 4900
NoConn ~ 9650 5000
NoConn ~ 9650 5100
NoConn ~ 9650 5200
NoConn ~ 9650 5300
NoConn ~ 9650 5800
NoConn ~ 9650 5900
NoConn ~ 9650 6000
NoConn ~ 8050 5700
NoConn ~ 8050 5500
NoConn ~ 8050 5300
Wire Wire Line
	8050 4900 7800 4900
Wire Wire Line
	8050 5000 7800 5000
Text Label 7800 4900 0    50   ~ 0
D+
Text Label 7800 5000 0    50   ~ 0
D-
Text Label 6250 4900 0    50   ~ 0
GND
Wire Wire Line
	8050 6000 8050 6300
Wire Wire Line
	7550 6300 8050 6300
Connection ~ 8050 6300
$Comp
L Device:R R?
U 1 1 5EB78162
P 10300 5350
F 0 "R?" H 10370 5396 50  0000 L CNN
F 1 "R" H 10370 5305 50  0000 L CNN
F 2 "" V 10230 5350 50  0001 C CNN
F 3 "~" H 10300 5350 50  0001 C CNN
	1    10300 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EB781D1
P 10700 5350
F 0 "R?" H 10770 5396 50  0000 L CNN
F 1 "R" H 10770 5305 50  0000 L CNN
F 2 "" V 10630 5350 50  0001 C CNN
F 3 "~" H 10700 5350 50  0001 C CNN
	1    10700 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5EB782E5
P 10300 4850
F 0 "D?" V 10338 4733 50  0000 R CNN
F 1 "LED" V 10247 4733 50  0000 R CNN
F 2 "" H 10300 4850 50  0001 C CNN
F 3 "~" H 10300 4850 50  0001 C CNN
	1    10300 4850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5EB78376
P 10700 4850
F 0 "D?" V 10738 4733 50  0000 R CNN
F 1 "LED" V 10647 4733 50  0000 R CNN
F 2 "" H 10700 4850 50  0001 C CNN
F 3 "~" H 10700 4850 50  0001 C CNN
	1    10700 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10300 5000 10300 5200
Wire Wire Line
	10700 5000 10700 5200
Wire Wire Line
	10300 4700 10300 4550
Wire Wire Line
	10300 4550 10700 4550
Wire Wire Line
	10700 4550 10700 4700
Text Label 10400 4550 0    50   ~ 0
+5V
Text Label 7550 6300 0    50   ~ 0
GND
Wire Wire Line
	10300 5600 10300 5500
Wire Wire Line
	10700 5700 10700 5500
Wire Wire Line
	10300 5600 9650 5600
Wire Wire Line
	9650 5700 10700 5700
Wire Wire Line
	8750 4300 8750 4000
$Comp
L Device:C C?
U 1 1 5EB79F16
P 9950 4150
F 0 "C?" H 10050 4150 50  0000 L CNN
F 1 "10u" H 10050 4050 50  0000 L CNN
F 2 "" H 9988 4000 50  0001 C CNN
F 3 "~" H 9950 4150 50  0001 C CNN
	1    9950 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB79F1D
P 9500 4150
F 0 "C?" H 9600 4150 50  0000 L CNN
F 1 "100n" H 9600 4050 50  0000 L CNN
F 2 "" H 9538 4000 50  0001 C CNN
F 3 "~" H 9500 4150 50  0001 C CNN
	1    9500 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB79F24
P 9100 4150
F 0 "C?" H 9200 4150 50  0000 L CNN
F 1 "10n" H 9200 4050 50  0000 L CNN
F 2 "" H 9138 4000 50  0001 C CNN
F 3 "~" H 9100 4150 50  0001 C CNN
	1    9100 4150
	1    0    0    -1  
$EndComp
Connection ~ 9500 4000
Wire Wire Line
	9500 4000 9100 4000
Wire Wire Line
	9950 4000 9500 4000
Wire Wire Line
	8950 4300 8950 4000
Wire Wire Line
	8950 4000 9100 4000
Connection ~ 9100 4000
Wire Wire Line
	9100 4300 9500 4300
Connection ~ 9500 4300
Wire Wire Line
	9500 4300 9950 4300
Text Label 9300 4000 0    50   ~ 0
+5V
Text Label 9800 4300 0    50   ~ 0
GND
$Comp
L Device:C C?
U 1 1 5EB7BC88
P 2450 6550
F 0 "C?" H 2565 6596 50  0000 L CNN
F 1 "100n" H 2565 6505 50  0000 L CNN
F 2 "" H 2488 6400 50  0001 C CNN
F 3 "~" H 2450 6550 50  0001 C CNN
	1    2450 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7BD4E
P 1650 6550
F 0 "C?" H 1765 6596 50  0000 L CNN
F 1 "10u" H 1765 6505 50  0000 L CNN
F 2 "" H 1688 6400 50  0001 C CNN
F 3 "~" H 1650 6550 50  0001 C CNN
	1    1650 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7BDC6
P 2050 6550
F 0 "C?" H 2165 6596 50  0000 L CNN
F 1 "4.7u" H 2165 6505 50  0000 L CNN
F 2 "" H 2088 6400 50  0001 C CNN
F 3 "~" H 2050 6550 50  0001 C CNN
	1    2050 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7BE5E
P 2850 6550
F 0 "C?" H 2965 6596 50  0000 L CNN
F 1 "10n" H 2965 6505 50  0000 L CNN
F 2 "" H 2888 6400 50  0001 C CNN
F 3 "~" H 2850 6550 50  0001 C CNN
	1    2850 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7D21E
P 4950 6550
F 0 "C?" H 5065 6596 50  0000 L CNN
F 1 "100n" H 5065 6505 50  0000 L CNN
F 2 "" H 4988 6400 50  0001 C CNN
F 3 "~" H 4950 6550 50  0001 C CNN
	1    4950 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7D225
P 4150 6550
F 0 "C?" H 4265 6596 50  0000 L CNN
F 1 "10u" H 4265 6505 50  0000 L CNN
F 2 "" H 4188 6400 50  0001 C CNN
F 3 "~" H 4150 6550 50  0001 C CNN
	1    4150 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7D22C
P 4550 6550
F 0 "C?" H 4665 6596 50  0000 L CNN
F 1 "4.7u" H 4665 6505 50  0000 L CNN
F 2 "" H 4588 6400 50  0001 C CNN
F 3 "~" H 4550 6550 50  0001 C CNN
	1    4550 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB7D233
P 5350 6550
F 0 "C?" H 5465 6596 50  0000 L CNN
F 1 "10n" H 5465 6505 50  0000 L CNN
F 2 "" H 5388 6400 50  0001 C CNN
F 3 "~" H 5350 6550 50  0001 C CNN
	1    5350 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6700 2050 6700
Connection ~ 2050 6700
Wire Wire Line
	2050 6700 2450 6700
Connection ~ 2450 6700
Wire Wire Line
	2450 6700 2850 6700
Connection ~ 2850 6700
Wire Wire Line
	2850 6700 3500 6700
Connection ~ 4150 6700
Wire Wire Line
	4150 6700 4550 6700
Connection ~ 4550 6700
Wire Wire Line
	4550 6700 4950 6700
Connection ~ 4950 6700
Wire Wire Line
	4950 6700 5350 6700
Wire Wire Line
	3500 6550 3500 6700
Connection ~ 3500 6700
Wire Wire Line
	3500 6700 4150 6700
Wire Wire Line
	3950 6350 4150 6350
Wire Wire Line
	5350 6350 5350 6400
Wire Wire Line
	4950 6400 4950 6350
Connection ~ 4950 6350
Wire Wire Line
	4950 6350 5350 6350
Wire Wire Line
	4550 6400 4550 6350
Connection ~ 4550 6350
Wire Wire Line
	4550 6350 4950 6350
Wire Wire Line
	4150 6400 4150 6350
Connection ~ 4150 6350
Wire Wire Line
	4150 6350 4550 6350
Wire Wire Line
	3050 6400 2850 6400
Connection ~ 2050 6400
Wire Wire Line
	2050 6400 1650 6400
Connection ~ 2450 6400
Wire Wire Line
	2450 6400 2050 6400
Connection ~ 2850 6400
Wire Wire Line
	2850 6400 2450 6400
Wire Wire Line
	3050 6300 2850 6300
Wire Wire Line
	2850 6300 2850 6400
Text HLabel 1250 6400 0    50   Input ~ 0
VIN
Wire Wire Line
	1650 6400 1250 6400
Connection ~ 1650 6400
Text HLabel 1250 6700 0    50   Input ~ 0
GND
Wire Wire Line
	1650 6700 1250 6700
Connection ~ 1650 6700
Text Label 3700 6700 0    50   ~ 0
GND
Text Label 5150 6350 0    50   ~ 0
+5V
$Comp
L Device:R R?
U 1 1 5EB8714C
P 5750 6350
F 0 "R?" V 5543 6350 50  0000 C CNN
F 1 "R" V 5634 6350 50  0000 C CNN
F 2 "" V 5680 6350 50  0001 C CNN
F 3 "~" H 5750 6350 50  0001 C CNN
	1    5750 6350
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5EB871F6
P 6100 6500
F 0 "D?" V 6138 6383 50  0000 R CNN
F 1 "LED" V 6047 6383 50  0000 R CNN
F 2 "" H 6100 6500 50  0001 C CNN
F 3 "~" H 6100 6500 50  0001 C CNN
	1    6100 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 6700 6100 6700
Wire Wire Line
	6100 6700 6100 6650
Connection ~ 5350 6700
Wire Wire Line
	6100 6350 5900 6350
Wire Wire Line
	5600 6350 5350 6350
Connection ~ 5350 6350
$Comp
L Connector:USB_B_Mini J?
U 1 1 5EB8D146
P 9800 2700
F 0 "J?" H 9855 3167 50  0000 C CNN
F 1 "USB_B_Mini" H 9855 3076 50  0000 C CNN
F 2 "" H 9950 2650 50  0001 C CNN
F 3 "~" H 9950 2650 50  0001 C CNN
	1    9800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3100 9800 3100
Connection ~ 9800 3100
Wire Wire Line
	9800 3100 10350 3100
Wire Wire Line
	10100 2800 10350 2800
Wire Wire Line
	10100 2700 10350 2700
NoConn ~ 10100 2500
NoConn ~ 10100 2900
Text Label 10250 2700 0    50   ~ 0
D+
Text Label 10250 2800 0    50   ~ 0
D-
Text Label 10200 3100 0    50   ~ 0
GND
$Comp
L My_Switch:SW_DIP_x02 SW?
U 1 1 5EB95A02
P 1850 2550
F 0 "SW?" H 1850 2917 50  0000 C CNN
F 1 "SW_DIP_x02" H 1850 2826 50  0000 C CNN
F 2 "" H 1850 2550 50  0001 C CNN
F 3 "" H 1850 2550 50  0001 C CNN
	1    1850 2550
	1    0    0    -1  
$EndComp
Text HLabel 1550 2550 0    50   Input ~ 0
TX
Text HLabel 1550 2450 0    50   Input ~ 0
RX
$Comp
L Device:C C?
U 1 1 5EB9949F
P 7550 4750
F 0 "C?" H 7350 4750 50  0000 L CNN
F 1 "10n" H 7350 4650 50  0000 L CNN
F 2 "" H 7588 4600 50  0001 C CNN
F 3 "~" H 7550 4750 50  0001 C CNN
	1    7550 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB994A6
P 7100 4750
F 0 "C?" H 6900 4750 50  0000 L CNN
F 1 "100n" H 6900 4650 50  0000 L CNN
F 2 "" H 7138 4600 50  0001 C CNN
F 3 "~" H 7100 4750 50  0001 C CNN
	1    7100 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB994AD
P 6700 4750
F 0 "C?" H 6500 4750 50  0000 L CNN
F 1 "10u" H 6500 4650 50  0000 L CNN
F 2 "" H 6738 4600 50  0001 C CNN
F 3 "~" H 6700 4750 50  0001 C CNN
	1    6700 4750
	1    0    0    -1  
$EndComp
Connection ~ 7100 4600
Wire Wire Line
	7100 4600 6700 4600
Wire Wire Line
	7550 4600 7100 4600
Wire Wire Line
	8050 4600 7850 4600
Connection ~ 7550 4600
Wire Wire Line
	6250 4900 6700 4900
Connection ~ 6700 4900
Wire Wire Line
	6700 4900 7100 4900
Connection ~ 7100 4900
Wire Wire Line
	7100 4900 7550 4900
Connection ~ 8850 6300
Wire Wire Line
	8050 6300 8650 6300
Wire Wire Line
	8850 6300 8650 6300
Connection ~ 8650 6300
Wire Wire Line
	8950 6300 8850 6300
Wire Wire Line
	9050 6300 8950 6300
Connection ~ 8950 6300
$Comp
L Interface_USB:FT232RL U?
U 1 1 5EB7785C
P 8850 5300
F 0 "U?" H 8850 5300 50  0000 C CNN
F 1 "FT232RL" H 8850 5200 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 8850 5300 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 8850 5300 50  0001 C CNN
	1    8850 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4000 7850 4000
Wire Wire Line
	7850 4000 7850 4600
Connection ~ 7850 4600
Wire Wire Line
	7850 4600 7550 4600
Text Notes 7950 4350 0    50   ~ 0
Want to drive UART\nat 3.3V  so connect \n3.3V to this pin
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5EBA19F1
P 2850 2350
F 0 "J?" H 2877 2326 50  0000 L CNN
F 1 "HC05" H 2877 2235 50  0000 L CNN
F 2 "" H 2850 2350 50  0001 C CNN
F 3 "~" H 2850 2350 50  0001 C CNN
	1    2850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2450 2650 2450
Wire Wire Line
	2650 2550 2150 2550
NoConn ~ 2650 2650
NoConn ~ 2650 2150
Text Notes 2500 2450 0    50   ~ 0
TX
Text Notes 2500 2550 0    50   ~ 0
RX
Text Notes 2400 2650 0    50   ~ 0
STATE
Text Notes 2450 2350 0    50   ~ 0
GND
Text Notes 2450 2250 0    50   ~ 0
+5V
Text Notes 2500 2150 0    50   ~ 0
EN
Text Notes 1900 3000 0    50   ~ 0
STM32 works at 3.3V\nlevels, so don't need\na voltage divider here
$EndSCHEMATC
