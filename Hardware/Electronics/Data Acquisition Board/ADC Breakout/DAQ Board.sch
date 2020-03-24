EESchema Schematic File Version 4
LIBS:DAQ Board-cache
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
L Device:R R?
U 1 1 5E8AA8A4
P 2850 3100
AR Path="/5D7F9BD3/5E8AA8A4" Ref="R?"  Part="1" 
AR Path="/5E8AA8A4" Ref="R3"  Part="1" 
F 0 "R3" V 2750 2950 50  0000 C CNN
F 1 "220k" V 2750 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 3100 50  0001 C CNN
F 3 "~" H 2850 3100 50  0001 C CNN
	1    2850 3100
	0    1    1    0   
$EndComp
Text Notes 3150 7100 0    50   ~ 0
RC LPF: f_c = 1 /  (2*pi*R*C)\nR = 220kOhms\nhttps://pdfs.semanticscholar.org/05b6/6348fc1a11726d76eb08ddddabfc4cd36f6.pdf\n\nLowest Sampling Frequency = 250sps, therefore Nyquist Frequency at 125Hz, \nbut this is still very high for EEG. Will LPF at 30Hz\n\n30 = 1/ (2 * pi * 220k * C)\nC = 1/ (2 * pi * 220k*30)\nC = 24.11nF, approx 24nF --> f_c = 30.14Hz
$Comp
L TI_Analog_ADC:ADS1299-8 ADC?
U 1 1 5E8AA8AC
P 6200 2950
AR Path="/5D7F9BD3/5E8AA8AC" Ref="ADC?"  Part="1" 
AR Path="/5E8AA8AC" Ref="ADC1"  Part="1" 
F 0 "ADC1" H 7150 2000 50  0000 C CNN
F 1 "ADS1299-8" H 7150 1900 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_10x10mm_P0.5mm" H 7050 2000 50  0001 C CNN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/ADCs/ADS1299/ads1299-4.pdf" H 7050 2000 50  0001 C CNN
	1    6200 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AA8B3
P 3100 5300
AR Path="/5D7F9BD3/5E8AA8B3" Ref="C?"  Part="1" 
AR Path="/5E8AA8B3" Ref="C9"  Part="1" 
F 0 "C9" H 3215 5346 50  0000 L CNN
F 1 "24nF" H 3215 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3138 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3100 5300 50  0001 C CNN
	1    3100 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8BA
P 2850 3350
AR Path="/5D7F9BD3/5E8AA8BA" Ref="R?"  Part="1" 
AR Path="/5E8AA8BA" Ref="R4"  Part="1" 
F 0 "R4" V 2750 3200 50  0000 C CNN
F 1 "220k" V 2750 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 3350 50  0001 C CNN
F 3 "~" H 2850 3350 50  0001 C CNN
	1    2850 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8C1
P 2850 3600
AR Path="/5D7F9BD3/5E8AA8C1" Ref="R?"  Part="1" 
AR Path="/5E8AA8C1" Ref="R5"  Part="1" 
F 0 "R5" V 2750 3450 50  0000 C CNN
F 1 "220k" V 2750 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 3600 50  0001 C CNN
F 3 "~" H 2850 3600 50  0001 C CNN
	1    2850 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8C8
P 2850 3850
AR Path="/5D7F9BD3/5E8AA8C8" Ref="R?"  Part="1" 
AR Path="/5E8AA8C8" Ref="R6"  Part="1" 
F 0 "R6" V 2750 3700 50  0000 C CNN
F 1 "220k" V 2750 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 3850 50  0001 C CNN
F 3 "~" H 2850 3850 50  0001 C CNN
	1    2850 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8CF
P 2850 4100
AR Path="/5D7F9BD3/5E8AA8CF" Ref="R?"  Part="1" 
AR Path="/5E8AA8CF" Ref="R7"  Part="1" 
F 0 "R7" V 2750 3950 50  0000 C CNN
F 1 "220k" V 2750 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 4100 50  0001 C CNN
F 3 "~" H 2850 4100 50  0001 C CNN
	1    2850 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8D6
P 2850 4350
AR Path="/5D7F9BD3/5E8AA8D6" Ref="R?"  Part="1" 
AR Path="/5E8AA8D6" Ref="R8"  Part="1" 
F 0 "R8" V 2750 4200 50  0000 C CNN
F 1 "220k" V 2750 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 4350 50  0001 C CNN
F 3 "~" H 2850 4350 50  0001 C CNN
	1    2850 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8DD
P 2850 4600
AR Path="/5D7F9BD3/5E8AA8DD" Ref="R?"  Part="1" 
AR Path="/5E8AA8DD" Ref="R9"  Part="1" 
F 0 "R9" V 2750 4450 50  0000 C CNN
F 1 "220k" V 2750 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 4600 50  0001 C CNN
F 3 "~" H 2850 4600 50  0001 C CNN
	1    2850 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA8E4
P 2850 4850
AR Path="/5D7F9BD3/5E8AA8E4" Ref="R?"  Part="1" 
AR Path="/5E8AA8E4" Ref="R10"  Part="1" 
F 0 "R10" V 2750 4700 50  0000 C CNN
F 1 "220k" V 2750 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 4850 50  0001 C CNN
F 3 "~" H 2850 4850 50  0001 C CNN
	1    2850 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 3100 3100 3100
Wire Wire Line
	3000 3600 3900 3600
Wire Wire Line
	3000 3850 4300 3850
Wire Wire Line
	3000 4100 4700 4100
Wire Wire Line
	3000 4350 5100 4350
Wire Wire Line
	3000 4600 5500 4600
Wire Wire Line
	3000 4850 5900 4850
Wire Wire Line
	3100 5150 3100 3100
Connection ~ 3100 3100
Wire Wire Line
	3100 3100 6100 3100
Wire Wire Line
	3500 5150 3500 3350
Wire Wire Line
	3000 3350 3500 3350
Connection ~ 3500 3350
Wire Wire Line
	3500 3350 6100 3350
Wire Wire Line
	3900 5150 3900 3600
Connection ~ 3900 3600
Wire Wire Line
	3900 3600 6100 3600
Wire Wire Line
	4300 5150 4300 3850
Connection ~ 4300 3850
Wire Wire Line
	4300 3850 6100 3850
Wire Wire Line
	4700 5150 4700 4100
Connection ~ 4700 4100
Wire Wire Line
	4700 4100 6100 4100
