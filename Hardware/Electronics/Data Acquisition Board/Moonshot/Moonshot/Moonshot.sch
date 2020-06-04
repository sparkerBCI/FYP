EESchema Schematic File Version 4
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
L My_ADS1299:ADS1299-Board ADC1
U 1 1 5ED94A0E
P 8150 3900
F 0 "ADC1" H 8200 3164 50  0000 C CNN
F 1 "ADS1299-Board" H 8200 3073 50  0000 C CNN
F 2 "Sparker:ADS1299-Board" H 8200 3750 50  0001 C CNN
F 3 "" H 8200 3750 50  0001 C CNN
	1    8150 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5ED94B34
P 9800 3100
F 0 "J3" H 9773 3030 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 3121 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 3100 50  0001 C CNN
F 3 "~" H 9800 3100 50  0001 C CNN
	1    9800 3100
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 5ED94C3B
P 9800 3300
F 0 "J4" H 9773 3230 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 3321 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 3300 50  0001 C CNN
F 3 "~" H 9800 3300 50  0001 C CNN
	1    9800 3300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 5ED94C57
P 9800 3500
F 0 "J5" H 9773 3430 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 3521 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 3500 50  0001 C CNN
F 3 "~" H 9800 3500 50  0001 C CNN
	1    9800 3500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 5ED94C6E
P 9800 3700
F 0 "J6" H 9773 3630 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 3721 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 3700 50  0001 C CNN
F 3 "~" H 9800 3700 50  0001 C CNN
	1    9800 3700
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 5ED94C84
P 9800 3900
F 0 "J7" H 9773 3830 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 3921 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 3900 50  0001 C CNN
F 3 "~" H 9800 3900 50  0001 C CNN
	1    9800 3900
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 5ED94D07
P 9800 4050
F 0 "J8" H 9773 3980 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 4071 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 4050 50  0001 C CNN
F 3 "~" H 9800 4050 50  0001 C CNN
	1    9800 4050
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 5ED94D0E
P 9800 4250
F 0 "J9" H 9773 4180 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 4271 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 4250 50  0001 C CNN
F 3 "~" H 9800 4250 50  0001 C CNN
	1    9800 4250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J10
U 1 1 5ED94D15
P 9800 4450
F 0 "J10" H 9773 4380 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 4471 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 4450 50  0001 C CNN
F 3 "~" H 9800 4450 50  0001 C CNN
	1    9800 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 5ED94D1C
P 9800 4650
F 0 "J11" H 9773 4580 50  0000 R CNN
F 1 "Conn_01x01_Male" H 9773 4671 50  0000 R CNN
F 2 "Sparker:DIN 42802-1" H 9800 4650 50  0001 C CNN
F 3 "~" H 9800 4650 50  0001 C CNN
	1    9800 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 3900 9600 3900
Wire Wire Line
	9100 3800 9600 3800
Wire Wire Line
	9600 3800 9600 3700
Wire Wire Line
	9100 4000 9600 4000
Wire Wire Line
	9600 4000 9600 4050
Wire Wire Line
	9100 4100 9550 4100
Wire Wire Line
	9550 4100 9550 4250
Wire Wire Line
	9550 4250 9600 4250
Wire Wire Line
	9600 4450 9500 4450
Wire Wire Line
	9500 4450 9500 4200
Wire Wire Line
	9500 4200 9100 4200
Wire Wire Line
	9600 4650 9450 4650
Wire Wire Line
	9450 4650 9450 4300
Wire Wire Line
	9450 4300 9100 4300
Wire Wire Line
	9100 3700 9550 3700
Wire Wire Line
	9550 3700 9550 3500
Wire Wire Line
	9550 3500 9600 3500
Wire Wire Line
	9600 3300 9500 3300
Wire Wire Line
	9500 3300 9500 3600
Wire Wire Line
	9500 3600 9100 3600
