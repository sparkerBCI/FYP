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
Wire Wire Line
	8150 1050 8750 1050
Wire Wire Line
	8150 1150 8750 1150
Text Label 8400 1050 0    50   ~ 0
UART4_TX
Text Label 8400 1150 0    50   ~ 0
UART4_RX
$Comp
L MCU_ST_STM32F4:STM32F407VGTx U2
U 1 1 5E06F553
P 7250 3450
F 0 "U2" H 7250 564 50  0000 C CNN
F 1 "STM32F407VGTx" H 7250 473 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 6550 850 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 7250 3450 50  0001 C CNN
	1    7250 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1050 5700 1050
Wire Wire Line
	8150 2450 8750 2450
Text Label 8550 2350 0    50   ~ 0
SWDIO
Text Label 8550 2450 0    50   ~ 0
SWCLK
Wire Wire Line
	8150 3050 8750 3050
Text Label 8600 3050 0    50   ~ 0
SWO
Text Label 5700 1050 0    50   ~ 0
NRST
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 5E06F6DA
P 10400 2150
F 0 "J1" H 10373 2030 50  0000 R CNN
F 1 "SWD Header" H 10373 2121 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 10400 2150 50  0001 C CNN
F 3 "~" H 10400 2150 50  0001 C CNN
	1    10400 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 1850 9650 1850
Wire Wire Line
	10200 1950 9650 1950
Wire Wire Line
	10200 2050 9650 2050
Wire Wire Line
	10200 2150 9650 2150
Wire Wire Line
	10200 2250 9650 2250
Wire Wire Line
	10200 2350 9650 2350
Text Label 9650 1850 0    50   ~ 0
SWO
Text Label 9650 1950 0    50   ~ 0
NRST
Text Label 9650 2050 0    50   ~ 0
SWDIO
Text Label 9650 2150 0    50   ~ 0
GND
Text Label 9650 2250 0    50   ~ 0
SWCLK
Text Label 9650 2350 0    50   ~ 0
3V3
Wire Wire Line
	8150 2350 8750 2350
Wire Wire Line
	8150 1650 8750 1650
Text Label 8400 1650 0    50   ~ 0
TIM3_CH1
Wire Wire Line
	8150 1750 8750 1750
Text Label 8400 1750 0    50   ~ 0
TIM3_CH2
Wire Wire Line
	8150 2750 8750 2750
Text Label 8400 2750 0    50   ~ 0
TIM3_CH3
Wire Wire Line
	8150 2850 8750 2850
Text Label 8400 2850 0    50   ~ 0
TIM3_CH4
Wire Wire Line
	6350 5650 5700 5650
Text Label 5700 5650 0    50   ~ 0
TIM4_CH1
Wire Wire Line
	6350 5750 5700 5750
Text Label 5700 5750 0    50   ~ 0
TIM4_CH2
$Comp
L Device:LED D1
U 1 1 5E071C85
P 5500 3650
F 0 "D1" H 5491 3866 50  0000 C CNN
F 1 "LTST-C171TBKT" H 5491 3775 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 5500 3650 50  0001 C CNN
F 3 "~" H 5500 3650 50  0001 C CNN
	1    5500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3650 5200 3650
Wire Wire Line
	5200 3650 5200 4000
Wire Wire Line
	5200 4000 4950 4000
Text Label 4950 4000 0    50   ~ 0
GND
Wire Wire Line
	6350 4150 5950 4150
$Comp
L Device:R R4
U 1 1 5E07218C
P 5800 4150
F 0 "R4" V 5900 4250 50  0000 C CNN
F 1 "65R" V 6000 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5730 4150 50  0001 C CNN
F 3 "~" H 5800 4150 50  0001 C CNN
	1    5800 4150
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5E072193
P 5500 4150
F 0 "D2" H 5491 4366 50  0000 C CNN
F 1 "LO R976-PS-1" H 5491 4275 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 5500 4150 50  0001 C CNN
F 3 "~" H 5500 4150 50  0001 C CNN
	1    5500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4150 5200 4150
Wire Wire Line
	5200 4150 5200 4500
Wire Wire Line
	5200 4500 4950 4500
Text Label 4950 4500 0    50   ~ 0
GND
$Comp
L Regulator_Linear:AZ1117-3.3 U1
U 1 1 5E072D2F
P 3300 7050
F 0 "U1" H 3300 7292 50  0000 C CNN
F 1 "LDL1117S33R" H 3300 7201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3300 7300 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 3300 7050 50  0001 C CNN
	1    3300 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C40
U 1 1 5E073091
P 3900 7200
F 0 "C40" H 4015 7246 50  0000 L CNN
F 1 "1n" H 4015 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3938 7050 50  0001 C CNN
F 3 "~" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C46
U 1 1 5E073130
P 4350 7200
F 0 "C46" H 4465 7246 50  0000 L CNN
F 1 "10n" H 4465 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4388 7050 50  0001 C CNN
F 3 "~" H 4350 7200 50  0001 C CNN
	1    4350 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C47
