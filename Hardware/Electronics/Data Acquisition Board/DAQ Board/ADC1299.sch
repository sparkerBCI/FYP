EESchema Schematic File Version 4
LIBS:DAQ Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L Device:R R3
U 1 1 5D7FB9CF
P 2750 3100
F 0 "R3" V 2650 2950 50  0000 C CNN
F 1 "220k" V 2650 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 3100 50  0001 C CNN
F 3 "~" H 2750 3100 50  0001 C CNN
	1    2750 3100
	0    1    1    0   
$EndComp
Text Notes 3050 7100 0    50   ~ 0
RC LPF: f_c = 1 /  (2*pi*R*C)\nR = 220kOhms\nhttps://pdfs.semanticscholar.org/05b6/6348fc1a11726d76eb08ddddabfc4cd36f6.pdf\n\nLowest Sampling Frequency = 250sps, therefore Nyquist Frequency at 125Hz, \nbut this is still very high for EEG. Will LPF at 30Hz\n\n30 = 1/ (2 * pi * 220k * C)\nC = 1/ (2 * pi * 220k*30)\nC = 24.11nF, approx 24nF --> f_c = 30.14Hz
$Comp
L TI_Analog_ADC:ADS1299-8 ADC1
U 1 1 5D7FB8EC
P 6100 2950
F 0 "ADC1" H 7050 2000 50  0000 C CNN
F 1 "ADS1299-8" H 7050 1900 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_10x10mm_P0.5mm" H 6950 2000 50  0001 C CNN
F 3 "C:/Users/Willie/Documents/Uni/Newcastle/4 Fourth Year/1 Final Year Project/trunk/Hardware/Electronics/Datasheets/ADCs/ADS1299/ads1299-4.pdf" H 6950 2000 50  0001 C CNN
	1    6100 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5D81188E
P 3000 5300
F 0 "C1" H 3115 5346 50  0000 L CNN
F 1 "24nF" H 3115 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3038 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3000 5300 50  0001 C CNN
	1    3000 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5D811AEF
P 2750 3350
F 0 "R4" V 2650 3200 50  0000 C CNN
F 1 "220k" V 2650 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 3350 50  0001 C CNN
F 3 "~" H 2750 3350 50  0001 C CNN
	1    2750 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5D811B0F
P 2750 3600
F 0 "R5" V 2650 3450 50  0000 C CNN
F 1 "220k" V 2650 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 3600 50  0001 C CNN
F 3 "~" H 2750 3600 50  0001 C CNN
	1    2750 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5D811B2C
P 2750 3850
F 0 "R6" V 2650 3700 50  0000 C CNN
F 1 "220k" V 2650 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 3850 50  0001 C CNN
F 3 "~" H 2750 3850 50  0001 C CNN
	1    2750 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5D811B50
P 2750 4100
F 0 "R7" V 2650 3950 50  0000 C CNN
F 1 "220k" V 2650 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 4100 50  0001 C CNN
F 3 "~" H 2750 4100 50  0001 C CNN
	1    2750 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5D811B71
P 2750 4350
F 0 "R8" V 2650 4200 50  0000 C CNN
F 1 "220k" V 2650 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 4350 50  0001 C CNN
F 3 "~" H 2750 4350 50  0001 C CNN
	1    2750 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5D811B9B
P 2750 4600
F 0 "R9" V 2650 4450 50  0000 C CNN
F 1 "220k" V 2650 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 4600 50  0001 C CNN
F 3 "~" H 2750 4600 50  0001 C CNN
	1    2750 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5D811BC4
P 2750 4850
F 0 "R10" V 2650 4700 50  0000 C CNN
F 1 "220k" V 2650 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 4850 50  0001 C CNN
F 3 "~" H 2750 4850 50  0001 C CNN
	1    2750 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 3100 3000 3100
Wire Wire Line
	2900 3600 3800 3600
Wire Wire Line
	2900 3850 4200 3850
Wire Wire Line
	2900 4100 4600 4100
Wire Wire Line
	2900 4350 5000 4350
Wire Wire Line
	2900 4600 5400 4600
Wire Wire Line
	2900 4850 5800 4850
Wire Wire Line
	3000 5150 3000 3100
Connection ~ 3000 3100
Wire Wire Line
	3000 3100 6000 3100
Wire Wire Line
	3400 5150 3400 3350
Wire Wire Line
	2900 3350 3400 3350
Connection ~ 3400 3350
Wire Wire Line
	3400 3350 6000 3350
Wire Wire Line
	3800 5150 3800 3600
Connection ~ 3800 3600
Wire Wire Line
	3800 3600 6000 3600
Wire Wire Line
	4200 5150 4200 3850
Connection ~ 4200 3850
Wire Wire Line
	4200 3850 6000 3850
Wire Wire Line
	4600 5150 4600 4100
Connection ~ 4600 4100
Wire Wire Line
	4600 4100 6000 4100
Wire Wire Line
	5000 5150 5000 4350
Connection ~ 5000 4350
Wire Wire Line
	5000 4350 6000 4350
Wire Wire Line
	5400 5150 5400 4600
Connection ~ 5400 4600
Wire Wire Line
	5400 4600 6000 4600
Wire Wire Line
	5800 5150 5800 4850
Connection ~ 5800 4850
Wire Wire Line
	5800 4850 6000 4850
$Comp
L Device:R R11
U 1 1 5D812E57
P 2750 5600
F 0 "R11" V 2650 5450 50  0000 C CNN
F 1 "220k" V 2650 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2680 5600 50  0001 C CNN
F 3 "~" H 2750 5600 50  0001 C CNN
	1    2750 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 5600 3000 5600
Wire Wire Line
	6500 5600 6500 5200
Wire Wire Line
	3000 5450 3000 5600
Connection ~ 3000 5600
NoConn ~ 6400 5200
Wire Wire Line
	6000 3200 5900 3200
Wire Wire Line
	5900 3200 5900 3450
Wire Wire Line
	5900 4950 6000 4950
Wire Wire Line
	6000 3450 5900 3450
