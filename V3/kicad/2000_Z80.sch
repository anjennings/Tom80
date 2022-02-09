EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1150 7250 0    197  ~ 39
This page has NOT been checked!
$Comp
L Oscillator:ACO-xxxMHz X2000
U 1 1 61E80A40
P 1900 3700
F 0 "X2000" H 1557 3746 50  0000 R CNN
F 1 "ACO-10.000MHz" H 1557 3655 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2350 3350 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 1800 3700 50  0001 C CNN
	1    1900 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 61E80A46
P 1900 3400
F 0 "#PWR0108" H 1900 3250 50  0001 C CNN
F 1 "+5V" H 1915 3573 50  0000 C CNN
F 2 "" H 1900 3400 50  0001 C CNN
F 3 "" H 1900 3400 50  0001 C CNN
	1    1900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 61E80A4C
P 1900 4000
F 0 "#PWR0109" H 1900 3750 50  0001 C CNN
F 1 "GND" H 1905 3827 50  0000 C CNN
F 2 "" H 1900 4000 50  0001 C CNN
F 3 "" H 1900 4000 50  0001 C CNN
	1    1900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3700 2450 3700
Text Label 2450 3700 0    50   ~ 0
CLK
$Sheet
S 4400 3300 900  1100
U 61EBDADB
F0 "2100_ALTCPU" 50
F1 "2100_ALTCPU.sch" 50
F2 "RESET" I L 4400 3400 50 
F3 "BUSRQ" I L 4400 3500 50 
F4 "INT" I L 4400 3600 50 
F5 "D[0..7]" B R 5300 3500 50 
F6 "A[0..19]" T R 5300 3400 50 
F7 "MREQ" O R 5300 3700 50 
F8 "BUSAK" O R 5300 3900 50 
F9 "ST" O R 5300 4200 50 
F10 "M1" O R 5300 4300 50 
F11 "IORQ" O R 5300 4000 50 
F12 "RD" O R 5300 4100 50 
F13 "WR" O R 5300 3800 50 
F14 "CLK" I L 4400 3700 50 
$EndSheet
$Sheet
S 6450 3300 850  1150
U 61F28B7D
F0 "2200_PERP_ALT" 50
F1 "2200_PERP_ALT.sch" 50
F2 "RESET" I L 6450 3700 50 
F3 "A[0..19]" I L 6450 3400 50 
F4 "D[0..7]" B L 6450 3500 50 
F5 "RW" I L 6450 3800 50 
F6 "CLK" I L 6450 3900 50 
F7 "CS" I L 6450 4000 50 
$EndSheet
Wire Wire Line
	6450 3900 6200 3900
Text Label 6200 3900 0    50   ~ 0
CLK
Text HLabel 5650 4300 2    50   Output ~ 0
M1
Text HLabel 5650 4200 2    50   Output ~ 0
ST
Text HLabel 5650 4100 2    50   Output ~ 0
RD
Text HLabel 5650 4000 2    50   Output ~ 0
IORQ
Text HLabel 5650 3900 2    50   Output ~ 0
BUSACK
Text HLabel 5650 3800 2    50   Output ~ 0
WR
Text HLabel 5650 3700 2    50   Output ~ 0
MREQ
Wire Wire Line
	5300 3900 5650 3900
Wire Wire Line
	5300 3800 5650 3800
Wire Wire Line
	5300 3700 5650 3700
Wire Wire Line
	5300 4000 5650 4000
Wire Wire Line
	5300 4100 5650 4100
Wire Wire Line
	5300 4200 5650 4200
Wire Wire Line
	5300 4300 5650 4300
Text Label 5450 4000 0    50   ~ 0
IORQ
Wire Wire Line
	6200 3800 6450 3800
Wire Wire Line
	6200 4000 6450 4000
Text Label 6200 4000 0    50   ~ 0
IORQ
Text Label 5500 3800 0    50   ~ 0
WR
Text Label 6200 3800 0    50   ~ 0
WR
Wire Bus Line
	5300 3400 5400 3400
Wire Bus Line
	5400 3400 5400 3150
Wire Bus Line
	5400 3150 5150 3150
Wire Bus Line
	5300 3500 5500 3500
Wire Bus Line
	5500 3500 5500 3050
Wire Bus Line
	5500 3050 5150 3050
Wire Bus Line
	5500 3500 6450 3500
Connection ~ 5500 3500
Wire Bus Line
	5400 3400 6450 3400
Connection ~ 5400 3400
Text HLabel 5150 3050 0    50   3State ~ 0
A[0..19]
Text HLabel 5150 3150 0    50   3State ~ 0
D[0..7]
Text Notes 4900 4850 0    50   ~ 0
Some key signals need to be tied high during BUSASK
Wire Wire Line
	4400 3700 4150 3700
Text Label 4150 3700 0    50   ~ 0
CLK
Text HLabel 4400 3400 0    50   Input ~ 0
RESET
Text HLabel 6450 3700 0    50   Input ~ 0
RESET
$EndSCHEMATC