Wire Wire Line
	5100 5150 5100 4350
Connection ~ 5100 4350
Wire Wire Line
	5100 4350 6100 4350
Wire Wire Line
	5500 5150 5500 4600
Connection ~ 5500 4600
Wire Wire Line
	5500 4600 6100 4600
Wire Wire Line
	5900 5150 5900 4850
Connection ~ 5900 4850
Wire Wire Line
	5900 4850 6100 4850
$Comp
L Device:R R?
U 1 1 5E8AA90B
P 2850 5600
AR Path="/5D7F9BD3/5E8AA90B" Ref="R?"  Part="1" 
AR Path="/5E8AA90B" Ref="R11"  Part="1" 
F 0 "R11" V 2750 5450 50  0000 C CNN
F 1 "220k" V 2750 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2780 5600 50  0001 C CNN
F 3 "~" H 2850 5600 50  0001 C CNN
	1    2850 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 5600 3100 5600
Wire Wire Line
	6600 5600 6600 5200
Wire Wire Line
	3100 5450 3100 5600
Connection ~ 3100 5600
NoConn ~ 6500 5200
Wire Wire Line
	6100 3200 6000 3200
Wire Wire Line
	6000 3200 6000 3450
Wire Wire Line
	6000 4950 6100 4950
Wire Wire Line
	6100 3450 6000 3450
Connection ~ 6000 3450
Wire Wire Line
	6000 3450 6000 3700
Wire Wire Line
	6100 3700 6000 3700
Connection ~ 6000 3700
Wire Wire Line
	6000 3700 6000 3950
Wire Wire Line
	6100 3950 6000 3950
Connection ~ 6000 3950
Wire Wire Line
	6000 3950 6000 4200
Wire Wire Line
	6100 4200 6000 4200
Connection ~ 6000 4200
Wire Wire Line
	6000 4200 6000 4450
Wire Wire Line
	6100 4450 6000 4450
Connection ~ 6000 4450
Wire Wire Line
	6000 4450 6000 4700
Wire Wire Line
	6100 4700 6000 4700
Connection ~ 6000 4700
Wire Wire Line
	6000 4700 6000 4950
Wire Wire Line
	6000 3200 6000 2950
Wire Wire Line
	6000 2950 5250 2950
Connection ~ 6000 3200
$Comp
L Device:C C?
U 1 1 5E8AA949
P 6050 6100
AR Path="/5D7F9BD3/5E8AA949" Ref="C?"  Part="1" 
AR Path="/5E8AA949" Ref="C25"  Part="1" 
F 0 "C25" H 6165 6146 50  0000 L CNN
F 1 "1uF" H 6165 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6088 5950 50  0001 C CNN
F 3 "~" H 6050 6100 50  0001 C CNN
	1    6050 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AA950
P 7300 6100
AR Path="/5D7F9BD3/5E8AA950" Ref="C?"  Part="1" 
AR Path="/5E8AA950" Ref="C31"  Part="1" 
F 0 "C31" H 7415 6146 50  0000 L CNN
F 1 "100uF" H 7415 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7338 5950 50  0001 C CNN
F 3 "~" H 7300 6100 50  0001 C CNN
	1    7300 6100
	1    0    0    -1  
$EndComp
NoConn ~ 7100 5200
NoConn ~ 6900 5200
Wire Wire Line
	7300 6350 7300 6250
Text Label 6750 6350 0    50   ~ 0
AVSS
Text Notes 6650 6500 0    50   ~ 0
Using internal 4.5V Reference, \nso short VREFN to AVSS
Text Notes 3150 5900 0    50   ~ 0
Referred Montage: All electrodes will be referenced to reference electrode. \nNegative electrode inputs are unused, set to mid-supply. \nMAKE SURE CORRECT REGISTERS ARE SET IN SOFTWARE!
Wire Wire Line
	8050 5450 7700 5450
Wire Wire Line
	7700 5450 7700 5200
$Comp
L Device:R R?
U 1 1 5E8AA95F
P 7400 5450
AR Path="/5D7F9BD3/5E8AA95F" Ref="R?"  Part="1" 
AR Path="/5E8AA95F" Ref="R13"  Part="1" 
F 0 "R13" H 7250 5500 50  0000 L CNN
F 1 "33k" H 7250 5600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7330 5450 50  0001 C CNN
F 3 "~" H 7400 5450 50  0001 C CNN
	1    7400 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 6900 7400 6900
Wire Wire Line
	7400 5300 7400 5200
Wire Wire Line
	7400 5600 7400 5700
Wire Wire Line
	7400 5700 7500 5700
Wire Wire Line
	7500 5700 7500 5200
Wire Wire Line
	7500 5700 7800 5700
Connection ~ 7500 5700
$Comp
L Device:C C?
U 1 1 5E8AA96D
P 8150 6100
AR Path="/5D7F9BD3/5E8AA96D" Ref="C?"  Part="1" 
AR Path="/5E8AA96D" Ref="C34"  Part="1" 
F 0 "C34" H 8265 6146 50  0000 L CNN
F 1 "1uF" H 8265 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8188 5950 50  0001 C CNN
F 3 "~" H 8150 6100 50  0001 C CNN
	1    8150 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5600 7600 5600
Wire Wire Line
	7600 5600 7600 5200
Wire Wire Line
	7300 6350 8150 6350
Wire Wire Line
	8150 6350 8150 6250
Connection ~ 7300 6350
Text Label 7600 5700 0    50   ~ 0
DGND
Text Label 8150 4750 0    50   ~ 0
DGND
Wire Wire Line
	8100 4750 8350 4750
Wire Wire Line
	8100 4650 8350 4650
Text Label 8150 4650 0    50   ~ 0
MOSI
Wire Wire Line
	8100 4550 8350 4550
Text Label 8150 4550 0    50   ~ 0
START
Text Label 8150 4350 0    50   ~ 0
~CS
Wire Wire Line
	8100 4250 8350 4250
Text Label 8150 4250 0    50   ~ 0
SCLK
$Comp
L Device:R R?
U 1 1 5E8AA984
P 8550 4150
AR Path="/5D7F9BD3/5E8AA984" Ref="R?"  Part="1" 
AR Path="/5E8AA984" Ref="R15"  Part="1" 
F 0 "R15" V 8650 4100 50  0000 C CNN
F 1 "33k" V 8650 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8480 4150 50  0001 C CNN
F 3 "~" H 8550 4150 50  0001 C CNN
	1    8550 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E8AA98B