Connection ~ 5900 3450
Wire Wire Line
	5900 3450 5900 3700
Wire Wire Line
	6000 3700 5900 3700
Connection ~ 5900 3700
Wire Wire Line
	5900 3700 5900 3950
Wire Wire Line
	6000 3950 5900 3950
Connection ~ 5900 3950
Wire Wire Line
	5900 3950 5900 4200
Wire Wire Line
	6000 4200 5900 4200
Connection ~ 5900 4200
Wire Wire Line
	5900 4200 5900 4450
Wire Wire Line
	6000 4450 5900 4450
Connection ~ 5900 4450
Wire Wire Line
	5900 4450 5900 4700
Wire Wire Line
	6000 4700 5900 4700
Connection ~ 5900 4700
Wire Wire Line
	5900 4700 5900 4950
Wire Wire Line
	5900 3200 5900 2950
Wire Wire Line
	5900 2950 5150 2950
Connection ~ 5900 3200
$Comp
L Device:C C9
U 1 1 5D81EEFA
P 5950 6100
F 0 "C9" H 6065 6146 50  0000 L CNN
F 1 "1uF" H 6065 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5988 5950 50  0001 C CNN
F 3 "~" H 5950 6100 50  0001 C CNN
	1    5950 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5D8200C4
P 7200 6100
F 0 "C16" H 7315 6146 50  0000 L CNN
F 1 "100uF" H 7315 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7238 5950 50  0001 C CNN
F 3 "~" H 7200 6100 50  0001 C CNN
	1    7200 6100
	1    0    0    -1  
$EndComp
NoConn ~ 7000 5200
NoConn ~ 6800 5200
Wire Wire Line
	7200 6350 7200 6250
Connection ~ 6900 6350
Wire Wire Line
	6900 6350 7200 6350
Text Label 6650 6350 0    50   ~ 0
AVSS
Text Notes 6550 6500 0    50   ~ 0
Using internal 4.5V Reference, \nso short VREFN to AVSS
Text Notes 3050 5900 0    50   ~ 0
Referred Montage: All electrodes will be referenced to reference electrode. \nNegative electrode inputs are unused, set to mid-supply. \nMAKE SURE CORRECT REGISTERS ARE SET IN SOFTWARE!
Wire Wire Line
	7600 5450 7600 5200
$Comp
L Device:R R12
U 1 1 5D82E619
P 7300 5450
F 0 "R12" H 7150 5500 50  0000 L CNN
F 1 "33k" H 7150 5600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7230 5450 50  0001 C CNN
F 3 "~" H 7300 5450 50  0001 C CNN
	1    7300 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 6900 7300 6900
Wire Wire Line
	7300 5300 7300 5200
Wire Wire Line
	7300 5600 7300 5700
Wire Wire Line
	7300 5700 7400 5700
Wire Wire Line
	7400 5700 7400 5200
Wire Wire Line
	7400 5700 7700 5700
Connection ~ 7400 5700
$Comp
L Device:C C19
U 1 1 5D83AA7F
P 8050 6100
F 0 "C19" H 8165 6146 50  0000 L CNN
F 1 "1uF" H 8165 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8088 5950 50  0001 C CNN
F 3 "~" H 8050 6100 50  0001 C CNN
	1    8050 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5600 7500 5600
Wire Wire Line
	7500 5600 7500 5200
Wire Wire Line
	7200 6350 8050 6350
Wire Wire Line
	8050 6350 8050 6250
Connection ~ 7200 6350
Text Label 7500 5700 0    50   ~ 0
DGND
Text Label 8050 4750 0    50   ~ 0
DGND
Wire Wire Line
	8000 4750 8250 4750
Wire Wire Line
	8000 4650 8250 4650
Text Label 8050 4650 0    50   ~ 0
MOSI_3V3
Wire Wire Line
	8000 4550 8250 4550
Text Label 8050 4550 0    50   ~ 0
START_3V3
NoConn ~ 8000 4450
Text Label 8050 4350 0    50   ~ 0
~CS_3V3
Wire Wire Line
	8000 4250 8250 4250
Text Label 8050 4250 0    50   ~ 0
SCLK_3V3
$Comp
L Device:R R14
U 1 1 5D84E32C
P 8450 4150
F 0 "R14" V 8550 4100 50  0000 C CNN
F 1 "33k" V 8550 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8380 4150 50  0001 C CNN
F 3 "~" H 8450 4150 50  0001 C CNN
	1    8450 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5D85014F
P 8850 4050
F 0 "R15" V 8950 4050 50  0000 C CNN
F 1 "33k" V 8750 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8780 4050 50  0001 C CNN
F 3 "~" H 8850 4050 50  0001 C CNN
	1    8850 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 4050 8700 4050
Wire Wire Line
	8300 4150 8000 4150
Wire Wire Line
	8600 4150 9150 4150
Wire Wire Line
	9000 4050 9150 4050
Wire Wire Line
	9150 4050 9150 4150
Connection ~ 9150 4150
Wire Wire Line
	9150 4150 9350 4150
Text Label 9200 4150 0    50   ~ 0
DGND
Wire Wire Line
	8000 3950 8250 3950
Text Label 8050 3950 0    50   ~ 0
MISO_3V3
$Comp
L Device:R R13
U 1 1 5D85C47A
P 8450 3850
F 0 "R13" V 8550 3850 50  0000 C CNN
F 1 "33k" V 8350 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8380 3850 50  0001 C CNN
F 3 "~" H 8450 3850 50  0001 C CNN
	1    8450 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 3850 8000 3850
Wire Wire Line
	8600 3850 8750 3850
Wire Wire Line
	9150 3850 9150 4050
Connection ~ 9150 4050
Wire Wire Line
	8000 3750 8250 3750
Text Label 8050 3750 0    50   ~ 0
~DRDY_3V3
Text Label 8550 3450 0    50   ~ 0
DVDD
Wire Wire Line
	8000 3550 8250 3550
Text Label 8050 3550 0    50   ~ 0
AVSS
Wire Wire Line
	8000 3450 8400 3450
Wire Wire Line
	8400 3450 8400 3650
