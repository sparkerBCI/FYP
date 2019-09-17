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
F 0 "R17" V 4493 4550 50  0000 C CNN
F 1 "1K" V 4584 4550 50  0000 C CNN
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
P 10050 5100
F 0 "PB1" H 10050 4900 50  0000 C CNN
F 1 "RESET" H 10050 5000 50  0000 C CNN
F 2 "" H 10050 5300 50  0001 C CNN
F 3 "" H 10050 5300 50  0001 C CNN
	1    10050 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5D81D641
P 10550 4800
F 0 "R16" H 10620 4846 50  0000 L CNN
F 1 "1K" H 10620 4755 50  0000 L CNN
F 2 "" V 10480 4800 50  0001 C CNN
F 3 "~" H 10550 4800 50  0001 C CNN
	1    10550 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5100 9600 5100
Wire Wire Line
	9600 5350 9850 5350
Wire Wire Line
	10250 5100 10550 5100
Wire Wire Line
	10550 5100 10550 4950
Wire Wire Line
	10550 4500 10800 4500
Text Label 10600 4500 0    50   ~ 0
+5V
Text Label 9650 5350 0    50   ~ 0
GND
Wire Wire Line
	2950 2250 2500 2250
Text Label 10300 5100 0    50   ~ 0
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
NoConn ~ 4150 4450
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
	10550 4650 10550 4500
Wire Wire Line
	9600 5100 9600 5350
$Comp
L Connector:USB_B_Mini J2
U 1 1 5D832EC8
P 6500 2450
F 0 "J2" H 6555 2917 50  0000 C CNN
F 1 "USB_B_Mini" H 6555 2826 50  0000 C CNN
F 2 "" H 6650 2400 50  0001 C CNN
F 3 "~" H 6650 2400 50  0001 C CNN
	1    6500 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F?
U 1 1 5D833699
P 7000 2250
F 0 "F?" V 6803 2250 50  0000 C CNN
F 1 "500mA" V 6894 2250 50  0000 C CNN
F 2 "" V 6930 2250 50  0001 C CNN
F 3 "~" H 7000 2250 50  0001 C CNN
	1    7000 2250
	0    1    1    0   
$EndComp
Text Label 7250 2250 0    50   ~ 0
VUSB
$Comp
L Interface_USB:FT232RL U?
U 1 1 5D834BE6
P 9100 2850
F 0 "U?" H 9100 2850 50  0000 C CNN
F 1 "FT232RL" H 9100 2750 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 9100 2850 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 9100 2850 50  0001 C CNN
	1    9100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2250 6800 2250
Wire Wire Line
	7150 2250 7450 2250
NoConn ~ 6800 2650
NoConn ~ 8300 2850
NoConn ~ 8300 3050
NoConn ~ 8300 3250
Wire Wire Line
	8300 3550 7850 3550
Text Label 7900 3550 0    50   ~ 0
GND
Wire Wire Line
	9300 3850 9200 3850
Connection ~ 9100 3850
Wire Wire Line
	9100 3850 8900 3850
Connection ~ 9200 3850
Wire Wire Line
	9200 3850 9100 3850
Wire Wire Line
	8900 3850 7850 3850
Connection ~ 8900 3850
Text Label 7900 3850 0    50   ~ 0
GND
NoConn ~ 9900 3550
NoConn ~ 9900 3450
NoConn ~ 9900 3350
$Comp
L Device:R R?
U 1 1 5D8469B7
P 10500 2850
F 0 "R?" H 10570 2896 50  0000 L CNN
F 1 "1K" H 10570 2805 50  0000 L CNN
F 2 "" V 10430 2850 50  0001 C CNN
F 3 "~" H 10500 2850 50  0001 C CNN
	1    10500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2150 10150 2150
Wire Wire Line
	9900 2250 10150 2250
Text Label 10050 2150 0    50   ~ 0
RX
Text Label 10050 2250 0    50   ~ 0
TX
NoConn ~ 9900 2350
NoConn ~ 9900 2450
NoConn ~ 9900 2750
NoConn ~ 9900 2650
NoConn ~ 9900 2850
$Comp
L Device:R R?
U 1 1 5D8508E4
P 10800 2850
F 0 "R?" H 10870 2896 50  0000 L CNN
F 1 "1K" H 10870 2805 50  0000 L CNN
F 2 "" V 10730 2850 50  0001 C CNN
F 3 "~" H 10800 2850 50  0001 C CNN
	1    10800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3150 10500 3150
Wire Wire Line
	10500 3150 10500 3000
