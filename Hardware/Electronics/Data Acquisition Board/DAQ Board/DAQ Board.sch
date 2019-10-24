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
S 3450 2800 750  1750
U 5D7F9BD3
F0 "ADC1299" 50
F1 "ADC1299.sch" 50
F2 "~PWDN" I R 4200 4450 50 
F3 "~RESET" I R 4200 4350 50 
F4 "MOSI" I R 4200 3200 50 
F5 "MISO" I R 4200 3300 50 
F6 "SCLK" I R 4200 3400 50 
F7 "~CS" I R 4200 3100 50 
F8 "START" I R 4200 3750 50 
F9 "~DRDY" I R 4200 3850 50 
F10 "DGND" I L 3450 4300 50 
F11 "VIN" I L 3450 3100 50 
F12 "AVSS" I L 3450 4200 50 
$EndSheet
$Sheet
S 4700 2850 700  1750
U 5D80B4DC
F0 "Arduino Nano" 50
F1 "Arduino_Nano.sch" 50
F2 "MOSI" I L 4700 3200 50 
F3 "MISO" I L 4700 3300 50 
F4 "~CS" I L 4700 3100 50 
F5 "SCLK" I L 4700 3400 50 
F6 "START" I L 4700 3750 50 
F7 "~DRDY" I L 4700 3850 50 
F8 "~PWDN" I L 4700 4450 50 
F9 "TX" I R 5400 3950 50 
F10 "RX" I R 5400 3850 50 
F11 "~RESET" I L 4700 4350 50 
F12 "VIN" I R 5400 3000 50 
F13 "GND" I R 5400 4350 50 
F14 "+5V" I R 5400 3200 50 
F15 "AT_COMM" I R 5400 3550 50 
$EndSheet
Wire Wire Line
	4200 3100 4700 3100
Wire Wire Line
	4200 3200 4700 3200
Wire Wire Line
	4200 3300 4700 3300
Wire Wire Line
	4200 3400 4700 3400
Wire Wire Line
	4200 3750 4700 3750
Wire Wire Line
	4200 3850 4700 3850
Wire Wire Line
	4200 4350 4700 4350
Wire Wire Line
	4200 4450 4700 4450
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5D8A8745
P 8500 3750
AR Path="/5D899D49/5D8A8745" Ref="J?"  Part="1" 
AR Path="/5D8A8745" Ref="J5"  Part="1" 
F 0 "J5" H 8350 3350 50  0000 L CNN
F 1 "HC-05 BT Module" H 8300 3250 50  0000 L CNN
F 2 "Resonators:HC-05" H 8500 3750 50  0001 C CNN
F 3 "~" H 8500 3750 50  0001 C CNN
	1    8500 3750
	1    0    0    -1  
$EndComp
Text Notes 8600 3550 0    50   ~ 0
Enable AT Commands
Text Notes 8600 3650 0    50   ~ 0
+5V
Text Notes 8600 3750 0    50   ~ 0
GND
Text Notes 8600 3850 0    50   ~ 0
TX
Text Notes 8600 3950 0    50   ~ 0
RX
Text Notes 8600 4050 0    50   ~ 0
LED
Text Label 7950 3650 0    50   ~ 0
+5V
Text Label 7950 3750 0    50   ~ 0
GND
Text Label 7950 3850 0    50   ~ 0
HC05_RX
Text Label 7950 3950 0    50   ~ 0
HC05_TX
Wire Wire Line
	8300 3650 7950 3650
Wire Wire Line
	8300 3750 7950 3750
Wire Wire Line
	8300 4050 7950 4050
NoConn ~ 7950 4050
Wire Wire Line
	5400 3200 5800 3200
Text Label 5650 3200 0    50   ~ 0
+5V
Text Label 7250 3850 0    50   ~ 0
HC05_RX
Text Label 6250 3950 0    50   ~ 0
HC05_TX
Wire Wire Line
	8300 3550 7950 3550
Wire Wire Line
	8300 3850 7950 3850
Wire Wire Line
	8300 3950 7950 3950
