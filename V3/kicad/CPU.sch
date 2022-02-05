EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 12
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
L Device:C C?
U 1 1 61F12C46
P 3450 1450
AR Path="/61A26BC0/61F12C46" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F12C46" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F12C46" Ref="C?"  Part="1" 
F 0 "C?" H 3565 1496 50  0000 L CNN
F 1 "C" H 3565 1405 50  0000 L CNN
F 2 "" H 3488 1300 50  0001 C CNN
F 3 "~" H 3450 1450 50  0001 C CNN
	1    3450 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F12C4C
P 3450 1600
AR Path="/61F12C4C" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61F12C4C" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61F12C4C" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61F12C4C" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F12C4C" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F12C4C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 1350 50  0001 C CNN
F 1 "GND" H 3455 1427 50  0000 C CNN
F 2 "" H 3450 1600 50  0001 C CNN
F 3 "" H 3450 1600 50  0001 C CNN
	1    3450 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61F12C52
P 3450 1300
AR Path="/6191B6A2/61F12C52" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F12C52" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 1150 50  0001 C CNN
F 1 "+5V" H 3465 1473 50  0000 C CNN
F 2 "" H 3450 1300 50  0001 C CNN
F 3 "" H 3450 1300 50  0001 C CNN
	1    3450 1300
	1    0    0    -1  
$EndComp
$Comp
L CPU:Z80CPU U?
U 1 1 61F12C58
P 3450 3750
AR Path="/6191B6A2/61F12C58" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F12C58" Ref="U?"  Part="1" 
F 0 "U?" H 3450 5431 50  0000 C CNN
F 1 "Z80CPU" H 3450 5340 50  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 3450 5339 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 3450 4150 50  0001 C CNN
	1    3450 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4250 4300 4250
Wire Wire Line
	4150 4350 4300 4350
Wire Wire Line
	4150 4450 4300 4450
Wire Wire Line
	4150 4550 4300 4550
Wire Wire Line
	4150 4650 4300 4650
Wire Wire Line
	4150 4750 4300 4750
Wire Wire Line
	4150 4850 4300 4850
Wire Wire Line
	4150 4950 4300 4950
Wire Wire Line
	4150 2550 4300 2550
Wire Wire Line
	4150 2650 4300 2650
Wire Wire Line
	4150 2750 4300 2750
Wire Wire Line
	4150 2850 4300 2850
Wire Wire Line
	4150 2950 4300 2950
Wire Wire Line
	4150 3050 4300 3050
Wire Wire Line
	4150 3150 4300 3150
Wire Wire Line
	4150 3250 4300 3250
Wire Wire Line
	4150 3350 4300 3350
Wire Wire Line
	4150 3450 4300 3450
Wire Wire Line
	4150 3550 4300 3550
Wire Wire Line
	4150 3650 4300 3650
Wire Wire Line
	4150 3750 4300 3750
Wire Wire Line
	4150 3850 4300 3850
Wire Wire Line
	4150 3950 4300 3950
Wire Wire Line
	4150 4050 4300 4050
Entry Wire Line
	4300 2550 4400 2650
Entry Wire Line
	4300 2650 4400 2750
Entry Wire Line
	4300 2750 4400 2850
Entry Wire Line
	4300 2850 4400 2950
Entry Wire Line
	4300 2950 4400 3050
Entry Wire Line
	4300 3050 4400 3150
Entry Wire Line
	4300 3150 4400 3250
Entry Wire Line
	4300 3250 4400 3350
Entry Wire Line
	4300 3350 4400 3450
Entry Wire Line
	4300 3450 4400 3550
Entry Wire Line
	4300 3550 4400 3650
Entry Wire Line
	4300 3650 4400 3750
Entry Wire Line
	4300 3750 4400 3850
Entry Wire Line
	4300 3850 4400 3950
Entry Wire Line
	4300 3950 4400 4050
Entry Wire Line
	4300 4050 4400 4150
Entry Wire Line
	4300 4250 4400 4350
Entry Wire Line
	4300 4350 4400 4450
Entry Wire Line
	4300 4450 4400 4550
Entry Wire Line
	4300 4550 4400 4650
Entry Wire Line
	4300 4650 4400 4750
Entry Wire Line
	4300 4750 4400 4850
Entry Wire Line
	4300 4850 4400 4950
Entry Wire Line
	4300 4950 4400 5050
Wire Bus Line
	4400 2550 4550 2550
Wire Bus Line
	4400 5050 4500 5050
Text HLabel 2750 2550 0    50   Input ~ 0
RESET
$Comp
L power:+5V #PWR?
U 1 1 61F12C91
P 2750 3150
AR Path="/6191B6A2/61F12C91" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F12C91" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2750 3000 50  0001 C CNN
F 1 "+5V" V 2765 3278 50  0000 L CNN
F 2 "" H 2750 3150 50  0001 C CNN
F 3 "" H 2750 3150 50  0001 C CNN
	1    2750 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 4250 2600 4250
