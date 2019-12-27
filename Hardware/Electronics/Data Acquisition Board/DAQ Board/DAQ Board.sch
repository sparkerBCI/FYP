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
S 4350 1600 750  1750
U 5D7F9BD3
F0 "ADC1299" 50
F1 "ADC1299.sch" 50
F2 "~PWDN" I R 5100 3250 50 
F3 "~RESET" I R 5100 3150 50 
F4 "MOSI" I R 5100 2000 50 
F5 "MISO" I R 5100 2100 50 
F6 "SCLK" I R 5100 2200 50 
F7 "~CS" I R 5100 1900 50 
F8 "START" I R 5100 2550 50 
F9 "~DRDY" I R 5100 2650 50 
F10 "DGND" I L 4350 3100 50 
F11 "VIN" I L 4350 1900 50 
F12 "AVSS" I L 4350 3000 50 
$EndSheet
$Sheet
S 5600 1650 700  1750
U 5D80B4DC
F0 "Arduino Nano" 50
F1 "Arduino_Nano.sch" 50
F2 "MOSI" I L 5600 2000 50 
F3 "MISO" I L 5600 2100 50 
F4 "~CS" I L 5600 1900 50 
F5 "SCLK" I L 5600 2200 50 
F6 "START" I L 5600 2550 50 
F7 "~DRDY" I L 5600 2650 50 
F8 "~PWDN" I L 5600 3250 50 
F9 "TX" I R 6300 2750 50 
F10 "RX" I R 6300 2650 50 
F11 "~RESET" I L 5600 3150 50 
F12 "VIN" I R 6300 1800 50 
F13 "GND" I R 6300 3150 50 
F14 "+5V" I R 6300 2000 50 
F15 "AT_COMM" I R 6300 2350 50 
$EndSheet
Wire Wire Line
	5100 1900 5600 1900
Wire Wire Line
	5100 2000 5600 2000
Wire Wire Line
	5100 2100 5600 2100
Wire Wire Line
	5100 2200 5600 2200
Wire Wire Line
	5100 2550 5600 2550
Wire Wire Line
	5100 2650 5600 2650
Wire Wire Line
	5100 3150 5600 3150
Wire Wire Line
	5100 3250 5600 3250
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5D8A8745
P 7350 5400
AR Path="/5D899D49/5D8A8745" Ref="J?"  Part="1" 
AR Path="/5D8A8745" Ref="J5"  Part="1" 
F 0 "J5" H 7200 5000 50  0000 L CNN
F 1 "HC-05 BT Module" H 7150 4900 50  0000 L CNN
F 2 "Resonators:HC-05" H 7350 5400 50  0001 C CNN
F 3 "~" H 7350 5400 50  0001 C CNN
	1    7350 5400
	1    0    0    -1  
$EndComp
Text Notes 7450 5700 0    50   ~ 0
Enable AT Commands
Text Notes 7450 5600 0    50   ~ 0
+5V
Text Notes 7450 5500 0    50   ~ 0
GND
Text Notes 7450 5400 0    50   ~ 0
TX
Text Notes 7450 5300 0    50   ~ 0
RX
Text Notes 7450 5200 0    50   ~ 0
LED
Text Label 6800 5600 0    50   ~ 0
+5V
Text Label 6800 5500 0    50   ~ 0
GND
Text Label 6800 5400 0    50   ~ 0
HC05_RX
Text Label 6800 5300 0    50   ~ 0
HC05_TX
Wire Wire Line
	7150 5300 6800 5300
Wire Wire Line
	7150 5400 6800 5400
Wire Wire Line
	7150 5700 6800 5700
NoConn ~ 6800 5700
Wire Wire Line
	6300 2000 6700 2000
Text Label 6550 2000 0    50   ~ 0
+5V
Text Label 7300 2650 0    50   ~ 0
HC05_RX
Text Label 8050 2750 0    50   ~ 0
HC05_TX
Wire Wire Line
	7150 5200 6800 5200
Wire Wire Line
	7150 5500 6800 5500
Wire Wire Line
	7150 5600 6800 5600
Wire Wire Line
	6300 2350 6700 2350
Text Label 6350 2350 0    50   ~ 0
AT_COMM
Wire Wire Line
	4350 3000 4250 3000
Wire Wire Line
	4250 3000 4250 3100
Wire Wire Line
	4250 3100 4350 3100
Wire Wire Line
	4250 3100 3850 3100
Connection ~ 4250 3100
Text Label 3850 3100 0    50   ~ 0
GND
Wire Wire Line
	6300 3150 6700 3150
