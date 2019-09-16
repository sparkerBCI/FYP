EESchema Schematic File Version 4
LIBS:DAQ Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Device:R R?
U 1 1 5D7FB9CF
P 2150 3100
F 0 "R?" V 2050 2950 50  0000 C CNN
F 1 "220k" V 2050 3200 50  0000 C CNN
F 2 "" V 2080 3100 50  0001 C CNN
F 3 "~" H 2150 3100 50  0001 C CNN
	1    2150 3100
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5D7FBAD0
P 3600 5300
F 0 "C?" H 3715 5346 50  0000 L CNN
F 1 "24nF" H 3715 5255 50  0000 L CNN
F 2 "" H 3638 5150 50  0001 C CNN
F 3 "~" H 3600 5300 50  0001 C CNN
	1    3600 5300
	1    0    0    -1  
$EndComp
Text Notes 1250 7450 0    50   ~ 0
RC LPF: f_c = 1 /  (2*pi*R*C)\nR = 220kOhms\nhttps://pdfs.semanticscholar.org/05b6/6348fc1a11726d76eb08ddddabfc4cd36f6.pdf\n\nLowest Sampling Frequency = 250sps, therefore Nyquist Frequency at 125Hz, \nbut this is still very high for EEG. Will LPF at 30Hz\n\n30 = 1/ (2 * pi * 220k * C)\nC = 1/ (2 * pi * 220k*30)\nC = 24.11nF, approx 24nF --> f_c = 30.14Hz
$Comp
L TI_Analog_ADC:ADS1299-8 ADC?
U 1 1 5D7FB8EC
P 5500 2950
F 0 "ADC?" H 6450 2000 50  0000 C CNN
F 1 "ADS1299-8" H 6450 1900 50  0000 C CNN
F 2 "" H 6350 2000 50  0001 C CNN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/ADCs/ADS1299/ads1299-4.pdf" H 6350 2000 50  0001 C CNN
	1    5500 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D81181D
P 3200 5300
F 0 "C?" H 3315 5346 50  0000 L CNN
F 1 "24nF" H 3315 5255 50  0000 L CNN
F 2 "" H 3238 5150 50  0001 C CNN
F 3 "~" H 3200 5300 50  0001 C CNN
	1    3200 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D811868
P 2800 5300
F 0 "C?" H 2915 5346 50  0000 L CNN
F 1 "24nF" H 2915 5255 50  0000 L CNN
F 2 "" H 2838 5150 50  0001 C CNN
F 3 "~" H 2800 5300 50  0001 C CNN
	1    2800 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D81188E
P 2400 5300
F 0 "C?" H 2515 5346 50  0000 L CNN
F 1 "24nF" H 2515 5255 50  0000 L CNN
F 2 "" H 2438 5150 50  0001 C CNN
F 3 "~" H 2400 5300 50  0001 C CNN
	1    2400 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8119B9
P 5200 5300
F 0 "C?" H 5315 5346 50  0000 L CNN
F 1 "24nF" H 5315 5255 50  0000 L CNN
F 2 "" H 5238 5150 50  0001 C CNN
F 3 "~" H 5200 5300 50  0001 C CNN
	1    5200 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8119C0
P 4800 5300
F 0 "C?" H 4915 5346 50  0000 L CNN
F 1 "24nF" H 4915 5255 50  0000 L CNN
F 2 "" H 4838 5150 50  0001 C CNN
F 3 "~" H 4800 5300 50  0001 C CNN
	1    4800 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8119C7
P 4400 5300
F 0 "C?" H 4515 5346 50  0000 L CNN
F 1 "24nF" H 4515 5255 50  0000 L CNN
F 2 "" H 4438 5150 50  0001 C CNN
F 3 "~" H 4400 5300 50  0001 C CNN
	1    4400 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8119CE
