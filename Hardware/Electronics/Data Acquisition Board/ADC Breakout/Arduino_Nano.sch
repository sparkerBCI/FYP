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
F 2 "Resonators:CSTNE16M0V53Z000R0" H 2225 2600 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1788 3000 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1788 3950 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 3950 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2538 3950 50  0001 C CNN
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
F 2 "Resistor_SMD:R_0603_1608Metric" V 4630 4550 50  0001 C CNN
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
F 2 "Resistor_SMD:R_0603_1608Metric" V 4980 4650 50  0001 C CNN
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
L Device:R R16
U 1 1 5D81D641
P 10100 4800
F 0 "R16" H 9850 4850 50  0000 L CNN
F 1 "1K" H 9850 4750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10030 4800 50  0001 C CNN
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
Wire Wire Line
	10100 4650 10100 4500
$Comp
L Connector:USB_B_Mini J2
U 1 1 5D832EC8
P 6500 2300
F 0 "J2" H 6555 2767 50  0000 C CNN
F 1 "USB_B_Mini" H 6555 2676 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Wuerth_629105150521" H 6650 2250 50  0001 C CNN
F 3 "~" H 6650 2250 50  0001 C CNN
	1    6500 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F2
U 1 1 5D833699
P 7000 2100
F 0 "F2" V 6803 2100 50  0000 C CNN
F 1 "MF-MSMF050-2" V 6900 2200 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric" V 6930 2100 50  0001 C CNN
F 3 "~" H 7000 2100 50  0001 C CNN
	1    7000 2100
	0    1    1    0   
$EndComp
Text Label 7250 2100 0    50   ~ 0
VUSB
$Comp
L Interface_USB:FT232RL U5
U 1 1 5D834BE6
P 9100 2700
F 0 "U5" H 9100 2700 50  0000 C CNN
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
L Device:R R25
U 1 1 5D8469B7
P 10500 2700
F 0 "R25" H 10570 2746 50  0000 L CNN
F 1 "100" H 10570 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10430 2700 50  0001 C CNN
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
L Device:R R26
U 1 1 5D8508E4
P 10800 2700
F 0 "R26" H 10870 2746 50  0000 L CNN
F 1 "100" H 10870 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10730 2700 50  0001 C CNN
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
L Device:LED D8
U 1 1 5D8530E2
P 10500 1750
F 0 "D8" V 10538 1633 50  0000 R CNN
F 1 "LTST-C191KRKT" V 10600 2400 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 10500 1750 50  0001 C CNN
F 3 "~" H 10500 1750 50  0001 C CNN
	1    10500 1750
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D9
U 1 1 5D853210
P 10800 1750
F 0 "D9" V 10838 1633 50  0000 R CNN
F 1 "LTST-C191KGKT" V 10747 1633 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 10800 1750 50  0001 C CNN
F 3 "~" H 10800 1750 50  0001 C CNN
	1    10800 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10500 1600 10650 1600
Wire Wire Line
	10650 1600 10650 1350
Wire Wire Line
	10650 1350 10900 1350
Connection ~ 10650 1600
Wire Wire Line
	10650 1600 10800 1600
Text Label 10750 1350 0    50   ~ 0
+5V
Wire Wire Line
	6500 2700 6400 2700
Connection ~ 6400 2700
Wire Wire Line
	6400 2700 5900 2700
Text Label 5900 2700 0    50   ~ 0
GND
$Comp
L Device:C C60
U 1 1 5D85A3D5
P 10050 2400
F 0 "C60" V 10200 2350 50  0000 L CNN
F 1 "100nF" V 9900 2250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10088 2250 50  0001 C CNN
F 3 "~" H 10050 2400 50  0001 C CNN
	1    10050 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10200 2400 10400 2400
Wire Wire Line
	8300 2000 8300 1600
Wire Wire Line
	8300 1600 7650 1600
$Comp
L Device:C C54
U 1 1 5D860C4B
P 7650 1850
F 0 "C54" H 7765 1896 50  0000 L CNN
F 1 "100nF" H 7765 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7688 1700 50  0001 C CNN
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
L Device:C C57
U 1 1 5D86D087
P 8800 1100
F 0 "C57" H 8915 1146 50  0000 L CNN
F 1 "10nF" H 8800 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8838 950 50  0001 C CNN
F 3 "~" H 8800 1100 50  0001 C CNN
	1    8800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C56