P 8950 4050
AR Path="/5D7F9BD3/5E8AA98B" Ref="R?"  Part="1" 
AR Path="/5E8AA98B" Ref="R17"  Part="1" 
F 0 "R17" V 8850 3900 50  0000 C CNN
F 1 "33k" V 8850 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8880 4050 50  0001 C CNN
F 3 "~" H 8950 4050 50  0001 C CNN
	1    8950 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 4050 8800 4050
Wire Wire Line
	8400 4150 8100 4150
Wire Wire Line
	8700 4150 9250 4150
Wire Wire Line
	9100 4050 9250 4050
Wire Wire Line
	9250 4050 9250 4150
Connection ~ 9250 4150
Wire Wire Line
	9250 4150 9450 4150
Text Label 9300 4150 0    50   ~ 0
DGND
Wire Wire Line
	8100 3950 8350 3950
Text Label 8150 3950 0    50   ~ 0
MISO
$Comp
L Device:R R?
U 1 1 5E8AA99C
P 8550 3850
AR Path="/5D7F9BD3/5E8AA99C" Ref="R?"  Part="1" 
AR Path="/5E8AA99C" Ref="R14"  Part="1" 
F 0 "R14" V 8450 3700 50  0000 C CNN
F 1 "33k" V 8450 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8480 3850 50  0001 C CNN
F 3 "~" H 8550 3850 50  0001 C CNN
	1    8550 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 3850 8100 3850
Wire Wire Line
	8700 3850 8850 3850
Wire Wire Line
	9250 3850 9250 4050
Connection ~ 9250 4050
Wire Wire Line
	8100 3750 8350 3750
Text Label 8150 3750 0    50   ~ 0
~DRDY
Text Label 8650 3450 0    50   ~ 0
DVDD
Wire Wire Line
	8100 3550 8350 3550
Text Label 8150 3550 0    50   ~ 0
AVSS
Wire Wire Line
	8100 3450 8500 3450
Wire Wire Line
	8500 3450 8500 3650
Wire Wire Line
	8100 3650 8500 3650
NoConn ~ 8100 3350
Wire Wire Line
	8100 3250 8350 3250
Text Label 8150 3250 0    50   ~ 0
DGND
$Comp
L Device:C C?
U 1 1 5E8AA9B2
P 7400 2550
AR Path="/5D7F9BD3/5E8AA9B2" Ref="C?"  Part="1" 
AR Path="/5E8AA9B2" Ref="C32"  Part="1" 
F 0 "C32" H 7515 2596 50  0000 L CNN
F 1 "1uF" H 7515 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7438 2400 50  0001 C CNN
F 3 "~" H 7400 2550 50  0001 C CNN
	1    7400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2850 7400 2750
Wire Wire Line
	7500 2850 7500 2350
Wire Wire Line
	7500 2350 7400 2350
Wire Wire Line
	7400 2350 7400 2400
Wire Wire Line
	7200 5200 7200 6900
Wire Wire Line
	7300 5200 7300 5950
Wire Wire Line
	8150 5600 8150 5950
$Comp
L Device:C C?
U 1 1 5E8AA9C0
P 7300 2100
AR Path="/5D7F9BD3/5E8AA9C0" Ref="C?"  Part="1" 
AR Path="/5E8AA9C0" Ref="C30"  Part="1" 
F 0 "C30" H 7415 2146 50  0000 L CNN
F 1 "0.1uF" H 7415 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7338 1950 50  0001 C CNN
F 3 "~" H 7300 2100 50  0001 C CNN
	1    7300 2100
	1    0    0    -1  
$EndComp
Text Label 7450 1150 0    50   ~ 0
AVSS
Connection ~ 7500 2350
$Comp
L Device:C C?
U 1 1 5E8AA9C9
P 7200 1350
AR Path="/5D7F9BD3/5E8AA9C9" Ref="C?"  Part="1" 
AR Path="/5E8AA9C9" Ref="C29"  Part="1" 
F 0 "C29" H 7315 1396 50  0000 L CNN
F 1 "1uF" H 7315 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 1200 50  0001 C CNN
F 3 "~" H 7200 1350 50  0001 C CNN
	1    7200 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1200 7200 1150
Wire Wire Line
	7200 1500 7200 1850
Wire Wire Line
	7200 1850 6900 1850
Connection ~ 7200 1850
Wire Wire Line
	7200 1850 7200 2850
Text Label 6900 1850 0    50   ~ 0
AVDD
$Comp
L Device:C C?
U 1 1 5E8AA9D6
P 6600 2550
AR Path="/5D7F9BD3/5E8AA9D6" Ref="C?"  Part="1" 
AR Path="/5E8AA9D6" Ref="C26"  Part="1" 
F 0 "C26" H 6400 2600 50  0000 L CNN
F 1 "1uF" H 6350 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 2400 50  0001 C CNN
F 3 "~" H 6600 2550 50  0001 C CNN
	1    6600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2850 6600 2800
Wire Wire Line
	6700 2850 6700 2400
Wire Wire Line
	6700 2400 6600 2400
Text Label 6600 2400 0    50   ~ 0
AVDD
Wire Wire Line
	7400 2750 7800 2750
Connection ~ 7400 2750
Wire Wire Line
	7400 2750 7400 2700
Text Label 7600 2750 0    50   ~ 0
AVDD
$Comp
L Device:C C?
U 1 1 5E8AA9E5
P 9250 3600
AR Path="/5D7F9BD3/5E8AA9E5" Ref="C?"  Part="1" 
AR Path="/5E8AA9E5" Ref="C36"  Part="1" 
F 0 "C36" H 9365 3646 50  0000 L CNN
F 1 "1uF" H 9365 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9288 3450 50  0001 C CNN
F 3 "~" H 9250 3600 50  0001 C CNN
	1    9250 3600
	1    0    0    -1  
$EndComp
Connection ~ 8500 3450
Wire Wire Line
	9250 3750 9250 3850
Connection ~ 9250 3850
Wire Wire Line
	8500 3450 8850 3450
