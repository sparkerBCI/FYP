EESchema Schematic File Version 4
LIBS:DAQ Board-cache
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
$Comp
L My_Regulator_Linear:LM3480-3.3 U?
U 1 1 5D899D77
P 3250 6550
F 0 "U?" H 3250 6792 50  0000 C CNN
F 1 "LM3480-3.3" H 3250 6701 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3250 6775 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm3480.pdf" H 3250 6550 50  0001 C CNN
	1    3250 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A230E
P 3750 6700
F 0 "C?" H 3865 6746 50  0000 L CNN
F 1 "1nF" H 3800 6600 50  0000 L CNN
F 2 "" H 3788 6550 50  0001 C CNN
F 3 "~" H 3750 6700 50  0001 C CNN
	1    3750 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A2315
P 4100 6700
F 0 "C?" H 4215 6746 50  0000 L CNN
F 1 "10nF" H 4150 6600 50  0000 L CNN
F 2 "" H 4138 6550 50  0001 C CNN
F 3 "~" H 4100 6700 50  0001 C CNN
	1    4100 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A231C
P 4450 6700
F 0 "C?" H 4565 6746 50  0000 L CNN
F 1 "100nF" H 4500 6600 50  0000 L CNN
F 2 "" H 4488 6550 50  0001 C CNN
F 3 "~" H 4450 6700 50  0001 C CNN
	1    4450 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A2323
P 4800 6700
F 0 "C?" H 4915 6746 50  0000 L CNN
F 1 "10uF" H 4850 6600 50  0000 L CNN
F 2 "" H 4838 6550 50  0001 C CNN
F 3 "~" H 4800 6700 50  0001 C CNN
	1    4800 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A232A
P 1700 6700
F 0 "C?" H 1450 6750 50  0000 L CNN
F 1 "100uF" H 1400 6600 50  0000 L CNN
F 2 "" H 1738 6550 50  0001 C CNN
F 3 "~" H 1700 6700 50  0001 C CNN
	1    1700 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A2331
P 2050 6700
F 0 "C?" H 2165 6746 50  0000 L CNN
F 1 "10uF" H 1850 6600 50  0000 L CNN
F 2 "" H 2088 6550 50  0001 C CNN
F 3 "~" H 2050 6700 50  0001 C CNN
	1    2050 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A2338
P 2400 6700
F 0 "C?" H 2515 6746 50  0000 L CNN
F 1 "100nF" H 2450 6600 50  0000 L CNN
F 2 "" H 2438 6550 50  0001 C CNN
F 3 "~" H 2400 6700 50  0001 C CNN
	1    2400 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8A233F
P 2750 6700
F 0 "C?" H 2865 6746 50  0000 L CNN
F 1 "10nF" H 2800 6600 50  0000 L CNN
F 2 "" H 2788 6550 50  0001 C CNN
F 3 "~" H 2750 6700 50  0001 C CNN
	1    2750 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6550 2750 6550
Connection ~ 1700 6550
Wire Wire Line
	1700 6550 1300 6550
Connection ~ 2050 6550
Wire Wire Line
	2050 6550 1700 6550
Connection ~ 2400 6550
Wire Wire Line
	2400 6550 2050 6550
Connection ~ 2750 6550
Wire Wire Line
	2750 6550 2400 6550
Wire Wire Line
	1700 6850 2050 6850
Connection ~ 2050 6850
Wire Wire Line
	2050 6850 2400 6850
Connection ~ 2400 6850
Wire Wire Line
	2400 6850 2750 6850
Connection ~ 2750 6850
Wire Wire Line
	2750 6850 3250 6850
Connection ~ 3250 6850
Wire Wire Line
	3250 6850 3750 6850
Connection ~ 3750 6850
Wire Wire Line
	3750 6850 4100 6850
Connection ~ 4100 6850
Wire Wire Line
	4100 6850 4450 6850
Connection ~ 4450 6850
Wire Wire Line
	4450 6850 4800 6850
Wire Wire Line
	4800 6550 4450 6550
Connection ~ 3750 6550
Wire Wire Line
	3750 6550 3550 6550
Connection ~ 4100 6550
Wire Wire Line
	4100 6550 4000 6550
Connection ~ 4450 6550
Wire Wire Line
	4450 6550 4100 6550
Wire Wire Line
	4000 6550 4000 6350
Wire Wire Line
	4000 6350 4250 6350
Connection ~ 4000 6550
Wire Wire Line
	4000 6550 3750 6550
Wire Wire Line
	3250 6850 3250 7100
Wire Wire Line
	3250 7100 3450 7100
Text Label 1400 6550 0    50   ~ 0
VIN
Text Label 4050 6350 0    50   ~ 0
+3V3
Text Label 3300 7100 0    50   ~ 0
GND
Text Notes 2750 6200 0    79   ~ 0
+3.3V Regulated Supply\n
Wire Notes Line
	1100 6050 5950 6050
Wire Notes Line
	5950 6050 5950 7150
Wire Notes Line
	5950 7150 1100 7150
Wire Notes Line
	1100 7150 1100 6050
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5D8A357C
P 5350 3450
F 0 "J?" H 5430 3442 50  0000 L CNN
F 1 "Conn_01x06" H 5430 3351 50  0000 L CNN
F 2 "" H 5350 3450 50  0001 C CNN
F 3 "~" H 5350 3450 50  0001 C CNN
	1    5350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3250 4500 3250
Wire Wire Line
	5150 3350 4500 3350
Wire Wire Line
	5150 3450 4500 3450
Wire Wire Line
	5150 3550 4500 3550
Wire Wire Line
	5150 3650 4500 3650
Wire Wire Line
	5150 3750 4500 3750
NoConn ~ 4500 3750
Text Notes 5550 3250 0    50   ~ 0
Enable AT Commands
Text Notes 5550 3350 0    50   ~ 0
+5V
Text Notes 5550 3450 0    50   ~ 0
GND
$EndSCHEMATC