U 1 1 5E073705
P 4800 7200
F 0 "C47" H 4915 7246 50  0000 L CNN
F 1 "4.7u" H 4915 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4838 7050 50  0001 C CNN
F 3 "~" H 4800 7200 50  0001 C CNN
	1    4800 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C48
U 1 1 5E073C88
P 5250 7200
F 0 "C48" H 5365 7246 50  0000 L CNN
F 1 "10u" H 5365 7155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 5288 7050 50  0001 C CNN
F 3 "~" H 5250 7200 50  0001 C CNN
	1    5250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5E074A04
P 1350 7200
F 0 "C7" H 1465 7246 50  0000 L CNN
F 1 "10u" H 1465 7155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 1388 7050 50  0001 C CNN
F 3 "~" H 1350 7200 50  0001 C CNN
	1    1350 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5E074A0B
P 1800 7200
F 0 "C15" H 1915 7246 50  0000 L CNN
F 1 "4.7u" H 1915 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1838 7050 50  0001 C CNN
F 3 "~" H 1800 7200 50  0001 C CNN
	1    1800 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 5E074A12
P 2250 7200
F 0 "C20" H 2365 7246 50  0000 L CNN
F 1 "10n" H 2365 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2288 7050 50  0001 C CNN
F 3 "~" H 2250 7200 50  0001 C CNN
	1    2250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 5E074A19
P 2700 7200
F 0 "C25" H 2815 7246 50  0000 L CNN
F 1 "1n" H 2815 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2738 7050 50  0001 C CNN
F 3 "~" H 2700 7200 50  0001 C CNN
	1    2700 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 7350 1800 7350
Connection ~ 1800 7350
Wire Wire Line
	1800 7350 2250 7350
Connection ~ 2250 7350
Wire Wire Line
	2250 7350 2700 7350
Connection ~ 2700 7350
Wire Wire Line
	2700 7350 3300 7350
Connection ~ 3300 7350
Wire Wire Line
	3300 7350 3900 7350
Connection ~ 3900 7350
Wire Wire Line
	3900 7350 4350 7350
Connection ~ 4350 7350
Wire Wire Line
	4350 7350 4800 7350
Connection ~ 4800 7350
Wire Wire Line
	4800 7350 5250 7350
Wire Wire Line
	5250 7050 4800 7050
Connection ~ 3900 7050
Wire Wire Line
	3900 7050 3600 7050
Connection ~ 4350 7050
Wire Wire Line
	4350 7050 3900 7050
Connection ~ 4800 7050
Wire Wire Line
	4800 7050 4350 7050
Wire Wire Line
	3000 7050 2700 7050
Connection ~ 1800 7050
Wire Wire Line
	1800 7050 1350 7050
Connection ~ 2250 7050
Wire Wire Line
	2250 7050 1800 7050
Connection ~ 2700 7050
Wire Wire Line
	2700 7050 2250 7050
$Comp
L Device:C C51
U 1 1 5E07E6DD
P 5750 1700
F 0 "C51" H 5865 1746 50  0000 L CNN
F 1 "2.2u" H 5865 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 1550 50  0001 C CNN
F 3 "~" H 5750 1700 50  0001 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C49
U 1 1 5E07E7F9
P 5400 1700
F 0 "C49" H 5150 1700 50  0000 L CNN
F 1 "2.2u" H 5150 1600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5438 1550 50  0001 C CNN
F 3 "~" H 5400 1700 50  0001 C CNN
	1    5400 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1550 5750 1550
Wire Wire Line
	6350 1450 5400 1450
Wire Wire Line
	5750 1850 5400 1850
Text Label 5500 1850 0    50   ~ 0
GND
Text Notes 5350 1950 0    50   ~ 0
ESR < 2Ohms
$Comp
L Device:C C13
U 1 1 5E08383F
P 1650 1800
F 0 "C13" H 1765 1846 50  0000 L CNN
F 1 "0.1u" H 1765 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1688 1650 50  0001 C CNN
F 3 "~" H 1650 1800 50  0001 C CNN
	1    1650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1600 1650 1600
Wire Wire Line
	1400 2000 1650 2000
Wire Wire Line
	1650 1650 1650 1600
Connection ~ 1650 1600
Wire Wire Line
	1650 1600 2100 1600
Wire Wire Line
	1650 1950 1650 2000
Connection ~ 1650 2000
Wire Wire Line
	1650 2000 2100 2000
Text Label 1900 1600 0    50   ~ 0
NRST
Text Label 1900 2000 0    50   ~ 0
GND
$Comp
L Device:C C52
U 1 1 5E08F1B3
P 5750 2250
F 0 "C52" H 5865 2296 50  0000 L CNN
F 1 "10n" H 5865 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 2100 50  0001 C CNN
F 3 "~" H 5750 2250 50  0001 C CNN
	1    5750 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1450 5400 1550