Wire Wire Line
	5400 3550 5800 3550
Text Label 5450 3550 0    50   ~ 0
AT_COMM
Wire Wire Line
	3450 4200 3350 4200
Wire Wire Line
	3350 4200 3350 4300
Wire Wire Line
	3350 4300 3450 4300
Wire Wire Line
	3350 4300 2950 4300
Connection ~ 3350 4300
Text Label 2950 4300 0    50   ~ 0
GND
Wire Wire Line
	5400 4350 5800 4350
Text Label 5650 4350 0    50   ~ 0
GND
$Comp
L Connector:Barrel_Jack J4
U 1 1 5DB47949
P 1100 3800
F 0 "J4" H 1155 4125 50  0000 C CNN
F 1 "DC Barrel Jack" H 1155 4034 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-063AH_Horizontal" H 1150 3760 50  0001 C CNN
F 3 "~" H 1150 3760 50  0001 C CNN
	1    1100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3900 1800 3900
Wire Wire Line
	1400 3700 1800 3700
Text Label 1650 3700 0    50   ~ 0
GND
Text Label 1600 3900 0    50   ~ 0
VIN_RAW
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5DB485DF
P 950 3200
F 0 "J3" H 870 2875 50  0000 C CNN
F 1 "Battery Connector" H 870 2966 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 950 3200 50  0001 C CNN
F 3 "~" H 950 3200 50  0001 C CNN
	1    950  3200
	-1   0    0    1   
$EndComp
Text Label 1250 3100 0    50   ~ 0
GND
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5DB4C37F
P 1600 3200
F 0 "SW1" H 1750 3450 50  0000 C CNN
F 1 "DIP" H 1750 3350 50  0000 C CNN
F 2 "Switches:DIP-Switch_01x01" H 1600 3200 50  0001 C CNN
F 3 "" H 1600 3200 50  0001 C CNN
	1    1600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3200 2650 3200
Text Label 2500 3200 0    50   ~ 0
VBAT
Wire Wire Line
	1150 3100 1400 3100
Wire Wire Line
	1300 3200 1150 3200
$Comp
L Device:D_Schottky D1
U 1 1 5DB4F989
P 1550 7150
F 0 "D1" H 1550 7366 50  0000 C CNN
F 1 "NSR20F40NXT5GOSCT-ND" H 1550 7275 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 1550 7150 50  0001 C CNN
F 3 "~" H 1550 7150 50  0001 C CNN
	1    1550 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 7150 1050 7150
Wire Wire Line
	1700 7150 2050 7150
Text Label 1050 7150 0    50   ~ 0
VIN
Text Label 1750 7150 0    50   ~ 0
VBAT
Text Notes 900  6750 0    79   ~ 0
VIN Auto Selector
Wire Notes Line
	800  6600 2250 6600
Wire Notes Line
	2250 6600 2250 7450
Wire Notes Line
	800  7450 800  6600
Wire Notes Line
	800  7450 2250 7450
Wire Wire Line
	3450 3100 2950 3100
Text Label 2950 3100 0    50   ~ 0
VIN
Wire Wire Line
	5400 3000 5800 3000
Text Label 5700 3000 0    50   ~ 0
VIN
$Comp
L Device:R R20
U 1 1 5DA0407B
P 6750 4000
F 0 "R20" H 6820 4046 50  0000 L CNN
F 1 "2K" H 6820 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6680 4000 50  0001 C CNN
F 3 "~" H 6750 4000 50  0001 C CNN
	1    6750 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5DA04C13
P 7050 3850
F 0 "R21" V 6843 3850 50  0000 C CNN
F 1 "1K" V 6934 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 3850 50  0001 C CNN
F 3 "~" H 7050 3850 50  0001 C CNN
	1    7050 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 4150 6750 4350
Wire Wire Line
	6750 4350 6950 4350
Text Label 6800 4350 0    50   ~ 0
GND
Wire Wire Line
	6250 3850 6750 3850
Wire Wire Line
	6900 3850 6750 3850
