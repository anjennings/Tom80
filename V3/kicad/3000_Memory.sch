EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Wire Line
	5700 2900 5800 3000
Entry Wire Line
	5700 3000 5800 3100
Entry Wire Line
	5700 3100 5800 3200
Entry Wire Line
	5700 3200 5800 3300
Entry Wire Line
	5700 3300 5800 3400
Entry Wire Line
	5700 3400 5800 3500
Entry Wire Line
	5700 3500 5800 3600
Entry Wire Line
	5700 3600 5800 3700
Wire Wire Line
	5800 3000 6100 3000
Wire Wire Line
	5800 3100 6100 3100
Wire Wire Line
	5800 3200 6100 3200
Wire Wire Line
	5800 3300 6100 3300
Wire Wire Line
	5800 3400 6100 3400
Wire Wire Line
	5800 3500 6100 3500
Wire Wire Line
	5800 3600 6100 3600
Wire Wire Line
	5800 3700 6100 3700
Entry Wire Line
	5700 3700 5800 3800
Entry Wire Line
	5700 3800 5800 3900
Entry Wire Line
	5700 3900 5800 4000
Entry Wire Line
	5700 4000 5800 4100
Entry Wire Line
	5700 4100 5800 4200
Entry Wire Line
	5700 4200 5800 4300
Entry Wire Line
	5700 4300 5800 4400
Wire Wire Line
	5800 3800 6100 3800
Wire Wire Line
	5800 3900 6100 3900
Wire Wire Line
	5800 4000 6100 4000
Wire Wire Line
	5800 4100 6100 4100
Wire Wire Line
	5800 4200 6100 4200
Wire Wire Line
	5800 4300 6100 4300
Wire Wire Line
	5800 4400 6100 4400
Text Label 5850 3000 0    50   ~ 0
A0
Text Label 5850 3100 0    50   ~ 0
A1
Text Label 5850 3200 0    50   ~ 0
A2
Text Label 5850 3300 0    50   ~ 0
A3
Text Label 5850 3400 0    50   ~ 0
A4
Text Label 5850 3500 0    50   ~ 0
A5
Text Label 5850 3600 0    50   ~ 0
A6
Text Label 5850 3700 0    50   ~ 0
A7
Text Label 5850 3800 0    50   ~ 0
A8
Text Label 5850 3900 0    50   ~ 0
A9
Text Label 5850 4000 0    50   ~ 0
A10
Text Label 5850 4100 0    50   ~ 0
A11
Text Label 5850 4200 0    50   ~ 0
A12
Text Label 5850 4300 0    50   ~ 0
A13
Text Label 5850 4400 0    50   ~ 0
A14
Entry Wire Line
	7600 3100 7500 3000
Entry Wire Line
	7600 3200 7500 3100
Entry Wire Line
	7600 3300 7500 3200
Entry Wire Line
	7600 3400 7500 3300
Entry Wire Line
	7600 3500 7500 3400
Entry Wire Line
	7600 3600 7500 3500
Entry Wire Line
	7600 3700 7500 3600
Entry Wire Line
	7600 3800 7500 3700
Entry Wire Line
	5500 3050 5400 2950
Entry Wire Line
	5500 3150 5400 3050
Entry Wire Line
	5500 3250 5400 3150
Entry Wire Line
	5500 3350 5400 3250
Entry Wire Line
	5500 3450 5400 3350
Entry Wire Line
	5500 3550 5400 3450
Entry Wire Line
	5500 3650 5400 3550
Entry Wire Line
	5500 3750 5400 3650
Wire Wire Line
	7100 3000 7500 3000
Wire Wire Line
	7100 3100 7500 3100
Wire Wire Line
	7100 3200 7500 3200
Wire Wire Line
	7100 3300 7500 3300
Wire Wire Line
	7100 3400 7500 3400
Wire Wire Line
	7100 3500 7500 3500
Wire Wire Line
	7100 3600 7500 3600
Wire Wire Line
	7100 3700 7500 3700
Text Label 7400 3000 0    50   ~ 0
D0
Text Label 7400 3100 0    50   ~ 0
D1
Text Label 7400 3200 0    50   ~ 0
D2
Text Label 7400 3300 0    50   ~ 0
D3
Text Label 7400 3400 0    50   ~ 0
D4
Text Label 7400 3500 0    50   ~ 0
D5
Text Label 7400 3600 0    50   ~ 0
D6
Text Label 7400 3700 0    50   ~ 0
D7
Wire Wire Line
	5000 2950 5400 2950
Wire Wire Line
	5000 3050 5400 3050
Wire Wire Line
	5000 3150 5400 3150
Wire Wire Line
	5000 3250 5400 3250
Wire Wire Line
	5000 3350 5400 3350
Wire Wire Line
	5000 3450 5400 3450
Wire Wire Line
	5000 3550 5400 3550
Wire Wire Line
	5000 3650 5400 3650