$Comp
L Device:C C50
U 1 1 5E092045
P 5450 2250
F 0 "C50" H 5250 2300 50  0000 L CNN
F 1 "1u" H 5250 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5488 2100 50  0001 C CNN
F 3 "~" H 5450 2250 50  0001 C CNN
	1    5450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2100 5750 2100
Wire Wire Line
	5450 2400 5750 2400
Wire Wire Line
	5750 2100 6250 2100
Wire Wire Line
	6250 2100 6250 1650
Wire Wire Line
	6250 1650 6350 1650
Connection ~ 5750 2100
Text Label 5500 2400 0    50   ~ 0
VSSA
Text Label 5500 2100 0    50   ~ 0
VDDA
$Comp
L Device:C C2
U 1 1 5E0A332F
P 1000 3300
F 0 "C2" H 1115 3346 50  0000 L CNN
F 1 "100n" H 1115 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1038 3150 50  0001 C CNN
F 3 "~" H 1000 3300 50  0001 C CNN
	1    1000 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5E0B7431
P 950 7200
F 0 "C1" H 1068 7246 50  0000 L CNN
F 1 "100u" H 1068 7155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 988 7050 50  0001 C CNN
F 3 "~" H 950 7200 50  0001 C CNN
	1    950  7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 7050 950  7050
Connection ~ 1350 7050
Wire Wire Line
	1350 7350 950  7350
Connection ~ 1350 7350
$Comp
L Device:C C34
U 1 1 5E0D63C3
P 3400 6100
F 0 "C34" H 3515 6146 50  0000 L CNN
F 1 "10n" H 3515 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3438 5950 50  0001 C CNN
F 3 "~" H 3400 6100 50  0001 C CNN
	1    3400 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C39
U 1 1 5E0D6574
P 3800 6100
F 0 "C39" H 3915 6146 50  0000 L CNN
F 1 "100n" H 3915 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3838 5950 50  0001 C CNN
F 3 "~" H 3800 6100 50  0001 C CNN
	1    3800 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C41
U 1 1 5E0DAF7D
P 4200 6100
F 0 "C41" H 4315 6146 50  0000 L CNN
F 1 "1u" H 4315 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4238 5950 50  0001 C CNN
F 3 "~" H 4200 6100 50  0001 C CNN
	1    4200 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5950 3800 5950
Connection ~ 3800 5950
Wire Wire Line
	3800 5950 3400 5950
Wire Wire Line
	3400 6250 3800 6250
Connection ~ 3800 6250
Wire Wire Line
	3800 6250 4200 6250
$Comp
L Device:C C4
U 1 1 5E0EA918
P 1000 4500
F 0 "C4" H 1115 4546 50  0000 L CNN
F 1 "10n" H 1115 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1038 4350 50  0001 C CNN
F 3 "~" H 1000 4500 50  0001 C CNN
	1    1000 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5E13A2EC
P 1450 3300
F 0 "C9" H 1565 3346 50  0000 L CNN
F 1 "100n" H 1565 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 3150 50  0001 C CNN
F 3 "~" H 1450 3300 50  0001 C CNN
	1    1450 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5E13C6EA
P 1900 3300
F 0 "C16" H 2015 3346 50  0000 L CNN
F 1 "100n" H 2015 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 3150 50  0001 C CNN
F 3 "~" H 1900 3300 50  0001 C CNN
	1    1900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5E13EB65
P 2400 3300
F 0 "C21" H 2515 3346 50  0000 L CNN
F 1 "100n" H 2515 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 3150 50  0001 C CNN
F 3 "~" H 2400 3300 50  0001 C CNN
	1    2400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 5E14100A
P 2850 3300
F 0 "C26" H 2965 3346 50  0000 L CNN
F 1 "100n" H 2965 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2888 3150 50  0001 C CNN
F 3 "~" H 2850 3300 50  0001 C CNN
	1    2850 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C30
U 1 1 5E141011
P 3300 3300
F 0 "C30" H 3415 3346 50  0000 L CNN
F 1 "100n" H 3415 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 3150 50  0001 C CNN
F 3 "~" H 3300 3300 50  0001 C CNN
	1    3300 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C35
U 1 1 5E141018
P 3750 3300
F 0 "C35" H 3865 3346 50  0000 L CNN
F 1 "100n" H 3865 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 3150 50  0001 C CNN
F 3 "~" H 3750 3300 50  0001 C CNN
	1    3750 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5E14353A
P 1000 3800
F 0 "C3" H 1115 3846 50  0000 L CNN
F 1 "100n" H 1115 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1038 3650 50  0001 C CNN
F 3 "~" H 1000 3800 50  0001 C CNN
	1    1000 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5E143541
P 1450 3800
F 0 "C10" H 1565 3846 50  0000 L CNN
F 1 "100n" H 1565 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 3650 50  0001 C CNN
F 3 "~" H 1450 3800 50  0001 C CNN
	1    1450 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5E143548
