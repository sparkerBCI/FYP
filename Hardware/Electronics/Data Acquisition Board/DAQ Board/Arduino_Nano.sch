EESchema Schematic File Version 4
LIBS:DAQ Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Resonator Y1
U 1 1 5D80B656
P 2250 2600
F 0 "Y1" V 2000 2550 50  0000 L CNN
F 1 "16MHz" V 2450 2350 50  0000 L CNN
F 2 "" H 2225 2600 50  0001 C CNN
F 3 "~" H 2225 2600 50  0001 C CNN
	1    2250 2600
	0    1    1    0   
$EndComp
$Comp
L My_MCU_Microchip_ATmega:ATmega328P-AU U1
U 1 1 5D8169D7
P 3550 3400
F 0 "U1" H 3550 4967 50  0000 C CNN
F 1 "ATmega328P-AU" H 3550 4876 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 3550 3400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 3550 3400 50  0001 C CNN
	1    3550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2750 2250 2750
Wire Wire Line
	2950 2650 2600 2650
Wire Wire Line
	2600 2650 2600 2450
Wire Wire Line
	2600 2450 2250 2450
Wire Wire Line
	2050 2600 1750 2600
Wire Wire Line
	1750 2600 1750 2800
Wire Wire Line
	1750 2800 1350 2800
Text Label 1450 2800 0    50   ~ 0
GND
$Comp
L Device:C C22
U 1 1 5D819D64
P 1750 3150
F 0 "C22" H 1865 3196 50  0000 L CNN
F 1 "100nF" H 1865 3105 50  0000 L CNN
F 2 "" H 1788 3000 50  0001 C CNN
F 3 "~" H 1750 3150 50  0001 C CNN
	1    1750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3000 1750 3000
Wire Wire Line
	1750 3300 1350 3300
Text Label 1450 3300 0    50   ~ 0
GND
Wire Wire Line
	2950 3750 2500 3750
Wire Wire Line
	2950 3100 2500 3100
Wire Wire Line
	2950 3650 2600 3650
Text Label 2700 3650 0    50   ~ 0
GND
Text Label 2000 3750 0    50   ~ 0
+5V
$Comp
L Device:C C23
U 1 1 5D81A1B9
P 1750 4100
F 0 "C23" H 1800 4200 50  0000 L CNN
F 1 "1uF" H 1800 4000 50  0000 L CNN
F 2 "" H 1788 3950 50  0001 C CNN
F 3 "~" H 1750 4100 50  0001 C CNN
	1    1750 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C24
U 1 1 5D81A28A
P 2100 4100
F 0 "C24" H 2218 4146 50  0000 L CNN
F 1 "4.7uF" H 2150 4000 50  0000 L CNN
F 2 "" H 2138 3950 50  0001 C CNN
F 3 "~" H 2100 4100 50  0001 C CNN
	1    2100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3750 2100 3750
Wire Wire Line
	1750 3950 1750 3750
Wire Wire Line
	2100 3950 2100 3750
Connection ~ 2100 3750
$Comp
L Device:C C25
U 1 1 5D81A81B
P 2500 4100
F 0 "C25" H 2615 4146 50  0000 L CNN
F 1 "1uF" H 2615 4055 50  0000 L CNN
F 2 "" H 2538 3950 50  0001 C CNN
F 3 "~" H 2500 4100 50  0001 C CNN
	1    2500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3950 2500 3750
Connection ~ 2500 3750
Wire Wire Line
	2100 3750 2500 3750
Wire Wire Line
	2500 3750 2500 3100
Wire Wire Line
	2500 4450 2100 4450
Wire Wire Line
	2500 4250 2500 4450
Wire Wire Line
	1750 4250 1750 4450
Connection ~ 1750 4450
Wire Wire Line
	2100 4250 2100 4450
Connection ~ 2100 4450
Wire Wire Line
	2100 4450 1750 4450
Text Label 1450 4450 0    50   ~ 0
GND
Wire Wire Line
	2950 3200 2600 3200
Wire Wire Line
	2600 3200 2600 3650