Wire Wire Line
	9900 3250 10800 3250
Wire Wire Line
	10800 3250 10800 3000
$Comp
L Device:LED D?
U 1 1 5D8530E2
P 10500 2400
F 0 "D?" V 10538 2283 50  0000 R CNN
F 1 "LED" V 10447 2283 50  0000 R CNN
F 2 "" H 10500 2400 50  0001 C CNN
F 3 "~" H 10500 2400 50  0001 C CNN
	1    10500 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D853210
P 10800 2400
F 0 "D?" V 10838 2283 50  0000 R CNN
F 1 "LED" V 10747 2283 50  0000 R CNN
F 2 "" H 10800 2400 50  0001 C CNN
F 3 "~" H 10800 2400 50  0001 C CNN
	1    10800 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10500 2550 10500 2700
Wire Wire Line
	10800 2550 10800 2700
Wire Wire Line
	10500 2250 10650 2250
Wire Wire Line
	10650 2250 10650 2000
Wire Wire Line
	10650 2000 10900 2000
Connection ~ 10650 2250
Wire Wire Line
	10650 2250 10800 2250
Text Label 10750 2000 0    50   ~ 0
+5V
Wire Wire Line
	6500 2850 6400 2850
Connection ~ 6400 2850
Wire Wire Line
	6400 2850 5900 2850
Text Label 5900 2850 0    50   ~ 0
GND
$Comp
L Device:C C?
U 1 1 5D85A3D5
P 10050 2700
F 0 "C?" H 10165 2746 50  0000 L CNN
F 1 "100nF" H 10165 2655 50  0000 L CNN
F 2 "" H 10088 2550 50  0001 C CNN
F 3 "~" H 10050 2700 50  0001 C CNN
	1    10050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2550 9900 2550
Wire Wire Line
	10050 2850 10050 3000
Text Label 10100 3000 0    50   ~ 0
GND
Wire Wire Line
	10050 3000 10250 3000
Wire Wire Line
	8300 2150 8300 1750
Wire Wire Line
	8300 1750 7650 1750
$Comp
L Device:C C?
U 1 1 5D860C4B
P 7650 2000
F 0 "C?" H 7765 2046 50  0000 L CNN
F 1 "100nF" H 7765 1955 50  0000 L CNN
F 2 "" H 7688 1850 50  0001 C CNN
F 3 "~" H 7650 2000 50  0001 C CNN
	1    7650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1850 7650 1750
Wire Wire Line
	7650 2150 7650 2250
Wire Wire Line
	7650 2250 7950 2250
Text Label 7800 2250 0    50   ~ 0
GND
Wire Wire Line
	8300 2450 6800 2450
Wire Wire Line
	8300 2550 6800 2550
Text Label 7850 1750 0    50   ~ 0
+3V3
$Comp
L Device:C C?
U 1 1 5D86D087
P 8800 1250
F 0 "C?" H 8915 1296 50  0000 L CNN
F 1 "10nF" H 8800 1150 50  0000 L CNN
F 2 "" H 8838 1100 50  0001 C CNN
F 3 "~" H 8800 1250 50  0001 C CNN
	1    8800 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D10C
P 8400 1250
F 0 "C?" H 8515 1296 50  0000 L CNN
F 1 "100nF" H 8515 1205 50  0000 L CNN
F 2 "" H 8438 1100 50  0001 C CNN
F 3 "~" H 8400 1250 50  0001 C CNN
	1    8400 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D240
P 8000 1250
F 0 "C?" H 8115 1296 50  0000 L CNN
F 1 "10uF" H 8115 1205 50  0000 L CNN
F 2 "" H 8038 1100 50  0001 C CNN
F 3 "~" H 8000 1250 50  0001 C CNN
	1    8000 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D3CF
P 10200 1250
F 0 "C?" H 10315 1296 50  0000 L CNN
F 1 "10uF" H 10315 1205 50  0000 L CNN
F 2 "" H 10238 1100 50  0001 C CNN
F 3 "~" H 10200 1250 50  0001 C CNN
	1    10200 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D3D6
P 9800 1250
F 0 "C?" H 9915 1296 50  0000 L CNN
F 1 "100nF" H 9915 1205 50  0000 L CNN
F 2 "" H 9838 1100 50  0001 C CNN
F 3 "~" H 9800 1250 50  0001 C CNN
	1    9800 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D86D3DD
P 9400 1250
F 0 "C?" H 9515 1296 50  0000 L CNN
F 1 "10nF" H 9515 1205 50  0000 L CNN
F 2 "" H 9438 1100 50  0001 C CNN
F 3 "~" H 9400 1250 50  0001 C CNN
	1    9400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1850 9000 1100
