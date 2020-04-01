EESchema Schematic File Version 4
LIBS:Classification and Contol Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3050 2500 0    50   Input ~ 0
SIG1
Text HLabel 3050 3050 0    50   Input ~ 0
SIG2
Text HLabel 3050 3600 0    50   Input ~ 0
SIG3
Text HLabel 3050 4150 0    50   Input ~ 0
SIG4
Text HLabel 8800 4000 0    50   Output ~ 0
FB4
Text HLabel 3050 4700 0    50   Input ~ 0
SIG5
Text HLabel 9350 4000 0    50   Output ~ 0
FB5
Text HLabel 3050 5250 0    50   Input ~ 0
SIG6
Text HLabel 9900 4000 0    50   Output ~ 0
FB6
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5EBE2B45
P 3500 2600
F 0 "J3" H 3473 2530 50  0000 R CNN
F 1 "Thumb" H 3473 2621 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3500 2600 50  0001 C CNN
F 3 "~" H 3500 2600 50  0001 C CNN
	1    3500 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5EBE2C14
P 3500 3150
F 0 "J4" H 3473 3080 50  0000 R CNN
F 1 "Index" H 3473 3171 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3500 3150 50  0001 C CNN
F 3 "~" H 3500 3150 50  0001 C CNN
	1    3500 3150
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5EBE2C2B
P 3500 3700
F 0 "J5" H 3473 3630 50  0000 R CNN
F 1 "Middle" H 3473 3721 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3500 3700 50  0001 C CNN
F 3 "~" H 3500 3700 50  0001 C CNN
	1    3500 3700
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5EBE2C4B
P 3500 4250
F 0 "J6" H 3473 4180 50  0000 R CNN
F 1 "Ring" H 3473 4271 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3500 4250 50  0001 C CNN
F 3 "~" H 3500 4250 50  0001 C CNN
	1    3500 4250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5EBE2CAA
P 3500 4800
F 0 "J7" H 3473 4730 50  0000 R CNN
F 1 "Pinky" H 3473 4821 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3500 4800 50  0001 C CNN
F 3 "~" H 3500 4800 50  0001 C CNN
	1    3500 4800
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J8
U 1 1 5EBE2CB1
P 3500 5350
F 0 "J8" H 3472 5280 50  0000 R CNN
F 1 "Wrist" H 3472 5371 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3500 5350 50  0001 C CNN
F 3 "~" H 3500 5350 50  0001 C CNN
	1    3500 5350
	-1   0    0    1   
$EndComp
Text HLabel 1900 2250 1    50   Input ~ 0
V+
Text HLabel 1800 2250 1    50   Input ~ 0
GND
$Comp
L Device:R R6
U 1 1 5EBE2F3B
P 2200 2600
F 0 "R6" V 1993 2600 50  0000 C CNN
F 1 "50m" V 2084 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 2600 50  0001 C CNN
F 3 "~" H 2200 2600 50  0001 C CNN
	1    2200 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5EBE2FC9
P 2200 3150
F 0 "R7" V 1993 3150 50  0000 C CNN
F 1 "50m" V 2084 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 3150 50  0001 C CNN
F 3 "~" H 2200 3150 50  0001 C CNN
	1    2200 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5EBE2FE2
P 2200 3700
F 0 "R8" V 1993 3700 50  0000 C CNN
F 1 "50m" V 2084 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 3700 50  0001 C CNN
F 3 "~" H 2200 3700 50  0001 C CNN
	1    2200 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5EBE3000
P 2200 4250
F 0 "R9" V 1993 4250 50  0000 C CNN
F 1 "50m" V 2084 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 4250 50  0001 C CNN
F 3 "~" H 2200 4250 50  0001 C CNN
	1    2200 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5EBE3021
P 2200 4800
F 0 "R10" V 1993 4800 50  0000 C CNN
F 1 "50m" V 2084 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 4800 50  0001 C CNN
F 3 "~" H 2200 4800 50  0001 C CNN
	1    2200 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5EBE3049
P 2200 5350
F 0 "R11" V 1993 5350 50  0000 C CNN
F 1 "50m" V 2084 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 5350 50  0001 C CNN
F 3 "~" H 2200 5350 50  0001 C CNN
	1    2200 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 2250 1900 2600
Wire Wire Line
	1900 2600 2050 2600
Wire Wire Line
	1900 3150 2050 3150
Wire Wire Line
	1900 3700 2050 3700
Wire Wire Line
	1900 4250 2050 4250
Wire Wire Line
	1900 4800 2050 4800
Wire Wire Line
	1900 5350 2050 5350
Wire Wire Line
	1800 2250 1800 2700
Connection ~ 1800 2700
Wire Wire Line
	1800 2700 1800 3250
Connection ~ 1800 3250
Wire Wire Line
	1800 3250 1800 3800
Connection ~ 1800 3800
Wire Wire Line
	1800 3800 1800 4350