$Comp
L Device:R R17
U 1 1 5D81BE95
P 4700 4550
F 0 "R17" V 5000 4550 50  0000 C CNN
F 1 "1K" V 4900 4550 50  0000 C CNN
F 2 "" V 4630 4550 50  0001 C CNN
F 3 "~" H 4700 4550 50  0001 C CNN
	1    4700 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 5D81BEFF
P 5050 4650
F 0 "R18" V 5250 4650 50  0000 C CNN
F 1 "1K" V 5150 4650 50  0000 C CNN
F 2 "" V 4980 4650 50  0001 C CNN
F 3 "~" H 5050 4650 50  0001 C CNN
	1    5050 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 4550 4150 4550
Wire Wire Line
	4900 4650 4150 4650
Wire Wire Line
	4850 4550 5450 4550
Wire Wire Line
	5200 4650 5450 4650
Text Label 5300 4550 0    50   ~ 0
TX
Text Label 5300 4650 0    50   ~ 0
RX
$Comp
L Switch:SW_Push PB1
U 1 1 5D81D491
P 10100 5250
F 0 "PB1" V 10100 5050 50  0000 C CNN
F 1 "RESET" V 10200 5050 50  0000 C CNN
F 2 "" H 10100 5450 50  0001 C CNN
F 3 "" H 10100 5450 50  0001 C CNN
	1    10100 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5D81D641
P 10100 4800
F 0 "R16" H 9850 4850 50  0000 L CNN
F 1 "1K" H 9850 4750 50  0000 L CNN
F 2 "" V 10030 4800 50  0001 C CNN
F 3 "~" H 10100 4800 50  0001 C CNN
	1    10100 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 5550 10350 5550
Wire Wire Line
	10100 4500 10350 4500
Text Label 10150 4500 0    50   ~ 0
+5V
Text Label 10150 5550 0    50   ~ 0
GND
Wire Wire Line
	2950 2250 2500 2250
Text Label 10250 5050 0    50   ~ 0
RESET
Text Label 2550 2250 0    50   ~ 0
RESET
Wire Wire Line
	4150 2200 4600 2200
Wire Wire Line
	4150 2300 4600 2300
Wire Wire Line
	4150 2400 4600 2400
Wire Wire Line
	4150 2600 4600 2600
Wire Wire Line
	4150 3950 4600 3950
Wire Wire Line
	4150 4050 4600 4050
Text Label 4400 2600 0    50   ~ 0
~CS
Text Label 4400 2400 0    50   ~ 0
MOSI
Text Label 4400 2300 0    50   ~ 0
MISO
Text Label 4400 2200 0    50   ~ 0
SCLK
Text Label 4400 3950 0    50   ~ 0
START
Text Label 4400 4050 0    50   ~ 0
~DRDY
Wire Wire Line
	4150 4150 4600 4150
Text Label 4400 4150 0    50   ~ 0
~PWDN
NoConn ~ 2950 4450
NoConn ~ 2950 4550
NoConn ~ 4150 4350
NoConn ~ 4150 3600
NoConn ~ 4150 3500
NoConn ~ 4150 3400
NoConn ~ 4150 3300
NoConn ~ 4150 3200
NoConn ~ 4150 3100
NoConn ~ 4150 2500
Text Notes 9750 4200 0    79   ~ 0
Reset Pushbutton
Wire Notes Line
	9400 4050 11100 4050
Wire Notes Line
	11100 4050 11100 5650
Wire Notes Line
	11100 5650 9400 5650
Wire Notes Line
	9400 5650 9400 4050
Wire Wire Line
	10100 4650 10100 4500
$Comp
L Connector:USB_B_Mini J2
U 1 1 5D832EC8
P 6500 2300
F 0 "J2" H 6555 2767 50  0000 C CNN
F 1 "USB_B_Mini" H 6555 2676 50  0000 C CNN
F 2 "" H 6650 2250 50  0001 C CNN
F 3 "~" H 6650 2250 50  0001 C CNN
	1    6500 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F?
