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
P 8000 3750
AR Path="/5D899D49/5D8A8745" Ref="J?"  Part="1" 
AR Path="/5D8A8745" Ref="J?"  Part="1" 
F 0 "J?" H 7850 3350 50  0000 L CNN
F 1 "HC-05 BT Module" H 7800 3250 50  0000 L CNN
F 2 "" H 8000 3750 50  0001 C CNN
F 3 "~" H 8000 3750 50  0001 C CNN
	1    8000 3750
	1    0    0    -1  
$EndComp
Text Notes 8100 3550 0    50   ~ 0
Enable AT Commands
Text Notes 8100 3650 0    50   ~ 0
+5V
Text Notes 8100 3750 0    50   ~ 0
GND
Text Notes 8100 3850 0    50   ~ 0
TX
Text Notes 8100 3950 0    50   ~ 0
RX
Text Notes 8100 4050 0    50   ~ 0
LED
Text Label 7450 3550 0    50   ~ 0
AT_COMM
Text Label 7450 3650 0    50   ~ 0
+5V
Text Label 7450 3750 0    50   ~ 0
GND
Text Label 7450 3850 0    50   ~ 0
RX
Text Label 7450 3950 0    50   ~ 0
TX
Wire Wire Line
	7800 3650 7450 3650
Wire Wire Line
	7800 3750 7450 3750
Wire Wire Line
	7800 4050 7450 4050
NoConn ~ 7450 4050
Wire Wire Line
	5400 3200 5800 3200
Text Label 5650 3200 0    50   ~ 0
+5V
$Comp
L Device:Jumper_NC_Dual JP?
U 1 1 5DB1F4DE
P 6150 4050
F 0 "JP?" H 6150 4196 50  0000 C CNN
F 1 "BT_Jumper" H 6150 4287 50  0000 C CNN
F 2 "" H 6150 4050 50  0001 C CNN
F 3 "~" H 6150 4050 50  0001 C CNN
	1    6150 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Dual JP?
U 1 1 5DB1F989
P 6150 3750
F 0 "JP?" H 6150 3989 50  0000 C CNN
F 1 "BT_Jumper" H 6150 3898 50  0000 C CNN
F 2 "" H 6150 3750 50  0001 C CNN
F 3 "~" H 6150 3750 50  0001 C CNN
	1    6150 3750
	1    0    0    -1  
$EndComp
NoConn ~ 5900 3750
NoConn ~ 5900 4050
Wire Wire Line
	6400 3750 6650 3750
Wire Wire Line
	6400 4050 6650 4050
Text Label 6550 3750 0    50   ~ 0
RX
Text Label 6550 4050 0    50   ~ 0
TX
Wire Wire Line
	7800 3550 7450 3550
Wire Wire Line
	7800 3850 7450 3850
Wire Wire Line
	7800 3950 7450 3950
Wire Wire Line
	5400 3850 6150 3850
Wire Wire Line
	5400 3950 6150 3950
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
L Connector:Barrel_Jack J?
U 1 1 5DB47949
P 1100 3800
F 0 "J?" H 1155 4125 50  0000 C CNN
F 1 "DC Barrel Jack" H 1155 4034 50  0000 C CNN
F 2 "" H 1150 3760 50  0001 C CNN
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
VIN
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DB485DF
P 950 3200
F 0 "J?" H 870 2875 50  0000 C CNN
F 1 "Board Connector" H 870 2966 50  0000 C CNN
F 2 "" H 950 3200 50  0001 C CNN
F 3 "~" H 950 3200 50  0001 C CNN
	1    950  3200
	-1   0    0    1   
$EndComp
Text Label 1250 3100 0    50   ~ 0
GND
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 5DB4C37F
P 1600 3200
F 0 "SW?" H 1750 3450 50  0000 C CNN
F 1 "DIP" H 1750 3350 50  0000 C CNN
F 2 "" H 1600 3200 50  0001 C CNN
F 3 "" H 1600 3200 50  0001 C CNN
	1    1600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3200 2250 3200
Text Label 2100 3200 0    50   ~ 0
VBAT
Wire Wire Line
	1150 3100 1400 3100
Wire Wire Line
	1300 3200 1150 3200
$Comp
L Device:D_Schottky D?
U 1 1 5DB4F989
P 1750 5250
F 0 "D?" H 1750 5466 50  0000 C CNN
F 1 "SS1P3L" H 1750 5375 50  0000 C CNN
F 2 "" H 1750 5250 50  0001 C CNN
F 3 "~" H 1750 5250 50  0001 C CNN
	1    1750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5250 1250 5250
Wire Wire Line
	1900 5250 2250 5250
Text Label 1400 5250 0    50   ~ 0
VIN
Text Label 1950 5250 0    50   ~ 0
VBAT
Text Notes 1100 4850 0    79   ~ 0
VIN Auto Selector
Wire Notes Line
	1000 4700 2450 4700
Wire Notes Line
	2450 4700 2450 5550
Wire Notes Line
	1000 5550 1000 4700
Wire Notes Line
	1000 5550 2450 5550
Wire Wire Line
	3450 3100 2950 3100
Text Label 2950 3100 0    50   ~ 0
VIN
Wire Wire Line
	5400 3000 5800 3000
Text Label 5700 3000 0    50   ~ 0
VIN
$EndSCHEMATC