$Comp
L Device:C C?
U 1 1 5E8AA9F0
P 8850 3600
AR Path="/5D7F9BD3/5E8AA9F0" Ref="C?"  Part="1" 
AR Path="/5E8AA9F0" Ref="C35"  Part="1" 
F 0 "C35" H 8965 3646 50  0000 L CNN
F 1 "0.1uF" H 8900 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8888 3450 50  0001 C CNN
F 3 "~" H 8850 3600 50  0001 C CNN
	1    8850 3600
	1    0    0    -1  
$EndComp
Connection ~ 8850 3450
Wire Wire Line
	8850 3450 9250 3450
Wire Wire Line
	8850 3750 8850 3850
Connection ~ 8850 3850
Wire Wire Line
	8850 3850 9250 3850
Wire Wire Line
	6050 6350 6050 6250
Wire Wire Line
	6050 5950 6050 5650
Wire Wire Line
	6050 5650 6700 5650
Wire Wire Line
	6700 5650 6700 5200
Wire Wire Line
	7300 1850 7300 1950
$Comp
L Device:C C?
U 1 1 5E8AAA01
P 7750 2100
AR Path="/5D7F9BD3/5E8AAA01" Ref="C?"  Part="1" 
AR Path="/5E8AAA01" Ref="C33"  Part="1" 
F 0 "C33" H 7865 2146 50  0000 L CNN
F 1 "1uF" H 7865 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7788 1950 50  0001 C CNN
F 3 "~" H 7750 2100 50  0001 C CNN
	1    7750 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2250 7300 2850
Wire Wire Line
	7750 2250 7300 2250
Connection ~ 7300 2250
Wire Wire Line
	7750 1950 7750 1850
Wire Wire Line
	7750 1850 7550 1850
Wire Wire Line
	7500 2350 8050 2350
Wire Wire Line
	8050 1150 8050 2350
Wire Wire Line
	7200 1150 7550 1150
Wire Wire Line
	7550 1850 7550 1150
Connection ~ 7550 1850
Wire Wire Line
	7550 1850 7300 1850
Connection ~ 7550 1150
Wire Wire Line
	7550 1150 8050 1150
$Comp
L Device:C C?
U 1 1 5E8AAA15
P 6650 1350
AR Path="/5D7F9BD3/5E8AAA15" Ref="C?"  Part="1" 
AR Path="/5E8AAA15" Ref="C27"  Part="1" 
F 0 "C27" H 6765 1396 50  0000 L CNN
F 1 "0.1uF" H 6765 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6688 1200 50  0001 C CNN
F 3 "~" H 6650 1350 50  0001 C CNN
	1    6650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1500 7200 1500
Connection ~ 7200 1500
Wire Wire Line
	6650 1200 6650 1150
Wire Wire Line
	6650 1150 7200 1150
Connection ~ 7200 1150
NoConn ~ 6900 2850
NoConn ~ 6800 2850
NoConn ~ 7000 2850
Wire Wire Line
	7100 2850 7100 2700
Text Label 6900 2700 0    50   ~ 0
AVSS
Text Notes 6500 2300 0    50   ~ 0
Right Leg Drive \nBias not used \nunder instruction \nfrom Psychology \nDepartment
Text Notes 8050 4950 0    50   ~ 0
All GPIO Pins pulled to GND, unused
Text Label 7800 5450 0    50   ~ 0
~RESET
Text Label 7250 6900 0    50   ~ 0
~PWDN
Text Notes 9700 2700 0    79   ~ 0
Control and Data Lines
Text Notes 8350 700  0    98   ~ 20
ADS1299-8 and Support Circuitry
Text HLabel 10600 2850 2    50   Input ~ 0
MOSI
Text HLabel 10600 2950 2    50   Input ~ 0
MISO
Text HLabel 10600 3050 2    50   Input ~ 0
SCLK
Text HLabel 10600 3150 2    50   Input ~ 0
~CS
Text HLabel 10600 3350 2    50   Input ~ 0
START
Text HLabel 10600 3450 2    50   Input ~ 0
~DRDY
Wire Wire Line
	10600 2850 9950 2850
Wire Wire Line
	10600 2950 9950 2950
Wire Wire Line
	10600 3050 9950 3050
Wire Wire Line
	10600 3150 9950 3150
Wire Wire Line
	10600 3350 9950 3350
Wire Wire Line
	10600 3450 9950 3450
Text Label 10000 2850 0    50   ~ 0
MOSI
Text Label 10000 2950 0    50   ~ 0
MISO
Text Label 10000 3050 0    50   ~ 0
SCLK
Text Label 10000 3150 0    50   ~ 0
~CS
Text Label 10000 3350 0    50   ~ 0
START
Text Label 10000 3450 0    50   ~ 0
~DRDY
Wire Notes Line
	9650 2550 11150 2550
Wire Notes Line
	11150 3750 9650 3750
Text HLabel 10650 4400 2    50   Input ~ 0
VIN
Text HLabel 10650 4500 2    50   Input ~ 0
AVSS
Text HLabel 10650 4600 2    50   Input ~ 0
DGND
Wire Wire Line
	10650 4400 10000 4400
Wire Wire Line
	10650 4500 10000 4500
Wire Wire Line
	10650 4600 10000 4600
Text HLabel 10600 3550 2    50   Input ~ 0
~PWDN
Text HLabel 10600 3650 2    50   Input ~ 0
~RESET
Wire Wire Line
	10600 3550 9950 3550
Wire Wire Line
	10600 3650 9950 3650
Text Label 10000 3550 0    50   ~ 0
~PWDN
Text Label 10000 3650 0    50   ~ 0
~RESET
Wire Notes Line
	9650 2550 9650 3750
Wire Notes Line
	11150 2550 11150 3750
Text Notes 9850 4050 0    79   ~ 0
Power Connections
Wire Notes Line
	9650 3900 11150 3900
Wire Notes Line
	11150 5100 9650 5100
Wire Notes Line
	9650 3900 9650 5100
Wire Notes Line
	11150 3900 11150 5100
Text Label 10050 4400 0    50   ~ 0
VIN
Text Label 10050 4500 0    50   ~ 0
AVSS
Text Label 10050 4600 0    50   ~ 0
DGND
$Comp
L Device:C C?
U 1 1 5E8AAA59
P 3650 1150
AR Path="/5D80B4DC/5E8AAA59" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA59" Ref="C?"  Part="1" 
AR Path="/5E8AAA59" Ref="C11"  Part="1" 
F 0 "C11" H 3765 1196 50  0000 L CNN
F 1 "1nF" H 3700 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3688 1000 50  0001 C CNN
F 3 "~" H 3650 1150 50  0001 C CNN
	1    3650 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA60
