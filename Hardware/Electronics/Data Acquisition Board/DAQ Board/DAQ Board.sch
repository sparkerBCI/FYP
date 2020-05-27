EESchema Schematic File Version 4
LIBS:DAQ Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3300 1500 750  1750
U 5D7F9BD3
F0 "ADC1299" 50
F1 "ADC1299.sch" 50
F2 "~PWDN" I R 4050 2850 50 
F3 "~RESET" I R 4050 2750 50 
F4 "MOSI" I R 4050 2250 50 
F5 "MISO" I R 4050 2350 50 
F6 "SCLK" I R 4050 2450 50 
F7 "~CS" I R 4050 2150 50 
F8 "START" I R 4050 2550 50 
F9 "~DRDY" I R 4050 2650 50 
F10 "DGND" I L 3300 3000 50 
F11 "VIN" I L 3300 1800 50 
F12 "AVSS" I L 3300 2900 50 
F13 "3V3" I R 4050 1600 50 
$EndSheet
$Sheet
S 5350 1500 700  1750
U 5D80B4DC
F0 "Arduino Nano" 50
F1 "Arduino_Nano.sch" 50
F2 "MOSI" I L 5350 2250 50 
F3 "MISO" I L 5350 2350 50 
F4 "~CS" I L 5350 2150 50 
F5 "SCLK" I L 5350 2450 50 
F6 "START" I L 5350 2550 50 
F7 "~DRDY" I L 5350 2650 50 
F8 "~PWDN" I L 5350 2850 50 
F9 "~RESET" I L 5350 2750 50 
F10 "VIN" I R 6050 1650 50 
F11 "GND" I R 6050 3000 50 
F12 "+5V" I R 6050 1850 50 
F13 "SS_TX" I R 6050 2600 50 
F14 "SS_RX" I R 6050 2500 50 
$EndSheet
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5D8A8745
P 7800 5350
AR Path="/5D899D49/5D8A8745" Ref="J?"  Part="1" 
AR Path="/5D8A8745" Ref="J5"  Part="1" 
F 0 "J5" H 7650 4950 50  0000 L CNN
F 1 "HC-05 BT Module" H 7600 4850 50  0000 L CNN
F 2 "Resonators:HC-05" H 7800 5350 50  0001 C CNN
F 3 "~" H 7800 5350 50  0001 C CNN
	1    7800 5350
	1    0    0    -1  
$EndComp
Text Notes 7900 5650 0    50   ~ 0
Enable AT Commands
Text Notes 7900 5550 0    50   ~ 0
+5V
Text Notes 7900 5450 0    50   ~ 0
GND
Text Notes 7900 5350 0    50   ~ 0
TX
Text Notes 7900 5250 0    50   ~ 0
RX
Text Notes 7900 5150 0    50   ~ 0
LED
Text Label 7250 5550 0    50   ~ 0
+5V
Text Label 7250 5450 0    50   ~ 0
GND
Text Label 7250 5350 0    50   ~ 0
HC05_RX
Text Label 7250 5250 0    50   ~ 0
HC05_TX
Wire Wire Line
	7600 5250 7250 5250
Wire Wire Line
	7600 5350 7250 5350
Wire Wire Line
	7600 5650 7250 5650
NoConn ~ 7250 5650
Wire Wire Line
	6050 1850 6450 1850
Text Label 6300 1850 0    50   ~ 0
+5V
Text Label 6450 2500 0    50   ~ 0
HC05_RX
Text Label 7200 2600 0    50   ~ 0
HC05_TX
Wire Wire Line
	7600 5150 7250 5150
Wire Wire Line
	7600 5450 7250 5450
Wire Wire Line
	7600 5550 7250 5550
Wire Wire Line
	3300 2900 3200 2900
Wire Wire Line
	3200 2900 3200 3000
Wire Wire Line
	3200 3000 3300 3000
Wire Wire Line
	3200 3000 2800 3000
Connection ~ 3200 3000
Text Label 2800 3000 0    50   ~ 0
GND
Text Label 6300 3000 0    50   ~ 0
GND
$Comp
L Connector:Barrel_Jack J4
U 1 1 5DB47949
P 5000 7000
F 0 "J4" H 5055 7325 50  0000 C CNN
F 1 "DC Barrel Jack" H 5055 7234 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-063AH_Horizontal" H 5050 6960 50  0001 C CNN
F 3 "~" H 5050 6960 50  0001 C CNN
	1    5000 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 7100 5700 7100