P 4000 5300
F 0 "C?" H 4115 5346 50  0000 L CNN
F 1 "24nF" H 4115 5255 50  0000 L CNN
F 2 "" H 4038 5150 50  0001 C CNN
F 3 "~" H 4000 5300 50  0001 C CNN
	1    4000 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5D811AEF
P 2150 3350
F 0 "R?" V 2050 3200 50  0000 C CNN
F 1 "220k" V 2050 3450 50  0000 C CNN
F 2 "" V 2080 3350 50  0001 C CNN
F 3 "~" H 2150 3350 50  0001 C CNN
	1    2150 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D811B0F
P 2150 3600
F 0 "R?" V 2050 3450 50  0000 C CNN
F 1 "220k" V 2050 3700 50  0000 C CNN
F 2 "" V 2080 3600 50  0001 C CNN
F 3 "~" H 2150 3600 50  0001 C CNN
	1    2150 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D811B2C
P 2150 3850
F 0 "R?" V 2050 3700 50  0000 C CNN
F 1 "220k" V 2050 3950 50  0000 C CNN
F 2 "" V 2080 3850 50  0001 C CNN
F 3 "~" H 2150 3850 50  0001 C CNN
	1    2150 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D811B50
P 2150 4100
F 0 "R?" V 2050 3950 50  0000 C CNN
F 1 "220k" V 2050 4200 50  0000 C CNN
F 2 "" V 2080 4100 50  0001 C CNN
F 3 "~" H 2150 4100 50  0001 C CNN
	1    2150 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D811B71
P 2150 4350
F 0 "R?" V 2050 4200 50  0000 C CNN
F 1 "220k" V 2050 4450 50  0000 C CNN
F 2 "" V 2080 4350 50  0001 C CNN
F 3 "~" H 2150 4350 50  0001 C CNN
	1    2150 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D811B9B
P 2150 4600
F 0 "R?" V 2050 4450 50  0000 C CNN
F 1 "220k" V 2050 4700 50  0000 C CNN
F 2 "" V 2080 4600 50  0001 C CNN
F 3 "~" H 2150 4600 50  0001 C CNN
	1    2150 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D811BC4
P 2150 4850
F 0 "R?" V 2050 4700 50  0000 C CNN
F 1 "220k" V 2050 4950 50  0000 C CNN
F 2 "" V 2080 4850 50  0001 C CNN
F 3 "~" H 2150 4850 50  0001 C CNN
	1    2150 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 3100 2400 3100
Wire Wire Line
	2300 3600 3200 3600
Wire Wire Line
	2300 3850 3600 3850
Wire Wire Line
	2300 4100 4000 4100
Wire Wire Line
	2300 4350 4400 4350
Wire Wire Line
	2300 4600 4800 4600
Wire Wire Line
	2300 4850 5200 4850
Wire Wire Line
	2400 5150 2400 3100
Connection ~ 2400 3100
Wire Wire Line
	2400 3100 5400 3100
Wire Wire Line
	2800 5150 2800 3350
Wire Wire Line
	2300 3350 2800 3350
Connection ~ 2800 3350
Wire Wire Line
	2800 3350 5400 3350
Wire Wire Line
	3200 5150 3200 3600
Connection ~ 3200 3600
Wire Wire Line
	3200 3600 5400 3600
Wire Wire Line
	3600 5150 3600 3850
Connection ~ 3600 3850
Wire Wire Line
	3600 3850 5400 3850
Wire Wire Line
	4000 5150 4000 4100
Connection ~ 4000 4100
Wire Wire Line
	4000 4100 5400 4100
Wire Wire Line
	4400 5150 4400 4350
Connection ~ 4400 4350
Wire Wire Line
	4400 4350 5400 4350
Wire Wire Line
	4800 5150 4800 4600
Connection ~ 4800 4600
Wire Wire Line
	4800 4600 5400 4600
Wire Wire Line
	5200 5150 5200 4850