Wire Wire Line
	8000 3650 8400 3650
NoConn ~ 8000 3350
Wire Wire Line
	8000 3250 8250 3250
Text Label 8050 3250 0    50   ~ 0
DGND
$Comp
L Device:C C17
U 1 1 5D872129
P 7300 2550
F 0 "C17" H 7415 2596 50  0000 L CNN
F 1 "1uF" H 7415 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7338 2400 50  0001 C CNN
F 3 "~" H 7300 2550 50  0001 C CNN
	1    7300 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2850 7300 2750
Wire Wire Line
	7400 2850 7400 2350
Wire Wire Line
	7400 2350 7300 2350
Wire Wire Line
	7300 2350 7300 2400
Wire Wire Line
	7100 5200 7100 6900
Wire Wire Line
	7200 5200 7200 5950
Wire Wire Line
	8050 5600 8050 5950
$Comp
L Device:C C15
U 1 1 5D89A66B
P 7200 2100
F 0 "C15" H 7315 2146 50  0000 L CNN
F 1 "0.1uF" H 7315 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 1950 50  0001 C CNN
F 3 "~" H 7200 2100 50  0001 C CNN
	1    7200 2100
	1    0    0    -1  
$EndComp
Text Label 7350 1150 0    50   ~ 0
AVSS
Connection ~ 7400 2350
$Comp
L Device:C C14
U 1 1 5D8A758B
P 7100 1350
F 0 "C14" H 7215 1396 50  0000 L CNN
F 1 "1uF" H 7215 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7138 1200 50  0001 C CNN
F 3 "~" H 7100 1350 50  0001 C CNN
	1    7100 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1200 7100 1150
Wire Wire Line
	7100 1500 7100 1850
Wire Wire Line
	7100 1850 6800 1850
Connection ~ 7100 1850
Wire Wire Line
	7100 1850 7100 2850
Text Label 6800 1850 0    50   ~ 0
AVDD
$Comp
L Device:C C10
U 1 1 5D8B872A
P 6500 2550
F 0 "C10" H 6300 2600 50  0000 L CNN
F 1 "1uF" H 6250 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6538 2400 50  0001 C CNN
F 3 "~" H 6500 2550 50  0001 C CNN
	1    6500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2850 6500 2800
Wire Wire Line
	6600 2850 6600 2400
Wire Wire Line
	6600 2400 6500 2400
Text Label 6500 2400 0    50   ~ 0
AVDD
Wire Wire Line
	7300 2750 7700 2750
Connection ~ 7300 2750
Wire Wire Line
	7300 2750 7300 2700
Text Label 7500 2750 0    50   ~ 0
AVDD
$Comp
L Device:C C21
U 1 1 5D8D0422
P 9150 3600
F 0 "C21" H 9265 3646 50  0000 L CNN
F 1 "1uF" H 9265 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9188 3450 50  0001 C CNN
F 3 "~" H 9150 3600 50  0001 C CNN
	1    9150 3600
	1    0    0    -1  
$EndComp
Connection ~ 8400 3450
Wire Wire Line
	9150 3750 9150 3850
Connection ~ 9150 3850
Wire Wire Line
	8400 3450 8750 3450
$Comp
L Device:C C20
U 1 1 5D8E172D
P 8750 3600
F 0 "C20" H 8865 3646 50  0000 L CNN
F 1 "0.1uF" H 8800 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8788 3450 50  0001 C CNN
F 3 "~" H 8750 3600 50  0001 C CNN
	1    8750 3600
	1    0    0    -1  
$EndComp
Connection ~ 8750 3450
Wire Wire Line
	8750 3450 9150 3450
Wire Wire Line
	8750 3750 8750 3850
Connection ~ 8750 3850
Wire Wire Line
	8750 3850 9150 3850
$Comp
L Device:C C13
U 1 1 5D88301A
P 6750 5850
F 0 "C13" H 6865 5896 50  0000 L CNN
F 1 "10uF" H 6865 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6788 5700 50  0001 C CNN
F 3 "~" H 6750 5850 50  0001 C CNN
	1    6750 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 5200 6900 5850
Wire Wire Line
	6700 5200 6700 5700
Wire Wire Line
	5950 6350 5950 6250
Wire Wire Line
	5950 5950 5950 5650
Wire Wire Line
	5950 5650 6600 5650
Wire Wire Line
	6600 5650 6600 5200
Wire Wire Line
	7200 1850 7200 1950
$Comp
L Device:C C18
U 1 1 5D923B6D
P 7650 2100
F 0 "C18" H 7765 2146 50  0000 L CNN
F 1 "1uF" H 7765 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7688 1950 50  0001 C CNN
F 3 "~" H 7650 2100 50  0001 C CNN
	1    7650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2250 7200 2850
Wire Wire Line
	7650 2250 7200 2250
Connection ~ 7200 2250
Wire Wire Line
	7650 1950 7650 1850
Wire Wire Line
	7650 1850 7450 1850
Wire Wire Line
	7400 2350 7950 2350
Wire Wire Line
	7950 1150 7950 2350
Wire Wire Line
	7100 1150 7450 1150
Wire Wire Line
	7450 1850 7450 1150
Connection ~ 7450 1850
Wire Wire Line
	7450 1850 7200 1850
Connection ~ 7450 1150
Wire Wire Line
	7450 1150 7950 1150
$Comp
L Device:C C12
U 1 1 5D960CBD
P 6550 1350
F 0 "C12" H 6665 1396 50  0000 L CNN
F 1 "0.1uF" H 6665 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6588 1200 50  0001 C CNN
F 3 "~" H 6550 1350 50  0001 C CNN
	1    6550 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1500 7100 1500
Connection ~ 7100 1500
Wire Wire Line
	6550 1200 6550 1150
Wire Wire Line
	6550 1150 7100 1150
Connection ~ 7100 1150
NoConn ~ 6800 2850
NoConn ~ 6700 2850
NoConn ~ 6900 2850
Wire Wire Line
	7000 2850 7000 2700
Wire Wire Line
	7000 2700 6700 2700