P 4000 1150
AR Path="/5D80B4DC/5E8AAA60" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA60" Ref="C?"  Part="1" 
AR Path="/5E8AAA60" Ref="C14"  Part="1" 
F 0 "C14" H 4115 1196 50  0000 L CNN
F 1 "10nF" H 4050 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4038 1000 50  0001 C CNN
F 3 "~" H 4000 1150 50  0001 C CNN
	1    4000 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA67
P 4350 1150
AR Path="/5D80B4DC/5E8AAA67" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA67" Ref="C?"  Part="1" 
AR Path="/5E8AAA67" Ref="C17"  Part="1" 
F 0 "C17" H 4465 1196 50  0000 L CNN
F 1 "100nF" H 4400 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4388 1000 50  0001 C CNN
F 3 "~" H 4350 1150 50  0001 C CNN
	1    4350 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA6E
P 4700 1150
AR Path="/5D80B4DC/5E8AAA6E" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA6E" Ref="C?"  Part="1" 
AR Path="/5E8AAA6E" Ref="C19"  Part="1" 
F 0 "C19" H 4815 1196 50  0000 L CNN
F 1 "10uF" H 4750 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4738 1000 50  0001 C CNN
F 3 "~" H 4700 1150 50  0001 C CNN
	1    4700 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA75
P 1200 1200
AR Path="/5D80B4DC/5E8AAA75" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA75" Ref="C?"  Part="1" 
AR Path="/5E8AAA75" Ref="C1"  Part="1" 
F 0 "C1" H 950 1250 50  0000 L CNN
F 1 "100uF" H 900 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1238 1050 50  0001 C CNN
F 3 "~" H 1200 1200 50  0001 C CNN
	1    1200 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA7C
P 1550 1200
AR Path="/5D80B4DC/5E8AAA7C" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA7C" Ref="C?"  Part="1" 
AR Path="/5E8AAA7C" Ref="C2"  Part="1" 
F 0 "C2" H 1665 1246 50  0000 L CNN
F 1 "10uF" H 1350 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1588 1050 50  0001 C CNN
F 3 "~" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA83
P 1900 1200
AR Path="/5D80B4DC/5E8AAA83" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA83" Ref="C?"  Part="1" 
AR Path="/5E8AAA83" Ref="C4"  Part="1" 
F 0 "C4" H 2015 1246 50  0000 L CNN
F 1 "100nF" H 1950 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1938 1050 50  0001 C CNN
F 3 "~" H 1900 1200 50  0001 C CNN
	1    1900 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAA8A
P 2250 1200
AR Path="/5D80B4DC/5E8AAA8A" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAA8A" Ref="C?"  Part="1" 
AR Path="/5E8AAA8A" Ref="C6"  Part="1" 
F 0 "C6" H 2365 1246 50  0000 L CNN
F 1 "10nF" H 2300 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2288 1050 50  0001 C CNN
F 3 "~" H 2250 1200 50  0001 C CNN
	1    2250 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1050 2350 1050
Connection ~ 1200 1050
Wire Wire Line
	1200 1050 800  1050
Connection ~ 1550 1050
Wire Wire Line
	1550 1050 1200 1050
Connection ~ 1900 1050
Wire Wire Line
	1900 1050 1550 1050
Connection ~ 2250 1050
Wire Wire Line
	2250 1050 1900 1050
Wire Wire Line
	1200 1350 1550 1350
Connection ~ 1550 1350
Wire Wire Line
	1550 1350 1900 1350
Connection ~ 1900 1350
Wire Wire Line
	1900 1350 2250 1350
Connection ~ 2250 1350
Wire Wire Line
	2250 1350 2750 1350
Wire Wire Line
	3150 1300 3650 1300
Connection ~ 3650 1300
Wire Wire Line
	3650 1300 4000 1300
Connection ~ 4000 1300
Wire Wire Line
	4000 1300 4350 1300
Connection ~ 4350 1300
Wire Wire Line
	4350 1300 4700 1300
Wire Wire Line
	4700 1000 4350 1000
Connection ~ 3650 1000
Connection ~ 4000 1000
Wire Wire Line
	4000 1000 3900 1000
Connection ~ 4350 1000
Wire Wire Line
	4350 1000 4000 1000
Wire Wire Line
	3900 1000 3900 800 
Wire Wire Line
	3900 800  4150 800 
Connection ~ 3900 1000
Wire Wire Line
	3900 1000 3650 1000
Wire Wire Line
	4700 1000 5200 1000
Connection ~ 4700 1000
$Comp
L Device:R R?
U 1 1 5E8AAAB4
P 5350 1000
AR Path="/5D80B4DC/5E8AAAB4" Ref="R?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAB4" Ref="R?"  Part="1" 
AR Path="/5E8AAAB4" Ref="R12"  Part="1" 
F 0 "R12" V 5250 950 50  0000 L CNN
F 1 "100" V 5450 850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5280 1000 50  0001 C CNN
F 3 "~" H 5350 1000 50  0001 C CNN
	1    5350 1000
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E8AAABB
P 5500 1300
AR Path="/5D80B4DC/5E8AAABB" Ref="D?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAABB" Ref="D?"  Part="1" 
AR Path="/5E8AAABB" Ref="D1"  Part="1" 
F 0 "D1" V 5538 1182 50  0000 R CNN
F 1 "LTST-C194TBKT" V 5450 1950 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5500 1300 50  0001 C CNN
F 3 "~" H 5500 1300 50  0001 C CNN
	1    5500 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 1150 5500 1000
Wire Wire Line
	3150 1300 3150 1550
Wire Wire Line
	3150 1550 3350 1550
Text Label 900  1050 0    50   ~ 0
VIN
Text Label 3950 800  0    50   ~ 0
AVDD
Text Label 3200 1550 0    50   ~ 0
AVSS
Wire Wire Line
	5500 1450 5150 1450
Text Label 5250 1450 0    50   ~ 0
AVSS
Text Notes 2500 650  0    79   ~ 0
+5V Regulated Supply\n
Wire Notes Line
	5900 500  5900 1600
Wire Notes Line
	700  1600 700  500 