P 1900 3800
F 0 "C17" H 2015 3846 50  0000 L CNN
F 1 "100n" H 2015 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 3650 50  0001 C CNN
F 3 "~" H 1900 3800 50  0001 C CNN
	1    1900 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 5E14354F
P 2400 3800
F 0 "C22" H 2515 3846 50  0000 L CNN
F 1 "100n" H 2515 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 3650 50  0001 C CNN
F 3 "~" H 2400 3800 50  0001 C CNN
	1    2400 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 5E143556
P 2850 3800
F 0 "C27" H 2965 3846 50  0000 L CNN
F 1 "100n" H 2965 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2888 3650 50  0001 C CNN
F 3 "~" H 2850 3800 50  0001 C CNN
	1    2850 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C31
U 1 1 5E14355D
P 3300 3800
F 0 "C31" H 3415 3846 50  0000 L CNN
F 1 "100n" H 3415 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 3650 50  0001 C CNN
F 3 "~" H 3300 3800 50  0001 C CNN
	1    3300 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C36
U 1 1 5E143564
P 3750 3800
F 0 "C36" H 3865 3846 50  0000 L CNN
F 1 "100n" H 3865 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 3650 50  0001 C CNN
F 3 "~" H 3750 3800 50  0001 C CNN
	1    3750 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5E145A0D
P 1450 4500
F 0 "C11" H 1565 4546 50  0000 L CNN
F 1 "10n" H 1565 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 4350 50  0001 C CNN
F 3 "~" H 1450 4500 50  0001 C CNN
	1    1450 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5E147E98
P 1900 4500
F 0 "C18" H 2015 4546 50  0000 L CNN
F 1 "10n" H 2015 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 4350 50  0001 C CNN
F 3 "~" H 1900 4500 50  0001 C CNN
	1    1900 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 5E14A2A0
P 2400 4500
F 0 "C23" H 2515 4546 50  0000 L CNN
F 1 "10n" H 2515 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 4350 50  0001 C CNN
F 3 "~" H 2400 4500 50  0001 C CNN
	1    2400 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 5E14C853
P 2850 4500
F 0 "C28" H 2965 4546 50  0000 L CNN
F 1 "10n" H 2965 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2888 4350 50  0001 C CNN
F 3 "~" H 2850 4500 50  0001 C CNN
	1    2850 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C32
U 1 1 5E14EC59
P 3300 4500
F 0 "C32" H 3415 4546 50  0000 L CNN
F 1 "10n" H 3415 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 4350 50  0001 C CNN
F 3 "~" H 3300 4500 50  0001 C CNN
	1    3300 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C37
U 1 1 5E15121C
P 3750 4500
F 0 "C37" H 3865 4546 50  0000 L CNN
F 1 "10n" H 3865 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 4350 50  0001 C CNN
F 3 "~" H 3750 4500 50  0001 C CNN
	1    3750 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E155D77
P 1000 5000
F 0 "C5" H 1115 5046 50  0000 L CNN
F 1 "10n" H 1115 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1038 4850 50  0001 C CNN
F 3 "~" H 1000 5000 50  0001 C CNN
	1    1000 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5E155D7E
P 1450 5000
F 0 "C12" H 1565 5046 50  0000 L CNN
F 1 "10n" H 1565 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 4850 50  0001 C CNN
F 3 "~" H 1450 5000 50  0001 C CNN
	1    1450 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 5E155D85
P 1900 5000
F 0 "C19" H 2015 5046 50  0000 L CNN
F 1 "10n" H 2015 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 4850 50  0001 C CNN
F 3 "~" H 1900 5000 50  0001 C CNN
	1    1900 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 5E155D8C
P 2400 5000
F 0 "C24" H 2515 5046 50  0000 L CNN
F 1 "10n" H 2515 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 4850 50  0001 C CNN
F 3 "~" H 2400 5000 50  0001 C CNN
	1    2400 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 5E155D93
P 2850 5000
F 0 "C29" H 2965 5046 50  0000 L CNN
F 1 "10n" H 2965 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2888 4850 50  0001 C CNN
F 3 "~" H 2850 5000 50  0001 C CNN
	1    2850 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C33
U 1 1 5E155D9A
P 3300 5000
F 0 "C33" H 3415 5046 50  0000 L CNN
F 1 "10n" H 3415 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 4850 50  0001 C CNN
F 3 "~" H 3300 5000 50  0001 C CNN
	1    3300 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C38
U 1 1 5E155DA1
P 3750 5000
F 0 "C38" H 3865 5046 50  0000 L CNN
F 1 "10n" H 3865 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 4850 50  0001 C CNN
F 3 "~" H 3750 5000 50  0001 C CNN
	1    3750 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 3150 1450 3150
Connection ~ 1450 3150
Wire Wire Line
	1450 3150 1900 3150
Connection ~ 1900 3150
Wire Wire Line
	1900 3150 2400 3150
