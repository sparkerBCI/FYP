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
L MCU_ST_STM32F4:STM32F407VETx U1
U 1 1 5E06EE6F
P 5350 3850
F 0 "U1" H 5350 964 50  0000 C CNN
F 1 "STM32F407VETx" H 5350 873 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 4650 1250 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 5350 3850 50  0001 C CNN
	1    5350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1450 6850 1450
Wire Wire Line
	6250 1550 6850 1550
Text Label 6500 1450 0    50   ~ 0
UART4_TX
Text Label 6500 1550 0    50   ~ 0
UART4_RX
$EndSCHEMATC