Connection ~ 5200 4850
Wire Wire Line
	5200 4850 5400 4850
$Comp
L Device:R R?
U 1 1 5D812E57
P 2150 5600
F 0 "R?" V 2050 5450 50  0000 C CNN
F 1 "220k" V 2050 5700 50  0000 C CNN
F 2 "" V 2080 5600 50  0001 C CNN
F 3 "~" H 2150 5600 50  0001 C CNN
	1    2150 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 5600 2400 5600
Wire Wire Line
	5900 5600 5900 5200
Wire Wire Line
	5200 5450 5200 5600
Connection ~ 5200 5600
Wire Wire Line
	5200 5600 5900 5600
Wire Wire Line
	4800 5450 4800 5600
Connection ~ 4800 5600
Wire Wire Line
	4800 5600 5200 5600
Wire Wire Line
	4400 5450 4400 5600
Connection ~ 4400 5600
Wire Wire Line
	4400 5600 4800 5600
Wire Wire Line
	4000 5450 4000 5600
Connection ~ 4000 5600
Wire Wire Line
	4000 5600 4400 5600
Wire Wire Line
	3600 5450 3600 5600
Connection ~ 3600 5600
Wire Wire Line
	3600 5600 4000 5600
Wire Wire Line
	3200 5450 3200 5600
Connection ~ 3200 5600
Wire Wire Line
	3200 5600 3600 5600
Wire Wire Line
	2800 5450 2800 5600
Connection ~ 2800 5600
Wire Wire Line
	2800 5600 3200 5600
Wire Wire Line
	2400 5450 2400 5600
Connection ~ 2400 5600
Wire Wire Line
	2400 5600 2800 5600
NoConn ~ 5800 5200
$Comp
L Device:R R?
U 1 1 5D815A64
P 2050 1400
F 0 "R?" H 2120 1446 50  0000 L CNN
F 1 "10k" H 2120 1355 50  0000 L CNN
F 2 "" V 1980 1400 50  0001 C CNN
F 3 "~" H 2050 1400 50  0001 C CNN
	1    2050 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5D815AD7
P 2050 1800
F 0 "R?" H 2120 1846 50  0000 L CNN
F 1 "10k" H 2120 1755 50  0000 L CNN
F 2 "" V 1980 1800 50  0001 C CNN
F 3 "~" H 2050 1800 50  0001 C CNN
	1    2050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1050 1800 1050
Wire Wire Line
	2050 1050 2050 1250
Wire Wire Line
	2050 1550 2050 1600
Wire Wire Line
	2050 1600 2550 1600
Connection ~ 2050 1600
Wire Wire Line
	2050 1600 2050 1650
Wire Wire Line
	2050 1950 2050 2100
Wire Wire Line
	2050 2100 1800 2100
Text Label 1800 1050 0    50   ~ 0
AVDD
Text Label 1800 2100 0    50   ~ 0
AVSS
Text Label 2100 1600 0    50   ~ 0
MID_SUPPLY
Wire Wire Line
	5400 3200 5300 3200
Wire Wire Line
	5300 3200 5300 3450
Wire Wire Line
	5300 4950 5400 4950
Wire Wire Line
	5400 3450 5300 3450
Connection ~ 5300 3450
Wire Wire Line
	5300 3450 5300 3700
Wire Wire Line
	5400 3700 5300 3700
Connection ~ 5300 3700
Wire Wire Line
	5300 3700 5300 3950
Wire Wire Line
	5400 3950 5300 3950
Connection ~ 5300 3950
Wire Wire Line
	5300 3950 5300 4200
Wire Wire Line
	5400 4200 5300 4200
Connection ~ 5300 4200
Wire Wire Line
	5300 4200 5300 4450
Wire Wire Line
	5400 4450 5300 4450
Connection ~ 5300 4450
Wire Wire Line
	5300 4450 5300 4700
Wire Wire Line
	5400 4700 5300 4700