Connection ~ 2400 3150
Wire Wire Line
	2400 3150 2850 3150
Connection ~ 2850 3150
Wire Wire Line
	2850 3150 3300 3150
Connection ~ 3300 3150
Wire Wire Line
	3300 3150 3750 3150
Connection ~ 1450 3450
Wire Wire Line
	1450 3450 1000 3450
Connection ~ 1900 3450
Wire Wire Line
	1900 3450 1450 3450
Connection ~ 2400 3450
Wire Wire Line
	2400 3450 1900 3450
Connection ~ 2850 3450
Wire Wire Line
	2850 3450 2400 3450
Connection ~ 3300 3450
Wire Wire Line
	3300 3450 2850 3450
Wire Wire Line
	3750 3450 3300 3450
Wire Wire Line
	1000 3650 1450 3650
Connection ~ 1450 3650
Wire Wire Line
	1450 3650 1900 3650
Connection ~ 1900 3650
Wire Wire Line
	1900 3650 2400 3650
Connection ~ 2400 3650
Wire Wire Line
	2400 3650 2850 3650
Connection ~ 2850 3650
Wire Wire Line
	2850 3650 3300 3650
Connection ~ 3300 3650
Wire Wire Line
	3300 3650 3750 3650
Connection ~ 1450 3950
Wire Wire Line
	1450 3950 1000 3950
Connection ~ 1900 3950
Wire Wire Line
	1900 3950 1450 3950
Connection ~ 2400 3950
Wire Wire Line
	2400 3950 1900 3950
Connection ~ 2850 3950
Wire Wire Line
	2850 3950 2400 3950
Connection ~ 3300 3950
Wire Wire Line
	3300 3950 2850 3950
Wire Wire Line
	3750 3950 3300 3950
Wire Wire Line
	1000 4350 1450 4350
Connection ~ 1450 4350
Wire Wire Line
	1450 4350 1900 4350
Connection ~ 1900 4350
Wire Wire Line
	1900 4350 2400 4350
Connection ~ 2400 4350
Wire Wire Line
	2400 4350 2850 4350
Connection ~ 2850 4350
Wire Wire Line
	2850 4350 3300 4350
Connection ~ 3300 4350
Wire Wire Line
	3300 4350 3750 4350
Connection ~ 1450 4650
Wire Wire Line
	1450 4650 1000 4650
Connection ~ 1900 4650
Wire Wire Line
	1900 4650 1450 4650
Connection ~ 2400 4650
Wire Wire Line
	2400 4650 1900 4650
Connection ~ 2850 4650
Wire Wire Line
	2850 4650 2400 4650
Connection ~ 3300 4650
Wire Wire Line
	3300 4650 2850 4650
Wire Wire Line
	3750 4650 3300 4650
Wire Wire Line
	1000 4850 1450 4850
Connection ~ 1450 4850
Wire Wire Line
	1450 4850 1900 4850
Connection ~ 1900 4850
Wire Wire Line
	1900 4850 2400 4850
Connection ~ 2400 4850
Wire Wire Line
	2400 4850 2850 4850
Connection ~ 2850 4850
Wire Wire Line
	2850 4850 3300 4850
Connection ~ 3300 4850
Wire Wire Line
	3300 4850 3750 4850
Connection ~ 1450 5150
Wire Wire Line
	1450 5150 1000 5150
Connection ~ 1900 5150
Wire Wire Line
	1900 5150 1450 5150
Connection ~ 2400 5150
Wire Wire Line
	2400 5150 1900 5150
Connection ~ 2850 5150
Wire Wire Line
	2850 5150 2400 5150
Connection ~ 3300 5150
Wire Wire Line
	3300 5150 2850 5150
Wire Wire Line
	3750 5150 3300 5150
Text Notes 1000 3100 0    50   ~ 0
2 per VDD pin
Text Notes 1000 4300 0    50   ~ 0
2 per VDD pin
Connection ~ 7050 750 
Wire Wire Line
	7050 750  6950 750 
Connection ~ 7150 750 
Wire Wire Line
	7150 750  7050 750 
Connection ~ 7250 750 
Wire Wire Line
	7250 750  7150 750 
Connection ~ 7350 750 
Wire Wire Line
	7350 750  7300 750 
Connection ~ 7450 750 
Wire Wire Line
	7450 750  7350 750 
Wire Wire Line
	7550 750  7450 750 
Wire Wire Line
	7300 750  7300 650 
Wire Wire Line
	7300 650  7200 650 
Connection ~ 7300 750 
Wire Wire Line
	7300 750  7250 750 
Wire Wire Line
	7300 650  7400 650 
Connection ~ 7300 650 
Text Label 7250 650  0    50   ~ 0
3V3
Wire Wire Line
	7650 750  7800 750 
Text Label 7650 750  0    50   ~ 0
VDDA
Text Label 3650 5950 0    50   ~ 0
VDDA
Wire Wire Line
	7650 750  7550 750 