Wire Wire Line
	5300 6900 5700 6900
Text Label 5550 6900 0    50   ~ 0
GND
Text Label 5500 7100 0    50   ~ 0
VIN_RAW
Wire Wire Line
	3300 1800 2800 1800
Text Label 2800 1800 0    50   ~ 0
VIN
Wire Wire Line
	6050 1650 6450 1650
Text Label 6350 1650 0    50   ~ 0
VIN
$Comp
L Device:R R20
U 1 1 5DA0407B
P 6650 2750
F 0 "R20" H 6720 2796 50  0000 L CNN
F 1 "2K" H 6720 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6580 2750 50  0001 C CNN
F 3 "~" H 6650 2750 50  0001 C CNN
	1    6650 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5DA04C13
P 6950 2600
F 0 "R21" V 6743 2600 50  0000 C CNN
F 1 "1K" V 6834 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6880 2600 50  0001 C CNN
F 3 "~" H 6950 2600 50  0001 C CNN
	1    6950 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 2900 6650 3000
Wire Wire Line
	6800 2600 6650 2600
$Comp
L My_dmp2100u:DMP2100U Q1
U 1 1 5DA6E1B7
P 2250 6750
F 0 "Q1" V 2593 6750 50  0000 C CNN
F 1 "DMP2100U" V 2502 6750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2450 6675 50  0001 L CIN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/MOSFETs/DMP2100U/DMP2100U.pdf" V 2250 6750 50  0001 L CNN
	1    2250 6750
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5DA708B0
P 2900 6800
F 0 "D3" V 2854 6879 50  0000 L CNN
F 1 "7.5V" V 2945 6879 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 2900 6800 50  0001 C CNN
F 3 "~" H 2900 6800 50  0001 C CNN
	1    2900 6800
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5DA70948
P 2250 7250
F 0 "R19" H 2320 7296 50  0000 L CNN
F 1 "33k" H 2320 7205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 7250 50  0001 C CNN
F 3 "~" H 2250 7250 50  0001 C CNN
	1    2250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6650 1050 6650
Wire Wire Line
	2250 6950 2250 7050
Wire Wire Line
	2450 6650 2900 6650
Wire Wire Line
	2900 6950 2900 7050
Wire Wire Line
	2900 7050 2250 7050
Connection ~ 2250 7050
Wire Wire Line
	2250 7050 2250 7100
Wire Wire Line
	2250 7400 2250 7550
Text Label 1050 7550 0    50   ~ 0
GND
Text Label 1050 6650 0    50   ~ 0
VIN_RAW
Text Label 3200 6650 0    50   ~ 0
VIN
$Comp
L Device:Fuse F1
U 1 1 5DA77262
P 1700 6650
F 0 "F1" V 1503 6650 50  0000 C CNN
F 1 "025101.5MAT1L" V 1594 6650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 1630 6650 50  0001 C CNN
F 3 "~" H 1700 6650 50  0001 C CNN
	1    1700 6650
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 6650 3300 6650
Wire Wire Line
	2050 6650 1850 6650
Connection ~ 2900 6650
Wire Wire Line
	1050 7550 2250 7550
Text Notes 900  6350 0    79   ~ 0
Reverse Polarity and Overcurrent Protection
Wire Notes Line
	900  6200 3600 6200
Wire Notes Line
	3600 6200 3600 7650
Wire Notes Line
	3600 7650 900  7650
Wire Notes Line
	900  7650 900  6200
Text Notes 1500 6800 0    50   ~ 0
1.5A Rating
Wire Wire Line
	7100 2600 7500 2600
$Comp
L Mechanical:MountingHole MH1
U 1 1 5E2DFA9E
P 1100 5250
F 0 "MH1" H 1200 5296 50  0000 L CNN
F 1 "MountingHole" H 1200 5205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1100 5250 50  0001 C CNN
F 3 "~" H 1100 5250 50  0001 C CNN
	1    1100 5250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5E2DFB6D
P 1100 5450
F 0 "MH2" H 1200 5496 50  0000 L CNN
F 1 "MountingHole" H 1200 5405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1100 5450 50  0001 C CNN
F 3 "~" H 1100 5450 50  0001 C CNN
	1    1100 5450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5E2E0B2B