Connection ~ 5300 4700
Wire Wire Line
	5300 4700 5300 4950
Wire Wire Line
	5300 3200 5300 2950
Wire Wire Line
	5300 2950 4550 2950
Connection ~ 5300 3200
Text Label 4650 2950 0    50   ~ 0
MID_SUPPLY
$Comp
L Device:C C?
U 1 1 5D81EEFA
P 5350 6100
F 0 "C?" H 5465 6146 50  0000 L CNN
F 1 "1uF" H 5465 6055 50  0000 L CNN
F 2 "" H 5388 5950 50  0001 C CNN
F 3 "~" H 5350 6100 50  0001 C CNN
	1    5350 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D8200C4
P 6600 6100
F 0 "C?" H 6715 6146 50  0000 L CNN
F 1 "100uF" H 6715 6055 50  0000 L CNN
F 2 "" H 6638 5950 50  0001 C CNN
F 3 "~" H 6600 6100 50  0001 C CNN
	1    6600 6100
	1    0    0    -1  
$EndComp
NoConn ~ 6400 5200
NoConn ~ 6200 5200
Wire Wire Line
	6000 6350 6300 6350
Wire Wire Line
	6600 6350 6600 6250
Connection ~ 6300 6350
Wire Wire Line
	6300 6350 6600 6350
Text Label 6050 6350 0    50   ~ 0
AVSS
Text Notes 5250 6600 0    50   ~ 0
Using internal 4.5V Reference, \nso short VREFN to AVSS
Text Notes 1900 5950 0    50   ~ 0
Referred Montage: All electrodes will be referenced to reference electrode. \nNegative electrode inputs are unused, set to mid-supply. \nMAKE SURE CORRECT REGISTERS ARE SET IN SOFTWARE!
Wire Wire Line
	7350 5450 7000 5450
Wire Wire Line
	7000 5450 7000 5200
$Comp
L Device:R R?
U 1 1 5D82E619
P 6700 5450
F 0 "R?" H 6550 5500 50  0000 L CNN
F 1 "33k" H 6550 5600 50  0000 L CNN
F 2 "" V 6630 5450 50  0001 C CNN
F 3 "~" H 6700 5450 50  0001 C CNN
	1    6700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6900 6700 6900
Wire Wire Line
	6700 5300 6700 5200
Wire Wire Line
	6700 5600 6700 5700
Wire Wire Line
	6700 5700 6800 5700
Wire Wire Line
	6800 5700 6800 5200
Wire Wire Line
	6800 5700 7100 5700
Connection ~ 6800 5700
$Comp
L Device:C C?
U 1 1 5D83AA7F
P 7450 6100
F 0 "C?" H 7565 6146 50  0000 L CNN
F 1 "1uF" H 7565 6055 50  0000 L CNN
F 2 "" H 7488 5950 50  0001 C CNN
F 3 "~" H 7450 6100 50  0001 C CNN
	1    7450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 5600 6900 5600
Wire Wire Line
	6900 5600 6900 5200
Wire Wire Line
	6600 6350 7450 6350
Wire Wire Line
	7450 6350 7450 6250
Connection ~ 6600 6350
Text Label 6900 5700 0    50   ~ 0
DGND
Text Label 7450 4750 0    50   ~ 0
DGND
Wire Wire Line
	7400 4750 7650 4750
Wire Wire Line
	7400 4650 7650 4650
Text Label 7450 4650 0    50   ~ 0
MOSI
Wire Wire Line
	7400 4550 7650 4550
Text Label 7450 4550 0    50   ~ 0
START
NoConn ~ 7400 4450
Wire Wire Line
	7400 4350 7650 4350
Text Label 7450 4350 0    50   ~ 0
~CS
Wire Wire Line
	7400 4250 7650 4250