Wire Wire Line
	9600 3100 9450 3100
Wire Wire Line
	9450 3100 9450 3500
Wire Wire Line
	9450 3500 9100 3500
NoConn ~ 8650 3100
NoConn ~ 8550 3100
NoConn ~ 8450 3100
NoConn ~ 8350 3100
NoConn ~ 8250 3100
NoConn ~ 8150 3100
NoConn ~ 8050 3100
NoConn ~ 7950 3100
NoConn ~ 7850 3100
$Comp
L Connector:Conn_01x06_Female J2
U 1 1 5ED97168
P 7500 5900
F 0 "J2" H 7393 5375 50  0000 C CNN
F 1 "Conn_01x06_Female" H 7393 5466 50  0000 C CNN
F 2 "Resonators:HC-05" H 7500 5900 50  0001 C CNN
F 3 "~" H 7500 5900 50  0001 C CNN
	1    7500 5900
	1    0    0    1   
$EndComp
Wire Wire Line
	7550 3100 7550 2800
Wire Wire Line
	7550 2800 7200 2800
Text Label 7250 2800 0    50   ~ 0
V+
Text Label 1050 4600 0    50   ~ 0
SCLK_5V
Wire Wire Line
	1050 3900 1500 3900
Wire Wire Line
	1050 3700 1500 3700
Text Label 1050 3900 0    50   ~ 0
~DRDY_3V3
Text Label 1050 3700 0    50   ~ 0
~CS_5V
Wire Wire Line
	1050 4100 1500 4100
Wire Wire Line
	1050 4200 1500 4200
Text Label 1050 4100 0    50   ~ 0
BT_RX_3V3
Text Label 1050 4200 0    50   ~ 0
BT_TX_5V
Wire Wire Line
	1050 4500 1500 4500
Text Label 1050 4500 0    50   ~ 0
MISO_3V3
Wire Wire Line
	1050 4400 1500 4400
Text Label 1050 4400 0    50   ~ 0
MOSI_5V
Wire Wire Line
	1050 3600 1500 3600
Text Label 1050 3600 0    50   ~ 0
LED
Wire Wire Line
	7300 3850 6800 3850
Text Label 6800 3850 0    50   ~ 0
+3V3
Wire Wire Line
	7300 3950 6800 3950
Text Label 6800 3950 0    50   ~ 0
+3V3
Wire Wire Line
	7300 4050 6800 4050
Text Label 6800 4050 0    50   ~ 0
GND
Wire Wire Line
	7700 4550 7700 4750
Wire Wire Line
	7700 4750 6800 4750
Text Label 6800 4750 0    50   ~ 0
GND
Wire Wire Line
	7300 3450 6800 3450
Text Label 6800 3450 0    50   ~ 0
SCLK_3V3
Wire Wire Line
	7300 3550 6800 3550
Text Label 6800 3550 0    50   ~ 0
MISO_3V3
Wire Wire Line
	7300 3650 6800 3650
Text Label 6800 3650 0    50   ~ 0
~CS_3V3
Wire Wire Line
	7300 3750 6800 3750
Text Label 6800 3750 0    50   ~ 0
MOSI_3V3
Wire Wire Line
	7300 4150 6800 4150
Text Label 6800 4150 0    50   ~ 0
~DRDY_3V3
NoConn ~ 7300 5600
NoConn ~ 7300 6100
Text Label 6900 5700 0    50   ~ 0
+5V
Text Label 6900 5800 0    50   ~ 0
GND
Text Label 6900 5900 0    50   ~ 0
BT_RX_3V3
Wire Wire Line
	6900 5800 7300 5800
Wire Wire Line
	6900 5900 7300 5900
Wire Wire Line
	6900 6000 7300 6000
Wire Wire Line
	6900 5700 7300 5700
