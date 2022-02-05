EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 16
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
L 74xx:74LS541 U?
U 1 1 61A295C4
P 5400 2300
AR Path="/61A295C4" Ref="U?"  Part="1" 
AR Path="/61A26BC0/61A295C4" Ref="U100"  Part="1" 
AR Path="/61E50944/61E514B0/61A295C4" Ref="U4100"  Part="1" 
F 0 "U4100" H 5400 3281 50  0000 R CNN
F 1 "74LS541" H 5400 3190 50  0000 R CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U?
U 1 1 61A295D1
P 2900 2300
AR Path="/61A295D1" Ref="U?"  Part="1" 
AR Path="/61A26BC0/61A295D1" Ref="U101"  Part="1" 
AR Path="/61E50944/61E514B0/61A295D1" Ref="U4101"  Part="1" 
F 0 "U4101" H 2900 3281 50  0000 R CNN
F 1 "74LS541" H 2900 3190 50  0000 R CNN
F 2 "" H 2900 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 2900 2300 50  0001 C CNN
	1    2900 2300
	1    0    0    -1  
$EndComp
Entry Wire Line
	6300 2400 6200 2300
Entry Wire Line
	6300 2300 6200 2200
Entry Wire Line
	6300 2200 6200 2100
Entry Wire Line
	6300 2100 6200 2000
Entry Wire Line
	6300 2000 6200 1900
Entry Wire Line
	6300 1900 6200 1800
Wire Wire Line
	6200 2300 5900 2300
Wire Wire Line
	6200 2200 5900 2200
Wire Wire Line
	6200 2100 5900 2100
Wire Wire Line
	6200 2000 5900 2000
Wire Wire Line
	6200 1900 5900 1900
Wire Wire Line
	6200 1800 5900 1800
Entry Wire Line
	3800 2500 3700 2400
Entry Wire Line
	3800 2400 3700 2300
Entry Wire Line
	3800 2300 3700 2200
Entry Wire Line
	3800 2200 3700 2100
Entry Wire Line
	3800 2100 3700 2000
Entry Wire Line
	6300 2500 6200 2400
Wire Wire Line
	3700 2500 3400 2500
Wire Wire Line
	3700 2400 3400 2400
Wire Wire Line
	3700 2300 3400 2300
Wire Wire Line
	3700 2200 3400 2200
Wire Wire Line
	3700 2100 3400 2100
Wire Wire Line
	3700 2000 3400 2000
Wire Wire Line
	6200 2400 5900 2400
Text Label 5950 1800 0    50   ~ 0
A0
Text Label 5950 1900 0    50   ~ 0
A1
Text Label 5950 2000 0    50   ~ 0
A2
Text Label 5950 2100 0    50   ~ 0
A3
Text Label 5950 2200 0    50   ~ 0
A4
Text Label 5950 2300 0    50   ~ 0
A5
Text Label 5950 2400 0    50   ~ 0
A14
Text Label 3450 2000 0    50   ~ 0
A8
Text Label 3450 2100 0    50   ~ 0
A9
Text Label 3450 2200 0    50   ~ 0
A10
Text Label 3450 2300 0    50   ~ 0
A11
Text Label 3450 2400 0    50   ~ 0
A12
Text Label 3450 2500 0    50   ~ 0
A13
$Comp
L power:GND #PWR?
U 1 1 61A29604
P 2900 3100
AR Path="/61A29604" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61A29604" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514B0/61A29604" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 2900 2850 50  0001 C CNN
F 1 "GND" H 2905 2927 50  0000 C CNN
F 2 "" H 2900 3100 50  0001 C CNN
F 3 "" H 2900 3100 50  0001 C CNN
	1    2900 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A2960A
P 5400 3100
AR Path="/61A2960A" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61A2960A" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514B0/61A2960A" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 5400 2850 50  0001 C CNN
F 1 "GND" H 5405 2927 50  0000 C CNN
F 2 "" H 5400 3100 50  0001 C CNN
F 3 "" H 5400 3100 50  0001 C CNN
	1    5400 3100
	1    0    0    -1  
$EndComp
Entry Wire Line
	3800 1900 3700 1800
Wire Wire Line
	3700 1800 3400 1800
Text Label 3450 1800 0    50   ~ 0
A6
Entry Wire Line
	3800 2000 3700 1900
Text Label 3450 1900 0    50   ~ 0
A7
Wire Wire Line
	3700 1900 3400 1900