Text Label 7450 4250 0    50   ~ 0
SCLK
$Comp
L Device:R R?
U 1 1 5D84E32C
P 7850 4150
F 0 "R?" V 7950 4100 50  0000 C CNN
F 1 "33k" V 7950 4300 50  0000 C CNN
F 2 "" V 7780 4150 50  0001 C CNN
F 3 "~" H 7850 4150 50  0001 C CNN
	1    7850 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D85014F
P 8250 4050
F 0 "R?" V 8150 3900 50  0000 C CNN
F 1 "33k" V 8150 4150 50  0000 C CNN
F 2 "" V 8180 4050 50  0001 C CNN
F 3 "~" H 8250 4050 50  0001 C CNN
	1    8250 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 4050 8100 4050
Wire Wire Line
	7700 4150 7400 4150
Wire Wire Line
	8000 4150 8550 4150
Wire Wire Line
	8400 4050 8550 4050
Wire Wire Line
	8550 4050 8550 4150
Connection ~ 8550 4150
Wire Wire Line
	8550 4150 8750 4150
Text Label 8600 4150 0    50   ~ 0
DGND
Wire Wire Line
	7400 3950 7650 3950
Text Label 7450 3950 0    50   ~ 0
MISO
$Comp
L Device:R R?
U 1 1 5D85C47A
P 7850 3850
F 0 "R?" V 7750 3700 50  0000 C CNN
F 1 "33k" V 7750 3950 50  0000 C CNN
F 2 "" V 7780 3850 50  0001 C CNN
F 3 "~" H 7850 3850 50  0001 C CNN
	1    7850 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 3850 7400 3850
Wire Wire Line
	8000 3850 8150 3850
Wire Wire Line
	8550 3850 8550 4050
Connection ~ 8550 4050
Wire Wire Line
	7400 3750 7650 3750
Text Label 7450 3750 0    50   ~ 0
~DRDY
Text Label 7950 3450 0    50   ~ 0
DVDD
Wire Wire Line
	7400 3550 7650 3550
Text Label 7450 3550 0    50   ~ 0
AVSS
Wire Wire Line
	7400 3450 7800 3450
Wire Wire Line
	7800 3450 7800 3650
Wire Wire Line
	7400 3650 7800 3650
NoConn ~ 7400 3350
Wire Wire Line
	7400 3250 7650 3250
Text Label 7450 3250 0    50   ~ 0
DGND
$Comp
L Device:C C?
U 1 1 5D872129
P 6700 2550
F 0 "C?" H 6815 2596 50  0000 L CNN
F 1 "1uF" H 6815 2505 50  0000 L CNN
F 2 "" H 6738 2400 50  0001 C CNN
F 3 "~" H 6700 2550 50  0001 C CNN
	1    6700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2850 6700 2750
Wire Wire Line
	6800 2850 6800 2350
Wire Wire Line
	6800 2350 6700 2350
Wire Wire Line
	6700 2350 6700 2400
Wire Wire Line
	6500 5200 6500 6900
Wire Wire Line
	6600 5200 6600 5950
Wire Wire Line
	7450 5600 7450 5950
$Comp
L Device:C C?
U 1 1 5D89A66B
P 6600 2100
F 0 "C?" H 6715 2146 50  0000 L CNN
F 1 "0.1uF" H 6715 2055 50  0000 L CNN
F 2 "" H 6638 1950 50  0001 C CNN
F 3 "~" H 6600 2100 50  0001 C CNN
	1    6600 2100
	1    0    0    -1  
$EndComp
Text Label 6750 1150 0    50   ~ 0
AVSS
Connection ~ 6800 2350
$Comp
L Device:C C?
U 1 1 5D8A758B
P 6500 1350
F 0 "C?" H 6615 1396 50  0000 L CNN
F 1 "1uF" H 6615 1305 50  0000 L CNN
F 2 "" H 6538 1200 50  0001 C CNN
F 3 "~" H 6500 1350 50  0001 C CNN
	1    6500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1200 6500 1150