Connection ~ 7650 750 
Connection ~ 7550 750 
Wire Wire Line
	7350 6250 7250 6250
Connection ~ 7050 6250
Wire Wire Line
	7050 6250 6750 6250
Connection ~ 7150 6250
Wire Wire Line
	7150 6250 7050 6250
Connection ~ 7250 6250
Wire Wire Line
	7250 6250 7150 6250
Text Label 6750 6250 0    50   ~ 0
GND
Wire Wire Line
	7350 6250 7450 6250
Connection ~ 7350 6250
Connection ~ 7450 6250
Wire Wire Line
	7450 6250 7650 6250
Text Label 7450 6250 0    50   ~ 0
VSSA
Text Label 3550 6250 0    50   ~ 0
VSSA
Text Label 2500 3150 0    50   ~ 0
3V3
Text Label 2500 3450 0    50   ~ 0
GND
Text Label 2500 3650 0    50   ~ 0
3V3
Text Label 2500 3950 0    50   ~ 0
GND
Text Label 2500 4350 0    50   ~ 0
3V3
Text Label 2500 4650 0    50   ~ 0
GND
Text Label 2500 4850 0    50   ~ 0
3V3
Text Label 2500 5150 0    50   ~ 0
GND
Text Label 4150 7050 0    50   ~ 0
3V3
Text Label 4150 7350 0    50   ~ 0
GND
$Comp
L Device:Resonator Y1
U 1 1 5E1CC3C6
P 5450 2800
F 0 "Y1" V 5404 2911 50  0000 L CNN
F 1 "12MHz" V 5495 2911 50  0000 L CNN
F 2 "Resonators:CSTNE12M0GH5L000R0" H 5425 2800 50  0001 C CNN
F 3 "~" H 5425 2800 50  0001 C CNN
	1    5450 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 2650 6000 2650
Wire Wire Line
	6000 2650 6000 2450
Wire Wire Line
	6000 2450 6350 2450
Wire Wire Line
	5450 2950 6100 2950
Wire Wire Line
	6100 2950 6100 2550
Wire Wire Line
	6100 2550 6350 2550
Wire Wire Line
	5250 2800 5050 2800
Wire Wire Line
	5050 2800 5050 3100
Wire Wire Line
	5050 3100 5350 3100
Text Label 5200 3100 0    50   ~ 0
GND
Text HLabel 10600 3050 2    50   Output ~ 0
TX
Text HLabel 10600 3200 2    50   Input ~ 0
RX
Text HLabel 10600 3700 2    50   Output ~ 0
PWM1
Text HLabel 10600 3850 2    50   Output ~ 0
PWM2
Text HLabel 10600 4000 2    50   Output ~ 0
PWM3
Text HLabel 10600 4150 2    50   Output ~ 0
PWM4
Text HLabel 10600 4300 2    50   Output ~ 0
PWM5
Text HLabel 10600 4450 2    50   Output ~ 0
PWM6
Wire Wire Line
	8150 4450 8750 4450
Text Label 8250 4450 0    50   ~ 0
ADC123_IN10
Wire Wire Line
	8150 4550 8750 4550
Text Label 8250 4550 0    50   ~ 0
ADC123_IN11
Wire Wire Line
	8150 4650 8750 4650
Text Label 8250 4650 0    50   ~ 0
ADC123_IN12
Text Label 8300 4950 0    50   ~ 0
ADC12_IN15
Wire Wire Line
	8150 4950 8750 4950
Text Label 8300 4850 0    50   ~ 0
ADC12_IN14
Wire Wire Line
	8150 4850 8750 4850
Wire Wire Line
	8150 4750 8750 4750
Text Label 8250 4750 0    50   ~ 0
ADC123_IN13
Text HLabel 10600 4600 2    50   Input ~ 0
FB1
Text HLabel 10600 4750 2    50   Input ~ 0
FB2
Text HLabel 10600 4900 2    50   Input ~ 0
FB3
Text HLabel 10600 5050 2    50   Input ~ 0
FB4
Text HLabel 10600 5200 2    50   Input ~ 0
FB5
Text HLabel 10600 5350 2    50   Input ~ 0
FB6
Wire Wire Line
	8150 2950 8750 2950
Wire Wire Line
	6350 1250 5700 1250
Text Label 5700 1250 0    50   ~ 0
BOOT0
Text Label 8500 2950 0    50   ~ 0
BOOT1
$Comp
L Switch:SW_DIP_x02 SW2
U 1 1 5E31230F
P 3400 1600
F 0 "SW2" H 3400 1333 50  0000 C CNN
F 1 "SW_DIP_x02" H 3400 1424 50  0000 C CNN
F 2 "Switches:DIP-Switch_01x02" H 3400 1600 50  0001 C CNN
F 3 "" H 3400 1600 50  0001 C CNN
	1    3400 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 1600 4000 1600
