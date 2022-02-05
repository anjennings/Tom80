EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6350 1100 0    50   ~ 0
(800x600) / 4 = (400x300)\nDivide 40 MHz clock by 2 \nEach Byte contains 8 pixels\n(400x300)/8 = 14.6kb
Text Notes 2450 4400 0    50   ~ 0
0 - 399 Visible Area (Video Enable)\n400 - 419 Front Porch\n420 - 483 Pulse = (PC7 & C8 & (C6 | C5))\n484 - 527 Back Porch\n\n(Clock is 40MHz/2 so all values are 1/2\n1056 is divisible by 4 so maybe cut off lines 1 and 2?\n\nIf these chips can use variables then it may save some IO\n\nVIDEO_EN and CPU_EN should be used for a more complete CPU area
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 619BBF10
P 4750 2000
AR Path="/619BBF10" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF10" Ref="U?"  Part="1" 
F 0 "U?" H 4750 2881 50  0000 C CNN
F 1 "GAL16V8" H 4750 2790 50  0000 C CNN
F 2 "" H 4750 2000 50  0001 C CNN
F 3 "" H 4750 2000 50  0001 C CNN
	1    4750 2000
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4040 U?
U 1 1 619BBF19
P 2600 2000
AR Path="/619BBF19" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF19" Ref="U?"  Part="1" 
F 0 "U?" H 2600 2981 50  0000 C CNN
F 1 "4040" H 2600 2890 50  0000 C CNN
F 2 "" H 2600 2000 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4020bms-24bms-40bms.pdf" H 2600 2000 50  0001 C CNN
	1    2600 2000
	1    0    0    -1  
$EndComp
Text Notes 8150 3150 0    50   ~ 0
0 - 599 Visible Area\n600 Front Porch\n601 - 604 Pulse\n605 - 627 Back Porch
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 619BBF35
P 9600 2000
AR Path="/619BBF35" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF35" Ref="U?"  Part="1" 
F 0 "U?" H 9600 2881 50  0000 C CNN
F 1 "GAL16V8" H 9600 2790 50  0000 C CNN
F 2 "" H 9600 2000 50  0001 C CNN
F 3 "" H 9600 2000 50  0001 C CNN
	1    9600 2000
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4040 U?
U 1 1 619BBF3E
P 7450 2000
AR Path="/619BBF3E" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF3E" Ref="U?"  Part="1" 
F 0 "U?" H 7450 2981 50  0000 C CNN
F 1 "4040" H 7450 2890 50  0000 C CNN
F 2 "" H 7450 2000 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4020bms-24bms-40bms.pdf" H 7450 2000 50  0001 C CNN
	1    7450 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619BF87E
P 4750 2700
F 0 "#PWR?" H 4750 2450 50  0001 C CNN
F 1 "GND" H 4755 2527 50  0000 C CNN
F 2 "" H 4750 2700 50  0001 C CNN
F 3 "" H 4750 2700 50  0001 C CNN
	1    4750 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619BFDC1
P 2600 2900
F 0 "#PWR?" H 2600 2650 50  0001 C CNN
F 1 "GND" H 2605 2727 50  0000 C CNN
F 2 "" H 2600 2900 50  0001 C CNN
F 3 "" H 2600 2900 50  0001 C CNN
	1    2600 2900
	1    0    0    -1  
$EndComp
Entry Wire Line
	3500 1400 3400 1500
Entry Wire Line
	3500 1500 3400 1600
Entry Wire Line
	3500 1600 3400 1700
Entry Wire Line
	3500 1700 3400 1800
Entry Wire Line
	3500 1800 3400 1900
Entry Wire Line
	3500 1900 3400 2000
Entry Wire Line
	3500 2000 3400 2100
Entry Wire Line
	3500 2100 3400 2200
Entry Wire Line
	3500 2200 3400 2300
Entry Wire Line
	3500 2300 3400 2400
Wire Bus Line
	3500 800  3650 800 
Wire Bus Line
	3500 1150 3850 1150
Wire Bus Line
	3500 800  3500 1150
Text HLabel 3650 800  2    50   Output ~ 0
PC[0..9]
Text Label 3150 1500 0    50   ~ 0
PC0
Text Label 3150 1600 0    50   ~ 0
PC1
Text Label 3150 1700 0    50   ~ 0
PC2
Text Label 3150 1800 0    50   ~ 0
PC3
Text Label 3150 1900 0    50   ~ 0
PC4
Text Label 3150 2000 0    50   ~ 0
PC5
Text Label 3150 2100 0    50   ~ 0
PC6
Text Label 3150 2200 0    50   ~ 0
PC7
Text Label 3150 2300 0    50   ~ 0
PC8
Text Label 3150 2400 0    50   ~ 0
PC9
Wire Wire Line
	3100 1500 3400 1500
Wire Wire Line
	3100 1600 3400 1600
Wire Wire Line
	3100 1700 3400 1700
Wire Wire Line
	3100 1800 3400 1800
Wire Wire Line
	3100 1900 3400 1900
Wire Wire Line
	3100 2000 3400 2000
Wire Wire Line
	3100 2100 3400 2100
Wire Wire Line
	3100 2200 3400 2200
Wire Wire Line
	3100 2300 3400 2300
Wire Wire Line
	3100 2400 3400 2400
Entry Wire Line
	3850 1400 3950 1500
Entry Wire Line
	3850 1500 3950 1600
Entry Wire Line
	3850 1600 3950 1700
Entry Wire Line
	3850 1700 3950 1800
Entry Wire Line
	3850 1800 3950 1900
Entry Wire Line
	3850 1900 3950 2000
Entry Wire Line
	3850 2000 3950 2100
Entry Wire Line
	3850 2100 3950 2200
Text Label 4000 1500 0    50   ~ 0
PC2
Text Label 4000 1600 0    50   ~ 0
PC3
Text Label 4000 1700 0    50   ~ 0
PC4
Text Label 4000 1800 0    50   ~ 0
PC5
Text Label 4000 1900 0    50   ~ 0
PC6
Text Label 4000 2000 0    50   ~ 0
PC7
Text Label 4000 2100 0    50   ~ 0
PC8
Text Label 4000 2200 0    50   ~ 0
PC9
Wire Wire Line
	3950 1500 4250 1500
Wire Wire Line
	3950 1600 4250 1600
Wire Wire Line
	3950 1700 4250 1700
Wire Wire Line
	3950 1800 4250 1800
Wire Wire Line
	3950 1900 4250 1900
Wire Wire Line
	3950 2000 4250 2000
Wire Wire Line
	3950 2100 4250 2100
Wire Wire Line
	3950 2200 4250 2200
Connection ~ 3500 1150
Wire Wire Line
	5250 1800 5500 1800
Wire Wire Line
	5500 3350 1850 3350
Wire Wire Line
	1850 3350 1850 1800
Wire Wire Line
	1850 1800 2100 1800
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 619D14D4
P 1400 1500
AR Path="/619D14D4" Ref="X?"  Part="1" 
AR Path="/619B58B4/619D14D4" Ref="X?"  Part="1" 
F 0 "X?" H 1057 1546 50  0000 R CNN
F 1 "ACO-xxxMHz" H 1057 1455 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 1850 1150 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 1300 1500 50  0001 C CNN
	1    1400 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 619D14DA
P 1400 1200
AR Path="/619D14DA" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/619D14DA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1400 1050 50  0001 C CNN
F 1 "+5V" H 1415 1373 50  0000 C CNN
F 2 "" H 1400 1200 50  0001 C CNN
F 3 "" H 1400 1200 50  0001 C CNN
	1    1400 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619D14E0
P 1400 1800
AR Path="/619D14E0" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/619D14E0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1400 1550 50  0001 C CNN
F 1 "GND" H 1405 1627 50  0000 C CNN
F 2 "" H 1400 1800 50  0001 C CNN
F 3 "" H 1400 1800 50  0001 C CNN
	1    1400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1500 2100 1500
Wire Wire Line
	5250 1600 6200 1600
Wire Wire Line
	6200 1600 6200 1500
Wire Wire Line
	6200 1500 6950 1500
Wire Wire Line
	6950 1800 6750 1800
Wire Wire Line
	6750 1800 6750 3300
$Comp
L power:GND #PWR?
U 1 1 619E1F40
P 7450 2900
F 0 "#PWR?" H 7450 2650 50  0001 C CNN
F 1 "GND" H 7455 2727 50  0000 C CNN
F 2 "" H 7450 2900 50  0001 C CNN
F 3 "" H 7450 2900 50  0001 C CNN
	1    7450 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619E26A6
P 9600 2700
F 0 "#PWR?" H 9600 2450 50  0001 C CNN
F 1 "GND" H 9605 2527 50  0000 C CNN
F 2 "" H 9600 2700 50  0001 C CNN
F 3 "" H 9600 2700 50  0001 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
Entry Wire Line
	8350 1400 8250 1500
Entry Wire Line
	8350 1500 8250 1600
Entry Wire Line
	8350 1600 8250 1700
Entry Wire Line
	8350 1700 8250 1800
Entry Wire Line
	8350 1800 8250 1900
Entry Wire Line
	8350 1900 8250 2000
Entry Wire Line
	8350 2000 8250 2100
Entry Wire Line
	8350 2100 8250 2200
Entry Wire Line
	8350 2200 8250 2300
Entry Wire Line
	8350 2300 8250 2400
Wire Bus Line
	8350 800  8500 800 
Wire Bus Line
	8350 1150 8700 1150
Wire Bus Line
	8350 800  8350 1150
Text HLabel 8500 800  2    50   Output ~ 0
LC[0..9]
Text Label 8000 1500 0    50   ~ 0
LC0
Text Label 8000 1600 0    50   ~ 0
LC1
Text Label 8000 1700 0    50   ~ 0
LC2
Text Label 8000 1800 0    50   ~ 0
LC3
Text Label 8000 1900 0    50   ~ 0
LC4
Text Label 8000 2000 0    50   ~ 0
LC5
Text Label 8000 2100 0    50   ~ 0
LC6
Text Label 8000 2200 0    50   ~ 0
LC7
Text Label 8000 2300 0    50   ~ 0
LC8
Text Label 8000 2400 0    50   ~ 0
LC9
Wire Wire Line
	7950 1500 8250 1500
Wire Wire Line
	7950 1600 8250 1600
Wire Wire Line
	7950 1700 8250 1700
Wire Wire Line
	7950 1800 8250 1800
Wire Wire Line
	7950 1900 8250 1900
Wire Wire Line
	7950 2000 8250 2000
Wire Wire Line
	7950 2100 8250 2100
Wire Wire Line
	7950 2200 8250 2200
Wire Wire Line
	7950 2300 8250 2300
Wire Wire Line
	7950 2400 8250 2400
Entry Wire Line
	8700 1400 8800 1500
Entry Wire Line
	8700 1500 8800 1600
Entry Wire Line
	8700 1600 8800 1700
Entry Wire Line
	8700 1700 8800 1800
Entry Wire Line
	8700 1800 8800 1900
Entry Wire Line
	8700 1900 8800 2000
Entry Wire Line
	8700 2000 8800 2100
Entry Wire Line
	8700 2100 8800 2200
Text Label 8850 1500 0    50   ~ 0
LC0
Text Label 8850 1600 0    50   ~ 0
LC1
Text Label 8850 1700 0    50   ~ 0
LC2
Text Label 8850 1800 0    50   ~ 0
LC3
Text Label 8850 1900 0    50   ~ 0
LC4
Text Label 8850 2000 0    50   ~ 0
LC5
Text Label 8850 2100 0    50   ~ 0
LC6
Wire Wire Line
	8800 1500 9100 1500
Wire Wire Line
	8800 1600 9100 1600
Wire Wire Line
	8800 1700 9100 1700
Wire Wire Line
	8800 1800 9100 1800
Wire Wire Line
	8800 1900 9100 1900
Wire Wire Line
	8800 2000 9100 2000
Wire Wire Line
	8800 2100 9100 2100
Wire Wire Line
	8800 2200 9100 2200
Connection ~ 8350 1150
Entry Wire Line
	8700 2100 8800 2200
Entry Wire Line
	8700 2200 8800 2300
Entry Wire Line
	8700 2300 8800 2400
Wire Wire Line
	8800 2300 9100 2300
Wire Wire Line
	8800 2400 9100 2400
Text Label 8850 2200 0    50   ~ 0
LC7
Text Label 8850 2300 0    50   ~ 0
LC8
Text Label 8850 2400 0    50   ~ 0
LC9
Wire Wire Line
	6750 3300 10400 3300
Text HLabel 6150 1500 0    50   Output ~ 0
V_SYNC
Wire Wire Line
	6150 1500 6200 1500
Connection ~ 6200 1500
Text HLabel 10100 1500 2    50   Output ~ 0
H_SYNC
Text HLabel 10700 1700 2    50   Output ~ 0
CPU_EN
Text HLabel 5250 1500 2    50   Output ~ 0
VIDEO_EN
Text HLabel 4250 2300 0    50   Input ~ 0
RESET
Text HLabel 10100 1600 2    50   Input ~ 0
RESET
Wire Wire Line
	10100 1800 10400 1800
Wire Wire Line
	10400 1800 10400 3300
Wire Wire Line
	10100 1700 10550 1700
Wire Wire Line
	10550 1700 10550 3450
Wire Wire Line
	6100 3450 6100 1700
Connection ~ 10550 1700
Wire Wire Line
	10550 1700 10700 1700
Wire Wire Line
	5500 1800 5500 3350
Wire Wire Line
	6100 1700 5250 1700
Wire Wire Line
	6100 3450 10550 3450
Wire Bus Line
	3850 1150 3850 2100
Wire Bus Line
	3500 1150 3500 2300
Wire Bus Line
	8350 1150 8350 2300
Wire Bus Line
	8700 1150 8700 2300
Text Notes 1300 7050 0    197  ~ 39
This page has NOT been checked!
$EndSCHEMATC