U 1 1 5D86D10C
P 8400 1100
F 0 "C56" H 8515 1146 50  0000 L CNN
F 1 "100nF" H 8515 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8438 950 50  0001 C CNN
F 3 "~" H 8400 1100 50  0001 C CNN
	1    8400 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C55
U 1 1 5D86D240
P 8000 1100
F 0 "C55" H 8115 1146 50  0000 L CNN
F 1 "10uF" H 8115 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8038 950 50  0001 C CNN
F 3 "~" H 8000 1100 50  0001 C CNN
	1    8000 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C61
U 1 1 5D86D3CF
P 10200 1100
F 0 "C61" H 10315 1146 50  0000 L CNN
F 1 "10uF" H 10315 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10238 950 50  0001 C CNN
F 3 "~" H 10200 1100 50  0001 C CNN
	1    10200 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C59
U 1 1 5D86D3D6
P 9800 1100
F 0 "C59" H 9915 1146 50  0000 L CNN
F 1 "100nF" H 9915 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9838 950 50  0001 C CNN
F 3 "~" H 9800 1100 50  0001 C CNN
	1    9800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C58
U 1 1 5D86D3DD
P 9400 1100
F 0 "C58" H 9515 1146 50  0000 L CNN
F 1 "10nF" H 9515 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9438 950 50  0001 C CNN
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
L Device:CP C52
U 1 1 5D881ED5
P 6650 1300
F 0 "C52" H 6768 1346 50  0000 L CNN
F 1 "4.7uF" H 6768 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6688 1150 50  0001 C CNN
F 3 "~" H 6650 1300 50  0001 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C53
U 1 1 5D881F47
P 7100 1300
F 0 "C53" H 7218 1346 50  0000 L CNN
F 1 "100nF" H 7218 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7138 1150 50  0001 C CNN
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
L Connector_Generic:Conn_02x03_Odd_Even J6
U 1 1 5D894FFA
P 6450 4650
F 0 "J6" H 6500 4967 50  0000 C CNN
F 1 "ICSP Header" H 6500 4876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6450 4650 50  0001 C CNN
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
L Device:D_Schottky D7
U 1 1 5D8B4BC5
P 8350 4600
F 0 "D7" H 8350 4816 50  0000 C CNN
F 1 "B130-13-F" H 8350 4725 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 8350 4600 50  0001 C CNN
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
L Device:R R23
U 1 1 5D8CFFD5
P 4450 2700
F 0 "R23" V 4650 2600 50  0000 L CNN
F 1 "100" V 4550 2600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4380 2700 50  0001 C CNN
F 3 "~" H 4450 2700 50  0001 C CNN
	1    4450 2700
	0    1    1    0   
$EndComp
$Comp
L Device:LED D5
U 1 1 5D8CFFDE
P 4850 2950
F 0 "D5" V 4850 2850 50  0000 R CNN
F 1 "LTST-C191KGKT" V 4950 2900 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 4850 2950 50  0001 C CNN
F 3 "~" H 4850 2950 50  0001 C CNN
	1    4850 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 2700 4150 2700
Wire Wire Line
	4600 2700 4850 2700
$Comp
L Device:C C48
U 1 1 5D92B221
P 4300 7150
F 0 "C48" H 4415 7196 50  0000 L CNN
F 1 "1nF" H 4350 7050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4338 7000 50  0001 C CNN
F 3 "~" H 4300 7150 50  0001 C CNN
	1    4300 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C49
U 1 1 5D92B386
P 4650 7150
F 0 "C49" H 4765 7196 50  0000 L CNN
F 1 "10nF" H 4700 7050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 7000 50  0001 C CNN
F 3 "~" H 4650 7150 50  0001 C CNN
	1    4650 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C50
U 1 1 5D92B3F4
P 5000 7150
F 0 "C50" H 5115 7196 50  0000 L CNN
F 1 "100nF" H 5050 7050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5038 7000 50  0001 C CNN
F 3 "~" H 5000 7150 50  0001 C CNN
	1    5000 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C51
