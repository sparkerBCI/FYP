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
S 2700 1650 1450 3450
U 5EB4567D
F0 "STM32F407VGTx" 79
F1 "STM32F407VGTx.sch" 79
F2 "TX" O R 4150 4950 79 
F3 "RX" I R 4150 4750 79 
F4 "PWM1" O R 4150 1800 79 
F5 "PWM2" O R 4150 2200 79 
F6 "PWM3" O R 4150 2600 79 
F7 "PWM4" O R 4150 3000 79 
F8 "PWM5" O R 4150 3400 79 
F9 "PWM6" O R 4150 3800 79 
F10 "FB1" I R 4150 1950 79 
F11 "FB2" I R 4150 2350 79 
F12 "FB3" I R 4150 2750 79 
F13 "FB4" I R 4150 3150 79 
F14 "FB6" I R 4150 3950 79 
F15 "V+" O L 2700 2050 79 
F16 "FB5" I R 4150 3550 79 
F17 "GND" I L 2700 4900 79 
$EndSheet
$Comp
L Device:CP C?
U 1 1 5EB7443A
P 950 6600
F 0 "C?" H 1068 6646 50  0000 L CNN
F 1 "100u" H 1068 6555 50  0000 L CNN
F 2 "" H 988 6450 50  0001 C CNN
F 3 "~" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB744CB
P 2050 6600
F 0 "C?" H 2165 6646 50  0000 L CNN
F 1 "10u" H 2165 6555 50  0000 L CNN
F 2 "" H 2088 6450 50  0001 C CNN
F 3 "~" H 2050 6600 50  0001 C CNN
	1    2050 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB74532
P 2550 6600
F 0 "C?" H 2665 6646 50  0000 L CNN
F 1 "10u" H 2665 6555 50  0000 L CNN
F 2 "" H 2588 6450 50  0001 C CNN
F 3 "~" H 2550 6600 50  0001 C CNN
	1    2550 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB74539
P 3100 6600
F 0 "C?" H 3215 6646 50  0000 L CNN
F 1 "4.7u" H 3215 6555 50  0000 L CNN
F 2 "" H 3138 6450 50  0001 C CNN
F 3 "~" H 3100 6600 50  0001 C CNN
	1    3100 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5EB7459B
P 1500 6600
F 0 "C?" H 1618 6646 50  0000 L CNN
F 1 "100u" H 1618 6555 50  0000 L CNN
F 2 "" H 1538 6450 50  0001 C CNN
F 3 "~" H 1500 6600 50  0001 C CNN
	1    1500 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6450 1500 6450
Connection ~ 1500 6450
Wire Wire Line
	1500 6450 2050 6450
Connection ~ 2050 6450
Wire Wire Line
	2050 6450 2550 6450
Connection ~ 2550 6450
Wire Wire Line
	2550 6450 3100 6450
Wire Wire Line
	3100 6750 2550 6750
Connection ~ 1500 6750
Wire Wire Line
	1500 6750 950  6750
Connection ~ 2050 6750
Wire Wire Line
	2050 6750 1500 6750
Connection ~ 2550 6750
Wire Wire Line
	2550 6750 2050 6750
Text Label 1900 6450 0    50   ~ 0
V+
Text Label 2000 6750 2    50   ~ 0
GND
$Comp
L Device:Fuse F?
U 1 1 5EB74E8E
P 5050 6500
F 0 "F?" V 4853 6500 50  0000 C CNN
F 1 "Fuse" V 4944 6500 50  0000 C CNN
F 2 "" V 4980 6500 50  0001 C CNN
F 3 "~" H 5050 6500 50  0001 C CNN
	1    5050 6500
	0    1    1    0   
$EndComp
$Comp
L My_dmp2100u:DMP2100U Q?
U 1 1 5EB750F0
P 5550 6600
F 0 "Q?" V 5893 6600 50  0000 C CNN
F 1 "DMP2100U" V 5802 6600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5750 6525 50  0001 L CIN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/MOSFETs/DMP2100U/DMP2100U.pdf" V 5550 6600 50  0001 L CNN
	1    5550 6600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 6500 5200 6500
$Comp
L Device:R R?
U 1 1 5EB7546F
P 5550 7100
F 0 "R?" H 5620 7146 50  0000 L CNN
F 1 "R" H 5620 7055 50  0000 L CNN
F 2 "" V 5480 7100 50  0001 C CNN
F 3 "~" H 5550 7100 50  0001 C CNN
	1    5550 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 5EB75533
P 5950 6750
F 0 "D?" V 5904 6829 50  0000 L CNN
F 1 "D_Zener" V 5995 6829 50  0000 L CNN
F 2 "" H 5950 6750 50  0001 C CNN
F 3 "~" H 5950 6750 50  0001 C CNN
	1    5950 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 6900 5550 6900
Wire Wire Line
	5550 6900 5550 6800
Wire Wire Line
	5550 6900 5550 6950
Connection ~ 5550 6900
Wire Wire Line
	5750 6500 5950 6500
Wire Wire Line
	5950 6600 5950 6500
Connection ~ 5950 6500
Wire Wire Line
	5950 6500 6400 6500
Wire Wire Line
	4900 6500 4600 6500
Text Label 6300 6500 0    47   ~ 0
V+
$Comp
L Connector:Barrel_Jack J?
U 1 1 5EB76426
P 4300 6600
F 0 "J?" H 4355 6925 50  0000 C CNN
F 1 "Barrel_Jack" H 4355 6834 50  0000 C CNN
F 2 "" H 4350 6560 50  0001 C CNN
F 3 "~" H 4350 6560 50  0001 C CNN
	1    4300 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6700 5050 6700
Wire Wire Line
	5050 6700 5050 7250
Wire Wire Line
	5050 7250 5550 7250
Text Label 4700 6700 0    50   ~ 0
GND
$Sheet
S 4850 1650 1550 2400
U 5EB7719E
F0 "Control" 79
F1 "Control.sch" 79
$EndSheet
$Sheet
S 4850 4450 1550 650 
U 5EB771C9
F0 "Communications" 79
F1 "Communications.sch" 79
$EndSheet
$EndSCHEMATC