Wire Wire Line
	2750 4350 2600 4350
Wire Wire Line
	2750 4450 2600 4450
Wire Wire Line
	2750 4550 2600 4550
Text Label 2600 4250 0    50   ~ 0
RD
Text Label 2600 4350 0    50   ~ 0
WR
Text Label 2600 4450 0    50   ~ 0
MRQ
Text Label 2600 4550 0    50   ~ 0
IRQ
Wire Wire Line
	2750 3550 2600 3550
Wire Wire Line
	2750 3850 2600 3850
Text Label 2600 3550 0    50   ~ 0
M1
NoConn ~ 2750 3650
NoConn ~ 2750 3750
Text Label 2600 3850 0    50   ~ 0
HLT
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 61F17191
P 7900 3750
AR Path="/61F17191" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F17191" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F17191" Ref="U?"  Part="1" 
F 0 "U?" H 7900 4631 50  0000 C CNN
F 1 "GAL16V8" H 7900 4540 50  0000 C CNN
F 2 "" H 7900 3750 50  0001 C CNN
F 3 "" H 7900 3750 50  0001 C CNN
	1    7900 3750
	1    0    0    -1  
$EndComp
Text GLabel 9000 3050 2    50   Input ~ 0
ROM_CS
Text GLabel 9000 3150 2    50   Input ~ 0
RAM_CS
Text GLabel 9000 3250 2    50   Input ~ 0
ROM_OE
Text GLabel 9000 3350 2    50   Input ~ 0
RAM_OE
$Comp
L power:GND #PWR?
U 1 1 61F1719E
P 7900 4450
AR Path="/61F1719E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F1719E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/61F1719E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7900 4200 50  0001 C CNN
F 1 "GND" H 7905 4277 50  0000 C CNN
F 2 "" H 7900 4450 50  0001 C CNN
F 3 "" H 7900 4450 50  0001 C CNN
	1    7900 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3350 7150 3350
Wire Wire Line
	7400 3450 7150 3450
Wire Wire Line
	7400 3550 7150 3550
Wire Wire Line
	7400 3650 7150 3650
Wire Wire Line
	7400 3750 7150 3750
Wire Wire Line
	8650 3950 8400 3950
Wire Wire Line
	7400 3850 7150 3850
Text Label 7150 3350 0    50   ~ 0
RD
Text Label 7150 3450 0    50   ~ 0
WR
Text Label 7150 3550 0    50   ~ 0
MRQ
Text Label 7150 3650 0    50   ~ 0
IRQ
Text Label 7150 3750 0    50   ~ 0
BUSACK
Text Label 8650 3950 0    50   ~ 0
P2CLK
Text Label 7150 3850 0    50   ~ 0
M1
Text HLabel 4550 2550 2    50   Output ~ 0
A[0..15]
Text HLabel 4500 5050 2    50   BiDi ~ 0
D[0..7]
Text HLabel 2600 4250 0    50   Output ~ 0
RD
Text HLabel 2600 4350 0    50   Output ~ 0
WR
Text HLabel 2600 4450 0    50   Output ~ 0
MRQ
Text HLabel 2600 4550 0    50   Output ~ 0
IRQ
Text HLabel 2600 3550 0    50   Output ~ 0
M1
Text HLabel 2750 2850 0    50   Input ~ 0
CLK
Text HLabel 2600 3250 0    50   Input ~ 0
INT
Wire Wire Line
	2600 3250 2750 3250
Text HLabel 2500 4950 0    50   Output ~ 0
BSACK
Text HLabel 2500 4850 0    50   Input ~ 0
BSRQ
Text Label 2500 4950 0    50   ~ 0
BSACK
Wire Wire Line
	2500 4850 2750 4850
Wire Wire Line
	2500 4950 2750 4950
Text HLabel 8400 3250 2    50   Output ~ 0
SIO_EN
Text HLabel 8400 3350 2    50   Output ~ 0
CTC_EN
Text HLabel 8400 3450 2    50   Output ~ 0
PIO_EN
Text HLabel 8400 3850 2    50   Output ~ 0
nPS2_CLK
Wire Bus Line
	7050 3850 6900 3850
Text HLabel 6900 3850 0    50   Output ~ 0
A[0..15]
Entry Wire Line
	7150 3950 7050 3850
Entry Wire Line
	7150 4050 7050 3950
Wire Bus Line
	7050 3850 7050 3950
Wire Wire Line
	7150 3950 7400 3950
Wire Wire Line
	7150 4050 7400 4050
Text Label 7150 3950 0    50   ~ 0
A3
Text Label 7150 4050 0    50   ~ 0
A4
Wire Bus Line
	4400 4350 4400 5050
Wire Bus Line
	4400 2550 4400 4150
$EndSCHEMATC