Text Label 6750 2700 0    50   ~ 0
AVSS
Text Notes 6400 2300 0    50   ~ 0
Right Leg Drive \nBias not used \nunder instruction \nfrom Psychology \nDepartment
Text Notes 7950 4950 0    50   ~ 0
All GPIO Pins pulled to GND, unused
Text Label 7700 5450 0    50   ~ 0
~RESET_3V3
Text Label 7150 6900 0    50   ~ 0
~PWDN_3V3
Text Notes 9600 2700 0    79   ~ 0
Control and Data Lines
Text Notes 8250 700  0    98   ~ 20
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
MOSI_3V3
Text Label 9900 2950 0    50   ~ 0
MISO_3V3
Text Label 9900 3050 0    50   ~ 0
SCLK_3V3
Text Label 9900 3150 0    50   ~ 0
~CS_3V3
Text Label 9900 3350 0    50   ~ 0
START_3V3
Text Label 9900 3450 0    50   ~ 0
~DRDY_3V3
Wire Notes Line
	9550 2550 11050 2550
Wire Notes Line
	11050 3750 9550 3750
Text HLabel 10550 4400 2    50   Input ~ 0
VIN
Text HLabel 10550 4500 2    50   Input ~ 0
AVSS
Text HLabel 10550 4600 2    50   Input ~ 0
DGND
Wire Wire Line
	10550 4400 9900 4400
Wire Wire Line
	10550 4500 9900 4500
Wire Wire Line
	10550 4600 9900 4600
Text HLabel 10500 3550 2    50   Input ~ 0
~PWDN
Text HLabel 10500 3650 2    50   Input ~ 0
~RESET
Wire Wire Line
	10500 3550 9850 3550
Wire Wire Line
	10500 3650 9850 3650
Text Label 9900 3550 0    50   ~ 0
~PWDN_3V3
Text Label 9900 3650 0    50   ~ 0
~RESET_3V3
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
Wire Wire Line
	1700 2800 1350 2800
Text Label 1350 2800 0    50   ~ 0
AVDD
Text Notes 1950 3050 0    50   ~ 0
Jump unused\nanalog inputs\ndirectly to\nAVDD
Text Label 9950 4400 0    50   ~ 0
VIN
Text Label 9950 4500 0    50   ~ 0
AVSS
Text Label 9950 4600 0    50   ~ 0
DGND
$Comp
L Device:C C?
U 1 1 5D950055
P 3550 1150
AR Path="/5D80B4DC/5D950055" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D950055" Ref="C34"  Part="1" 
F 0 "C34" H 3665 1196 50  0000 L CNN
F 1 "1nF" H 3600 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3588 1000 50  0001 C CNN
F 3 "~" H 3550 1150 50  0001 C CNN
	1    3550 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D95005C
P 3900 1150
AR Path="/5D80B4DC/5D95005C" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D95005C" Ref="C35"  Part="1" 
F 0 "C35" H 4015 1196 50  0000 L CNN
F 1 "10nF" H 3950 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3938 1000 50  0001 C CNN
F 3 "~" H 3900 1150 50  0001 C CNN
	1    3900 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D950063
P 4250 1150
AR Path="/5D80B4DC/5D950063" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D950063" Ref="C37"  Part="1" 
F 0 "C37" H 4365 1196 50  0000 L CNN
F 1 "100nF" H 4300 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4288 1000 50  0001 C CNN
F 3 "~" H 4250 1150 50  0001 C CNN
	1    4250 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D95006A
P 4600 1150
AR Path="/5D80B4DC/5D95006A" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D95006A" Ref="C39"  Part="1" 
F 0 "C39" H 4715 1196 50  0000 L CNN
F 1 "10uF" H 4650 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4638 1000 50  0001 C CNN
F 3 "~" H 4600 1150 50  0001 C CNN
	1    4600 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D950071
P 1100 1200
AR Path="/5D80B4DC/5D950071" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D950071" Ref="C26"  Part="1" 
F 0 "C26" H 850 1250 50  0000 L CNN
F 1 "100uF" H 800 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1138 1050 50  0001 C CNN
F 3 "~" H 1100 1200 50  0001 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D950078
P 1450 1200
AR Path="/5D80B4DC/5D950078" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D950078" Ref="C27"  Part="1" 
F 0 "C27" H 1565 1246 50  0000 L CNN
F 1 "10uF" H 1250 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 1050 50  0001 C CNN
F 3 "~" H 1450 1200 50  0001 C CNN
	1    1450 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D95007F
P 1800 1200
AR Path="/5D80B4DC/5D95007F" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D95007F" Ref="C29"  Part="1" 
F 0 "C29" H 1915 1246 50  0000 L CNN
F 1 "100nF" H 1850 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1838 1050 50  0001 C CNN
F 3 "~" H 1800 1200 50  0001 C CNN
	1    1800 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D950086
P 2150 1200
AR Path="/5D80B4DC/5D950086" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D950086" Ref="C31"  Part="1" 
F 0 "C31" H 2265 1246 50  0000 L CNN
F 1 "10nF" H 2200 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2188 1050 50  0001 C CNN
F 3 "~" H 2150 1200 50  0001 C CNN
	1    2150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1050 2250 1050
Connection ~ 1100 1050
Wire Wire Line
	1100 1050 700  1050
Connection ~ 1450 1050
Wire Wire Line
	1450 1050 1100 1050
Connection ~ 1800 1050
Wire Wire Line
	1800 1050 1450 1050
Connection ~ 2150 1050
Wire Wire Line
	2150 1050 1800 1050
Wire Wire Line
	1100 1350 1450 1350
Connection ~ 1450 1350
Wire Wire Line
	1450 1350 1800 1350
Connection ~ 1800 1350
Wire Wire Line
	1800 1350 2150 1350
Connection ~ 2150 1350
Wire Wire Line
	2150 1350 2650 1350
Wire Wire Line
	3050 1300 3550 1300
Connection ~ 3550 1300
Wire Wire Line
	3550 1300 3900 1300
Connection ~ 3900 1300
Wire Wire Line
	3900 1300 4250 1300