U 1 1 5D833699
P 7000 2100
F 0 "F?" V 6803 2100 50  0000 C CNN
F 1 "500mA" V 6894 2100 50  0000 C CNN
F 2 "" V 6930 2100 50  0001 C CNN
F 3 "~" H 7000 2100 50  0001 C CNN
	1    7000 2100
	0    1    1    0   
$EndComp
Text Label 7250 2100 0    50   ~ 0
VUSB
$Comp
L Interface_USB:FT232RL U?
U 1 1 5D834BE6
P 9100 2700
F 0 "U?" H 9100 2700 50  0000 C CNN
F 1 "FT232RL" H 9100 2600 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 9100 2700 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 9100 2700 50  0001 C CNN
	1    9100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2100 6800 2100
Wire Wire Line
	7150 2100 7450 2100
NoConn ~ 6800 2500
NoConn ~ 8300 2700
NoConn ~ 8300 2900
NoConn ~ 8300 3100
Wire Wire Line
	8300 3400 7850 3400
Text Label 7900 3400 0    50   ~ 0
GND
Wire Wire Line
	9300 3700 9200 3700
Connection ~ 9100 3700
Wire Wire Line
	9100 3700 8900 3700
Connection ~ 9200 3700
Wire Wire Line
	9200 3700 9100 3700
Wire Wire Line
	8900 3700 7850 3700
Connection ~ 8900 3700
Text Label 7900 3700 0    50   ~ 0
GND
NoConn ~ 9900 3400
NoConn ~ 9900 3300
NoConn ~ 9900 3200
$Comp
L Device:R R?
U 1 1 5D8469B7
P 10500 2700
F 0 "R?" H 10570 2746 50  0000 L CNN
F 1 "1K" H 10570 2655 50  0000 L CNN
F 2 "" V 10430 2700 50  0001 C CNN
F 3 "~" H 10500 2700 50  0001 C CNN
	1    10500 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2000 10150 2000
Wire Wire Line
	9900 2100 10150 2100
Text Label 10050 2000 0    50   ~ 0
RX
Text Label 10050 2100 0    50   ~ 0
TX
NoConn ~ 9900 2200
NoConn ~ 9900 2300
NoConn ~ 9900 2600
NoConn ~ 9900 2500
NoConn ~ 9900 2700
$Comp
L Device:R R?
U 1 1 5D8508E4
P 10800 2700
F 0 "R?" H 10870 2746 50  0000 L CNN
F 1 "1K" H 10870 2655 50  0000 L CNN
F 2 "" V 10730 2700 50  0001 C CNN
F 3 "~" H 10800 2700 50  0001 C CNN
	1    10800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3000 10500 3000
Wire Wire Line
	10500 3000 10500 2850
Wire Wire Line
	9900 3100 10800 3100
Wire Wire Line
	10800 3100 10800 2850
$Comp
L Device:LED D?
U 1 1 5D8530E2
P 10500 2250
F 0 "D?" V 10538 2133 50  0000 R CNN
F 1 "LED" V 10447 2133 50  0000 R CNN
F 2 "" H 10500 2250 50  0001 C CNN
F 3 "~" H 10500 2250 50  0001 C CNN
	1    10500 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D853210
P 10800 2250
F 0 "D?" V 10838 2133 50  0000 R CNN
F 1 "LED" V 10747 2133 50  0000 R CNN
F 2 "" H 10800 2250 50  0001 C CNN
F 3 "~" H 10800 2250 50  0001 C CNN
	1    10800 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10500 2400 10500 2550
Wire Wire Line
	10800 2400 10800 2550
Wire Wire Line
	10500 2100 10650 2100
Wire Wire Line
	10650 2100 10650 1850
Wire Wire Line
	10650 1850 10900 1850
Connection ~ 10650 2100
Wire Wire Line
	10650 2100 10800 2100
Text Label 10750 1850 0    50   ~ 0
+5V
Wire Wire Line
	6500 2700 6400 2700
Connection ~ 6400 2700
Wire Wire Line
	6400 2700 5900 2700