$Comp
L Device:C C?
U 1 1 5E8AAACD
P 3900 2300
AR Path="/5D80B4DC/5E8AAACD" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAACD" Ref="C?"  Part="1" 
AR Path="/5E8AAACD" Ref="C12"  Part="1" 
F 0 "C12" H 4015 2346 50  0000 L CNN
F 1 "1nF" H 3950 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3938 2150 50  0001 C CNN
F 3 "~" H 3900 2300 50  0001 C CNN
	1    3900 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAAD4
P 4250 2300
AR Path="/5D80B4DC/5E8AAAD4" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAD4" Ref="C?"  Part="1" 
AR Path="/5E8AAAD4" Ref="C15"  Part="1" 
F 0 "C15" H 4365 2346 50  0000 L CNN
F 1 "10nF" H 4300 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4288 2150 50  0001 C CNN
F 3 "~" H 4250 2300 50  0001 C CNN
	1    4250 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAADB
P 4600 2300
AR Path="/5D80B4DC/5E8AAADB" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAADB" Ref="C?"  Part="1" 
AR Path="/5E8AAADB" Ref="C18"  Part="1" 
F 0 "C18" H 4715 2346 50  0000 L CNN
F 1 "100nF" H 4650 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4638 2150 50  0001 C CNN
F 3 "~" H 4600 2300 50  0001 C CNN
	1    4600 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAAE2
P 4950 2300
AR Path="/5D80B4DC/5E8AAAE2" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAE2" Ref="C?"  Part="1" 
AR Path="/5E8AAAE2" Ref="C21"  Part="1" 
F 0 "C21" H 5065 2346 50  0000 L CNN
F 1 "10uF" H 5000 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4988 2150 50  0001 C CNN
F 3 "~" H 4950 2300 50  0001 C CNN
	1    4950 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAAE9
P 1850 2300
AR Path="/5D80B4DC/5E8AAAE9" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAE9" Ref="C?"  Part="1" 
AR Path="/5E8AAAE9" Ref="C3"  Part="1" 
F 0 "C3" H 1600 2350 50  0000 L CNN
F 1 "100uF" H 1550 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1888 2150 50  0001 C CNN
F 3 "~" H 1850 2300 50  0001 C CNN
	1    1850 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAAF0
P 2200 2300
AR Path="/5D80B4DC/5E8AAAF0" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAF0" Ref="C?"  Part="1" 
AR Path="/5E8AAAF0" Ref="C5"  Part="1" 
F 0 "C5" H 2315 2346 50  0000 L CNN
F 1 "10uF" H 2000 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2238 2150 50  0001 C CNN
F 3 "~" H 2200 2300 50  0001 C CNN
	1    2200 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAAF7
P 2550 2300
AR Path="/5D80B4DC/5E8AAAF7" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAF7" Ref="C?"  Part="1" 
AR Path="/5E8AAAF7" Ref="C7"  Part="1" 
F 0 "C7" H 2665 2346 50  0000 L CNN
F 1 "100nF" H 2600 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2588 2150 50  0001 C CNN
F 3 "~" H 2550 2300 50  0001 C CNN
	1    2550 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAAFE
P 2900 2300
AR Path="/5D80B4DC/5E8AAAFE" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5E8AAAFE" Ref="C?"  Part="1" 
AR Path="/5E8AAAFE" Ref="C8"  Part="1" 
F 0 "C8" H 3015 2346 50  0000 L CNN
F 1 "10nF" H 2950 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2938 2150 50  0001 C CNN
F 3 "~" H 2900 2300 50  0001 C CNN
	1    2900 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2150 2900 2150
Connection ~ 2200 2150
Wire Wire Line
	2200 2150 1850 2150
Connection ~ 2550 2150
Wire Wire Line
	2550 2150 2200 2150
Connection ~ 2900 2150
Wire Wire Line
	2900 2150 2550 2150
Wire Wire Line
	1850 2450 2200 2450
Connection ~ 2200 2450
Wire Wire Line
	2200 2450 2550 2450
Connection ~ 2550 2450
Wire Wire Line
	2550 2450 2900 2450
Connection ~ 2900 2450
Wire Wire Line
	2900 2450 3400 2450
Connection ~ 3400 2450
Wire Wire Line
	3400 2450 3900 2450
Connection ~ 3900 2450
Wire Wire Line
	3900 2450 4250 2450
Connection ~ 4250 2450
Wire Wire Line
	4250 2450 4600 2450
Connection ~ 4600 2450
Wire Wire Line
	4600 2450 4950 2450
Wire Wire Line
	4950 2150 4600 2150
Connection ~ 3900 2150
Wire Wire Line
	3900 2150 3700 2150
Connection ~ 4250 2150
Wire Wire Line
	4250 2150 4150 2150
Connection ~ 4600 2150
Wire Wire Line
	4600 2150 4250 2150
Wire Wire Line
	4150 2150 4150 1950
Wire Wire Line
	4150 1950 4400 1950
Connection ~ 4150 2150
Wire Wire Line
	4150 2150 3900 2150
Wire Wire Line
	3400 2600 3600 2600
Text Label 850  2150 0    50   ~ 0
AVDD
Text Label 4200 1950 0    50   ~ 0
DVDD
Text Label 3450 2600 0    50   ~ 0
DGND
Text Notes 2500 1800 0    79   ~ 0
+3.3V Regulated Supply\n
$Comp
L My_Regulator_Linear:LM3480-3.3 U?
U 1 1 5E8AAB2B
P 3400 2150
AR Path="/5D7F9BD3/5E8AAB2B" Ref="U?"  Part="1" 
AR Path="/5E8AAB2B" Ref="U2"  Part="1" 
F 0 "U2" H 3400 2392 50  0000 C CNN
F 1 "LM3480-3.3" H 3400 2301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3400 2375 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm3480.pdf" H 3400 2150 50  0001 C CNN
	1    3400 2150
	1    0    0    -1  
$EndComp
Connection ~ 1850 2150
Wire Wire Line
	850  2150 1850 2150
Wire Wire Line
	3100 5600 3500 5600
Connection ~ 3500 5600
Wire Wire Line
	3500 5450 3500 5600
Wire Wire Line
	3500 5600 3900 5600
Connection ~ 3900 5600
Wire Wire Line
	3900 5450 3900 5600
Wire Wire Line
	3900 5600 4300 5600
Connection ~ 4300 5600
Wire Wire Line
	4300 5450 4300 5600
Wire Wire Line
	4300 5600 4700 5600