Connection ~ 6750 3850
$Comp
L pspice:DIODE D2
U 1 1 5DA64DE7
P 2100 3200
F 0 "D2" H 2100 3350 50  0000 C CNN
F 1 "MURA140T3GOSCT-ND" H 2450 3050 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 2100 3200 50  0001 C CNN
F 3 "" H 2100 3200 50  0001 C CNN
	1    2100 3200
	1    0    0    -1  
$EndComp
$Comp
L My_dmp2100u:DMP2100U Q1
U 1 1 5DA6E1B7
P 4050 6600
F 0 "Q1" V 4393 6600 50  0000 C CNN
F 1 "DMP2100U" V 4302 6600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4250 6525 50  0001 L CIN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/MOSFETs/DMP2100U/DMP2100U.pdf" V 4050 6600 50  0001 L CNN
	1    4050 6600
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5DA708B0
P 4700 6650
F 0 "D3" V 4654 6729 50  0000 L CNN
F 1 "7.5V" V 4745 6729 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 4700 6650 50  0001 C CNN
F 3 "~" H 4700 6650 50  0001 C CNN
	1    4700 6650
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5DA70948
P 4050 7100
F 0 "R19" H 4120 7146 50  0000 L CNN
F 1 "33k" H 4120 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3980 7100 50  0001 C CNN
F 3 "~" H 4050 7100 50  0001 C CNN
	1    4050 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 6500 2850 6500
Wire Wire Line
	4050 6800 4050 6900
Wire Wire Line
	4250 6500 4700 6500
Wire Wire Line
	4700 6800 4700 6900
Wire Wire Line
	4700 6900 4050 6900
Connection ~ 4050 6900
Wire Wire Line
	4050 6900 4050 6950
Wire Wire Line
	4050 7250 4050 7400
Text Label 2850 7400 0    50   ~ 0
GND
Text Label 2850 6500 0    50   ~ 0
VIN_RAW
Text Label 5000 6500 0    50   ~ 0
VIN
$Comp
L Device:Fuse F1
U 1 1 5DA77262
P 3500 6500
F 0 "F1" V 3303 6500 50  0000 C CNN
F 1 "0251004.NRT1L" V 3394 6500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3430 6500 50  0001 C CNN
F 3 "~" H 3500 6500 50  0001 C CNN
	1    3500 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 6500 5100 6500
Wire Wire Line
	3850 6500 3650 6500
Connection ~ 4700 6500
Wire Wire Line
	2850 7400 4050 7400
Text Notes 2700 6200 0    79   ~ 0
Reverse Polarity and Overcurrent Protection
Wire Notes Line
	2700 6050 5400 6050
Wire Notes Line
	5400 6050 5400 7500
Wire Notes Line
	5400 7500 2700 7500
Wire Notes Line
	2700 7500 2700 6050
$Comp
L Switch:SW_DIP_x02 SW2
U 1 1 5DA8AB68
P 5950 3950
F 0 "SW2" H 5950 4317 50  0000 C CNN
F 1 "SW_DIP_x02" H 5950 4226 50  0000 C CNN
F 2 "Switches:DIP-Switch_01x02" H 5950 3950 50  0001 C CNN
F 3 "" H 5950 3950 50  0001 C CNN
	1    5950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3850 5400 3850
Wire Wire Line
	5650 3950 5400 3950
Text Notes 3300 6650 0    50   ~ 0
4A Rating
Wire Wire Line
	7200 3850 7600 3850
Wire Wire Line
	6250 3950 6600 3950
$Comp
L Mechanical:MountingHole MH1
U 1 1 5E2DFA9E
P 1050 4950
F 0 "MH1" H 1150 4996 50  0000 L CNN
F 1 "MountingHole" H 1150 4905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1050 4950 50  0001 C CNN
F 3 "~" H 1050 4950 50  0001 C CNN
	1    1050 4950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5E2DFB6D
P 1050 5150
F 0 "MH2" H 1150 5196 50  0000 L CNN
F 1 "MountingHole" H 1150 5105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1050 5150 50  0001 C CNN
F 3 "~" H 1050 5150 50  0001 C CNN
	1    1050 5150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5E2E0B2B