P 1100 5650
F 0 "MH3" H 1200 5696 50  0000 L CNN
F 1 "MountingHole" H 1200 5605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1100 5650 50  0001 C CNN
F 3 "~" H 1100 5650 50  0001 C CNN
	1    1100 5650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5E2E1B3B
P 1100 5850
F 0 "MH4" H 1200 5896 50  0000 L CNN
F 1 "MountingHole" H 1200 5805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1100 5850 50  0001 C CNN
F 3 "~" H 1100 5850 50  0001 C CNN
	1    1100 5850
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:SparkerLogo LOGO2
U 1 1 5E30CDEC
P 2000 5850
F 0 "LOGO2" H 2025 5896 50  0000 L CNN
F 1 "SparkerLogo" H 2025 5805 50  0000 L CNN
F 2 "Sparker:NASA" H 1900 5900 50  0001 C CNN
F 3 "" H 1900 5900 50  0001 C CNN
	1    2000 5850
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:UoNLogo LOGO1
U 1 1 5E30DF5A
P 2000 5600
F 0 "LOGO1" H 2025 5646 50  0000 L CNN
F 1 "UoNLogo" H 2025 5555 50  0000 L CNN
F 2 "Sparker:UoN" H 2000 5600 50  0001 C CNN
F 3 "" H 2000 5600 50  0001 C CNN
	1    2000 5600
	1    0    0    -1  
$EndComp
NoConn ~ 7250 5150
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5DB16C77
P 9950 5200
F 0 "J7" H 9922 5080 50  0000 R CNN
F 1 "VIN_RAW_TP" H 9922 5171 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9950 5200 50  0001 C CNN
F 3 "~" H 9950 5200 50  0001 C CNN
	1    9950 5200
	-1   0    0    1   
$EndComp
Text Label 9400 5100 0    50   ~ 0
VIN_RAW
Text Label 9400 5200 0    50   ~ 0
GND
Wire Wire Line
	9400 5100 9750 5100
Wire Wire Line
	9400 5200 9750 5200
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 5DB1EA2E
P 9950 5800
F 0 "J12" H 9922 5680 50  0000 R CNN
F 1 "START_TP" H 9922 5771 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9950 5800 50  0001 C CNN
F 3 "~" H 9950 5800 50  0001 C CNN
	1    9950 5800
	-1   0    0    1   
$EndComp
Text Label 9400 5700 0    50   ~ 0
START_3V3
Text Label 9400 5800 0    50   ~ 0
GND
Wire Wire Line
	9400 5700 9750 5700
Wire Wire Line
	9400 5800 9750 5800
Text Label 9400 5500 0    50   ~ 0
GND
Wire Wire Line
	9400 5500 9750 5500
Wire Wire Line
	9400 5400 9750 5400
Text Label 9400 5400 0    50   ~ 0
~CS_3V3
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 5DB1BF34
P 9950 5500
F 0 "J10" H 9923 5374 50  0000 R CNN
F 1 "~CS~_TP" H 9923 5472 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9950 5500 50  0001 C CNN
F 3 "~" H 9950 5500 50  0001 C CNN
	1    9950 5500
	-1   0    0    1   
$EndComp
Text Label 4250 2150 0    50   ~ 0
~CS_3V3
Text Label 4250 2550 0    50   ~ 0
START_3V3
Text Label 4250 2650 0    50   ~ 0
~DRDY_3V3
Text Label 4250 2750 0    50   ~ 0
~RESET_3V3
Text Label 4250 2850 0    50   ~ 0
~PWDN_3V3
Wire Notes Line
	900  4950 2700 4950
Wire Notes Line
	2700 4950 2700 6000
Wire Notes Line
	900  6000 900  4950
Wire Notes Line
	900  6000 2700 6000
Text Notes 1050 5100 0    79   ~ 0
Mounting Holes & Logos
Wire Notes Line
	4150 6200 6450 6200
Wire Notes Line
	6450 6200 6450 7650
Wire Notes Line
	6450 7650 4150 7650
Wire Notes Line
	4150 7650 4150 6200
Text Notes 4650 6350 0    79   ~ 0
Power Connections
Wire Notes Line
	9200 4800 10450 4800
Wire Notes Line
	10450 4800 10450 5900
Wire Notes Line
	10450 5900 9200 5900
Wire Notes Line
	9200 5900 9200 4800
Text Notes 9500 4950 0    79   ~ 0
Test Points
Wire Notes Line
	7000 4700 8800 4700