Connection ~ 4250 1300
Wire Wire Line
	4250 1300 4600 1300
Wire Wire Line
	4600 1000 4250 1000
Connection ~ 3550 1000
Connection ~ 3900 1000
Wire Wire Line
	3900 1000 3800 1000
Connection ~ 4250 1000
Wire Wire Line
	4250 1000 3900 1000
Wire Wire Line
	3800 1000 3800 800 
Wire Wire Line
	3800 800  4050 800 
Connection ~ 3800 1000
Wire Wire Line
	3800 1000 3550 1000
Wire Wire Line
	4600 1000 5100 1000
Connection ~ 4600 1000
$Comp
L Device:R R?
U 1 1 5D9500B2
P 5250 1000
AR Path="/5D80B4DC/5D9500B2" Ref="R?"  Part="1" 
AR Path="/5D7F9BD3/5D9500B2" Ref="R22"  Part="1" 
F 0 "R22" V 5150 950 50  0000 L CNN
F 1 "100" V 5350 850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5180 1000 50  0001 C CNN
F 3 "~" H 5250 1000 50  0001 C CNN
	1    5250 1000
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D9500B9
P 5400 1300
AR Path="/5D80B4DC/5D9500B9" Ref="D?"  Part="1" 
AR Path="/5D7F9BD3/5D9500B9" Ref="D4"  Part="1" 
F 0 "D4" V 5438 1182 50  0000 R CNN
F 1 "LTST-C194TBKT" V 5350 1950 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5400 1300 50  0001 C CNN
F 3 "~" H 5400 1300 50  0001 C CNN
	1    5400 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 1150 5400 1000
Wire Wire Line
	3050 1300 3050 1550
Wire Wire Line
	3050 1550 3250 1550
Text Label 800  1050 0    50   ~ 0
VIN
Text Label 3850 800  0    50   ~ 0
AVDD
Text Label 3100 1550 0    50   ~ 0
AVSS
Wire Wire Line
	5400 1450 5050 1450
Text Label 5150 1450 0    50   ~ 0
AVSS
Text Notes 2400 650  0    79   ~ 0
+5V Regulated Supply\n
Wire Notes Line
	5800 500  5800 1600
Wire Notes Line
	600  1600 600  500 
$Comp
L Device:C C?
U 1 1 5D9C2D04
P 3800 2300
AR Path="/5D80B4DC/5D9C2D04" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D04" Ref="C36"  Part="1" 
F 0 "C36" H 3915 2346 50  0000 L CNN
F 1 "1nF" H 3850 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3838 2150 50  0001 C CNN
F 3 "~" H 3800 2300 50  0001 C CNN
	1    3800 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D0B
P 4150 2300
AR Path="/5D80B4DC/5D9C2D0B" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D0B" Ref="C38"  Part="1" 
F 0 "C38" H 4265 2346 50  0000 L CNN
F 1 "10nF" H 4200 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4188 2150 50  0001 C CNN
F 3 "~" H 4150 2300 50  0001 C CNN
	1    4150 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D12
P 4500 2300
AR Path="/5D80B4DC/5D9C2D12" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D12" Ref="C40"  Part="1" 
F 0 "C40" H 4615 2346 50  0000 L CNN
F 1 "100nF" H 4550 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4538 2150 50  0001 C CNN
F 3 "~" H 4500 2300 50  0001 C CNN
	1    4500 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D19
P 4850 2300
AR Path="/5D80B4DC/5D9C2D19" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D19" Ref="C41"  Part="1" 
F 0 "C41" H 4965 2346 50  0000 L CNN
F 1 "10uF" H 4900 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4888 2150 50  0001 C CNN
F 3 "~" H 4850 2300 50  0001 C CNN
	1    4850 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D20
P 1750 2300
AR Path="/5D80B4DC/5D9C2D20" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D20" Ref="C28"  Part="1" 
F 0 "C28" H 1500 2350 50  0000 L CNN
F 1 "100uF" H 1450 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1788 2150 50  0001 C CNN
F 3 "~" H 1750 2300 50  0001 C CNN
	1    1750 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D27
P 2100 2300
AR Path="/5D80B4DC/5D9C2D27" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D27" Ref="C30"  Part="1" 
F 0 "C30" H 2215 2346 50  0000 L CNN
F 1 "10uF" H 1900 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 2150 50  0001 C CNN
F 3 "~" H 2100 2300 50  0001 C CNN
	1    2100 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D2E
P 2450 2300
AR Path="/5D80B4DC/5D9C2D2E" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D2E" Ref="C32"  Part="1" 
F 0 "C32" H 2565 2346 50  0000 L CNN
F 1 "100nF" H 2500 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2488 2150 50  0001 C CNN
F 3 "~" H 2450 2300 50  0001 C CNN
	1    2450 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D9C2D35
P 2800 2300
AR Path="/5D80B4DC/5D9C2D35" Ref="C?"  Part="1" 
AR Path="/5D7F9BD3/5D9C2D35" Ref="C33"  Part="1" 
F 0 "C33" H 2915 2346 50  0000 L CNN
F 1 "10nF" H 2850 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2838 2150 50  0001 C CNN
F 3 "~" H 2800 2300 50  0001 C CNN
	1    2800 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2150 2800 2150
Connection ~ 2100 2150
Wire Wire Line
	2100 2150 1750 2150
Connection ~ 2450 2150
Wire Wire Line
	2450 2150 2100 2150
Connection ~ 2800 2150
Wire Wire Line
	2800 2150 2450 2150
Wire Wire Line
	1750 2450 2100 2450
Connection ~ 2100 2450
Wire Wire Line
	2100 2450 2450 2450
Connection ~ 2450 2450
Wire Wire Line
	2450 2450 2800 2450
Connection ~ 2800 2450
Wire Wire Line
	2800 2450 3300 2450
Connection ~ 3300 2450
Wire Wire Line
	3300 2450 3800 2450
Connection ~ 3800 2450
Wire Wire Line
	3800 2450 4150 2450
Connection ~ 4150 2450
Wire Wire Line
	4150 2450 4500 2450