Text Label 6900 6000 0    50   ~ 0
BT_TX_3V3
Text Notes 7550 6100 0    50   ~ 0
LED
Text Notes 7550 6000 0    50   ~ 0
RX
Text Notes 7550 5900 0    50   ~ 0
TX
Text Notes 7550 5800 0    50   ~ 0
GND
Text Notes 7550 5700 0    50   ~ 0
+5V
Text Notes 7550 5600 0    50   ~ 0
STATE
$Comp
L Device:R R2
U 1 1 5EDAEED8
P 4250 2600
F 0 "R2" V 4043 2600 50  0000 C CNN
F 1 "1k" V 4134 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 2600 50  0001 C CNN
F 3 "~" H 4250 2600 50  0001 C CNN
	1    4250 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5EDAF18C
P 4500 2750
F 0 "R6" H 4570 2796 50  0000 L CNN
F 1 "2k" H 4570 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4430 2750 50  0001 C CNN
F 3 "~" H 4500 2750 50  0001 C CNN
	1    4500 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2600 3500 2600
Wire Wire Line
	4400 2600 4500 2600
Connection ~ 4500 2600
Wire Wire Line
	4500 2900 4500 3050
$Comp
L Device:R R3
U 1 1 5EDB23F8
P 4250 3350
F 0 "R3" V 4043 3350 50  0000 C CNN
F 1 "1k" V 4134 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 3350 50  0001 C CNN
F 3 "~" H 4250 3350 50  0001 C CNN
	1    4250 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5EDB23FF
P 4500 3500
F 0 "R7" H 4570 3546 50  0000 L CNN
F 1 "2k" H 4570 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4430 3500 50  0001 C CNN
F 3 "~" H 4500 3500 50  0001 C CNN
	1    4500 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3350 3500 3350
Wire Wire Line
	4400 3350 4500 3350
Connection ~ 4500 3350
Wire Wire Line
	4500 3650 4500 3800
$Comp
L Device:R R4
U 1 1 5EDB39BA
P 4250 4050
F 0 "R4" V 4043 4050 50  0000 C CNN
F 1 "1k" V 4134 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 4050 50  0001 C CNN
F 3 "~" H 4250 4050 50  0001 C CNN
	1    4250 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5EDB39C1
P 4500 4200
F 0 "R8" H 4570 4246 50  0000 L CNN
F 1 "2k" H 4570 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4430 4200 50  0001 C CNN
F 3 "~" H 4500 4200 50  0001 C CNN
	1    4500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4050 3500 4050
Wire Wire Line
	4400 4050 4500 4050
Connection ~ 4500 4050
Wire Wire Line
	4500 4350 4500 4500
$Comp
L Device:R R5
U 1 1 5EDB5359
P 4250 4800
F 0 "R5" V 4043 4800 50  0000 C CNN
F 1 "1k" V 4134 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 4800 50  0001 C CNN
F 3 "~" H 4250 4800 50  0001 C CNN
	1    4250 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5EDB5360
P 4500 4950
F 0 "R9" H 4570 4996 50  0000 L CNN
F 1 "2k" H 4570 4905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4430 4950 50  0001 C CNN
F 3 "~" H 4500 4950 50  0001 C CNN
	1    4500 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4800 3500 4800
Wire Wire Line
	4400 4800 4500 4800
Connection ~ 4500 4800
Wire Wire Line
	4500 5100 4500 5250
Text Label 3500 2600 0    50   ~ 0
BT_TX_5V
Text Label 4800 2600 0    50   ~ 0
BT_TX_3V3
Wire Wire Line
	4500 2600 5250 2600
Wire Wire Line
	4500 3050 5250 3050
Text Label 4800 3050 0    50   ~ 0
GND
Wire Wire Line
	4500 3350 5250 3350
Wire Wire Line
	4500 3800 5250 3800
Wire Wire Line
	4500 4050 5250 4050
Wire Wire Line
	4500 4500 5250 4500
Wire Wire Line
	4500 4800 5250 4800
