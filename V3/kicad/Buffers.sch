EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 9
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
AR Path="/61A26BC0/61A295C4" Ref="U?"  Part="1" 
F 0 "U?" H 5400 3281 50  0000 R CNN
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
AR Path="/61A26BC0/61A295D1" Ref="U?"  Part="1" 
F 0 "U?" H 2900 3281 50  0000 R CNN
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
	6300 2600 6200 2500
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
	6200 2500 5900 2500
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
Text Label 5950 2500 0    50   ~ 0
A15
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
F 0 "#PWR?" H 2900 2850 50  0001 C CNN
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
F 0 "#PWR?" H 5400 2850 50  0001 C CNN
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
$Comp
L power:GND #PWR?
U 1 1 61A29619
P 4700 2400
AR Path="/61A29619" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61A29619" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4700 2150 50  0001 C CNN
F 1 "GND" H 4705 2227 50  0000 C CNN
F 2 "" H 4700 2400 50  0001 C CNN
F 3 "" H 4700 2400 50  0001 C CNN
	1    4700 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 2400 4900 2400
Entry Wire Line
	3800 2000 3700 1900
Text Label 3450 1900 0    50   ~ 0
A7
Wire Wire Line
	3700 1900 3400 1900
Wire Bus Line
	6300 1100 6450 1100
Text HLabel 4900 2700 0    50   Input ~ 0
E1
Text HLabel 4900 2800 0    50   Input ~ 0
E2
Text HLabel 2400 2700 0    50   Input ~ 0
E1
Text HLabel 2400 2800 0    50   Input ~ 0
E2
Text HLabel 6450 1100 2    50   Output ~ 0
A[0..15]
$Comp
L power:+5V #PWR?
U 1 1 61A337E7
P 5400 1500
F 0 "#PWR?" H 5400 1350 50  0001 C CNN
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
F 0 "#PWR?" H 2900 1350 50  0001 C CNN
F 1 "+5V" V 2915 1628 50  0000 L CNN
F 2 "" H 2900 1500 50  0001 C CNN
F 3 "" H 2900 1500 50  0001 C CNN
	1    2900 1500
	0    1    1    0   
$EndComp
Text HLabel 4900 2500 0    50   Input ~ 0
PU0
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
Connection ~ 6300 1100
Wire Bus Line
	4450 1550 4500 1550
Text Notes 1200 7300 0    197  ~ 39
This page has NOT been checked!
Wire Bus Line
	6300 1100 6300 2600
Wire Bus Line
	4500 1550 4500 2200
Wire Bus Line
	2000 1550 2000 2400
Wire Bus Line
	3800 1100 3800 2600
$EndSCHEMATC