P 1050 5350
F 0 "MH3" H 1150 5396 50  0000 L CNN
F 1 "MountingHole" H 1150 5305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1050 5350 50  0001 C CNN
F 3 "~" H 1050 5350 50  0001 C CNN
	1    1050 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5E2E1B3B
P 1050 5550
F 0 "MH4" H 1150 5596 50  0000 L CNN
F 1 "MountingHole" H 1150 5505 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1050 5550 50  0001 C CNN
F 3 "~" H 1050 5550 50  0001 C CNN
	1    1050 5550
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:SparkerLogo LOGO2
U 1 1 5E30CDEC
P 1950 5550
F 0 "LOGO2" H 1975 5596 50  0000 L CNN
F 1 "SparkerLogo" H 1975 5505 50  0000 L CNN
F 2 "Sparker:NASA" H 1850 5600 50  0001 C CNN
F 3 "" H 1850 5600 50  0001 C CNN
	1    1950 5550
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:UoNLogo LOGO1
U 1 1 5E30DF5A
P 1950 5300
F 0 "LOGO1" H 1975 5346 50  0000 L CNN
F 1 "UoNLogo" H 1975 5255 50  0000 L CNN
F 2 "Sparker:UoN" H 1950 5300 50  0001 C CNN
F 3 "" H 1950 5300 50  0001 C CNN
	1    1950 5300
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:Text TEXT1
U 1 1 5E30F336
P 1950 5100
F 0 "TEXT1" H 1975 5146 50  0000 L CNN
F 1 "Text" H 1975 5055 50  0000 L CNN
F 2 "Sparker:NASA_subtext" H 1950 5100 50  0001 C CNN
F 3 "" H 1950 5100 50  0001 C CNN
	1    1950 5100
	1    0    0    -1  
$EndComp
NoConn ~ 7950 3550
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5DB16C77
P 7600 5300
F 0 "J7" H 7572 5180 50  0000 R CNN
F 1 "VIN_RAW_TP" H 7572 5271 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7600 5300 50  0001 C CNN
F 3 "~" H 7600 5300 50  0001 C CNN
	1    7600 5300
	-1   0    0    1   
$EndComp
Text Label 7050 5200 0    50   ~ 0
VIN_RAW
Text Label 7050 5300 0    50   ~ 0
GND
Wire Wire Line
	7050 5200 7400 5200
Wire Wire Line
	7050 5300 7400 5300
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 5DB1EA2E
P 8950 5800
F 0 "J12" H 8922 5680 50  0000 R CNN
F 1 "START_TP" H 8922 5771 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8950 5800 50  0001 C CNN
F 3 "~" H 8950 5800 50  0001 C CNN
	1    8950 5800
	-1   0    0    1   
$EndComp
Text Label 8400 5700 0    50   ~ 0
START
Text Label 8400 5800 0    50   ~ 0
GND
Wire Wire Line
	8400 5700 8750 5700
Wire Wire Line
	8400 5800 8750 5800
Text Label 8400 5300 0    50   ~ 0
GND
Wire Wire Line
	8400 5300 8750 5300
Wire Wire Line
	8400 5200 8750 5200
Text Label 8400 5200 0    50   ~ 0
~CS
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 5DB1BF34
P 8950 5300
F 0 "J10" H 8923 5174 50  0000 R CNN
F 1 "~CS~_TP" H 8923 5272 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8950 5300 50  0001 C CNN
F 3 "~" H 8950 5300 50  0001 C CNN
	1    8950 5300
	-1   0    0    1   
$EndComp
Text Label 4400 3100 0    50   ~ 0
~CS
Text Label 4350 3750 0    50   ~ 0
START
Text Label 4350 3850 0    50   ~ 0
~DRDY
Text Label 4350 4350 0    50   ~ 0
~RESET
Text Label 4350 4450 0    50   ~ 0
~PWDN
$EndSCHEMATC