Wire Wire Line
	4500 5250 5250 5250
Text Label 3500 3350 0    50   ~ 0
SCLK_5V
Text Label 4850 3350 0    50   ~ 0
SCLK_3V3
Text Label 4850 3800 0    50   ~ 0
GND
Text Label 3500 4050 0    50   ~ 0
MOSI_5V
Text Label 4850 4050 0    50   ~ 0
MOSI_3V3
Text Label 4850 4500 0    50   ~ 0
GND
Text Label 3500 4800 0    50   ~ 0
~CS_5V
Text Label 4950 4800 0    50   ~ 0
~CS_3V3
Text Label 4900 5250 0    50   ~ 0
GND
$Comp
L Connector:Barrel_Jack J1
U 1 1 5EDD58E5
P 1750 5850
F 0 "J1" H 1805 6175 50  0000 C CNN
F 1 "Barrel_Jack" H 1805 6084 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-063AH_Horizontal" H 1800 5810 50  0001 C CNN
F 3 "~" H 1800 5810 50  0001 C CNN
	1    1750 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5950 2100 5950
Wire Wire Line
	2100 5950 2100 6500
Wire Wire Line
	2100 6500 2500 6500
$Comp
L My_dmp2100u:DMP2100U Q1
U 1 1 5EDD9754
P 2500 5850
F 0 "Q1" V 2843 5850 50  0000 C CNN
F 1 "DMP2100U" V 2752 5850 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2700 5775 50  0001 L CIN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/MOSFETs/DMP2100U/DMP2100U.pdf" V 2500 5850 50  0001 L CNN
	1    2500 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5EDD990C
P 2500 6250
F 0 "R1" H 2570 6296 50  0000 L CNN
F 1 "33k" H 2570 6205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2430 6250 50  0001 C CNN
F 3 "~" H 2500 6250 50  0001 C CNN
	1    2500 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D1
U 1 1 5EDD99BE
P 3250 5900
F 0 "D1" V 3204 5968 50  0000 L CNN
F 1 "7.5V" V 3295 5968 50  0000 L CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" V 3250 5900 50  0001 C CNN
F 3 "~" V 3250 5900 50  0001 C CNN
	1    3250 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 5750 2300 5750
Wire Wire Line
	2700 5750 3250 5750
Wire Wire Line
	2500 6050 2500 6100
Wire Wire Line
	2500 6400 2500 6500
Wire Wire Line
	3250 5800 3250 5750
Connection ~ 3250 5750
Wire Wire Line
	3250 6000 3250 6100
Wire Wire Line
	3250 6100 2500 6100
Connection ~ 2500 6100
Connection ~ 2500 6500
Text Label 3600 6500 0    50   ~ 0
GND
Text Label 3600 5750 0    50   ~ 0
V+
$Comp
L My_Regulator_Linear:MCP1755T-5002E_SOT223-5 U2
U 1 1 5EDE95AD
P 4850 5650
F 0 "U2" H 5200 5815 50  0000 C CNN
F 1 "MCP1755T-5002E_SOT223-5" H 5200 5724 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-6" H 5300 4900 50  0001 C CNN
F 3 "" H 5300 4900 50  0001 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5EDE9815
P 4550 6000
F 0 "C2" H 4665 6046 50  0000 L CNN
F 1 "1u" H 4665 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4588 5850 50  0001 C CNN
F 3 "~" H 4550 6000 50  0001 C CNN
	1    4550 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5EDE98AF
P 4100 6000
F 0 "C1" H 4215 6046 50  0000 L CNN
F 1 "10u" H 4215 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4138 5850 50  0001 C CNN
F 3 "~" H 4100 6000 50  0001 C CNN
	1    4100 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5750 4100 5750
Wire Wire Line
	4750 5850 4550 5850
Connection ~ 4550 5850
Wire Wire Line
	4550 5850 4100 5850
