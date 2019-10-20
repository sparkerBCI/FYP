EESchema Schematic File Version 4
LIBS:Kineses_Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5E35E736
P 4150 3450
F 0 "A1" H 4150 2364 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4150 2273 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4300 2500 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4150 2450 50  0001 C CNN
	1    4150 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5E35E7F6
P 3400 2600
F 0 "C4" H 3285 2554 50  0000 R CNN
F 1 "10n" H 3285 2645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3438 2450 50  0001 C CNN
F 3 "~" H 3400 2600 50  0001 C CNN
	1    3400 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:C C3
U 1 1 5E35E911
P 3000 2600
F 0 "C3" H 2885 2554 50  0000 R CNN
F 1 "100n" H 2885 2645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3038 2450 50  0001 C CNN
F 3 "~" H 3000 2600 50  0001 C CNN
	1    3000 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 5E35E923
P 2600 2600
F 0 "C2" H 2485 2554 50  0000 R CNN
F 1 "10u" H 2485 2645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2638 2450 50  0001 C CNN
F 3 "~" H 2600 2600 50  0001 C CNN
	1    2600 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 4450 4250 4450
Connection ~ 4250 4450
Wire Wire Line
	4250 4450 5000 4450
Connection ~ 2600 2750
Wire Wire Line
	2600 2750 3000 2750
Connection ~ 3000 2750
Wire Wire Line
	3000 2750 3400 2750
Connection ~ 2600 2450
Wire Wire Line
	2600 2450 3000 2450
Connection ~ 3000 2450
Wire Wire Line
	3000 2450 3400 2450
Connection ~ 3400 2450
Wire Wire Line
	3400 2450 4050 2450
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5E35F587
P 6900 2450
F 0 "J2" H 6873 2380 50  0000 R CNN
F 1 "Thumb" H 6873 2471 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 2450 50  0001 C CNN
F 3 "~" H 6900 2450 50  0001 C CNN
	1    6900 2450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5E35FA2E
P 6900 2850
F 0 "J3" H 6873 2780 50  0000 R CNN
F 1 "Index" H 6873 2871 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 2850 50  0001 C CNN
F 3 "~" H 6900 2850 50  0001 C CNN
	1    6900 2850
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5E35FB45
P 6900 3250
F 0 "J4" H 6873 3180 50  0000 R CNN
F 1 "Middle" H 6873 3271 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 3250 50  0001 C CNN
F 3 "~" H 6900 3250 50  0001 C CNN
	1    6900 3250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5E35FC5F
P 6900 3600
F 0 "J5" H 6873 3530 50  0000 R CNN
F 1 "Ring" H 6873 3621 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 3600 50  0001 C CNN
F 3 "~" H 6900 3600 50  0001 C CNN
	1    6900 3600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5E35FD80
P 6900 4000
F 0 "J6" H 6873 3930 50  0000 R CNN
F 1 "Pinky" H 6873 4021 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 4000 50  0001 C CNN
F 3 "~" H 6900 4000 50  0001 C CNN
	1    6900 4000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5E35FE9A
P 6900 4350
F 0 "J7" H 6872 4280 50  0000 R CNN
F 1 "Wrist" H 6872 4371 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6900 4350 50  0001 C CNN
F 3 "~" H 6900 4350 50  0001 C CNN
	1    6900 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 3950 3300 3950
Wire Wire Line
	3650 3850 3300 3850
Wire Wire Line
	3650 3750 3300 3750
Wire Wire Line
	3650 3450 3300 3450
Wire Wire Line
	3650 3350 3300 3350
Wire Wire Line
	3650 3150 3300 3150
Text Label 3300 3150 0    50   ~ 0
Wrist
Text Label 3300 3350 0    50   ~ 0
Ring
Text Label 3300 3450 0    50   ~ 0
Middle
Text Label 3300 3750 0    50   ~ 0
Index
Text Label 3300 3850 0    50   ~ 0
Pinky
Text Label 3300 3950 0    50   ~ 0
Thumb
Text Label 1550 2450 0    50   ~ 0
VIN
Text Label 1550 2750 0    50   ~ 0
GND
Text Label 4850 4450 0    50   ~ 0
GND
Wire Wire Line
	6700 2350 6300 2350
Wire Wire Line
	6700 2450 6300 2450
Wire Wire Line
	6700 2550 6300 2550
Text Label 6300 2350 0    50   ~ 0
Thumb
Text Label 6300 2450 0    50   ~ 0
VIN
Text Label 6300 2550 0    50   ~ 0
GND
Wire Wire Line
	6700 2750 6300 2750
Wire Wire Line
	6700 2850 6300 2850
Wire Wire Line
	6700 2950 6300 2950
Text Label 6300 2750 0    50   ~ 0
Index
Text Label 6300 2850 0    50   ~ 0
VIN
Text Label 6300 2950 0    50   ~ 0
GND
Wire Wire Line
	6700 3150 6300 3150
Wire Wire Line
	6700 3250 6300 3250
Wire Wire Line
	6700 3350 6300 3350
Text Label 6300 3150 0    50   ~ 0
Middle
Text Label 6300 3250 0    50   ~ 0
VIN
Text Label 6300 3350 0    50   ~ 0
GND
Wire Wire Line
	6700 3500 6300 3500
Wire Wire Line
	6700 3600 6300 3600
Wire Wire Line
	6700 3700 6300 3700