Text Label 6550 3150 0    50   ~ 0
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
	4350 1900 3850 1900
Text Label 3850 1900 0    50   ~ 0
VIN
Wire Wire Line
	6300 1800 6700 1800
Text Label 6600 1800 0    50   ~ 0
VIN
$Comp
L Device:R R20
U 1 1 5DA0407B
P 7500 2900
F 0 "R20" H 7570 2946 50  0000 L CNN
F 1 "2K" H 7570 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7430 2900 50  0001 C CNN
F 3 "~" H 7500 2900 50  0001 C CNN
	1    7500 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5DA04C13
P 7800 2750
F 0 "R21" V 7593 2750 50  0000 C CNN
F 1 "1K" V 7684 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7730 2750 50  0001 C CNN
F 3 "~" H 7800 2750 50  0001 C CNN
	1    7800 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 3050 7500 3250
Wire Wire Line
	7500 3250 7700 3250
Text Label 7550 3250 0    50   ~ 0
GND
Wire Wire Line
	7150 2650 7650 2650
Wire Wire Line
	7650 2750 7500 2750
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
$Comp
L Switch:SW_DIP_x02 SW2
U 1 1 5DA8AB68
P 6850 2750
F 0 "SW2" H 6850 3117 50  0000 C CNN
F 1 "SW_DIP_x02" H 6850 3026 50  0000 C CNN
F 2 "Switches:DIP-Switch_01x02" H 6850 2750 50  0001 C CNN
F 3 "" H 6850 2750 50  0001 C CNN
	1    6850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2650 6300 2650
Wire Wire Line
	6550 2750 6300 2750
Text Notes 1500 6800 0    50   ~ 0
1.5A Rating
Wire Wire Line
	7950 2750 8350 2750
Wire Wire Line
	7150 2750 7500 2750
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
NoConn ~ 6800 5200
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5DB16C77
P 5550 5300
F 0 "J7" H 5522 5180 50  0000 R CNN
F 1 "VIN_RAW_TP" H 5522 5271 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5550 5300 50  0001 C CNN
F 3 "~" H 5550 5300 50  0001 C CNN
	1    5550 5300
	-1   0    0    1   
$EndComp
Text Label 5000 5200 0    50   ~ 0
VIN_RAW
Text Label 5000 5300 0    50   ~ 0
GND
Wire Wire Line
	5000 5200 5350 5200
Wire Wire Line
	5000 5300 5350 5300
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 5DB1EA2E
P 5550 5900
F 0 "J12" H 5522 5780 50  0000 R CNN
F 1 "START_TP" H 5522 5871 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5550 5900 50  0001 C CNN
F 3 "~" H 5550 5900 50  0001 C CNN
	1    5550 5900
	-1   0    0    1   
$EndComp
Text Label 5000 5800 0    50   ~ 0
START
Text Label 5000 5900 0    50   ~ 0
GND
Wire Wire Line
	5000 5800 5350 5800
Wire Wire Line
	5000 5900 5350 5900
Text Label 5000 5600 0    50   ~ 0
GND
Wire Wire Line
	5000 5600 5350 5600
Wire Wire Line
	5000 5500 5350 5500
Text Label 5000 5500 0    50   ~ 0
~CS
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 5DB1BF34
P 5550 5600
F 0 "J10" H 5523 5474 50  0000 R CNN
F 1 "~CS~_TP" H 5523 5572 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5550 5600 50  0001 C CNN
F 3 "~" H 5550 5600 50  0001 C CNN
	1    5550 5600
	-1   0    0    1   
$EndComp
Text Label 5300 1900 0    50   ~ 0
~CS
Text Label 5250 2550 0    50   ~ 0
START
Text Label 5250 2650 0    50   ~ 0
~DRDY
Text Label 5250 3150 0    50   ~ 0
~RESET
Text Label 5250 3250 0    50   ~ 0
~PWDN
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
	4800 4900 6050 4900
Wire Notes Line
	6050 4900 6050 6000
Wire Notes Line
	6050 6000 4800 6000
Wire Notes Line
	4800 6000 4800 4900
Text Notes 5100 5050 0    79   ~ 0
Test Points
Wire Notes Line
	6550 4750 8350 4750
Wire Notes Line
	8350 4750 8350 6000
Wire Notes Line
	8350 6000 6550 6000
Wire Notes Line
	6550 6000 6550 4750
Text Notes 6700 4900 0    79   ~ 0
HC-05 Bluetooth Module
Text Notes 5100 900  0    98   ~ 20
Data Acquisition System
Connection ~ 7500 2750
$EndSCHEMATC