Text Label 5900 2700 0    50   ~ 0
GND
$Comp
L Device:C C?
U 1 1 5D85A3D5
P 10050 2550
F 0 "C?" H 10165 2596 50  0000 L CNN
F 1 "100nF" H 10165 2505 50  0000 L CNN
F 2 "" H 10088 2400 50  0001 C CNN
F 3 "~" H 10050 2550 50  0001 C CNN
	1    10050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2400 9900 2400
Wire Wire Line
	10050 2700 10050 2850
Text Label 10100 2850 0    50   ~ 0
GND
Wire Wire Line
	10050 2850 10250 2850
Wire Wire Line
	8300 2000 8300 1600
Wire Wire Line
	8300 1600 7650 1600
$Comp
L Device:C C?
U 1 1 5D860C4B
P 7650 1850
F 0 "C?" H 7765 1896 50  0000 L CNN
F 1 "100nF" H 7765 1805 50  0000 L CNN
F 2 "" H 7688 1700 50  0001 C CNN
F 3 "~" H 7650 1850 50  0001 C CNN
	1    7650 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1700 7650 1600
Wire Wire Line
	7650 2000 7650 2100
Wire Wire Line
	7650 2100 7950 2100
Text Label 7800 2100 0    50   ~ 0
GND
Wire Wire Line
	8300 2300 6800 2300
Wire Wire Line
	8300 2400 6800 2400
Text Label 7850 1600 0    50   ~ 0
+3V3
$Comp
L Device:C C?
U 1 1 5D86D087
P 8800 1100
F 0 "C?" H 8915 1146 50  0000 L CNN
F 1 "10nF" H 8800 1000 50  0000 L CNN
F 2 "" H 8838 950 50  0001 C CNN
F 3 "~" H 8800 1100 50  0001 C CNN
	1    8800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D10C
P 8400 1100
F 0 "C?" H 8515 1146 50  0000 L CNN
F 1 "100nF" H 8515 1055 50  0000 L CNN
F 2 "" H 8438 950 50  0001 C CNN
F 3 "~" H 8400 1100 50  0001 C CNN
	1    8400 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D240
P 8000 1100
F 0 "C?" H 8115 1146 50  0000 L CNN
F 1 "10uF" H 8115 1055 50  0000 L CNN
F 2 "" H 8038 950 50  0001 C CNN
F 3 "~" H 8000 1100 50  0001 C CNN
	1    8000 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D3CF
P 10200 1100
F 0 "C?" H 10315 1146 50  0000 L CNN
F 1 "10uF" H 10315 1055 50  0000 L CNN
F 2 "" H 10238 950 50  0001 C CNN
F 3 "~" H 10200 1100 50  0001 C CNN
	1    10200 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D3D6
P 9800 1100
F 0 "C?" H 9915 1146 50  0000 L CNN
F 1 "100nF" H 9915 1055 50  0000 L CNN
F 2 "" H 9838 950 50  0001 C CNN
F 3 "~" H 9800 1100 50  0001 C CNN
	1    9800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D3DD
P 9400 1100
F 0 "C?" H 9515 1146 50  0000 L CNN
F 1 "10nF" H 9515 1055 50  0000 L CNN
F 2 "" H 9438 950 50  0001 C CNN
F 3 "~" H 9400 1100 50  0001 C CNN
	1    9400 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1700 9000 950 
Wire Wire Line
	9000 950  8800 950 
Wire Wire Line
	9200 1700 9200 950 
Wire Wire Line
	9200 950  9400 950 
Wire Wire Line
	10200 950  9800 950 
Connection ~ 9400 950 
Connection ~ 9800 950 
Wire Wire Line
	9800 950  9400 950 
Wire Wire Line
	10200 1250 9800 1250
Connection ~ 9800 1250
Wire Wire Line
	9800 1250 9400 1250
Wire Wire Line
	9800 1250 9800 1450
Wire Wire Line
	9800 1450 9950 1450
Wire Wire Line
	8800 950  8400 950 
Connection ~ 8800 950 
Connection ~ 8400 950 
Wire Wire Line
	8400 950  8000 950 