Connection ~ 4700 5600
Wire Wire Line
	4700 5450 4700 5600
Wire Wire Line
	4700 5600 5100 5600
Connection ~ 5100 5600
Wire Wire Line
	5100 5450 5100 5600
Wire Wire Line
	5100 5600 5500 5600
Connection ~ 5500 5600
Wire Wire Line
	5500 5450 5500 5600
Wire Wire Line
	5500 5600 5900 5600
Wire Wire Line
	5900 5600 6600 5600
Connection ~ 5900 5600
Wire Wire Line
	5900 5450 5900 5600
$Comp
L Device:C C?
U 1 1 5E8AAB4A
P 3500 5300
AR Path="/5D7F9BD3/5E8AAB4A" Ref="C?"  Part="1" 
AR Path="/5E8AAB4A" Ref="C10"  Part="1" 
F 0 "C10" H 3615 5346 50  0000 L CNN
F 1 "24nF" H 3615 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3538 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3500 5300 50  0001 C CNN
	1    3500 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAB51
P 3900 5300
AR Path="/5D7F9BD3/5E8AAB51" Ref="C?"  Part="1" 
AR Path="/5E8AAB51" Ref="C13"  Part="1" 
F 0 "C13" H 4015 5346 50  0000 L CNN
F 1 "24nF" H 4015 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3938 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3900 5300 50  0001 C CNN
	1    3900 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAB58
P 4300 5300
AR Path="/5D7F9BD3/5E8AAB58" Ref="C?"  Part="1" 
AR Path="/5E8AAB58" Ref="C16"  Part="1" 
F 0 "C16" H 4415 5346 50  0000 L CNN
F 1 "24nF" H 4415 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4338 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4300 5300 50  0001 C CNN
	1    4300 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAB5F
P 4700 5300
AR Path="/5D7F9BD3/5E8AAB5F" Ref="C?"  Part="1" 
AR Path="/5E8AAB5F" Ref="C20"  Part="1" 
F 0 "C20" H 4815 5346 50  0000 L CNN
F 1 "24nF" H 4815 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4738 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4700 5300 50  0001 C CNN
	1    4700 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAB66
P 5100 5300
AR Path="/5D7F9BD3/5E8AAB66" Ref="C?"  Part="1" 
AR Path="/5E8AAB66" Ref="C22"  Part="1" 
F 0 "C22" H 5215 5346 50  0000 L CNN
F 1 "24nF" H 5215 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5138 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5100 5300 50  0001 C CNN
	1    5100 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAB6D
P 5500 5300
AR Path="/5D7F9BD3/5E8AAB6D" Ref="C?"  Part="1" 
AR Path="/5E8AAB6D" Ref="C23"  Part="1" 
F 0 "C23" H 5615 5346 50  0000 L CNN
F 1 "24nF" H 5615 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5538 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5500 5300 50  0001 C CNN
	1    5500 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E8AAB74
P 5900 5300
AR Path="/5D7F9BD3/5E8AAB74" Ref="C?"  Part="1" 
AR Path="/5E8AAB74" Ref="C24"  Part="1" 
F 0 "C24" H 6015 5346 50  0000 L CNN
F 1 "24nF" H 6015 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5938 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5900 5300 50  0001 C CNN
	1    5900 5300
	1    0    0    -1  
$EndComp
Text Notes 4600 850  0    39   ~ 0
5V Supply driving 3.3V LED, so \n1.7V drop across resistor. \nI = 20mA. R = V/I = 1.7 / 20m \n= 85 Ohms. Round to higher \nstandard value, 100 Ohms
Text Notes 5600 1500 0    50   ~ 0
PWR\n(Blue)
Wire Notes Line
	700  1650 700  2650
Wire Wire Line
	3400 2450 3400 2600
Wire Wire Line
	1950 3100 2700 3100
$Comp
L My_Regulator_Linear:MCP1755T-5002E_SOT223-5 U?
U 1 1 5E8AAB82
P 2550 850
AR Path="/5D7F9BD3/5E8AAB82" Ref="U?"  Part="1" 
AR Path="/5E8AAB82" Ref="U1"  Part="1" 
F 0 "U1" H 2900 1015 50  0000 C CNN
F 1 "MCP1755T-5002E_SOT223-5" H 2900 924 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-6" H 3000 100 50  0001 C CNN
F 3 "" H 3000 100 50  0001 C CNN
	1    2550 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1000 3650 1000
Wire Wire Line
	2750 1350 2750 1300
Wire Wire Line
	2750 1300 2900 1300
Connection ~ 3150 1300
Wire Wire Line
	2900 1200 2900 1300
Connection ~ 2900 1300
Wire Wire Line
	2900 1300 3150 1300
Wire Notes Line
	700  1650 5900 1650
Wire Notes Line
	700  2650 5900 2650
Wire Notes Line
	5900 1650 5900 2650
Wire Notes Line
	700  500  5900 500 
Wire Notes Line
	700  1600 5900 1600
Wire Wire Line
	2450 950  2350 950 
Wire Wire Line
	2350 950  2350 1050
Connection ~ 2350 1050
Wire Wire Line
	2350 1050 2250 1050
Text Notes 4700 2000 0    50   ~ 0
Typical DVDD rail \nsupply current 0.5mA.\nVReg Imax = 100mA
Text Notes 3800 1550 0    50   ~ 0
Typical AVDD Rail\nsupply current 7.14mA.\nImax = 300mA
$Comp
L Connector_Generic:Conn_01x16 J?
U 1 1 5E8AABAA
P 1550 3700
AR Path="/5D7F9BD3/5E8AABAA" Ref="J?"  Part="1" 
AR Path="/5E8AABAA" Ref="J1"  Part="1" 
F 0 "J1" H 1630 3692 50  0000 L CNN
F 1 "Conn_01x16" H 1150 4550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 1550 3700 50  0001 C CNN
F 3 "~" H 1550 3700 50  0001 C CNN
	1    1550 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x16 J?
U 1 1 5E8AABB1
P 1550 5350
AR Path="/5D7F9BD3/5E8AABB1" Ref="J?"  Part="1" 
AR Path="/5E8AABB1" Ref="J2"  Part="1" 
F 0 "J2" H 1630 5342 50  0000 L CNN
F 1 "Conn_01x16" H 950 4500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 1550 5350 50  0001 C CNN
F 3 "~" H 1550 5350 50  0001 C CNN
	1    1550 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3200 750  3200