$Comp
L Device:R R2
U 1 1 5E343FA0
P 4300 2000
F 0 "R2" H 4370 2046 50  0000 L CNN
F 1 "100k" H 4370 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 2000 50  0001 C CNN
F 3 "~" H 4300 2000 50  0001 C CNN
	1    4300 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E3440A8
P 4000 2000
F 0 "R1" H 4070 2046 50  0000 L CNN
F 1 "100k" H 4070 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3930 2000 50  0001 C CNN
F 3 "~" H 4000 2000 50  0001 C CNN
	1    4000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1850 4000 1600
Connection ~ 4000 1600
Wire Wire Line
	4000 1600 4500 1600
Wire Wire Line
	4000 2150 4000 2350
Wire Wire Line
	4000 2350 4300 2350
Wire Wire Line
	4300 2350 4300 2150
Text Label 4050 2350 0    50   ~ 0
GND
Text Label 4250 1600 0    50   ~ 0
BOOT0
Text Label 4250 1700 0    50   ~ 0
BOOT1
Wire Wire Line
	3700 1700 4300 1700
Wire Wire Line
	4300 1700 4300 1850
Connection ~ 4300 1700
Wire Wire Line
	4300 1700 4500 1700
Wire Wire Line
	3100 1600 3100 1700
Wire Wire Line
	3100 1600 2800 1600
Connection ~ 3100 1600
Text Label 2800 1600 0    50   ~ 0
3V3
Wire Wire Line
	10600 3050 10050 3050
Wire Wire Line
	10600 3200 10050 3200
Wire Wire Line
	10600 3700 10050 3700
Wire Wire Line
	10600 3850 10050 3850
Wire Wire Line
	10600 4000 10050 4000
Wire Wire Line
	10600 4150 10050 4150
Wire Wire Line
	10600 4300 10050 4300
Wire Wire Line
	10600 4450 10050 4450
Wire Wire Line
	10600 4600 10050 4600
Wire Wire Line
	10600 4750 10050 4750
Wire Wire Line
	10600 4900 10050 4900
Wire Wire Line
	10600 5050 10050 5050
Wire Wire Line
	10600 5200 10050 5200
Wire Wire Line
	10600 5350 10050 5350
Text Label 10050 3050 0    50   ~ 0
UART4_TX
Text Label 10050 3200 0    50   ~ 0
UART4_RX
Text Label 10050 3700 0    50   ~ 0
TIM3_CH1
Text Label 10050 3850 0    50   ~ 0
TIM3_CH2
Text Label 10050 4000 0    50   ~ 0
TIM3_CH3
Text Label 10050 4150 0    50   ~ 0
TIM3_CH4
Text Label 10050 4300 0    50   ~ 0
TIM4_CH1
Text Label 10050 4450 0    50   ~ 0
TIM4_CH2
Text Label 10050 4600 0    50   ~ 0
ADC123_IN10
Text Label 10050 4750 0    50   ~ 0
ADC123_IN11
Text Label 10050 4900 0    50   ~ 0
ADC123_IN12
Text Label 10050 5050 0    50   ~ 0
ADC123_IN13
Text Label 10050 5200 0    50   ~ 0
ADC12_IN14
Text Label 10050 5350 0    50   ~ 0
ADC12_IN15
Text Notes 5500 700  0    98   ~ 20
STM32F407VGTx
Text Notes 2150 2950 0    79   ~ 0
Decoupling Caps
Text Notes 3100 5850 0    79   ~ 0
Analog Decoupling Caps
Text Notes 1250 1450 0    79   ~ 0
Reset Button
Text Notes 3000 1200 0    79   ~ 0
Bootloader Configuration
Text Notes 2750 2200 0    50   ~ 0
BOOT1 BOOT0\n   X      0   Flash (SWD)\n   0      1   System Memory\n   1      1   Embedded SRAM
Text Label 1450 7050 0    50   ~ 0
V_Input
Text Notes 1850 6850 2    79   ~ 0
3.3V Regulator
Text Notes 9550 1750 0    79   ~ 0
SWD Programming\n      Header
Text HLabel 10600 6000 2    50   Output ~ 0
V+
Text HLabel 10600 6150 2    50   Input ~ 0
GND
Wire Wire Line
	10600 6000 10050 6000
Wire Wire Line
	10600 6150 10050 6150
Text Label 10050 6000 0    50   ~ 0
V_Input
Text Label 10050 6150 0    50   ~ 0
GND
Wire Notes Line
	4600 2750 4600 5250
Wire Notes Line
	4600 5250 800  5250
Wire Notes Line
	800  5250 800  2750
Wire Notes Line
	800  2750 4600 2750
Wire Notes Line
	3050 5700 4600 5700
Wire Notes Line
	4600 5700 4600 6350
Wire Notes Line
	4600 6350 3050 6350
Wire Notes Line
	3050 6350 3050 5700
Wire Notes Line
	800  6700 5600 6700
Wire Notes Line
	5600 6700 5600 7500
Wire Notes Line
	5600 7500 800  7500