Wire Wire Line
	8800 1250 8400 1250
Connection ~ 8400 1250
Wire Wire Line
	8400 1250 8000 1250
Wire Wire Line
	8400 1250 8400 1450
Wire Wire Line
	8400 1450 8550 1450
Text Label 8400 1450 0    50   ~ 0
GND
Text Label 9800 1450 0    50   ~ 0
GND
Text Label 9550 950  0    50   ~ 0
+5V
Text Label 8150 950  0    50   ~ 0
+5V
$Comp
L Device:CP C?
U 1 1 5D881ED5
P 6650 1300
F 0 "C?" H 6768 1346 50  0000 L CNN
F 1 "4.7uF" H 6768 1255 50  0000 L CNN
F 2 "" H 6688 1150 50  0001 C CNN
F 3 "~" H 6650 1300 50  0001 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5D881F47
P 7100 1300
F 0 "C?" H 7218 1346 50  0000 L CNN
F 1 "100nF" H 7218 1255 50  0000 L CNN
F 2 "" H 7138 1150 50  0001 C CNN
F 3 "~" H 7100 1300 50  0001 C CNN
	1    7100 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1150 6650 1050
Wire Wire Line
	6650 1050 7100 1050
Wire Wire Line
	7100 1050 7100 1150
Wire Wire Line
	6650 1450 6650 1550
Wire Wire Line
	6650 1550 7100 1550
Wire Wire Line
	7100 1550 7100 1450
Text Label 6800 1050 0    50   ~ 0
VUSB
Text Label 6800 1550 0    50   ~ 0
GND
Text Notes 8050 700  0    79   ~ 0
USB Interface
Wire Notes Line
	5800 550  11100 550 
Wire Notes Line
	11100 550  11100 3950
Wire Notes Line
	11100 3950 5800 3950
Wire Notes Line
	5800 3950 5800 550 
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5D894FFA
P 6450 4650
F 0 "J?" H 6500 4967 50  0000 C CNN
F 1 "ICSP Header" H 6500 4876 50  0000 C CNN
F 2 "" H 6450 4650 50  0001 C CNN
F 3 "~" H 6450 4650 50  0001 C CNN
	1    6450 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 4550 6950 4550
Wire Wire Line
	6750 4650 6950 4650
Wire Wire Line
	6750 4750 6950 4750
Wire Wire Line
	6250 4550 6050 4550
Wire Wire Line
	6250 4650 6050 4650
Wire Wire Line
	6250 4750 6050 4750
Text Label 6050 4550 0    50   ~ 0
MISO
Text Label 6050 4650 0    50   ~ 0
SCLK
Text Label 6050 4750 0    50   ~ 0
RESET
Text Label 6800 4550 0    50   ~ 0
+5V
Text Label 6750 4650 0    50   ~ 0
MOSI
Text Label 6800 4750 0    50   ~ 0
GND
Text Notes 5900 4200 0    79   ~ 0
Programming Header
Wire Notes Line
	5800 4050 7250 4050
Wire Notes Line
	7250 4050 7250 4900
Wire Notes Line
	5800 4900 5800 4050
Wire Notes Line
	5800 4900 7250 4900
$Comp
L Device:D_Schottky D?
U 1 1 5D8B4BC5
P 8350 4600
F 0 "D?" H 8350 4816 50  0000 C CNN
F 1 "SS1P3L" H 8350 4725 50  0000 C CNN
F 2 "" H 8350 4600 50  0001 C CNN
F 3 "~" H 8350 4600 50  0001 C CNN
	1    8350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4600 7850 4600
Wire Wire Line
	8500 4600 8850 4600
Text Label 8000 4600 0    50   ~ 0
+5V
Text Label 8550 4600 0    50   ~ 0
VUSB
Text Notes 7700 4200 0    79   ~ 0
+5V Auto Selector
Wire Notes Line
	7600 4050 9050 4050
Wire Notes Line
	9050 4050 9050 4900
Wire Notes Line
	7600 4900 7600 4050
Wire Notes Line
	7600 4900 9050 4900