Wire Wire Line
	6500 1500 6500 1850
Wire Wire Line
	6500 1850 6200 1850
Connection ~ 6500 1850
Wire Wire Line
	6500 1850 6500 2850
Text Label 6200 1850 0    50   ~ 0
AVDD
$Comp
L Device:C C?
U 1 1 5D8B872A
P 5900 2550
F 0 "C?" H 5700 2600 50  0000 L CNN
F 1 "1uF" H 5650 2450 50  0000 L CNN
F 2 "" H 5938 2400 50  0001 C CNN
F 3 "~" H 5900 2550 50  0001 C CNN
	1    5900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2850 5900 2700
Wire Wire Line
	6000 2850 6000 2400
Wire Wire Line
	6000 2400 5900 2400
Text Label 5900 2400 0    50   ~ 0
AVDD
Wire Wire Line
	6700 2750 7100 2750
Connection ~ 6700 2750
Wire Wire Line
	6700 2750 6700 2700
Text Label 6900 2750 0    50   ~ 0
AVDD
$Comp
L Device:C C?
U 1 1 5D8D0422
P 8550 3600
F 0 "C?" H 8665 3646 50  0000 L CNN
F 1 "1uF" H 8665 3555 50  0000 L CNN
F 2 "" H 8588 3450 50  0001 C CNN
F 3 "~" H 8550 3600 50  0001 C CNN
	1    8550 3600
	1    0    0    -1  
$EndComp
Connection ~ 7800 3450
Wire Wire Line
	8550 3750 8550 3850
Connection ~ 8550 3850
Wire Wire Line
	7800 3450 8150 3450
$Comp
L Device:C C?
U 1 1 5D8E172D
P 8150 3600
F 0 "C?" H 8265 3646 50  0000 L CNN
F 1 "0.1uF" H 8200 3500 50  0000 L CNN
F 2 "" H 8188 3450 50  0001 C CNN
F 3 "~" H 8150 3600 50  0001 C CNN
	1    8150 3600
	1    0    0    -1  
$EndComp
Connection ~ 8150 3450
Wire Wire Line
	8150 3450 8550 3450
Wire Wire Line
	8150 3750 8150 3850
Connection ~ 8150 3850
Wire Wire Line
	8150 3850 8550 3850
$Comp
L Device:C C?
U 1 1 5D8EF63E
P 5900 5850
F 0 "C?" H 5700 5850 50  0000 L CNN
F 1 "0.1uF" H 5650 5750 50  0000 L CNN
F 2 "" H 5938 5700 50  0001 C CNN
F 3 "~" H 5900 5850 50  0001 C CNN
	1    5900 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D88301A
P 6100 5850
F 0 "C?" H 6215 5896 50  0000 L CNN
F 1 "1uF" H 6215 5805 50  0000 L CNN
F 2 "" H 6138 5700 50  0001 C CNN
F 3 "~" H 6100 5850 50  0001 C CNN
	1    6100 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 5200 6300 6350
Wire Wire Line
	5900 5700 6100 5700
Wire Wire Line
	6100 5200 6100 5700
Connection ~ 6100 5700
Wire Wire Line
	5900 6000 6000 6000
Wire Wire Line
	6000 6000 6000 6350
Connection ~ 6000 6000
Wire Wire Line
	6000 6000 6100 6000
Wire Wire Line
	6000 6350 5350 6350
Wire Wire Line
	5350 6350 5350 6250
Connection ~ 6000 6350
Wire Wire Line
	5350 5950 5350 5650
Wire Wire Line
	5350 5650 6000 5650
Wire Wire Line
	6000 5650 6000 5200
Wire Wire Line
	6600 1850 6600 1950
$Comp
L Device:C C?
U 1 1 5D923B6D
P 7050 2100
F 0 "C?" H 7165 2146 50  0000 L CNN
F 1 "1uF" H 7165 2055 50  0000 L CNN
F 2 "" H 7088 1950 50  0001 C CNN
F 3 "~" H 7050 2100 50  0001 C CNN
	1    7050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2250 6600 2850