Text Label 5300 2950 0    50   ~ 0
D0
Text Label 5300 3050 0    50   ~ 0
D1
Text Label 5300 3150 0    50   ~ 0
D2
Text Label 5300 3250 0    50   ~ 0
D3
Text Label 5300 3350 0    50   ~ 0
D4
Text Label 5300 3450 0    50   ~ 0
D5
Text Label 5300 3550 0    50   ~ 0
D6
Text Label 5300 3650 0    50   ~ 0
D7
Wire Bus Line
	5500 2400 7600 2400
Wire Bus Line
	7600 2400 7900 2400
Text HLabel 2800 5700 0    50   Input ~ 0
A[0..19]
Text HLabel 7900 2400 2    50   BiDi ~ 0
D[0..7]
$Comp
L power:+5V #PWR0151
U 1 1 619767D6
P 4400 2850
F 0 "#PWR0151" H 4400 2700 50  0001 C CNN
F 1 "+5V" H 4450 2900 50  0000 L CNN
F 2 "" H 4400 2850 50  0001 C CNN
F 3 "" H 4400 2850 50  0001 C CNN
	1    4400 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61976D35
P 4400 5350
AR Path="/61976D35" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/61976D35" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 4400 5100 50  0001 C CNN
F 1 "GND" H 4405 5177 50  0000 C CNN
F 2 "" H 4400 5350 50  0001 C CNN
F 3 "" H 4400 5350 50  0001 C CNN
	1    4400 5350
	1    0    0    -1  
$EndComp
Text Notes 7800 6950 0    118  ~ 24
This page has been checked!
$Comp
L Device:C C3000
U 1 1 61A8BF94
P 2250 3300
F 0 "C3000" H 2365 3346 50  0000 L CNN
F 1 "22pf" H 2365 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2288 3150 50  0001 C CNN
F 3 "~" H 2250 3300 50  0001 C CNN
	1    2250 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A8BFA0
P 2250 3450
AR Path="/61A8BFA0" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61A8BFA0" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61A8BFA0" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/61A8BFA0" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 2250 3200 50  0001 C CNN
F 1 "GND" H 2255 3277 50  0000 C CNN
F 2 "" H 2250 3450 50  0001 C CNN
F 3 "" H 2250 3450 50  0001 C CNN
	1    2250 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3001
U 1 1 61A8DC9F
P 2750 3300
F 0 "C3001" H 2865 3346 50  0000 L CNN
F 1 "22pf" H 2865 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2788 3150 50  0001 C CNN
F 3 "~" H 2750 3300 50  0001 C CNN
	1    2750 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A8DCAB
P 2750 3450
AR Path="/61A8DCAB" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61A8DCAB" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61A8DCAB" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/61A8DCAB" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 2750 3200 50  0001 C CNN
F 1 "GND" H 2755 3277 50  0000 C CNN
F 2 "" H 2750 3450 50  0001 C CNN
F 3 "" H 2750 3450 50  0001 C CNN
	1    2750 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0158
U 1 1 62017BC4
P 3800 4950
F 0 "#PWR0158" H 3800 4800 50  0001 C CNN
F 1 "+5V" V 3815 5078 50  0000 L CNN
F 2 "" H 3800 4950 50  0001 C CNN
F 3 "" H 3800 4950 50  0001 C CNN
	1    3800 4950
	0    -1   -1   0   
$EndComp
Entry Wire Line
	5700 4400 5800 4500
Entry Wire Line
	5700 4500 5800 4600
Entry Wire Line
	5700 4600 5800 4700
Entry Wire Line
	5700 4700 5800 4800
Wire Wire Line
	5800 4500 6100 4500
Wire Wire Line
	5800 4600 6100 4600
Wire Wire Line
	5800 4700 6100 4700
Wire Wire Line
	5800 4800 6100 4800
Text Label 5850 4500 0    50   ~ 0
A15
Text Label 5850 4600 0    50   ~ 0
A16
Text Label 5850 4700 0    50   ~ 0
A17
Text Label 5850 4800 0    50   ~ 0
A18
$Comp
L power:+5V #PWR0180
U 1 1 61F46407
P 6600 2800
F 0 "#PWR0180" H 6600 2650 50  0001 C CNN
F 1 "+5V" H 6650 2850 50  0000 L CNN
F 2 "" H 6600 2800 50  0001 C CNN
F 3 "" H 6600 2800 50  0001 C CNN
	1    6600 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0181
U 1 1 61F61A4C
P 6600 5000
F 0 "#PWR0181" H 6600 4750 50  0001 C CNN
F 1 "GND" H 6605 4827 50  0000 C CNN
F 2 "" H 6600 5000 50  0001 C CNN
F 3 "" H 6600 5000 50  0001 C CNN
	1    6600 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 620096C3
P 2750 3150
F 0 "#PWR0113" H 2750 3000 50  0001 C CNN
F 1 "+5V" H 2765 3323 50  0000 C CNN
F 2 "" H 2750 3150 50  0001 C CNN
F 3 "" H 2750 3150 50  0001 C CNN
	1    2750 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 62009F7F