NoConn ~ 4150 4250
$Comp
L Device:R R?
U 1 1 5D8CFFD5
P 4450 2700
F 0 "R?" V 4550 2850 50  0000 L CNN
F 1 "1K" V 4550 2550 50  0000 L CNN
F 2 "" V 4380 2700 50  0001 C CNN
F 3 "~" H 4450 2700 50  0001 C CNN
	1    4450 2700
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D8CFFDE
P 4850 2400
F 0 "D?" V 4888 2282 50  0000 R CNN
F 1 "STATUS" V 4797 2282 50  0000 R CNN
F 2 "" H 4850 2400 50  0001 C CNN
F 3 "~" H 4850 2400 50  0001 C CNN
	1    4850 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4850 2550 4850 2700
Text Label 4850 2100 0    50   ~ 0
+5V
Wire Wire Line
	4850 2250 4850 2100
Wire Wire Line
	4300 2700 4150 2700
Wire Wire Line
	4600 2700 4850 2700
$Comp
L My_Regulator_Linear:LM1117-5.0 U?
U 1 1 5D92394A
P 3100 7050
F 0 "U?" H 3100 7292 50  0000 C CNN
F 1 "LM1117-5.0" H 3100 7201 50  0000 C CNN
F 2 "" H 3100 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 3100 7050 50  0001 C CNN
	1    3100 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B221
P 3600 7200
F 0 "C?" H 3715 7246 50  0000 L CNN
F 1 "1nF" H 3650 7100 50  0000 L CNN
F 2 "" H 3638 7050 50  0001 C CNN
F 3 "~" H 3600 7200 50  0001 C CNN
	1    3600 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B386
P 3950 7200
F 0 "C?" H 4065 7246 50  0000 L CNN
F 1 "10nF" H 4000 7100 50  0000 L CNN
F 2 "" H 3988 7050 50  0001 C CNN
F 3 "~" H 3950 7200 50  0001 C CNN
	1    3950 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B3F4
P 4300 7200
F 0 "C?" H 4415 7246 50  0000 L CNN
F 1 "100nF" H 4350 7100 50  0000 L CNN
F 2 "" H 4338 7050 50  0001 C CNN
F 3 "~" H 4300 7200 50  0001 C CNN
	1    4300 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B47C
P 4650 7200
F 0 "C?" H 4765 7246 50  0000 L CNN
F 1 "10uF" H 4700 7100 50  0000 L CNN
F 2 "" H 4688 7050 50  0001 C CNN
F 3 "~" H 4650 7200 50  0001 C CNN
	1    4650 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3AA
P 1550 7200
F 0 "C?" H 1300 7250 50  0000 L CNN
F 1 "100uF" H 1250 7100 50  0000 L CNN
F 2 "" H 1588 7050 50  0001 C CNN
F 3 "~" H 1550 7200 50  0001 C CNN
	1    1550 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3B1
P 1900 7200
F 0 "C?" H 2015 7246 50  0000 L CNN
F 1 "10uF" H 1700 7100 50  0000 L CNN
F 2 "" H 1938 7050 50  0001 C CNN
F 3 "~" H 1900 7200 50  0001 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3B8
P 2250 7200
F 0 "C?" H 2365 7246 50  0000 L CNN
F 1 "100nF" H 2300 7100 50  0000 L CNN
F 2 "" H 2288 7050 50  0001 C CNN
F 3 "~" H 2250 7200 50  0001 C CNN
	1    2250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3BF
P 2600 7200
F 0 "C?" H 2715 7246 50  0000 L CNN
F 1 "10nF" H 2650 7100 50  0000 L CNN
F 2 "" H 2638 7050 50  0001 C CNN
F 3 "~" H 2600 7200 50  0001 C CNN
	1    2600 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 7050 2600 7050
Connection ~ 1550 7050
Wire Wire Line
	1550 7050 1150 7050
Connection ~ 1900 7050
Wire Wire Line
	1900 7050 1550 7050
Connection ~ 2250 7050
Wire Wire Line
	2250 7050 1900 7050