Wire Wire Line
	4100 5850 4100 5750
Connection ~ 4100 5850
Connection ~ 4100 5750
Wire Wire Line
	4100 5750 4750 5750
Wire Wire Line
	4100 6150 4100 6500
Wire Wire Line
	2500 6500 4100 6500
Wire Wire Line
	4550 6150 4550 6500
Wire Wire Line
	4550 6500 4100 6500
Connection ~ 4100 6500
Wire Wire Line
	5200 6000 5200 6500
Wire Wire Line
	5200 6500 4550 6500
Connection ~ 4550 6500
$Comp
L Device:C C3
U 1 1 5EDF9CB0
P 5850 6150
F 0 "C3" H 5600 6200 50  0000 L CNN
F 1 "100n" H 5600 6050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5888 6000 50  0001 C CNN
F 3 "~" H 5850 6150 50  0001 C CNN
	1    5850 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5EDF9D54
P 6200 6150
F 0 "C4" H 6050 6250 50  0000 L CNN
F 1 "1u" H 6050 6050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6238 6000 50  0001 C CNN
F 3 "~" H 6200 6150 50  0001 C CNN
	1    6200 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EDF9DE6
P 6550 6150
F 0 "C5" H 6665 6196 50  0000 L CNN
F 1 "10u" H 6665 6105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6588 6000 50  0001 C CNN
F 3 "~" H 6550 6150 50  0001 C CNN
	1    6550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5800 5850 5800
Wire Wire Line
	6550 5800 6550 6000
Wire Wire Line
	6550 6300 6550 6500
Wire Wire Line
	6550 6500 6200 6500
Connection ~ 5200 6500
Wire Wire Line
	5850 6000 5850 5800
Connection ~ 5850 5800
Wire Wire Line
	5850 5800 6200 5800
Wire Wire Line
	6200 6000 6200 5800
Connection ~ 6200 5800
Wire Wire Line
	6200 5800 6550 5800
Wire Wire Line
	5850 6300 5850 6500
Connection ~ 5850 6500
Wire Wire Line
	5850 6500 5200 6500
Wire Wire Line
	6200 6300 6200 6500
Connection ~ 6200 6500
Wire Wire Line
	6200 6500 5850 6500
Text Label 6400 5800 0    50   ~ 0
+5V
Wire Wire Line
	2500 2800 2100 2800
Text Label 2100 2800 0    50   ~ 0
+3V3
Wire Wire Line
	1900 2800 1500 2800
Text Label 1500 2800 0    50   ~ 0
V+
Text Label 2500 4900 0    50   ~ 0
GND
$Comp
L MCU_Module:Arduino_Nano_v2.x A1
U 1 1 5EE615FD
P 2000 3900
F 0 "A1" H 2000 2814 50  0000 C CNN
F 1 "Arduino_Nano_v2.x" H 2000 2723 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 2150 2950 50  0001 L CNN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 2000 2900 50  0001 C CNN
	1    2000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2800 1900 2900
Wire Wire Line
	2100 2900 2100 2800
NoConn ~ 2200 2900
NoConn ~ 2500 3300
NoConn ~ 2500 3400
Wire Wire Line
	2000 4900 2100 4900
Connection ~ 2100 4900
Wire Wire Line
	2100 4900 2650 4900
NoConn ~ 1500 3300
NoConn ~ 1500 3400
NoConn ~ 1500 3500
NoConn ~ 1500 3800
NoConn ~ 1500 4000
NoConn ~ 1500 4300
NoConn ~ 2500 4600
NoConn ~ 2500 4500
NoConn ~ 2500 4400
NoConn ~ 2500 4300
NoConn ~ 2500 4200
NoConn ~ 2500 4100
NoConn ~ 2500 4000
NoConn ~ 2500 3900
NoConn ~ 2500 3700
Wire Wire Line
	1050 4600 1500 4600
$EndSCHEMATC