Wire Wire Line
	7050 2250 6600 2250
Connection ~ 6600 2250
Wire Wire Line
	7050 1950 7050 1850
Wire Wire Line
	7050 1850 6850 1850
Wire Wire Line
	6800 2350 7350 2350
Wire Wire Line
	7350 1150 7350 2350
Wire Wire Line
	6500 1150 6850 1150
Wire Wire Line
	6850 1850 6850 1150
Connection ~ 6850 1850
Wire Wire Line
	6850 1850 6600 1850
Connection ~ 6850 1150
Wire Wire Line
	6850 1150 7350 1150
$Comp
L Device:C C?
U 1 1 5D960CBD
P 5950 1350
F 0 "C?" H 6065 1396 50  0000 L CNN
F 1 "0.1uF" H 6065 1305 50  0000 L CNN
F 2 "" H 5988 1200 50  0001 C CNN
F 3 "~" H 5950 1350 50  0001 C CNN
	1    5950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1500 6500 1500
Connection ~ 6500 1500
Wire Wire Line
	5950 1200 5950 1150
Wire Wire Line
	5950 1150 6500 1150
Connection ~ 6500 1150
NoConn ~ 6200 2850
NoConn ~ 6100 2850
NoConn ~ 6300 2850
Wire Wire Line
	6400 2850 6400 2700
Wire Wire Line
	6400 2700 6100 2700
Text Label 6150 2700 0    50   ~ 0
AVSS
Text Notes 5200 2200 0    50   ~ 0
Right Leg Drive Bias \nnot used under instruction \nfrom Psychology Department
Text Notes 7950 4550 0    50   ~ 0
All GPIO Pins pulled to GND, unused
Text Notes 1250 800  0    79   ~ 0
Mid-Supply Voltage Divider
Wire Notes Line
	1250 650  2950 650 
Wire Notes Line
	2950 650  2950 2250
Wire Notes Line
	2950 2250 1250 2250
Wire Notes Line
	1250 2250 1250 650 
Text Label 7100 5450 0    50   ~ 0
~RESET
Text Label 6550 6900 0    50   ~ 0
~PWDN
Text Notes 9600 2700 0    79   ~ 0
Control and Data Lines
Text Notes 5100 850  0    98   ~ 20
ADS1299-8 and Support Circuitry
Text HLabel 10500 2850 2    50   Input ~ 0
MOSI
Text HLabel 10500 2950 2    50   Input ~ 0
MISO
Text HLabel 10500 3050 2    50   Input ~ 0
SCLK
Text HLabel 10500 3150 2    50   Input ~ 0
~CS
Text HLabel 10500 3350 2    50   Input ~ 0
START
Text HLabel 10500 3450 2    50   Input ~ 0
~DRDY
Wire Wire Line
	10500 2850 9850 2850
Wire Wire Line
	10500 2950 9850 2950
Wire Wire Line
	10500 3050 9850 3050
Wire Wire Line
	10500 3150 9850 3150
Wire Wire Line
	10500 3350 9850 3350
Wire Wire Line
	10500 3450 9850 3450
Text Label 9900 2850 0    50   ~ 0
MOSI
Text Label 9900 2950 0    50   ~ 0
MISO
Text Label 9900 3050 0    50   ~ 0
SCLK
Text Label 9900 3150 0    50   ~ 0
~CS
Text Label 9900 3350 0    50   ~ 0
START
Text Label 9900 3450 0    50   ~ 0
~DRDY
Wire Notes Line
	9550 2550 11050 2550
Wire Notes Line
	11050 3750 9550 3750