Wire Notes Line
	800  7500 800  6700
Wire Notes Line
	9450 1400 10950 1400
Wire Notes Line
	10950 1400 10950 2500
Wire Notes Line
	10950 2500 9450 2500
Wire Notes Line
	9450 2500 9450 1400
Text Notes 10300 2900 0    79   ~ 0
UART
Text Notes 10250 3550 0    79   ~ 0
Control
Wire Notes Line
	4600 1050 4600 2400
Wire Notes Line
	4600 2400 2650 2400
Wire Notes Line
	2650 2400 2650 1050
Wire Notes Line
	2650 1050 4600 1050
Wire Notes Line
	800  2100 800  1300
Wire Notes Line
	800  1300 2250 1300
Wire Notes Line
	2250 1300 2250 2100
Wire Notes Line
	2250 2100 800  2100
Text Notes 10300 5900 0    79   ~ 0
Power
Wire Notes Line
	10950 2750 10950 3300
Wire Notes Line
	10000 3300 10000 2750
Wire Notes Line
	10000 3400 10950 3400
Wire Notes Line
	10950 5600 10000 5600
Wire Notes Line
	10000 5750 10950 5750
Wire Notes Line
	10950 5750 10950 6300
Wire Notes Line
	10950 6300 10000 6300
Wire Notes Line
	10000 6300 10000 5750
Wire Notes Line
	10000 3300 10950 3300
Wire Notes Line
	10000 2750 10950 2750
NoConn ~ 6350 2750
NoConn ~ 6350 2850
NoConn ~ 6350 2950
NoConn ~ 6350 3050
NoConn ~ 6350 3150
NoConn ~ 6350 3250
NoConn ~ 6350 3350
NoConn ~ 6350 3450
NoConn ~ 6350 3550
NoConn ~ 6350 3750
NoConn ~ 6350 3850
NoConn ~ 6350 3950
NoConn ~ 6350 4050
NoConn ~ 6350 4250
NoConn ~ 6350 4450
NoConn ~ 6350 4550
NoConn ~ 6350 4650
NoConn ~ 6350 4750
NoConn ~ 6350 4850
NoConn ~ 6350 4950
NoConn ~ 6350 5050
NoConn ~ 6350 5150
NoConn ~ 6350 5250
NoConn ~ 6350 5350
NoConn ~ 6350 5450
NoConn ~ 6350 5550
NoConn ~ 6350 5850
NoConn ~ 6350 5950
NoConn ~ 8150 5950
NoConn ~ 8150 5850
NoConn ~ 8150 5750
NoConn ~ 8150 5650
NoConn ~ 8150 5550
NoConn ~ 8150 5450
NoConn ~ 8150 5350
NoConn ~ 8150 5250
NoConn ~ 8150 5150
NoConn ~ 8150 5050
NoConn ~ 8150 4250
NoConn ~ 8150 4150
NoConn ~ 8150 4050
NoConn ~ 8150 3950
NoConn ~ 8150 3850
NoConn ~ 8150 3750
NoConn ~ 8150 3650
NoConn ~ 8150 3550
NoConn ~ 8150 3450
NoConn ~ 8150 3350
NoConn ~ 8150 3250
NoConn ~ 8150 3150
NoConn ~ 8150 2550
NoConn ~ 8150 2250
NoConn ~ 8150 2150
NoConn ~ 8150 2050
NoConn ~ 8150 1950
NoConn ~ 8150 1850
NoConn ~ 8150 1550
NoConn ~ 8150 1450
NoConn ~ 8150 1350
Wire Wire Line
	8150 1250 8750 1250
Text Label 8300 1250 0    50   ~ 0
ADC123_IN2
Text HLabel 10600 5500 2    50   Input ~ 0
FB_REF
Wire Wire Line
	10600 5500 10050 5500
Text Label 10050 5500 0    50   ~ 0
ADC123_IN2
Wire Notes Line
	10000 3400 10000 5600
Wire Notes Line
	10950 3400 10950 5600
Wire Wire Line
	5650 3650 6350 3650
Text Notes 4800 3800 0    50   ~ 0
User LED1\n(Blue)
Text Notes 4750 4350 0    50   ~ 0
User LED2\n(Orange)
Text Notes 5250 3850 0    50   ~ 0
3.3V LED, no R required
Text Notes 5250 4700 0    50   ~ 0
2V 20mA LED.\n3.3V - 2V = 1.3V\n1.3V / 20mA = 65 Ohms\nRound up to nearest \nstandard value, 68 Ohms
$Comp
L My_Switch:SW_Push SW1
U 1 1 5ED70186
P 1400 1800
F 0 "SW1" V 1600 2100 50  0000 R CNN
F 1 "SW_Push" V 1300 2200 50  0000 R CNN
F 2 "Switches:1825910-6" H 1400 2000 50  0001 C CNN
F 3 "" H 1400 2000 50  0001 C CNN
	1    1400 1800
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