Connection ~ 1800 4350
Wire Wire Line
	1800 4350 1800 4900
Connection ~ 1800 4900
Wire Wire Line
	1800 4900 1800 5450
Wire Wire Line
	1900 2600 1900 3150
Connection ~ 1900 2600
Connection ~ 1900 3150
Wire Wire Line
	1900 3150 1900 3700
Connection ~ 1900 3700
Wire Wire Line
	1900 3700 1900 4250
Connection ~ 1900 4250
Wire Wire Line
	1900 4250 1900 4800
Connection ~ 1900 4800
Wire Wire Line
	1900 4800 1900 5350
Wire Wire Line
	1800 3250 3300 3250
Wire Wire Line
	1800 3800 3300 3800
Wire Wire Line
	1800 4350 3300 4350
Wire Wire Line
	1800 4900 3300 4900
Wire Wire Line
	1800 5450 3300 5450
Wire Wire Line
	1800 2700 3300 2700
Wire Wire Line
	3050 2500 3300 2500
Wire Wire Line
	3050 3050 3300 3050
Wire Wire Line
	3050 3600 3300 3600
Wire Wire Line
	3050 4150 3300 4150
Wire Wire Line
	3050 4700 3300 4700
Wire Wire Line
	3050 5250 3300 5250
Text Notes 5600 750  0    98   ~ 20
Control
Text Notes 1550 7350 0    79   ~ 0
50mOhm current sense resistors.\nVoltage before and after resistor passed through 1/6th voltage divider.\nVoltage measured at FBx points by 16-bit ADC.\nVoltage drop across resistor given by FB_Ref - Value.\nVoltage drop across resistor * 6 / (50 x10^-3) gives current \nconsumed by each servo.\nVoltage supply drop to servo should be minimal (and\nwe are supplying near maximum end of rated voltage)
Text HLabel 6600 4000 0    50   Output ~ 0
FB_REF
$Comp
L Device:R R12
U 1 1 5EC6D8F2
P 6600 3700
F 0 "R12" H 6670 3746 50  0000 L CNN
F 1 "500k" H 6670 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6530 3700 50  0001 C CNN
F 3 "~" H 6600 3700 50  0001 C CNN
	1    6600 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5EC6DA05
P 6600 4300
F 0 "R13" H 6670 4346 50  0000 L CNN
F 1 "100k" H 6670 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6530 4300 50  0001 C CNN
F 3 "~" H 6600 4300 50  0001 C CNN
	1    6600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3850 6600 4150
Wire Wire Line
	6600 4450 6600 4650
Wire Wire Line
	6600 3550 6600 3450
Wire Wire Line
	6300 3450 6600 3450
Text Label 6300 3450 0    50   ~ 0
V+
Text Label 8250 4650 0    50   ~ 0
GND
Text HLabel 8250 4000 0    50   Output ~ 0
FB3
Text HLabel 7700 4000 0    50   Output ~ 0
FB2
Text HLabel 7150 4000 0    50   Output ~ 0
FB1
Wire Wire Line
	2350 2600 3300 2600
Wire Wire Line
	2350 3150 3300 3150
Wire Wire Line
	2350 3700 3300 3700
Wire Wire Line
	2350 4250 3300 4250
Wire Wire Line
	2350 4800 3300 4800
Wire Wire Line
	2350 5350 3300 5350
Text Label 2450 2600 0    50   ~ 0
VSER1
Text Label 2450 3150 0    50   ~ 0
VSER2
Text Label 2450 3700 0    50   ~ 0
VSER3
Text Label 2450 4250 0    50   ~ 0
VSER4
Text Label 2450 4800 0    50   ~ 0
VSER5
Text Label 2450 5350 0    50   ~ 0
VSER6
$Comp
L Device:R R14
U 1 1 5EC74B40
P 7150 3700
F 0 "R14" H 7220 3746 50  0000 L CNN
F 1 "500k" H 7220 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7080 3700 50  0001 C CNN
F 3 "~" H 7150 3700 50  0001 C CNN
	1    7150 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5EC74B47
P 7150 4300
F 0 "R15" H 7220 4346 50  0000 L CNN
F 1 "100k" H 7220 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7080 4300 50  0001 C CNN
F 3 "~" H 7150 4300 50  0001 C CNN
	1    7150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3850 7150 4150
Wire Wire Line
	7150 4450 7150 4650
Wire Wire Line
	7150 3550 7150 3450
Wire Wire Line
	6850 3450 7150 3450
Text Label 6850 3450 0    50   ~ 0
VSER1
$Comp
L Device:R R16
U 1 1 5EC75459
P 7700 3700
F 0 "R16" H 7770 3746 50  0000 L CNN
F 1 "500k" H 7770 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7630 3700 50  0001 C CNN
F 3 "~" H 7700 3700 50  0001 C CNN
	1    7700 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5EC75460