Connection ~ 4500 2450
Wire Wire Line
	4500 2450 4850 2450
Wire Wire Line
	4850 2150 4500 2150
Connection ~ 3800 2150
Wire Wire Line
	3800 2150 3600 2150
Connection ~ 4150 2150
Wire Wire Line
	4150 2150 4050 2150
Connection ~ 4500 2150
Wire Wire Line
	4500 2150 4150 2150
Wire Wire Line
	4050 2150 4050 1950
Wire Wire Line
	4050 1950 4300 1950
Connection ~ 4050 2150
Wire Wire Line
	4050 2150 3800 2150
Wire Wire Line
	3300 2600 3500 2600
Text Label 750  2150 0    50   ~ 0
AVDD
Text Label 4100 1950 0    50   ~ 0
DVDD
Text Label 3350 2600 0    50   ~ 0
DGND
Text Notes 2400 1800 0    79   ~ 0
+3.3V Regulated Supply\n
$Comp
L My_Regulator_Linear:LM3480-3.3 U3
U 1 1 5DA7A913
P 3300 2150
F 0 "U3" H 3300 2392 50  0000 C CNN
F 1 "LM3480-3.3" H 3300 2301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3300 2375 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm3480.pdf" H 3300 2150 50  0001 C CNN
	1    3300 2150
	1    0    0    -1  
$EndComp
Connection ~ 1750 2150
Wire Wire Line
	750  2150 1750 2150
Wire Wire Line
	3000 5600 3400 5600
Connection ~ 3400 5600
Wire Wire Line
	3400 5450 3400 5600
Wire Wire Line
	3400 5600 3800 5600
Connection ~ 3800 5600
Wire Wire Line
	3800 5450 3800 5600
Wire Wire Line
	3800 5600 4200 5600
Connection ~ 4200 5600
Wire Wire Line
	4200 5450 4200 5600
Wire Wire Line
	4200 5600 4600 5600
Connection ~ 4600 5600
Wire Wire Line
	4600 5450 4600 5600
Wire Wire Line
	4600 5600 5000 5600
Connection ~ 5000 5600
Wire Wire Line
	5000 5450 5000 5600
Wire Wire Line
	5000 5600 5400 5600
Connection ~ 5400 5600
Wire Wire Line
	5400 5450 5400 5600
Wire Wire Line
	5400 5600 5800 5600
Wire Wire Line
	5800 5600 6500 5600
Connection ~ 5800 5600
Wire Wire Line
	5800 5450 5800 5600
$Comp
L Device:C C2
U 1 1 5DAB8D13
P 3400 5300
F 0 "C2" H 3515 5346 50  0000 L CNN
F 1 "24nF" H 3515 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3438 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3400 5300 50  0001 C CNN
	1    3400 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5DACAB6F
P 3800 5300
F 0 "C3" H 3915 5346 50  0000 L CNN
F 1 "24nF" H 3915 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3838 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 3800 5300 50  0001 C CNN
	1    3800 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5DADC932
P 4200 5300
F 0 "C4" H 4315 5346 50  0000 L CNN
F 1 "24nF" H 4315 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4238 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4200 5300 50  0001 C CNN
	1    4200 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5DAEE6FC
P 4600 5300
F 0 "C5" H 4715 5346 50  0000 L CNN
F 1 "24nF" H 4715 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4638 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 4600 5300 50  0001 C CNN
	1    4600 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5DB00720
P 5000 5300
F 0 "C6" H 5115 5346 50  0000 L CNN
F 1 "24nF" H 5115 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5038 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5000 5300 50  0001 C CNN
	1    5000 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DB124E8
P 5400 5300
F 0 "C7" H 5515 5346 50  0000 L CNN
F 1 "24nF" H 5515 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5438 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5400 5300 50  0001 C CNN
	1    5400 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DB242B7
P 5800 5300
F 0 "C8" H 5915 5346 50  0000 L CNN
F 1 "24nF" H 5915 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5838 5150 50  0001 C CNN
F 3 "http://datasheets.avx.com/X7RDielectric.pdf" H 5800 5300 50  0001 C CNN
	1    5800 5300
	1    0    0    -1  
$EndComp
Text Notes 4500 850  0    39   ~ 0
5V Supply driving 3.3V LED, so \n1.7V drop across resistor. \nI = 20mA. R = V/I = 1.7 / 20m \n= 85 Ohms. Round to higher \nstandard value, 100 Ohms
Text Notes 5500 1500 0    50   ~ 0
PWR\n(Blue)
$Comp
L Switch:SW_SPDT SW3
U 1 1 5DBC5632
P 1650 3100
F 0 "SW3" H 1500 3000 50  0000 C CNN
F 1 "SW_SPDT" H 1650 2866 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 3100 50  0001 C CNN
F 3 "" H 1650 3100 50  0001 C CNN
	1    1650 3100
	-1   0    0    1   
$EndComp
Wire Notes Line
	600  1650 600  2650
Wire Wire Line
	3300 2450 3300 2600