Connection ~ 2600 7050
Wire Wire Line
	2600 7050 2250 7050
Wire Wire Line
	1550 7350 1900 7350
Connection ~ 1900 7350
Wire Wire Line
	1900 7350 2250 7350
Connection ~ 2250 7350
Wire Wire Line
	2250 7350 2600 7350
Connection ~ 2600 7350
Wire Wire Line
	2600 7350 3100 7350
Connection ~ 3100 7350
Wire Wire Line
	3100 7350 3600 7350
Connection ~ 3600 7350
Wire Wire Line
	3600 7350 3950 7350
Connection ~ 3950 7350
Wire Wire Line
	3950 7350 4300 7350
Connection ~ 4300 7350
Wire Wire Line
	4300 7350 4650 7350
Wire Wire Line
	4650 7050 4300 7050
Connection ~ 3600 7050
Wire Wire Line
	3600 7050 3400 7050
Connection ~ 3950 7050
Wire Wire Line
	3950 7050 3850 7050
Connection ~ 4300 7050
Wire Wire Line
	4300 7050 3950 7050
Wire Wire Line
	3850 7050 3850 6850
Wire Wire Line
	3850 6850 4100 6850
Connection ~ 3850 7050
Wire Wire Line
	3850 7050 3600 7050
Wire Wire Line
	4650 7050 5150 7050
Connection ~ 4650 7050
$Comp
L Device:R R?
U 1 1 5D94EEA5
P 5300 7050
F 0 "R?" V 5200 7000 50  0000 L CNN
F 1 "1K" V 5400 6900 50  0000 L CNN
F 2 "" V 5230 7050 50  0001 C CNN
F 3 "~" H 5300 7050 50  0001 C CNN
	1    5300 7050
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D94EEAC
P 5450 7350
F 0 "D?" V 5488 7232 50  0000 R CNN
F 1 "PWR" V 5397 7232 50  0000 R CNN
F 2 "" H 5450 7350 50  0001 C CNN
F 3 "~" H 5450 7350 50  0001 C CNN
	1    5450 7350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5450 7200 5450 7050
Wire Wire Line
	3100 7350 3100 7600
Wire Wire Line
	3100 7600 3300 7600
Text Label 1250 7050 0    50   ~ 0
VIN
Text Label 3900 6850 0    50   ~ 0
+5V
Text Label 3150 7600 0    50   ~ 0
GND
Wire Wire Line
	5450 7500 5100 7500
Text Label 5200 7500 0    50   ~ 0
GND
$Comp
L Device:C C?
U 1 1 5D987F79
P 1300 4100
F 0 "C?" H 1415 4146 50  0000 L CNN
F 1 "10uF" H 1350 4000 50  0000 L CNN
F 2 "" H 1338 3950 50  0001 C CNN
F 3 "~" H 1300 4100 50  0001 C CNN
	1    1300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9881A3
P 850 4100
F 0 "C?" H 965 4146 50  0000 L CNN
F 1 "100uF" H 900 4000 50  0000 L CNN
F 2 "" H 888 3950 50  0001 C CNN
F 3 "~" H 850 4100 50  0001 C CNN
	1    850  4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3750 1300 3750
Wire Wire Line
	850  3750 850  3950
Connection ~ 1750 3750
Wire Wire Line
	850  4250 850  4450
Wire Wire Line
	850  4450 1300 4450
Wire Wire Line
	1300 4250 1300 4450
Connection ~ 1300 4450
Wire Wire Line
	1300 4450 1750 4450
Wire Wire Line
	1300 3950 1300 3750
Connection ~ 1300 3750
Wire Wire Line
	1300 3750 850  3750
Text Notes 2750 6700 0    79   ~ 0
+5V Regulated Supply\n
Wire Notes Line
	950  6550 5800 6550
Wire Notes Line
	5800 6550 5800 7650
Wire Notes Line
	5800 7650 950  7650
Wire Notes Line
	950  7650 950  6550
