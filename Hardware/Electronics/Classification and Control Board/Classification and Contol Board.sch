EESchema Schematic File Version 4
LIBS:Classification and Contol Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
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
S 4700 1700 700  2200
U 5EB4567D
F0 "STM32F407VGTx" 50
F1 "STM32F407VGTx.sch" 50
F2 "TX" O R 5400 3800 50 
F3 "RX" I R 5400 3700 50 
F4 "PWM1" O R 5400 1850 50 
F5 "PWM2" O R 5400 2100 50 
F6 "PWM3" O R 5400 2350 50 
F7 "PWM4" O R 5400 2600 50 
F8 "PWM5" O R 5400 2850 50 
F9 "PWM6" O R 5400 3100 50 
F10 "FB1" I R 5400 1950 50 
F11 "FB2" I R 5400 2200 50 
F12 "FB3" I R 5400 2450 50 
F13 "FB4" I R 5400 2700 50 
F14 "FB6" I R 5400 3200 50 
F15 "V+" O L 4700 2100 50 
F16 "FB5" I R 5400 2950 50 
F17 "GND" I L 4700 3450 50 
F18 "FB_REF" I R 5400 3350 50 
$EndSheet
$Comp
L Device:CP C53
U 1 1 5EB7443A
P 1050 5400
F 0 "C53" H 1168 5446 50  0000 L CNN
F 1 "100u" H 1168 5355 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 1088 5250 50  0001 C CNN
F 3 "~" H 1050 5400 50  0001 C CNN
	1    1050 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C55
U 1 1 5EB744CB
P 2150 5400
F 0 "C55" H 2265 5446 50  0000 L CNN
F 1 "10u" H 2265 5355 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 2188 5250 50  0001 C CNN
F 3 "~" H 2150 5400 50  0001 C CNN
	1    2150 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C56
U 1 1 5EB74532
P 2650 5400
F 0 "C56" H 2765 5446 50  0000 L CNN
F 1 "10u" H 2765 5355 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 2688 5250 50  0001 C CNN
F 3 "~" H 2650 5400 50  0001 C CNN
	1    2650 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C57
U 1 1 5EB74539
P 3200 5400
F 0 "C57" H 3315 5446 50  0000 L CNN
F 1 "4.7u" H 3315 5355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3238 5250 50  0001 C CNN
F 3 "~" H 3200 5400 50  0001 C CNN
	1    3200 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C54
U 1 1 5EB7459B
P 1600 5400
F 0 "C54" H 1718 5446 50  0000 L CNN
F 1 "100u" H 1718 5355 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 1638 5250 50  0001 C CNN
F 3 "~" H 1600 5400 50  0001 C CNN
	1    1600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5250 1600 5250
Connection ~ 1600 5250
Wire Wire Line
	1600 5250 2150 5250
Connection ~ 2150 5250
Wire Wire Line
	2150 5250 2650 5250
Connection ~ 2650 5250
Wire Wire Line
	2650 5250 3200 5250
Wire Wire Line
	3200 5550 2650 5550
Connection ~ 1600 5550
Wire Wire Line
	1600 5550 1050 5550
Connection ~ 2150 5550
Wire Wire Line
	2150 5550 1600 5550
Connection ~ 2650 5550
Wire Wire Line
	2650 5550 2150 5550
Text Label 2000 5250 0    50   ~ 0
V+
Text Label 2100 5550 2    50   ~ 0
GND
$Comp
L Device:Fuse F1
U 1 1 5EB74E8E
P 8850 5250
F 0 "F1" V 8653 5250 50  0000 C CNN
F 1 "Fuse" V 8744 5250 50  0000 C CNN
F 2 "" V 8780 5250 50  0001 C CNN
F 3 "~" H 8850 5250 50  0001 C CNN
	1    8850 5250
	0    1    1    0   
$EndComp
$Comp
L My_dmp2100u:DMP2100U Q1
U 1 1 5EB750F0
P 9350 5350
F 0 "Q1" V 9693 5350 50  0000 C CNN
F 1 "DMP2100U" V 9602 5350 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9550 5275 50  0001 L CIN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/MOSFETs/DMP2100U/DMP2100U.pdf" V 9350 5350 50  0001 L CNN
	1    9350 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9150 5250 9000 5250