$Comp
L Switch:SW_SPDT SW4
U 1 1 5DCC6A0B
P 1650 3450
F 0 "SW4" H 1500 3300 50  0000 C CNN
F 1 "SW_SPDT" H 1650 3216 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 3450 50  0001 C CNN
F 3 "" H 1650 3450 50  0001 C CNN
	1    1650 3450
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW5
U 1 1 5DCD7D51
P 1650 3800
F 0 "SW5" H 1500 3650 50  0000 C CNN
F 1 "SW_SPDT" H 1650 3566 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 3800 50  0001 C CNN
F 3 "" H 1650 3800 50  0001 C CNN
	1    1650 3800
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW6
U 1 1 5DCFA27D
P 1650 4200
F 0 "SW6" H 1500 4100 50  0000 C CNN
F 1 "SW_SPDT" H 1650 3966 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 4200 50  0001 C CNN
F 3 "" H 1650 4200 50  0001 C CNN
	1    1650 4200
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW7
U 1 1 5DD1CAA0
P 1650 4550
F 0 "SW7" H 1500 4450 50  0000 C CNN
F 1 "SW_SPDT" H 1650 4316 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 4550 50  0001 C CNN
F 3 "" H 1650 4550 50  0001 C CNN
	1    1650 4550
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW8
U 1 1 5DD1CAA7
P 1650 4900
F 0 "SW8" H 1500 4800 50  0000 C CNN
F 1 "SW_SPDT" H 1650 4666 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 4900 50  0001 C CNN
F 3 "" H 1650 4900 50  0001 C CNN
	1    1650 4900
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW9
U 1 1 5DD1CAAE
P 1650 5250
F 0 "SW9" H 1500 5150 50  0000 C CNN
F 1 "SW_SPDT" H 1650 5016 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 5250 50  0001 C CNN
F 3 "" H 1650 5250 50  0001 C CNN
	1    1650 5250
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW10
U 1 1 5DD1CAB5
P 1650 5650
F 0 "SW10" H 1500 5500 50  0000 C CNN
F 1 "SW_SPDT" H 1650 5416 50  0001 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 5650 50  0001 C CNN
F 3 "" H 1650 5650 50  0001 C CNN
	1    1650 5650
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW11
U 1 1 5DDDA3D0
P 1650 6000
F 0 "SW11" H 1500 5850 50  0000 C CNN
F 1 "SW_SPDT" H 1600 6200 50  0000 C CNN
F 2 "Switches:SPDT-THT_Slide" H 1650 6000 50  0001 C CNN
F 3 "" H 1650 6000 50  0001 C CNN
	1    1650 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1450 6100 1350 6100
Wire Wire Line
	1450 5750 1350 5750
Connection ~ 1350 5750
Wire Wire Line
	1350 5750 1350 6100
Wire Wire Line
	1450 5350 1350 5350
Connection ~ 1350 5350
Wire Wire Line
	1350 5350 1350 5750
Wire Wire Line
	1450 5000 1350 5000
Connection ~ 1350 5000
Wire Wire Line
	1350 5000 1350 5350
Wire Wire Line
	1450 4650 1350 4650
Connection ~ 1350 4650
Wire Wire Line
	1350 4650 1350 5000
Wire Wire Line
	1450 4300 1350 4300
Connection ~ 1350 4300
Wire Wire Line
	1350 4300 1350 4650
Wire Wire Line
	1450 3900 1350 3900
Connection ~ 1350 3900
Wire Wire Line
	1350 3900 1350 4300
Wire Wire Line
	1450 3550 1350 3550
Connection ~ 1350 3550
Wire Wire Line
	1350 3550 1350 3900
Wire Wire Line
	1450 3200 1350 3200
Connection ~ 1350 3200
Wire Wire Line
	1350 3200 1350 3550
Wire Wire Line
	1350 2800 1350 3200
Wire Wire Line
	1850 3100 2600 3100
Wire Wire Line
	1850 6000 2500 6000
Wire Wire Line
	2500 6000 2500 5600
Wire Wire Line
	2500 5600 2600 5600
Wire Wire Line
	1850 3450 1950 3450
Wire Wire Line
	1950 3450 1950 3350
Wire Wire Line
	1950 3350 2600 3350
Wire Wire Line
	1850 3800 1950 3800
Wire Wire Line
	1950 3800 1950 3600
Wire Wire Line
	1950 3600 2600 3600
Wire Wire Line
	1850 4200 2000 4200
Wire Wire Line
	2000 4200 2000 3850
Wire Wire Line
	2000 3850 2600 3850
Wire Wire Line
	1850 4550 2050 4550
Wire Wire Line
	2050 4550 2050 4100
Wire Wire Line
	2050 4100 2600 4100
Wire Wire Line
	2450 5650 2450 4850
Wire Wire Line
	2450 4850 2600 4850
Wire Wire Line
	1850 5650 2450 5650
Wire Wire Line
	2300 5250 2300 4600
Wire Wire Line
	2300 4600 2600 4600
Wire Wire Line
	1850 5250 2300 5250
Wire Wire Line
	2200 4900 2200 4350
Wire Wire Line
	2200 4350 2600 4350
Wire Wire Line
	1850 4900 2200 4900
Wire Wire Line
	900  3000 1450 3000
Wire Wire Line
	900  3100 1300 3100
Wire Wire Line
	1300 3100 1300 3350
Wire Wire Line
	1300 3350 1450 3350
Wire Wire Line
	900  3200 1250 3200
Wire Wire Line
	1250 3200 1250 3700
Wire Wire Line
	1250 3700 1450 3700
Wire Wire Line
	900  3300 1200 3300
Wire Wire Line
	1200 3300 1200 4100
Wire Wire Line
	1200 4100 1450 4100
Wire Wire Line
	900  3400 1150 3400
Wire Wire Line
	1150 3400 1150 4450
Wire Wire Line
	1150 4450 1450 4450
Wire Wire Line
	900  3500 1100 3500
Wire Wire Line
	1100 3500 1100 4800
Wire Wire Line
	1100 4800 1450 4800
Wire Wire Line
	900  3600 1050 3600
Wire Wire Line
	1050 3600 1050 5150
Wire Wire Line
	1050 5150 1450 5150
Wire Wire Line
	900  3700 1000 3700
Wire Wire Line
	1000 3700 1000 5550
Wire Wire Line
	1000 5550 1450 5550
Wire Wire Line
	1450 5900 950  5900
Wire Wire Line
	950  5900 950  3800
Wire Wire Line
	950  3800 900  3800
$Comp
L My_Regulator_Linear:MCP1755T-5002E_SOT223-5 U2
U 1 1 5DAFB1C4
P 2450 850
F 0 "U2" H 2800 1015 50  0000 C CNN
F 1 "MCP1755T-5002E_SOT223-5" H 2800 924 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-6" H 2900 100 50  0001 C CNN
F 3 "" H 2900 100 50  0001 C CNN
	1    2450 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1000 3550 1000
Wire Wire Line
	2650 1350 2650 1300
Wire Wire Line
	2650 1300 2800 1300
Connection ~ 3050 1300
Wire Wire Line
	2800 1200 2800 1300