U 1 1 5D92B47C
P 5350 7150
F 0 "C51" H 5465 7196 50  0000 L CNN
F 1 "10uF" H 5400 7050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5388 7000 50  0001 C CNN
F 3 "~" H 5350 7150 50  0001 C CNN
	1    5350 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C44
U 1 1 5D92F3AA
P 1550 7200
F 0 "C44" H 1300 7250 50  0000 L CNN
F 1 "100uF" H 1250 7100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1588 7050 50  0001 C CNN
F 3 "~" H 1550 7200 50  0001 C CNN
	1    1550 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C45
U 1 1 5D92F3B1
P 1900 7200
F 0 "C45" H 2015 7246 50  0000 L CNN
F 1 "10uF" H 1700 7100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 7050 50  0001 C CNN
F 3 "~" H 1900 7200 50  0001 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C46
U 1 1 5D92F3B8
P 2250 7200
F 0 "C46" H 2365 7246 50  0000 L CNN
F 1 "100nF" H 2300 7100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2288 7050 50  0001 C CNN
F 3 "~" H 2250 7200 50  0001 C CNN
	1    2250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C47
U 1 1 5D92F3BF
P 2600 7200
F 0 "C47" H 2715 7246 50  0000 L CNN
F 1 "10nF" H 2650 7100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2638 7050 50  0001 C CNN
F 3 "~" H 2600 7200 50  0001 C CNN
	1    2600 7200
	1    0    0    -1  
$EndComp
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
Connection ~ 4300 7300
Wire Wire Line
	4300 7300 4650 7300
Connection ~ 4650 7300
Wire Wire Line
	4650 7300 5000 7300
Connection ~ 5000 7300
Wire Wire Line
	5000 7300 5350 7300
Wire Wire Line
	5350 7000 5000 7000
Connection ~ 4300 7000
Connection ~ 4650 7000
Wire Wire Line
	4650 7000 4550 7000
Connection ~ 5000 7000
Wire Wire Line
	5000 7000 4650 7000
Wire Wire Line
	4550 7000 4550 6800
Wire Wire Line
	4550 6800 4800 6800
Connection ~ 4550 7000
Wire Wire Line
	4550 7000 4300 7000
Wire Wire Line
	5350 7000 5850 7000
Connection ~ 5350 7000
$Comp
L Device:R R24
U 1 1 5D94EEA5
P 6000 7000
F 0 "R24" V 5900 6950 50  0000 L CNN
F 1 "100" V 6100 6850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5930 7000 50  0001 C CNN
F 3 "~" H 6000 7000 50  0001 C CNN
	1    6000 7000
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 7350 3350 7600
Wire Wire Line
	3350 7600 3550 7600
Text Label 1250 7050 0    50   ~ 0
VIN
Text Label 4600 6800 0    50   ~ 0
+5V
Text Label 3400 7600 0    50   ~ 0
GND
Wire Wire Line
	6150 7450 5800 7450
Text Label 5900 7450 0    50   ~ 0
GND
$Comp
L Device:C C43
U 1 1 5D987F79
P 1300 4100
F 0 "C43" H 1415 4146 50  0000 L CNN
F 1 "10uF" H 1350 4000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1338 3950 50  0001 C CNN
F 3 "~" H 1300 4100 50  0001 C CNN
	1    1300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C42
U 1 1 5D9881A3
P 850 4100
F 0 "C42" H 965 4146 50  0000 L CNN
F 1 "100uF" H 900 4000 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 888 3950 50  0001 C CNN
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
	6500 6550 6500 7650
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
Wire Notes Line
	9050 5000 9050 6450
Wire Notes Line
	7600 5000 7600 6450
Wire Wire Line
	10100 5450 10100 5550
Wire Wire Line
	10100 5050 10100 4950
Wire Wire Line
	10100 5050 10450 5050