Text HLabel 10550 4400 2    50   Input ~ 0
AVDD
Text HLabel 10550 4500 2    50   Input ~ 0
AVSS
Text HLabel 10550 4600 2    50   Input ~ 0
DVDD
Text HLabel 10550 4700 2    50   Input ~ 0
DGND
Wire Wire Line
	10550 4400 9900 4400
Wire Wire Line
	10550 4500 9900 4500
Wire Wire Line
	10550 4600 9900 4600
Wire Wire Line
	10550 4700 9900 4700
Text HLabel 10500 3550 2    50   Input ~ 0
~PWDN
Text HLabel 10500 3650 2    50   Input ~ 0
~RESET
Wire Wire Line
	10500 3550 9850 3550
Wire Wire Line
	10500 3650 9850 3650
Text Label 9900 3550 0    50   ~ 0
~PWDN
Text Label 9900 3650 0    50   ~ 0
~RESET
Wire Notes Line
	9550 2550 9550 3750
Wire Notes Line
	11050 2550 11050 3750
Text Notes 9750 4050 0    79   ~ 0
Power Connections
Wire Notes Line
	9550 3900 11050 3900
Wire Notes Line
	11050 5100 9550 5100
Wire Notes Line
	9550 3900 9550 5100
Wire Notes Line
	11050 3900 11050 5100
$Comp
L Connector_Generic:Conn_02x09_Counter_Clockwise J?
U 1 1 5DA7B8FB
P 1200 3500
F 0 "J?" H 1250 4117 50  0000 C CNN
F 1 "Header" H 1250 4026 50  0000 C CNN
F 2 "" H 1200 3500 50  0001 C CNN
F 3 "~" H 1200 3500 50  0001 C CNN
	1    1200 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3100 2000 3100
Wire Wire Line
	1500 3200 1900 3200
Wire Wire Line
	1900 3200 1900 3350
Wire Wire Line
	1900 3350 2000 3350
Wire Wire Line
	1500 3300 1850 3300
Wire Wire Line
	1850 3300 1850 3600
Wire Wire Line
	1850 3600 2000 3600
Wire Wire Line
	1500 3400 1800 3400
Wire Wire Line
	1800 3400 1800 3850
Wire Wire Line
	1800 3850 2000 3850
Wire Wire Line
	1500 3500 1750 3500
Wire Wire Line
	1750 3500 1750 4100
Wire Wire Line
	1750 4100 2000 4100
Wire Wire Line
	1500 3600 1700 3600
Wire Wire Line
	1700 3600 1700 4350
Wire Wire Line
	1700 4350 2000 4350
Wire Wire Line
	1500 3700 1650 3700
Wire Wire Line
	1650 3700 1650 4600
Wire Wire Line
	1650 4600 2000 4600
Wire Wire Line
	1500 3800 1600 3800
Wire Wire Line
	1600 3800 1600 4850
Wire Wire Line
	1600 4850 2000 4850
Wire Wire Line
	1500 3900 1500 5600
Wire Wire Line
	1500 5600 2000 5600
Wire Wire Line
	1000 3900 1000 3800
Wire Wire Line
	1000 3100 650  3100
Connection ~ 1000 3100
Connection ~ 1000 3200
Wire Wire Line
	1000 3200 1000 3100
Connection ~ 1000 3300
Wire Wire Line
	1000 3300 1000 3200
Connection ~ 1000 3400
Wire Wire Line
	1000 3400 1000 3300
Connection ~ 1000 3500
Wire Wire Line
	1000 3500 1000 3400
Connection ~ 1000 3600
Wire Wire Line
	1000 3600 1000 3500
Connection ~ 1000 3700
Wire Wire Line
	1000 3700 1000 3600
Connection ~ 1000 3800
Wire Wire Line
	1000 3800 1000 3700
Text Label 650  3100 0    50   ~ 0
AVDD
Text Notes 800  4300 0    50   ~ 0
Jump unused\nanalog inputs\ndirectly to\nAVDD
$EndSCHEMATC