Wire Wire Line
	9000 1100 8800 1100
Wire Wire Line
	9200 1850 9200 1100
Wire Wire Line
	9200 1100 9400 1100
Wire Wire Line
	10200 1100 9800 1100
Connection ~ 9400 1100
Connection ~ 9800 1100
Wire Wire Line
	9800 1100 9400 1100
Wire Wire Line
	10200 1400 9800 1400
Connection ~ 9800 1400
Wire Wire Line
	9800 1400 9400 1400
Wire Wire Line
	9800 1400 9800 1600
Wire Wire Line
	9800 1600 9950 1600
Wire Wire Line
	8800 1100 8400 1100
Connection ~ 8800 1100
Connection ~ 8400 1100
Wire Wire Line
	8400 1100 8000 1100
Wire Wire Line
	8800 1400 8400 1400
Connection ~ 8400 1400
Wire Wire Line
	8400 1400 8000 1400
Wire Wire Line
	8400 1400 8400 1600
Wire Wire Line
	8400 1600 8550 1600
Text Label 8400 1600 0    50   ~ 0
GND
Text Label 9800 1600 0    50   ~ 0
GND
Text Label 9550 1100 0    50   ~ 0
+5V
Text Label 8150 1100 0    50   ~ 0
+5V
$Comp
L Device:CP C?
U 1 1 5D881ED5
P 6650 1450
F 0 "C?" H 6768 1496 50  0000 L CNN
F 1 "4.7uF" H 6768 1405 50  0000 L CNN
F 2 "" H 6688 1300 50  0001 C CNN
F 3 "~" H 6650 1450 50  0001 C CNN
	1    6650 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5D881F47
P 7100 1450
F 0 "C?" H 7218 1496 50  0000 L CNN
F 1 "100nF" H 7218 1405 50  0000 L CNN
F 2 "" H 7138 1300 50  0001 C CNN
F 3 "~" H 7100 1450 50  0001 C CNN
	1    7100 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1300 6650 1200
Wire Wire Line
	6650 1200 7100 1200
Wire Wire Line
	7100 1200 7100 1300
Wire Wire Line
	6650 1600 6650 1700
Wire Wire Line
	6650 1700 7100 1700
Wire Wire Line
	7100 1700 7100 1600
Text Label 6800 1200 0    50   ~ 0
VUSB
Text Label 6800 1700 0    50   ~ 0
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
P 3300 7000
F 0 "U?" H 3300 7242 50  0000 C CNN
F 1 "LM1117-5.0" H 3300 7151 50  0000 C CNN
F 2 "" H 3300 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 3300 7000 50  0001 C CNN
	1    3300 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B221
P 3800 7150
F 0 "C?" H 3915 7196 50  0000 L CNN
F 1 "1nF" H 3850 7050 50  0000 L CNN
F 2 "" H 3838 7000 50  0001 C CNN
F 3 "~" H 3800 7150 50  0001 C CNN
	1    3800 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B386
P 4150 7150
F 0 "C?" H 4265 7196 50  0000 L CNN
F 1 "10nF" H 4200 7050 50  0000 L CNN
F 2 "" H 4188 7000 50  0001 C CNN
F 3 "~" H 4150 7150 50  0001 C CNN
	1    4150 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B3F4
P 4500 7150
F 0 "C?" H 4615 7196 50  0000 L CNN
F 1 "100nF" H 4550 7050 50  0000 L CNN
F 2 "" H 4538 7000 50  0001 C CNN
F 3 "~" H 4500 7150 50  0001 C CNN
	1    4500 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92B47C
P 4850 7150
F 0 "C?" H 4965 7196 50  0000 L CNN
F 1 "10uF" H 4900 7050 50  0000 L CNN
F 2 "" H 4888 7000 50  0001 C CNN
F 3 "~" H 4850 7150 50  0001 C CNN
	1    4850 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3AA
P 1750 7150
F 0 "C?" H 1500 7200 50  0000 L CNN
F 1 "100uF" H 1450 7050 50  0000 L CNN
F 2 "" H 1788 7000 50  0001 C CNN
F 3 "~" H 1750 7150 50  0001 C CNN
	1    1750 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3B1
P 2100 7150
F 0 "C?" H 2215 7196 50  0000 L CNN
F 1 "10uF" H 1900 7050 50  0000 L CNN
F 2 "" H 2138 7000 50  0001 C CNN
F 3 "~" H 2100 7150 50  0001 C CNN
	1    2100 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3B8