Wire Notes Line
	8800 4700 8800 5950
Wire Notes Line
	8800 5950 7000 5950
Wire Notes Line
	7000 5950 7000 4700
Text Notes 7150 4850 0    79   ~ 0
HC-05 Bluetooth Module
Text Notes 3800 900  0    98   ~ 20
Data Acquisition System
Connection ~ 6650 2600
Text Label 4250 1600 0    50   ~ 0
+3V3
Text Label 4250 2250 0    50   ~ 0
MOSI_3V3
Text Label 4250 2350 0    50   ~ 0
MISO_3V3
Text Label 4250 2450 0    50   ~ 0
SCLK_3V3
Text Label 4900 2150 0    50   ~ 0
~CS_5V
Text Label 4900 2250 0    50   ~ 0
MOSI_5V
Text Label 4900 2350 0    50   ~ 0
MISO_5V
Text Label 4900 2450 0    50   ~ 0
SCLK_5V
Text Label 4900 2550 0    50   ~ 0
START_5V
Text Label 4900 2650 0    50   ~ 0
~DRDY_5V
Text Label 4900 2750 0    50   ~ 0
~RESET_5V
Text Label 4900 2850 0    50   ~ 0
~PWDN_5V
Text Label 4200 4900 0    50   ~ 0
START_3V3
Text Label 4200 5000 0    50   ~ 0
~DRDY_3V3
Text Label 4200 5100 0    50   ~ 0
~RESET_3V3
Text Label 4200 5200 0    50   ~ 0
~PWDN_3V3
$Comp
L My_Switch:TXS0108EPWR U6
U 1 1 5ED0CA2D
P 5150 4950
F 0 "U6" H 4950 4550 50  0000 C CNN
F 1 "TXS0108EPWR" H 5250 4300 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 5150 4950 50  0001 C CNN
F 3 "" H 5150 4950 50  0001 C CNN
	1    5150 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4500 4900 4500
Wire Wire Line
	4000 4600 4900 4600
Wire Wire Line
	4000 4700 4900 4700
Wire Wire Line
	4000 4800 4900 4800
Wire Wire Line
	4000 4900 4900 4900
Wire Wire Line
	4000 5000 4900 5000
Wire Wire Line
	4000 5100 4900 5100
Wire Wire Line
	4000 5200 4900 5200
Wire Wire Line
	5200 3950 4800 3950
Wire Wire Line
	5300 3950 5450 3950
Text Label 5600 3950 0    50   ~ 0
+5V
Wire Wire Line
	5300 5350 5300 5500
Text Label 5850 5500 0    50   ~ 0
GND
Wire Wire Line
	5200 3950 5200 4350
Wire Wire Line
	5300 3950 5300 4350
$Comp
L Device:C C64
U 1 1 5ED0CA43
P 4800 4100
F 0 "C64" H 4915 4146 50  0000 L CNN
F 1 "10n" H 4915 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4838 3950 50  0001 C CNN
F 3 "~" H 4800 4100 50  0001 C CNN
	1    4800 4100
	1    0    0    -1  
$EndComp
Connection ~ 4800 3950
Wire Wire Line
	4800 3950 4400 3950
$Comp
L Device:C C63
U 1 1 5ED0CA4C
P 4400 4100
F 0 "C63" H 4515 4146 50  0000 L CNN
F 1 "100n" H 4515 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4438 3950 50  0001 C CNN
F 3 "~" H 4400 4100 50  0001 C CNN
	1    4400 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C65
U 1 1 5ED0CA55
P 5450 4100
F 0 "C65" H 5565 4146 50  0000 L CNN
F 1 "10n" H 5565 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5488 3950 50  0001 C CNN
F 3 "~" H 5450 4100 50  0001 C CNN
	1    5450 4100
	1    0    0    -1  
$EndComp
Connection ~ 5450 3950
$Comp
L Device:C C66
U 1 1 5ED0CA5E
P 5850 4100
F 0 "C66" H 5965 4146 50  0000 L CNN
F 1 "100n" H 5965 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5888 3950 50  0001 C CNN
F 3 "~" H 5850 4100 50  0001 C CNN
	1    5850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4250 4400 4250
Connection ~ 4400 4250
Wire Wire Line
	4400 4250 4150 4250
Text Label 4150 4250 0    50   ~ 0
GND
Text Label 6050 4250 0    50   ~ 0
GND
Text Label 4500 3950 0    50   ~ 0
+3V3
Wire Wire Line
	5200 5350 5200 5500