Text Notes 2800 750  0    98   ~ 20
ATMega328P
Text HLabel 8600 5250 2    50   Input ~ 0
MOSI
Text HLabel 8600 5350 2    50   Input ~ 0
MISO
Text HLabel 8600 5450 2    50   Input ~ 0
~CS
Text HLabel 8600 5550 2    50   Input ~ 0
SCLK
Text HLabel 8600 5700 2    50   Input ~ 0
START
Text HLabel 8600 5800 2    50   Input ~ 0
~DRDY
Text HLabel 8600 5900 2    50   Input ~ 0
~PWDN
Text HLabel 8600 6150 2    50   Input ~ 0
TX
Text HLabel 8600 6250 2    50   Input ~ 0
RX
Text HLabel 8600 6000 2    50   Input ~ 0
~RESET
Text HLabel 6950 5350 2    50   Input ~ 0
VIN
Text HLabel 6950 5500 2    50   Input ~ 0
GND
Wire Wire Line
	8600 5250 8350 5250
Wire Wire Line
	8600 5350 8350 5350
Wire Wire Line
	8600 5450 8350 5450
Wire Wire Line
	8600 5550 8350 5550
Wire Wire Line
	8600 5700 8350 5700
Wire Wire Line
	8600 5800 8350 5800
Wire Wire Line
	8600 5900 8350 5900
Wire Wire Line
	8600 6000 8350 6000
Wire Wire Line
	8600 6150 8350 6150
Wire Wire Line
	8600 6250 8350 6250
Wire Wire Line
	6950 5350 6700 5350
Wire Wire Line
	6950 5500 6700 5500
Text Label 6750 5350 0    50   ~ 0
VIN
Text Label 6750 5500 0    50   ~ 0
GND
Text Label 8400 5250 0    50   ~ 0
MOSI
Text Label 8400 5350 0    50   ~ 0
MISO
Text Label 8400 5450 0    50   ~ 0
~CS
Text Label 8400 5550 0    50   ~ 0
SCLK
Text Label 8400 5700 0    50   ~ 0
START
Text Label 8400 5800 0    50   ~ 0
~DRDY
Text Label 8400 5900 0    50   ~ 0
~PWDN
Text Label 8400 6000 0    50   ~ 0
RESET
Text Label 8400 6150 0    50   ~ 0
TX
Text Label 8400 6250 0    50   ~ 0
RX
Text Notes 6000 5150 0    79   ~ 0
Power Connections
Text Notes 7700 5150 0    79   ~ 0
Communication Pins
Wire Notes Line
	5800 5000 7250 5000
Wire Notes Line
	7250 5750 5800 5750
Wire Notes Line
	7600 5000 9050 5000
Wire Notes Line
	9050 6450 7600 6450
Text Notes 7950 5450 0    50   ~ 0
SPI
Text Notes 7800 5850 0    50   ~ 0
ADC Control
Text Notes 7950 6250 0    50   ~ 0
UART
Text Notes 5950 5350 0    50   ~ 0
+6.3V - +15V
Text Notes 6200 5500 0    50   ~ 0
GND\n
Text HLabel 6950 5650 2    50   Input ~ 0
+5V
Wire Wire Line
	6950 5650 6700 5650
Text Label 6750 5650 0    50   ~ 0
+5V
Text Notes 6100 5650 0    50   ~ 0
+5V OUT
Wire Notes Line
	7250 5000 7250 5750
Wire Notes Line
	5800 5000 5800 5750
Text HLabel 8600 6350 2    50   Input ~ 0
AT_COMM
Wire Wire Line
	8600 6350 8350 6350
Text Label 8400 6350 0    50   ~ 0
RX
Wire Wire Line
	4150 4450 5450 4450
Text Label 5050 4450 0    50   ~ 0
AT_COMM
Wire Notes Line
	9050 5000 9050 6450
Wire Notes Line
	7600 5000 7600 6450
Wire Wire Line
	10100 5450 10100 5550
Wire Wire Line
	10100 5050 10100 4950
Connection ~ 10100 5050
Wire Wire Line
	10100 5050 10450 5050
$EndSCHEMATC