P 2450 7150
F 0 "C?" H 2565 7196 50  0000 L CNN
F 1 "100nF" H 2500 7050 50  0000 L CNN
F 2 "" H 2488 7000 50  0001 C CNN
F 3 "~" H 2450 7150 50  0001 C CNN
	1    2450 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D92F3BF
P 2800 7150
F 0 "C?" H 2915 7196 50  0000 L CNN
F 1 "10nF" H 2850 7050 50  0000 L CNN
F 2 "" H 2838 7000 50  0001 C CNN
F 3 "~" H 2800 7150 50  0001 C CNN
	1    2800 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 7000 2800 7000
Connection ~ 1750 7000
Wire Wire Line
	1750 7000 1350 7000
Connection ~ 2100 7000
Wire Wire Line
	2100 7000 1750 7000
Connection ~ 2450 7000
Wire Wire Line
	2450 7000 2100 7000
Connection ~ 2800 7000
Wire Wire Line
	2800 7000 2450 7000
Wire Wire Line
	1750 7300 2100 7300
Connection ~ 2100 7300
Wire Wire Line
	2100 7300 2450 7300
Connection ~ 2450 7300
Wire Wire Line
	2450 7300 2800 7300
Connection ~ 2800 7300
Wire Wire Line
	2800 7300 3300 7300
Connection ~ 3300 7300
Wire Wire Line
	3300 7300 3800 7300
Connection ~ 3800 7300
Wire Wire Line
	3800 7300 4150 7300
Connection ~ 4150 7300
Wire Wire Line
	4150 7300 4500 7300
Connection ~ 4500 7300
Wire Wire Line
	4500 7300 4850 7300
Wire Wire Line
	4850 7000 4500 7000
Connection ~ 3800 7000
Wire Wire Line
	3800 7000 3600 7000
Connection ~ 4150 7000
Wire Wire Line
	4150 7000 4050 7000
Connection ~ 4500 7000
Wire Wire Line
	4500 7000 4150 7000
Wire Wire Line
	4050 7000 4050 6800
Wire Wire Line
	4050 6800 4300 6800
Connection ~ 4050 7000
Wire Wire Line
	4050 7000 3800 7000
Wire Wire Line
	4850 7000 5350 7000
Connection ~ 4850 7000
$Comp
L Device:R R?
U 1 1 5D94EEA5
P 5500 7000
F 0 "R?" V 5400 6950 50  0000 L CNN
F 1 "1K" V 5600 6850 50  0000 L CNN
F 2 "" V 5430 7000 50  0001 C CNN
F 3 "~" H 5500 7000 50  0001 C CNN
	1    5500 7000
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D94EEAC
P 5650 7300
F 0 "D?" V 5688 7182 50  0000 R CNN
F 1 "PWR" V 5597 7182 50  0000 R CNN
F 2 "" H 5650 7300 50  0001 C CNN
F 3 "~" H 5650 7300 50  0001 C CNN
	1    5650 7300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 7150 5650 7000
Wire Wire Line
	3300 7300 3300 7550
Wire Wire Line
	3300 7550 3500 7550
Text Label 1450 7000 0    50   ~ 0
VIN
Text Label 4100 6800 0    50   ~ 0
+5V
Text Label 3350 7550 0    50   ~ 0
GND
Wire Wire Line
	5650 7450 5300 7450
Text Label 5400 7450 0    50   ~ 0
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
Text Notes 2950 6650 0    79   ~ 0
+5V Regulated Supply\n
Wire Notes Line
	1150 6500 6000 6500
Wire Notes Line
	6000 6500 6000 7600
Wire Notes Line
	6000 7600 1150 7600
Wire Notes Line
	1150 7600 1150 6500
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
	7250 5000 7250 5600
Wire Notes Line
	7250 5600 5800 5600
Wire Notes Line
	5800 5600 5800 5000
Wire Notes Line
	7600 5000 9050 5000
Wire Notes Line
	9050 5000 9050 6350
Wire Notes Line
	9050 6350 7600 6350
Wire Notes Line
	7600 6350 7600 5000
Text Notes 8000 5450 0    50   ~ 0
SPI
Text Notes 7950 5850 0    50   ~ 0
Control
Text Notes 8000 6250 0    50   ~ 0
UART
Text Notes 5950 5350 0    50   ~ 0
+6.3V - +15V
Text Notes 6200 5500 0    50   ~ 0
GND\n
$EndSCHEMATC