$Comp
L Device:R R5
U 1 1 5EB7546F
P 9350 5850
F 0 "R5" H 9420 5896 50  0000 L CNN
F 1 "33k" H 9420 5805 50  0000 L CNN
F 2 "" V 9280 5850 50  0001 C CNN
F 3 "~" H 9350 5850 50  0001 C CNN
	1    9350 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5EB75533
P 9750 5500
F 0 "D3" V 9704 5579 50  0000 L CNN
F 1 "10V" V 9795 5579 50  0000 L CNN
F 2 "" H 9750 5500 50  0001 C CNN
F 3 "~" H 9750 5500 50  0001 C CNN
	1    9750 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	9750 5650 9350 5650
Wire Wire Line
	9350 5650 9350 5550
Wire Wire Line
	9350 5650 9350 5700
Connection ~ 9350 5650
Wire Wire Line
	9550 5250 9750 5250
Wire Wire Line
	9750 5350 9750 5250
Connection ~ 9750 5250
Wire Wire Line
	9750 5250 10200 5250
Wire Wire Line
	8700 5250 8400 5250
Text Label 10100 5250 0    47   ~ 0
V+
$Comp
L Connector:Barrel_Jack J2
U 1 1 5EB76426
P 8100 5350
F 0 "J2" H 8155 5675 50  0000 C CNN
F 1 "Barrel_Jack" H 8155 5584 50  0000 C CNN
F 2 "" H 8150 5310 50  0001 C CNN
F 3 "~" H 8150 5310 50  0001 C CNN
	1    8100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5450 8850 5450
Wire Wire Line
	8850 5450 8850 6000
Wire Wire Line
	8850 6000 9350 6000
Text Label 8500 5450 0    50   ~ 0
GND
$Sheet
S 5850 1700 700  1750
U 5EB7719E
F0 "Control" 50
F1 "Control.sch" 50
F2 "SIG1" I L 5850 1850 50 
F3 "SIG2" I L 5850 2100 50 
F4 "SIG3" I L 5850 2350 50 
F5 "SIG4" I L 5850 2600 50 
F6 "FB4" O L 5850 2700 50 
F7 "SIG5" I L 5850 2850 50 
F8 "FB5" O L 5850 2950 50 
F9 "SIG6" I L 5850 3100 50 
F10 "FB6" O L 5850 3200 50 
F11 "V+" I R 6550 2050 50 
F12 "GND" I R 6550 3050 50 
F13 "FB_REF" O L 5850 3350 50 
F14 "FB3" O L 5850 2450 50 
F15 "FB2" O L 5850 2200 50 
F16 "FB1" O L 5850 1950 50 
$EndSheet
$Sheet
S 5850 3800 700  400 
U 5EB771C9
F0 "Communications" 50
F1 "Communications.sch" 50
F2 "TX" I L 5850 4100 50 
F3 "RX" O L 5850 3900 50 
F4 "VIN" I R 6550 3900 50 
F5 "GND" I R 6550 4100 50 
$EndSheet
Wire Wire Line
	7050 2050 6550 2050
Wire Wire Line
	6550 3900 7000 3900
Wire Wire Line
	6550 4100 7000 4100
Wire Wire Line
	4700 3450 4100 3450
Text Label 6950 2050 0    50   ~ 0
V+
Text Label 4100 3450 0    50   ~ 0
GND
Text Label 6900 3900 0    50   ~ 0
V+
Text Label 6850 4100 0    50   ~ 0
GND
Wire Wire Line
	7150 3050 6550 3050
Text Label 7000 3050 0    50   ~ 0
GND
Wire Wire Line
	4700 2100 4200 2100
Text Label 4200 2100 0    50   ~ 0
V+
Text Notes 4550 700  0    98   ~ 20
Classification and Control Board
Text Notes 1650 5150 0    79   ~ 0
Bulk supply caps
Text Notes 7650 4900 0    79   ~ 0
Overcurrent and Reverse Polarity Protection
Wire Notes Line
	800  5000 3550 5000