P 7700 4300
F 0 "R17" H 7770 4346 50  0000 L CNN
F 1 "100k" H 7770 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7630 4300 50  0001 C CNN
F 3 "~" H 7700 4300 50  0001 C CNN
	1    7700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3850 7700 4150
Wire Wire Line
	7700 4450 7700 4650
Wire Wire Line
	7700 3550 7700 3450
Wire Wire Line
	7400 3450 7700 3450
Text Label 7400 3450 0    50   ~ 0
VSER2
$Comp
L Device:R R18
U 1 1 5EC7608B
P 8250 3700
F 0 "R18" H 8320 3746 50  0000 L CNN
F 1 "500k" H 8320 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 3700 50  0001 C CNN
F 3 "~" H 8250 3700 50  0001 C CNN
	1    8250 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5EC76092
P 8250 4300
F 0 "R19" H 8320 4346 50  0000 L CNN
F 1 "100k" H 8320 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 4300 50  0001 C CNN
F 3 "~" H 8250 4300 50  0001 C CNN
	1    8250 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3850 8250 4150
Wire Wire Line
	8250 4450 8250 4650
Wire Wire Line
	8250 3550 8250 3450
Wire Wire Line
	7950 3450 8250 3450
$Comp
L Device:R R20
U 1 1 5EC7609E
P 8800 3700
F 0 "R20" H 8870 3746 50  0000 L CNN
F 1 "500k" H 8870 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8730 3700 50  0001 C CNN
F 3 "~" H 8800 3700 50  0001 C CNN
	1    8800 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5EC760A5
P 8800 4300
F 0 "R21" H 8870 4346 50  0000 L CNN
F 1 "100k" H 8870 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8730 4300 50  0001 C CNN
F 3 "~" H 8800 4300 50  0001 C CNN
	1    8800 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3850 8800 4150
Wire Wire Line
	8800 4450 8800 4650
Wire Wire Line
	8800 3550 8800 3450
Wire Wire Line
	8500 3450 8800 3450
$Comp
L Device:R R22
U 1 1 5EC79139
P 9350 3700
F 0 "R22" H 9420 3746 50  0000 L CNN
F 1 "500k" H 9420 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9280 3700 50  0001 C CNN
F 3 "~" H 9350 3700 50  0001 C CNN
	1    9350 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5EC79140
P 9350 4300
F 0 "R23" H 9420 4346 50  0000 L CNN
F 1 "100k" H 9420 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9280 4300 50  0001 C CNN
F 3 "~" H 9350 4300 50  0001 C CNN
	1    9350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3850 9350 4150
Wire Wire Line
	9350 4450 9350 4650
Wire Wire Line
	9350 3550 9350 3450
Wire Wire Line
	9050 3450 9350 3450
$Comp
L Device:R R24
U 1 1 5EC7914C
P 9900 3700
F 0 "R24" H 9970 3746 50  0000 L CNN
F 1 "500k" H 9970 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9830 3700 50  0001 C CNN
F 3 "~" H 9900 3700 50  0001 C CNN
	1    9900 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 5EC79153
P 9900 4300
F 0 "R25" H 9970 4346 50  0000 L CNN
F 1 "100k" H 9970 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9830 4300 50  0001 C CNN
F 3 "~" H 9900 4300 50  0001 C CNN
	1    9900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3850 9900 4150
Wire Wire Line
	9900 4450 9900 4650
Wire Wire Line
	9900 3550 9900 3450
Wire Wire Line
	9600 3450 9900 3450
Text Label 7950 3450 0    50   ~ 0
VSER3
Text Label 8500 3450 0    50   ~ 0
VSER4
Text Label 9050 3450 0    50   ~ 0
VSER5
Text Label 9600 3450 0    50   ~ 0
VSER6
Wire Wire Line
	6600 4650 7150 4650
Connection ~ 7150 4650
Wire Wire Line
	7150 4650 7700 4650
Connection ~ 7700 4650
Wire Wire Line
	7700 4650 8250 4650
Connection ~ 8250 4650
Wire Wire Line
	8250 4650 8800 4650
Connection ~ 8800 4650
Wire Wire Line
	8800 4650 9350 4650
Connection ~ 9350 4650
Wire Wire Line
	9350 4650 9900 4650
Text Notes 2050 2000 0    79   ~ 0
Servo Connections
Text Notes 7800 3250 0    79   ~ 0
Voltage Dividers
Wire Notes Line
	1650 1850 3900 1850
Wire Notes Line
	3900 1850 3900 5650
Wire Notes Line
	3900 5650 1650 5650
Wire Notes Line
	1650 5650 1650 1850
Wire Notes Line
	10300 4800 5950 4800
Wire Notes Line
	5950 4800 5950 3100
Wire Notes Line
	5950 3100 10300 3100
Wire Notes Line
	10300 3100 10300 4800
$EndSCHEMATC