Text HLabel 4900 2700 0    50   Input ~ 0
E1
Text HLabel 4900 2800 0    50   Input ~ 0
E2
Text HLabel 2400 2700 0    50   Input ~ 0
E1
Text HLabel 2400 2800 0    50   Input ~ 0
E2
$Comp
L power:+5V #PWR?
U 1 1 61A337E7
P 5400 1500
AR Path="/61A26BC0/61A337E7" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514B0/61A337E7" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 5400 1350 50  0001 C CNN
F 1 "+5V" V 5415 1628 50  0000 L CNN
F 2 "" H 5400 1500 50  0001 C CNN
F 3 "" H 5400 1500 50  0001 C CNN
	1    5400 1500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A33F84
P 2900 1500
AR Path="/61A26BC0/61A33F84" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514B0/61A33F84" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 2900 1350 50  0001 C CNN
F 1 "+5V" V 2915 1628 50  0000 L CNN
F 2 "" H 2900 1500 50  0001 C CNN
F 3 "" H 2900 1500 50  0001 C CNN
	1    2900 1500
	0    1    1    0   
$EndComp
Entry Wire Line
	3700 2500 3800 2600
Entry Wire Line
	2000 1800 2100 1900
Entry Wire Line
	2000 1900 2100 2000
Entry Wire Line
	2000 2000 2100 2100
Entry Wire Line
	2000 2100 2100 2200
Entry Wire Line
	2000 2200 2100 2300
Entry Wire Line
	2000 2300 2100 2400
Entry Wire Line
	2000 2400 2100 2500
Entry Wire Line
	2000 1700 2100 1800
Wire Bus Line
	2000 1550 1700 1550
Text HLabel 1700 1550 0    50   Input ~ 0
LC[0..9]
Wire Wire Line
	2100 1800 2400 1800
Wire Wire Line
	2100 1900 2400 1900
Wire Wire Line
	2100 2000 2400 2000
Wire Wire Line
	2100 2100 2400 2100
Wire Wire Line
	2100 2200 2400 2200
Wire Wire Line
	2100 2300 2400 2300
Wire Wire Line
	2100 2400 2400 2400
Wire Wire Line
	2100 2500 2400 2500
Text Label 2200 1800 0    50   ~ 0
LC1
Text Label 2200 1900 0    50   ~ 0
LC2
Text Label 2200 2000 0    50   ~ 0
LC3
Text Label 2200 2100 0    50   ~ 0
LC4
Text Label 2200 2200 0    50   ~ 0
LC5
Text Label 2200 2300 0    50   ~ 0
LC6
Text Label 2200 2400 0    50   ~ 0
LC7
Text Label 2200 2500 0    50   ~ 0
LC8
Entry Wire Line
	4500 1700 4600 1800
Entry Wire Line
	4500 1800 4600 1900
Entry Wire Line
	4500 1900 4600 2000
Entry Wire Line
	4500 2000 4600 2100
Entry Wire Line
	4500 2100 4600 2200
Entry Wire Line
	4500 2200 4600 2300
Text HLabel 4450 1550 0    50   Input ~ 0
PC[0..9]
Wire Wire Line
	4600 1800 4900 1800
Wire Wire Line
	4600 1900 4900 1900
Wire Wire Line
	4600 2000 4900 2000
Wire Wire Line
	4600 2100 4900 2100
Wire Wire Line
	4600 2200 4900 2200
Wire Wire Line
	4600 2300 4900 2300
Text Label 4700 1800 0    50   ~ 0
PC3
Text Label 4700 1900 0    50   ~ 0
PC4
Text Label 4700 2000 0    50   ~ 0
PC5
Text Label 4700 2100 0    50   ~ 0
PC6
Text Label 4700 2200 0    50   ~ 0
PC7
Text Label 4700 2300 0    50   ~ 0
PC8
Wire Bus Line
	3800 1100 6300 1100
Wire Bus Line
	4450 1550 4500 1550
Text Notes 1200 7300 0    197  ~ 39
This page has NOT been checked!
$Comp
L Device:C C100
U 1 1 61A938D6
P 8500 2200
AR Path="/61A26BC0/61A938D6" Ref="C100"  Part="1" 
AR Path="/61E50944/61E514B0/61A938D6" Ref="C4100"  Part="1" 
F 0 "C4100" H 8615 2246 50  0000 L CNN
F 1 "C" H 8615 2155 50  0000 L CNN
F 2 "" H 8538 2050 50  0001 C CNN
F 3 "~" H 8500 2200 50  0001 C CNN
	1    8500 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A938E2
P 8500 2350
AR Path="/61A938E2" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61A938E2" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61A938E2" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61A938E2" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514B0/61A938E2" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 8500 2100 50  0001 C CNN
F 1 "GND" H 8505 2177 50  0000 C CNN
F 2 "" H 8500 2350 50  0001 C CNN
F 3 "" H 8500 2350 50  0001 C CNN
	1    8500 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C101