Wire Wire Line
	1350 3300 750  3300
Wire Wire Line
	1350 3400 750  3400
Wire Wire Line
	1350 3500 750  3500
Wire Wire Line
	1350 3700 750  3700
Wire Wire Line
	1350 3800 750  3800
Wire Wire Line
	1350 3900 750  3900
Wire Wire Line
	1350 4000 750  4000
Wire Wire Line
	1350 4100 750  4100
Wire Wire Line
	1350 3600 750  3600
Wire Wire Line
	1350 4200 750  4200
Wire Wire Line
	1350 4400 750  4400
Wire Wire Line
	1350 6150 750  6150
Wire Wire Line
	1350 4300 750  4300
Wire Wire Line
	1350 3100 750  3100
Wire Wire Line
	1350 3000 750  3000
Wire Wire Line
	1350 4850 750  4850
Wire Wire Line
	1350 4650 750  4650
Wire Wire Line
	1350 5050 750  5050
Wire Wire Line
	1350 5150 750  5150
Wire Wire Line
	1350 5250 750  5250
Wire Wire Line
	1350 5350 750  5350
Wire Wire Line
	1350 5450 750  5450
Wire Wire Line
	1350 5550 750  5550
Wire Wire Line
	1350 5650 750  5650
Wire Wire Line
	1350 5750 750  5750
Wire Wire Line
	1350 5850 750  5850
Wire Wire Line
	1350 5950 750  5950
Wire Wire Line
	1350 6050 750  6050
Wire Wire Line
	1350 4500 750  4500
Wire Wire Line
	1350 4750 750  4750
Wire Wire Line
	1350 4950 750  4950
Text Label 750  3300 0    50   ~ 0
MOSI
Text Label 750  3400 0    50   ~ 0
~PWDN
Text Label 750  3500 0    50   ~ 0
~RESET
Text Label 750  3700 0    50   ~ 0
START
Text Label 750  3800 0    50   ~ 0
~CS
Text Label 750  3900 0    50   ~ 0
SCLK
Text Label 750  4000 0    50   ~ 0
MISO
Text Label 750  4100 0    50   ~ 0
~DRDY
Text Label 750  3000 0    50   ~ 0
VIN
Text Label 750  3100 0    50   ~ 0
GND
Text Label 750  4400 0    50   ~ 0
AVDD
Text Label 750  4300 0    50   ~ 0
DVDD
Wire Wire Line
	1950 3350 2700 3350
Wire Wire Line
	1950 3600 2700 3600
Wire Wire Line
	1950 3850 2700 3850
Wire Wire Line
	1950 4100 2700 4100
Wire Wire Line
	1950 4350 2700 4350
Wire Wire Line
	1950 4600 2700 4600
Wire Wire Line
	1950 4850 2700 4850
Wire Wire Line
	1950 5600 2700 5600
Text Label 1950 3100 0    50   ~ 0
IN1
Text Label 1950 3350 0    50   ~ 0
IN2
Text Label 1950 3600 0    50   ~ 0
IN3
Text Label 1950 3850 0    50   ~ 0
IN4
Text Label 1950 4100 0    50   ~ 0
IN5
Text Label 1950 4350 0    50   ~ 0
IN6
Text Label 1950 4600 0    50   ~ 0
IN7
Text Label 1950 4850 0    50   ~ 0
IN8
Text Label 1950 5600 0    50   ~ 0
REF
Text Label 7850 5600 0    50   ~ 0
VCAP2
Text Label 7300 5850 0    50   ~ 0
VCAP1
Text Label 6050 5900 0    50   ~ 0
VCAP4
Text Label 750  5050 0    50   ~ 0
IN1
Text Label 750  5150 0    50   ~ 0
IN2
Text Label 750  5250 0    50   ~ 0
IN3
Text Label 750  5350 0    50   ~ 0
IN4
Text Label 750  5450 0    50   ~ 0
IN5
Text Label 750  5550 0    50   ~ 0
IN6
Text Label 750  5650 0    50   ~ 0
IN7
Text Label 750  5750 0    50   ~ 0
IN8
Text Label 750  5850 0    50   ~ 0
REF
Text Label 750  5950 0    50   ~ 0
VCAP1
Text Label 750  6050 0    50   ~ 0
VCAP2
Text Label 750  4500 0    50   ~ 0
VCAP3
Text Label 750  4650 0    50   ~ 0
VCAP4
Text Label 7400 2250 0    50   ~ 0
VCAP3
Text Label 750  4750 0    50   ~ 0
VREFP
Text Label 6800 5600 0    50   ~ 0
VREFP
Wire Wire Line
	7100 2700 6900 2700
Wire Wire Line
	6600 2800 6250 2800
Connection ~ 6600 2800
Wire Wire Line
	6600 2800 6600 2700
Text Label 6250 2800 0    50   ~ 0
AVSS
$Comp
L Device:C C?
U 1 1 5E8AAC0E
P 6950 5950
AR Path="/5D7F9BD3/5E8AAC0E" Ref="C?"  Part="1" 
AR Path="/5E8AAC0E" Ref="C28"  Part="1" 
F 0 "C28" V 6698 5950 50  0000 C CNN
F 1 "10u" V 6789 5950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6988 5800 50  0001 C CNN
F 3 "~" H 6950 5950 50  0001 C CNN
	1    6950 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 5200 7000 5400
Wire Wire Line
	7000 5400 7100 5400
Connection ~ 7100 6350
Wire Wire Line
	7100 6350 7300 6350
Wire Wire Line
	6050 6350 7100 6350
Connection ~ 7100 5950
Wire Wire Line
	7100 5950 7100 6350
Wire Wire Line
	6800 5200 6800 5950
Wire Wire Line
	7100 5400 7100 5950
Wire Wire Line
	9050 1500 9950 1500
Text Label 9050 1500 0    50   ~ 0
AVSS
Text Label 9400 1500 0    50   ~ 0
DGND
Text Label 9750 1500 0    50   ~ 0
GND
Text Label 750  4200 0    50   ~ 0
DVDD
Text Label 5250 2950 0    50   ~ 0
AVDD
Text Label 750  3600 0    50   ~ 0
CLK
Wire Wire Line
	8100 4450 8350 4450
Text Label 8200 4450 0    50   ~ 0
CLK
Wire Wire Line
	8100 4350 8350 4350
$EndSCHEMATC