Connection ~ 2800 1300
Wire Wire Line
	2800 1300 3050 1300
Wire Notes Line
	600  1650 5800 1650
Wire Notes Line
	600  2650 5800 2650
Wire Notes Line
	5800 1650 5800 2650
Wire Notes Line
	600  500  5800 500 
Wire Notes Line
	600  1600 5800 1600
Wire Wire Line
	2350 950  2250 950 
Wire Wire Line
	2250 950  2250 1050
Connection ~ 2250 1050
Wire Wire Line
	2250 1050 2150 1050
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5DBEC62D
P 10100 1800
AR Path="/5DBEC62D" Ref="J?"  Part="1" 
AR Path="/5D7F9BD3/5DBEC62D" Ref="J15"  Part="1" 
F 0 "J15" H 10073 1680 50  0000 R CNN
F 1 "VCAP1_TP" H 10073 1771 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10100 1800 50  0001 C CNN
F 3 "~" H 10100 1800 50  0001 C CNN
	1    10100 1800
	-1   0    0    1   
$EndComp
Text Label 9450 1700 0    50   ~ 0
AVSS
Text Label 9450 1800 0    50   ~ 0
VCAP1
Wire Wire Line
	9450 1700 9900 1700
Wire Wire Line
	9450 1800 9900 1800
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5DC0928B
P 10100 2150
AR Path="/5DC0928B" Ref="J?"  Part="1" 
AR Path="/5D7F9BD3/5DC0928B" Ref="J16"  Part="1" 
F 0 "J16" H 10072 2030 50  0000 R CNN
F 1 "DRDY_TP" H 10072 2121 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10100 2150 50  0001 C CNN
F 3 "~" H 10100 2150 50  0001 C CNN
	1    10100 2150
	-1   0    0    1   
$EndComp
Text Label 9450 2150 0    50   ~ 0
DGND
Text Label 9450 2050 0    50   ~ 0
~DRDY_3V3
Wire Wire Line
	9450 2050 9900 2050
Wire Wire Line
	9450 2150 9900 2150
Text Notes 4600 2000 0    50   ~ 0
Typical DVDD rail \nsupply current 0.5mA.\nVReg Imax = 100mA
Text Notes 3700 1550 0    50   ~ 0
Typical AVDD Rail\nsupply current 7.14mA.\nImax = 300mA
$Comp
L Device:R R27
U 1 1 5E085F31
P 8750 4450
F 0 "R27" H 8900 4400 50  0000 C CNN
F 1 "100k" H 8900 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8680 4450 50  0001 C CNN
F 3 "~" H 8750 4450 50  0001 C CNN
	1    8750 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4350 8550 4600
Wire Wire Line
	8550 4600 8750 4600
Wire Wire Line
	8000 4350 8550 4350
Connection ~ 8750 4600
Wire Wire Line
	8750 4600 9050 4600
Wire Wire Line
	8750 4300 9000 4300
Text Label 8800 4300 0    50   ~ 0
DVDD
Text Notes 9050 4550 0    50   ~ 0
Pull-up CS\nto VDD for\nICP
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 5E0A3C00
P 700 3000
F 0 "J1" H -50 3000 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3000 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3000 50  0001 C CNN
F 3 "~" H 700 3000 50  0001 C CNN
	1    700  3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5E0A3DA4
P 700 3100
F 0 "J3" H -50 3100 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3100 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3100 50  0001 C CNN
F 3 "~" H 700 3100 50  0001 C CNN
	1    700  3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 5E0C0599
P 700 3200
F 0 "J8" H -50 3200 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3200 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3200 50  0001 C CNN
F 3 "~" H 700 3200 50  0001 C CNN
	1    700  3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 5E0DCD8F
P 700 3300
F 0 "J9" H -50 3300 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3300 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3300 50  0001 C CNN
F 3 "~" H 700 3300 50  0001 C CNN
	1    700  3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 5E0F958A
P 700 3400
F 0 "J11" H -50 3400 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3400 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3400 50  0001 C CNN
F 3 "~" H 700 3400 50  0001 C CNN
	1    700  3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J13
U 1 1 5E115D86
P 700 3500
F 0 "J13" H -50 3500 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3500 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3500 50  0001 C CNN
F 3 "~" H 700 3500 50  0001 C CNN
	1    700  3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J17
U 1 1 5E132583
P 700 3600
F 0 "J17" H -50 3600 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3600 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3600 50  0001 C CNN
F 3 "~" H 700 3600 50  0001 C CNN
	1    700  3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J18
U 1 1 5E14EE6E
P 700 3700
F 0 "J18" H -50 3700 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3700 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3700 50  0001 C CNN
F 3 "~" H 700 3700 50  0001 C CNN
	1    700  3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J19
U 1 1 5E1A4862
P 700 3800
F 0 "J19" H -50 3800 50  0000 C CNN
F 1 "Conn_01x01_Male" H 350 3800 50  0000 C CNN
F 2 "Sparker:DIN 42802-1" H 700 3800 50  0001 C CNN
F 3 "~" H 700 3800 50  0001 C CNN
	1    700  3800
	1    0    0    -1  
$EndComp
Text HLabel 10550 4700 2    50   Input ~ 0
3V3
Wire Wire Line
	10550 4700 9900 4700
Text Label 9950 4700 0    50   ~ 0
DVDD
Wire Wire Line
	7600 5450 8200 5450
Text Notes 8300 5450 0    50   ~ 0
Pulled Up By Level Shifter
Wire Wire Line
	6500 2800 6100 2800
Connection ~ 6500 2800
Wire Wire Line
	6500 2800 6500 2700
Text Label 6100 2800 0    50   ~ 0
AVSS
Connection ~ 6900 5850
Wire Wire Line
	6900 5850 6900 6350
Wire Wire Line
	6600 5700 6700 5700
Wire Wire Line
	6600 5850 6600 5700
Wire Wire Line
	5950 6350 6900 6350
Text Label 5300 2950 0    50   ~ 0
AVDD
Text Label 7200 5850 0    50   ~ 0
VCAP1
$EndSCHEMATC