Wire Notes Line
	3550 5000 3550 5700
Wire Notes Line
	3550 5700 800  5700
Wire Notes Line
	800  5700 800  5000
Wire Notes Line
	7600 4750 10400 4750
Wire Notes Line
	10400 4750 10400 6100
Wire Notes Line
	10400 6100 7600 6100
Wire Notes Line
	7600 6100 7600 4750
Wire Wire Line
	5850 1850 5400 1850
Wire Wire Line
	5850 1950 5400 1950
Wire Wire Line
	5850 2100 5400 2100
Wire Wire Line
	5400 2200 5850 2200
Wire Wire Line
	5850 2350 5400 2350
Wire Wire Line
	5400 2450 5850 2450
Wire Wire Line
	5850 2600 5400 2600
Wire Wire Line
	5400 2700 5850 2700
Wire Wire Line
	5850 2850 5400 2850
Wire Wire Line
	5400 2950 5850 2950
Wire Wire Line
	5850 3100 5400 3100
Wire Wire Line
	5400 3200 5850 3200
Wire Wire Line
	5850 3350 5400 3350
Wire Wire Line
	5850 3900 5750 3900
Wire Wire Line
	5750 3900 5750 3700
Wire Wire Line
	5750 3700 5400 3700
Wire Wire Line
	5400 3800 5650 3800
Wire Wire Line
	5650 3800 5650 4100
Wire Wire Line
	5650 4100 5850 4100
$Comp
L Mechanical:MountingHole MH1
U 1 1 5ECBE595
P 1100 6250
F 0 "MH1" H 1200 6296 50  0000 L CNN
F 1 "MountingHole" H 1200 6205 50  0000 L CNN
F 2 "" H 1100 6250 50  0001 C CNN
F 3 "~" H 1100 6250 50  0001 C CNN
	1    1100 6250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5ECBE655
P 1100 6500
F 0 "MH2" H 1200 6546 50  0000 L CNN
F 1 "MountingHole" H 1200 6455 50  0000 L CNN
F 2 "" H 1100 6500 50  0001 C CNN
F 3 "~" H 1100 6500 50  0001 C CNN
	1    1100 6500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5ECBF24E
P 1100 6750
F 0 "MH3" H 1200 6796 50  0000 L CNN
F 1 "MountingHole" H 1200 6705 50  0000 L CNN
F 2 "" H 1100 6750 50  0001 C CNN
F 3 "~" H 1100 6750 50  0001 C CNN
	1    1100 6750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5ECBFE44
P 1100 7050
F 0 "MH4" H 1200 7096 50  0000 L CNN
F 1 "MountingHole" H 1200 7005 50  0000 L CNN
F 2 "" H 1100 7050 50  0001 C CNN
F 3 "~" H 1100 7050 50  0001 C CNN
	1    1100 7050
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:UoNLogo LOGO2
U 1 1 5ECC0AB9
P 2100 6950
F 0 "LOGO2" H 2125 6996 50  0000 L CNN
F 1 "UoNLogo" H 2125 6905 50  0000 L CNN
F 2 "" H 2100 6950 50  0001 C CNN
F 3 "" H 2100 6950 50  0001 C CNN
	1    2100 6950
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:SparkerLogo LOGO1
U 1 1 5ECC0B3A
P 2100 6600
F 0 "LOGO1" H 2125 6646 50  0000 L CNN
F 1 "SparkerLogo" H 2125 6555 50  0000 L CNN
F 2 "" H 2000 6650 50  0001 C CNN
F 3 "" H 2000 6650 50  0001 C CNN
	1    2100 6600
	1    0    0    -1  
$EndComp
Text Notes 1250 6100 0    79   ~ 0
Mounting Holes and Logos
Text Notes 8700 5400 0    50   ~ 0
10A Rated
Wire Notes Line
	800  5950 3550 5950
Wire Notes Line
	3550 5950 3550 7150
Wire Notes Line
	3550 7150 800  7150
Wire Notes Line
	800  7150 800  5950
$EndSCHEMATC