U 1 1 61A94BDA
P 9000 2200
AR Path="/61A26BC0/61A94BDA" Ref="C101"  Part="1" 
AR Path="/61E50944/61E514B0/61A94BDA" Ref="C4101"  Part="1" 
F 0 "C4101" H 9115 2246 50  0000 L CNN
F 1 "C" H 9115 2155 50  0000 L CNN
F 2 "" H 9038 2050 50  0001 C CNN
F 3 "~" H 9000 2200 50  0001 C CNN
	1    9000 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A94BE6
P 9000 2350
AR Path="/61A94BE6" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61A94BE6" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61A94BE6" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61A94BE6" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514B0/61A94BE6" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 9000 2100 50  0001 C CNN
F 1 "GND" H 9005 2177 50  0000 C CNN
F 2 "" H 9000 2350 50  0001 C CNN
F 3 "" H 9000 2350 50  0001 C CNN
	1    9000 2350
	1    0    0    -1  
$EndComp
Text HLabel 4450 2250 0    50   Input ~ 0
LC[0..9]
Wire Bus Line
	4500 2250 4450 2250
Text Notes 2900 4100 0    50   ~ 0
These buffers drive the data bus during BUSACK\nthe ~19k of memory is stored at location 0x8000-0xFFFF along with character rom\n\nLC0 is not used so as to create a line doubling effect
$Comp
L power:+5V #PWR0133
U 1 1 61E63555
P 8500 2050
F 0 "#PWR0133" H 8500 1900 50  0001 C CNN
F 1 "+5V" H 8515 2223 50  0000 C CNN
F 2 "" H 8500 2050 50  0001 C CNN
F 3 "" H 8500 2050 50  0001 C CNN
	1    8500 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0134
U 1 1 61E63E22
P 9000 2050
F 0 "#PWR0134" H 9000 1900 50  0001 C CNN
F 1 "+5V" H 9015 2223 50  0000 C CNN
F 2 "" H 9000 2050 50  0001 C CNN
F 3 "" H 9000 2050 50  0001 C CNN
	1    9000 2050
	1    0    0    -1  
$EndComp
Text HLabel 7050 1100 2    50   Output ~ 0
A[0..19]
Wire Bus Line
	6300 1100 7050 1100
Connection ~ 6300 1100
$Comp
L Device:R_Network06 RN4100
U 1 1 620116CC
P 7250 2100
F 0 "RN4100" V 6733 2100 50  0000 C CNN
F 1 ">= 10k" V 6824 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP7" V 7625 2100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7250 2100 50  0001 C CNN
	1    7250 2100
	0    1    1    0   
$EndComp
Entry Wire Line
	6650 1700 6750 1800
Entry Wire Line
	6650 1800 6750 1900
Entry Wire Line
	6650 1900 6750 2000
Entry Wire Line
	6650 2000 6750 2100
Entry Wire Line
	6650 2100 6750 2200
Wire Wire Line
	6750 1800 7050 1800
Wire Wire Line
	6750 1900 7050 1900
Wire Wire Line
	6750 2000 7050 2000
Wire Wire Line
	6750 2100 7050 2100
Wire Wire Line
	6750 2200 7050 2200
Text Label 6850 1800 0    50   ~ 0
A15
Text Label 6850 1900 0    50   ~ 0
A16
Text Label 6850 2000 0    50   ~ 0
A17
Text Label 6850 2100 0    50   ~ 0
A18
Text Label 6850 2200 0    50   ~ 0
A19
$Comp
L power:GND #PWR0179
U 1 1 6201643B
P 7450 1800
F 0 "#PWR0179" H 7450 1550 50  0001 C CNN
F 1 "GND" V 7455 1672 50  0000 R CNN
F 2 "" H 7450 1800 50  0001 C CNN
F 3 "" H 7450 1800 50  0001 C CNN
	1    7450 1800
	0    -1   -1   0   
$EndComp
Wire Bus Line
	4500 2250 4500 2300
Text Label 4700 2400 0    50   ~ 0
LC9
Wire Wire Line
	4600 2400 4900 2400
Entry Wire Line
	4500 2300 4600 2400
Wire Bus Line
	6300 1100 6300 2600
Wire Bus Line
	4500 1550 4500 2200
Wire Bus Line
	6650 1100 6650 2600
Wire Bus Line
	2000 1550 2000 2400
Wire Bus Line
	3800 1100 3800 2600
$EndSCHEMATC