P 2250 3150
F 0 "#PWR0114" H 2250 3000 50  0001 C CNN
F 1 "+5V" H 2265 3323 50  0000 C CNN
F 2 "" H 2250 3150 50  0001 C CNN
F 3 "" H 2250 3150 50  0001 C CNN
	1    2250 3150
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:AS6C4008-55PCN U3001
U 1 1 62109604
P 6600 3900
F 0 "U3001" H 6600 5300 50  0000 C CNN
F 1 "AS6C4008-55PCN" H 6600 5200 50  0000 C CNN
F 2 "Package_SO:SSOP-32_11.305x20.495mm_P1.27mm" H 6600 4000 50  0001 C CNN
F 3 "https://www.digikey.com/en/products/detail/alliance-memory-inc/AS6C4008-55ZIN/4234590" H 6600 4000 50  0001 C CNN
	1    6600 3900
	1    0    0    -1  
$EndComp
Text HLabel 7100 4000 2    50   Input ~ 0
RAM_CS
Text HLabel 3800 5150 0    50   Input ~ 0
ROM_CS
Connection ~ 7600 2400
Entry Wire Line
	3200 2850 3300 2950
Entry Wire Line
	3200 2950 3300 3050
Entry Wire Line
	3200 3050 3300 3150
Entry Wire Line
	3200 3150 3300 3250
Entry Wire Line
	3200 3250 3300 3350
Entry Wire Line
	3200 3350 3300 3450
Entry Wire Line
	3200 3450 3300 3550
Entry Wire Line
	3200 3550 3300 3650
Entry Wire Line
	3200 3650 3300 3750
Entry Wire Line
	3200 3750 3300 3850
Entry Wire Line
	3200 3850 3300 3950
Entry Wire Line
	3200 3950 3300 4050
Entry Wire Line
	3200 4050 3300 4150
Entry Wire Line
	3200 4150 3300 4250
Entry Wire Line
	3200 4250 3300 4350
Text Label 3350 2950 0    50   ~ 0
A0
Text Label 3350 3050 0    50   ~ 0
A1
Text Label 3350 3150 0    50   ~ 0
A2
Text Label 3350 3250 0    50   ~ 0
A3
Text Label 3350 3350 0    50   ~ 0
A4
Text Label 3350 3450 0    50   ~ 0
A5
Text Label 3350 3550 0    50   ~ 0
A6
Text Label 3350 3650 0    50   ~ 0
A7
Text Label 3350 3750 0    50   ~ 0
A8
Text Label 3350 3850 0    50   ~ 0
A9
Text Label 3350 3950 0    50   ~ 0
A10
Text Label 3350 4050 0    50   ~ 0
A11
Text Label 3350 4150 0    50   ~ 0
A12
Text Label 3350 4250 0    50   ~ 0
A13
Text Label 3350 4350 0    50   ~ 0
A14
Entry Wire Line
	3200 4350 3300 4450
Entry Wire Line
	3200 4450 3300 4550
Entry Wire Line
	3200 4550 3300 4650
Entry Wire Line
	3200 4650 3300 4750
Text Label 3350 4450 0    50   ~ 0
A15
Text Label 3350 4550 0    50   ~ 0
A16
Text Label 3350 4650 0    50   ~ 0
A17
Text Label 3350 4750 0    50   ~ 0
A18
Wire Wire Line
	3300 2950 3800 2950
Wire Wire Line
	3300 3050 3800 3050
Wire Wire Line
	3300 3150 3800 3150
Wire Wire Line
	3300 3250 3800 3250
Wire Wire Line
	3300 3350 3800 3350
Wire Wire Line
	3300 3450 3800 3450
Wire Wire Line
	3300 3550 3800 3550
Wire Wire Line
	3300 3650 3800 3650
Wire Wire Line
	3300 3750 3800 3750
Wire Wire Line
	3300 3850 3800 3850
Wire Wire Line
	3300 3950 3800 3950
Wire Wire Line
	3300 4050 3800 4050
Wire Wire Line
	3300 4150 3800 4150
Wire Wire Line
	3300 4250 3800 4250
Wire Wire Line
	3300 4350 3800 4350
Wire Wire Line
	3300 4450 3800 4450
Wire Wire Line
	3300 4550 3800 4550
Wire Wire Line
	3300 4650 3800 4650
Wire Wire Line
	3300 4750 3800 4750
Wire Bus Line
	2800 5700 3200 5700
Connection ~ 3200 5700
Wire Bus Line
	3200 5700 5700 5700
Text HLabel 7100 4100 2    50   Input ~ 0
RD
Text HLabel 7100 4200 2    50   Input ~ 0
WR
Text HLabel 3800 5250 0    50   Input ~ 0
RD
Wire Bus Line
	5500 2400 5500 3750
Wire Bus Line
	7600 2400 7600 3800
Wire Bus Line
	5700 2850 5700 5700
Wire Bus Line
	3200 2850 3200 5700
$Comp
L Memory_Flash:SST39SF040 U3000
U 1 1 625638C2
P 4400 4150
F 0 "U3000" H 4400 5750 50  0000 C CNN
F 1 "SST39SF040" H 4400 5650 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 4400 4450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25022B.pdf" H 4400 4450 50  0001 C CNN
	1    4400 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