Text Label 6300 3500 0    50   ~ 0
Ring
Text Label 6300 3600 0    50   ~ 0
VIN
Text Label 6300 3700 0    50   ~ 0
GND
Wire Wire Line
	6700 3900 6300 3900
Wire Wire Line
	6700 4000 6300 4000
Wire Wire Line
	6700 4100 6300 4100
Text Label 6300 3900 0    50   ~ 0
Pinky
Text Label 6300 4000 0    50   ~ 0
VIN
Text Label 6300 4100 0    50   ~ 0
GND
Wire Wire Line
	6700 4250 6300 4250
Wire Wire Line
	6700 4350 6300 4350
Wire Wire Line
	6700 4450 6300 4450
Text Label 6300 4250 0    50   ~ 0
Wrist
Text Label 6300 4350 0    50   ~ 0
VIN
Text Label 6300 4450 0    50   ~ 0
GND
$Comp
L Connector:Conn_01x06_Male J8
U 1 1 5E3699BF
P 6900 4950
F 0 "J8" H 6873 4830 50  0000 R CNN
F 1 "HC-05" H 6873 4921 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 6900 4950 50  0001 C CNN
F 3 "~" H 6900 4950 50  0001 C CNN
	1    6900 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4350 2450 4800 2450
Text Label 4600 2450 0    50   ~ 0
+5V
Wire Wire Line
	6700 4750 6300 4750
Text Label 6300 4750 0    50   ~ 0
+5V
Wire Wire Line
	6700 4850 6300 4850
Text Label 6300 4850 0    50   ~ 0
GND
Wire Wire Line
	3650 2850 3150 2850
Text Label 3150 2850 0    50   ~ 0
RX
Wire Wire Line
	6700 4950 6300 4950
Text Label 6300 4950 0    50   ~ 0
RX
Wire Wire Line
	3650 2950 2900 2950
$Comp
L Device:R R2
U 1 1 5E36FC5A
P 2750 2950
F 0 "R2" V 2600 2850 50  0000 C CNN
F 1 "1K" V 2650 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2680 2950 50  0001 C CNN
F 3 "~" H 2750 2950 50  0001 C CNN
	1    2750 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E36FCEC
P 2600 3200
F 0 "R1" H 2450 3250 50  0000 L CNN
F 1 "2K" H 2400 3150 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2530 3200 50  0001 C CNN
F 3 "~" H 2600 3200 50  0001 C CNN
	1    2600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2950 2600 3050
Wire Wire Line
	2600 3350 2600 3600
Wire Wire Line
	2600 3600 2850 3600
Text Label 2700 3600 0    50   ~ 0
GND
Wire Wire Line
	2600 2950 2200 2950
Connection ~ 2600 2950
Text Label 2200 2950 0    50   ~ 0
TX
Wire Wire Line
	6700 5050 6300 5050
Text Label 6300 5050 0    50   ~ 0
TX
NoConn ~ 6700 4650
NoConn ~ 6700 5150
Wire Wire Line
	1400 5050 1850 5050
Text Label 1750 5050 0    50   ~ 0
VIN
Wire Wire Line
	1400 4950 1850 4950
Text Label 1700 4950 0    50   ~ 0
GND
Wire Wire Line
	1500 2750 2050 2750
Wire Wire Line
	1500 2450 2050 2450
$Comp
L Device:CP C1
U 1 1 5E37812A
P 2050 2600
F 0 "C1" H 2168 2646 50  0000 L CNN
F 1 "100u" H 2168 2555 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x4.5" H 2088 2450 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
Connection ~ 2050 2450
Wire Wire Line
	2050 2450 2600 2450
Connection ~ 2050 2750
Wire Wire Line
	2050 2750 2600 2750
$Comp
L Mechanical:MountingHole MH1
U 1 1 5E3793D3
P 2950 5400
F 0 "MH1" H 3050 5446 50  0000 L CNN
F 1 "MountingHole" H 3050 5355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 2950 5400 50  0001 C CNN
F 3 "~" H 2950 5400 50  0001 C CNN
	1    2950 5400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5E3795E4
P 2950 5650
F 0 "MH2" H 3050 5696 50  0000 L CNN
F 1 "MountingHole" H 3050 5605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 2950 5650 50  0001 C CNN
F 3 "~" H 2950 5650 50  0001 C CNN
	1    2950 5650
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:SparkerLogo LOGO1
U 1 1 5E37BCED
P 3000 5950
F 0 "LOGO1" H 3025 5996 50  0000 L CNN
F 1 "SparkerLogo" H 3025 5905 50  0000 L CNN
F 2 "Sparker:NASA_Vertical" H 2900 6000 50  0001 C CNN
F 3 "" H 2900 6000 50  0001 C CNN
	1    3000 5950
	1    0    0    -1  
$EndComp
$Comp
L My_Graphics:UoNLogo LOGO2
U 1 1 5E37BEFB
P 3100 6250
F 0 "LOGO2" H 3125 6296 50  0000 L CNN
F 1 "UoNLogo" H 3125 6205 50  0000 L CNN
F 2 "Sparker:UoN_Small" H 3100 6250 50  0001 C CNN
F 3 "" H 3100 6250 50  0001 C CNN
	1    3100 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5DABE43A
P 1200 4950
F 0 "J1" H 1306 5128 50  0000 C CNN
F 1 "Power" H 1306 5037 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 1200 4950 50  0001 C CNN
F 3 "~" H 1200 4950 50  0001 C CNN
	1    1200 4950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