Wire Wire Line
	5200 5500 4600 5500
Text Label 4300 5500 0    50   ~ 0
+3V3
$Comp
L Device:R R28
U 1 1 5ED0CA71
P 4600 5650
F 0 "R28" H 4670 5696 50  0000 L CNN
F 1 "100k" H 4670 5605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4530 5650 50  0001 C CNN
F 3 "~" H 4600 5650 50  0001 C CNN
	1    4600 5650
	1    0    0    -1  
$EndComp
Connection ~ 4600 5500
Wire Wire Line
	4600 5500 4250 5500
Wire Wire Line
	4600 5800 4600 5900
Wire Wire Line
	4600 5900 4900 5900
Text Label 4750 5900 0    50   ~ 0
GND
Text Label 4200 4700 0    50   ~ 0
MOSI_3V3
Text Label 4200 4600 0    50   ~ 0
MISO_3V3
Text Label 4200 4800 0    50   ~ 0
SCLK_3V3
Wire Wire Line
	5300 5500 6000 5500
Wire Wire Line
	5600 4500 6300 4500
Wire Wire Line
	5600 4600 6300 4600
Wire Wire Line
	5600 4700 6300 4700
Wire Wire Line
	5600 4800 6300 4800
Wire Wire Line
	5600 4900 6300 4900
Wire Wire Line
	5600 5000 6300 5000
Wire Wire Line
	5600 5100 6300 5100
Wire Wire Line
	5600 5200 6300 5200
Text Label 4200 4500 0    50   ~ 0
~CS_3V3
Text Label 5850 4500 0    50   ~ 0
~CS_5V
Text Label 5850 4700 0    50   ~ 0
MOSI_5V
Text Label 5850 4600 0    50   ~ 0
MISO_5V
Text Label 5850 4800 0    50   ~ 0
SCLK_5V
Text Label 5850 4900 0    50   ~ 0
START_5V
Text Label 5850 5000 0    50   ~ 0
~DRDY_5V
Text Label 5850 5100 0    50   ~ 0
~RESET_5V
Text Label 5850 5200 0    50   ~ 0
~PWDN_5V
Wire Wire Line
	4050 2150 4650 2150
Wire Wire Line
	4050 2250 4650 2250
Wire Wire Line
	4050 2350 4650 2350
Wire Wire Line
	4050 2450 4650 2450
Wire Wire Line
	4050 2550 4650 2550
Wire Wire Line
	4050 2650 4650 2650
Wire Wire Line
	4050 2750 4650 2750
Wire Wire Line
	4050 2850 4650 2850
Wire Wire Line
	4850 2150 5350 2150
Wire Wire Line
	4850 2250 5350 2250
Wire Wire Line
	5350 2350 4850 2350
Wire Wire Line
	4850 2450 5350 2450
Wire Wire Line
	5350 2550 4850 2550
Wire Wire Line
	4850 2650 5350 2650
Wire Wire Line
	5350 2750 4850 2750
Wire Wire Line
	4850 2850 5350 2850
Text Notes 4050 3800 0    79   ~ 0
3V3 <-> 5V Bidirectional Level Shifter
Wire Notes Line
	3850 5950 6600 5950
Wire Notes Line
	6600 5950 6600 3650
Wire Notes Line
	6600 3650 3850 3650
Wire Notes Line
	3850 3650 3850 5950
Wire Wire Line
	6050 2500 6800 2500
Wire Wire Line
	6050 2600 6650 2600
Wire Wire Line
	6050 3000 6650 3000
Wire Wire Line
	4050 1600 4500 1600
Connection ~ 5850 4250
Wire Wire Line
	5850 4250 6200 4250
Wire Wire Line
	5450 4250 5850 4250
Wire Wire Line
	5450 3950 5850 3950
Text Notes 5450 5800 0    50   ~ 0
Ensure VCCA <= VCCB
$Comp
L My_Graphics:SparkerLogo LOGO3
U 1 1 5ED3B07B
P 2000 5350
F 0 "LOGO3" H 2025 5396 50  0000 L CNN
F 1 "VersionLogo" H 2025 5305 50  0000 L CNN
F 2 "Sparker:Block2" H 1900 5400 50  0001 C CNN
F 3 "" H 1900 5400 50  0001 C CNN
	1    2000 5350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