Text Notes 4450 2050 0    39   ~ 0
5V Supply driving 2V LED, so \n3V drop across resistor. \nI = 20mA. R = V/I = 2 / 20m \n= 100 Ohms
Text Notes 5000 2650 0    50   ~ 0
STATUS\n(Green)
$Comp
L Device:LED D6
U 1 1 5DB71A05
P 6150 7300
AR Path="/5D80B4DC/5DB71A05" Ref="D6"  Part="1" 
AR Path="/5D7F9BD3/5DB71A05" Ref="D?"  Part="1" 
F 0 "D6" V 6188 7182 50  0000 R CNN
F 1 "LTST-C194TBKT" V 6100 7950 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6150 7300 50  0001 C CNN
F 3 "~" H 6150 7300 50  0001 C CNN
	1    6150 7300
	0    -1   -1   0   
$EndComp
Text Notes 6250 7500 0    50   ~ 0
PWR\n(Blue)
Wire Wire Line
	6150 7150 6150 7000
Text Notes 5100 6950 0    39   ~ 0
5V Supply driving 3.3V LED, so \n1.7V drop across resistor. \nI = 20mA. R = V/I = 1.7 / 20m \n= 85 Ohms. Round to higher \nstandard value, 100 Ohms
Text Notes 10150 1850 0    50   ~ 0
USB_RX\n(Red)
Text Notes 10800 1600 0    50   ~ 0
USB_TX\n(Green)
Wire Wire Line
	10500 1900 10500 2550
Wire Wire Line
	10800 1900 10800 2550
Text Notes 6900 2250 0    50   ~ 0
500mA
Wire Wire Line
	8250 6250 8600 6250
Wire Wire Line
	8250 6150 8600 6150
$Comp
L My_Switch:TE-1825910-6 PB1
U 1 1 5E30B56D
P 10100 5250
F 0 "PB1" V 10054 5398 50  0000 L CNN
F 1 "TE-1825910-6" V 10145 5398 50  0000 L CNN
F 2 "Switches:1825910-6" H 10100 5450 50  0001 C CNN
F 3 "" H 10100 5450 50  0001 C CNN
	1    10100 5250
	0    1    -1   0   
$EndComp
Connection ~ 10100 5050
Wire Wire Line
	4850 2700 4850 2800
Wire Wire Line
	4850 3100 4850 3300
Wire Wire Line
	4850 3300 5000 3300
Text Label 4850 3300 0    50   ~ 0
GND
NoConn ~ 4150 4450
$Comp
L My_Regulator_Linear:MCP1755T-5002E_SOT223-5 U4
U 1 1 5DC42038
P 3000 6850
F 0 "U4" H 3750 6550 50  0000 C CNN
F 1 "MCP1755T-5002E_SOT223-5" H 3350 6924 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-6" H 3450 6100 50  0001 C CNN
F 3 "" H 3450 6100 50  0001 C CNN
	1    3000 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 7350 3350 7350
Connection ~ 2600 7350
Wire Wire Line
	3350 7200 3350 7300
Connection ~ 3350 7350
Wire Wire Line
	3350 7300 4300 7300
Connection ~ 3350 7300
Wire Wire Line
	3350 7300 3350 7350
Wire Wire Line
	3800 7000 4300 7000
Wire Wire Line
	2600 7050 2850 7050
Wire Notes Line
	950  6550 6500 6550
Wire Notes Line
	950  7650 6500 7650
Wire Wire Line
	2900 6950 2850 6950
Wire Wire Line
	2850 6950 2850 7050
Connection ~ 2850 7050
Wire Wire Line
	2850 7050 2900 7050
Text Label 10200 2400 0    50   ~ 0
RESET
$Comp
L Device:C C62
U 1 1 5E0B8F4F
P 9900 5250
F 0 "C62" H 9650 5300 50  0000 L CNN
F 1 "10uF" H 9600 5200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9938 5100 50  0001 C CNN
F 3 "~" H 9900 5250 50  0001 C CNN
	1    9900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 5050 9900 5050
Wire Wire Line
	9900 5050 9900 5100
Wire Wire Line
	9900 5400 9900 5550
Wire Wire Line
	9900 5550 10100 5550
Connection ~ 10100 5550
Text Notes 9800 5750 0    50   ~ 0
Additional cap here\nto enable serial programing
Wire Notes Line
	11100 4050 11100 5900
Wire Notes Line
	9400 5900 11100 5900
Wire Notes Line
	9400 4050 9400 5900
$EndSCHEMATC
