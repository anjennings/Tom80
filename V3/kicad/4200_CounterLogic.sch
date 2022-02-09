EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 10
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5750 1050 0    50   ~ 0
(800x600) / 4 = (400x300)\nDivide 40 MHz clock by 2 \nEach Byte contains 8 pixels\n(512x300)/8 = 18.75kb
Text Notes 2800 4450 0    50   ~ 0
0 - 399 Visible Area (Video Enable)\n400 - 419 Front Porch\n420 - 483 Pulse = (PC7 & C8 & (C6 | C5))\n484 - 527 Back Porch\n\n(Clock is 40MHz/2 so all values are 1/2\nAll values are divisible by 4 so that makes it even easier\n\nReset still needs all lines for most accurate signal\n\nH_VIS signals that the visible area has passed\nH_RST resets the 4040 count
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 619BBF10
P 4750 2000
AR Path="/619BBF10" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF10" Ref="U601"  Part="1" 
AR Path="/61E50944/61E514A1/619BBF10" Ref="U4202"  Part="1" 
F 0 "U4202" H 4750 2881 50  0000 C CNN
F 1 "GAL16V8" H 4750 2790 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 4750 2000 50  0001 C CNN
F 3 "" H 4750 2000 50  0001 C CNN
	1    4750 2000
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4040 U?
U 1 1 619BBF19
P 2600 2000
AR Path="/619BBF19" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF19" Ref="U600"  Part="1" 
AR Path="/61E50944/61E514A1/619BBF19" Ref="U4200"  Part="1" 
F 0 "U4200" H 2600 2981 50  0000 C CNN
F 1 "4040" H 2600 2890 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2600 2000 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4020bms-24bms-40bms.pdf" H 2600 2000 50  0001 C CNN
	1    2600 2000
	1    0    0    -1  
$EndComp
Text Notes 8000 3550 0    50   ~ 0
0 - 599 Visible Area\n600 Front Porch\n601 - 604 Pulse\n605 - 627 Back Porch\n\nH_VIS + lines past the visible area = CPU_EN
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 619BBF35
P 9600 2000
AR Path="/619BBF35" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF35" Ref="U603"  Part="1" 
AR Path="/61E50944/61E514A1/619BBF35" Ref="U4203"  Part="1" 
F 0 "U4203" H 9600 2881 50  0000 C CNN
F 1 "GAL16V8" H 9600 2790 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 9600 2000 50  0001 C CNN
F 3 "" H 9600 2000 50  0001 C CNN
	1    9600 2000
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4040 U?
U 1 1 619BBF3E
P 7450 2000
AR Path="/619BBF3E" Ref="U?"  Part="1" 
AR Path="/619B58B4/619BBF3E" Ref="U602"  Part="1" 
AR Path="/61E50944/61E514A1/619BBF3E" Ref="U4201"  Part="1" 
F 0 "U4201" H 7450 2981 50  0000 C CNN
F 1 "4040" H 7450 2890 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 7450 2000 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4020bms-24bms-40bms.pdf" H 7450 2000 50  0001 C CNN
	1    7450 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 619BF87E
P 4750 2700
F 0 "#PWR0135" H 4750 2450 50  0001 C CNN
F 1 "GND" H 4755 2527 50  0000 C CNN
F 2 "" H 4750 2700 50  0001 C CNN
F 3 "" H 4750 2700 50  0001 C CNN
	1    4750 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 619BFDC1
P 2600 2900
F 0 "#PWR0136" H 2600 2650 50  0001 C CNN
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
Entry Wire Line
	3850 2200 3950 2300
Entry Wire Line
	3850 2300 3950 2400
Text Label 4000 1700 0    50   ~ 0
PC2
Text Label 4000 1800 0    50   ~ 0
PC3
Text Label 4000 1900 0    50   ~ 0
PC4
Text Label 4000 2000 0    50   ~ 0
PC5
Text Label 4000 2100 0    50   ~ 0
PC6
Text Label 4000 2200 0    50   ~ 0
PC7
Text Label 4000 2300 0    50   ~ 0
PC8
Text Label 4000 2400 0    50   ~ 0
PC9
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
Wire Wire Line
	3950 2300 4250 2300
Wire Wire Line
	3950 2400 4250 2400
Connection ~ 3500 1150
$Comp
L power:+5V #PWR?
U 1 1 619D14DA
P 1950 900
AR Path="/619D14DA" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/619D14DA" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/619D14DA" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 1950 750 50  0001 C CNN
F 1 "+5V" H 1965 1073 50  0000 C CNN
F 2 "" H 1950 900 50  0001 C CNN
F 3 "" H 1950 900 50  0001 C CNN
	1    1950 900 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619D14E0
P 1350 900
AR Path="/619D14E0" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/619D14E0" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/619D14E0" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 1350 650 50  0001 C CNN
F 1 "GND" H 1355 727 50  0000 C CNN
F 2 "" H 1350 900 50  0001 C CNN
F 3 "" H 1350 900 50  0001 C CNN
	1    1350 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 1500 5550 1500
Wire Wire Line
	6950 1800 6750 1800
$Comp
L power:GND #PWR0139
U 1 1 619E1F40
P 7450 2900
F 0 "#PWR0139" H 7450 2650 50  0001 C CNN
F 1 "GND" H 7455 2727 50  0000 C CNN
F 2 "" H 7450 2900 50  0001 C CNN
F 3 "" H 7450 2900 50  0001 C CNN
	1    7450 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0140
U 1 1 619E26A6
P 9600 2700
F 0 "#PWR0140" H 9600 2450 50  0001 C CNN
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
Text HLabel 10100 1500 2    50   Output ~ 0
H_SYNC
Text HLabel 10100 1700 2    50   Output ~ 0
CPU_EN
Text HLabel 5250 2200 2    50   Input ~ 0
RESET
Text HLabel 10100 1600 2    50   Input ~ 0
RESET
Wire Wire Line
	10100 1900 10400 1900
Text Notes 1300 7050 0    197  ~ 39
This page has NOT been checked!
$Comp
L Device:C C?
U 1 1 619265E5
P 6850 4200
AR Path="/61A26BC0/619265E5" Ref="C?"  Part="1" 
AR Path="/619B58B4/619265E5" Ref="C600"  Part="1" 
AR Path="/61E50944/61E514A1/619265E5" Ref="C4200"  Part="1" 
F 0 "C4200" H 6965 4246 50  0000 L CNN
F 1 "C" H 6965 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6888 4050 50  0001 C CNN
F 3 "~" H 6850 4200 50  0001 C CNN
	1    6850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 619265F1
P 6850 4350
AR Path="/619265F1" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/619265F1" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/619265F1" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/619265F1" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/619265F1" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/619265F1" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 6850 4100 50  0001 C CNN
F 1 "GND" H 6855 4177 50  0000 C CNN
F 2 "" H 6850 4350 50  0001 C CNN
F 3 "" H 6850 4350 50  0001 C CNN
	1    6850 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 619265F7
P 7350 4200
AR Path="/61A26BC0/619265F7" Ref="C?"  Part="1" 
AR Path="/619B58B4/619265F7" Ref="C601"  Part="1" 
AR Path="/61E50944/61E514A1/619265F7" Ref="C4201"  Part="1" 
F 0 "C4201" H 7465 4246 50  0000 L CNN
F 1 "C" H 7465 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7388 4050 50  0001 C CNN
F 3 "~" H 7350 4200 50  0001 C CNN
	1    7350 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61926603
P 7350 4350
AR Path="/61926603" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61926603" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61926603" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61926603" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/61926603" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/61926603" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 7350 4100 50  0001 C CNN
F 1 "GND" H 7355 4177 50  0000 C CNN
F 2 "" H 7350 4350 50  0001 C CNN
F 3 "" H 7350 4350 50  0001 C CNN
	1    7350 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61928F88
P 7850 4200
AR Path="/61A26BC0/61928F88" Ref="C?"  Part="1" 
AR Path="/619B58B4/61928F88" Ref="C602"  Part="1" 
AR Path="/61E50944/61E514A1/61928F88" Ref="C4202"  Part="1" 
F 0 "C4202" H 7965 4246 50  0000 L CNN
F 1 "C" H 7965 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7888 4050 50  0001 C CNN
F 3 "~" H 7850 4200 50  0001 C CNN
	1    7850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61928F94
P 7850 4350
AR Path="/61928F94" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61928F94" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61928F94" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61928F94" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/61928F94" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/61928F94" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 7850 4100 50  0001 C CNN
F 1 "GND" H 7855 4177 50  0000 C CNN
F 2 "" H 7850 4350 50  0001 C CNN
F 3 "" H 7850 4350 50  0001 C CNN
	1    7850 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61928F9A
P 8350 4200
AR Path="/61A26BC0/61928F9A" Ref="C?"  Part="1" 
AR Path="/619B58B4/61928F9A" Ref="C603"  Part="1" 
AR Path="/61E50944/61E514A1/61928F9A" Ref="C4203"  Part="1" 
F 0 "C4203" H 8465 4246 50  0000 L CNN
F 1 "C" H 8465 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 8388 4050 50  0001 C CNN
F 3 "~" H 8350 4200 50  0001 C CNN
	1    8350 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61928FA6
P 8350 4350
AR Path="/61928FA6" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61928FA6" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61928FA6" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61928FA6" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/61928FA6" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/61928FA6" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 8350 4100 50  0001 C CNN
F 1 "GND" H 8355 4177 50  0000 C CNN
F 2 "" H 8350 4350 50  0001 C CNN
F 3 "" H 8350 4350 50  0001 C CNN
	1    8350 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6192BEC7
P 8850 4200
AR Path="/61A26BC0/6192BEC7" Ref="C?"  Part="1" 
AR Path="/619B58B4/6192BEC7" Ref="C604"  Part="1" 
AR Path="/61E50944/61E514A1/6192BEC7" Ref="C4204"  Part="1" 
F 0 "C4204" H 8965 4246 50  0000 L CNN
F 1 "C" H 8965 4155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 8888 4050 50  0001 C CNN
F 3 "~" H 8850 4200 50  0001 C CNN
	1    8850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6192BED3
P 8850 4350
AR Path="/6192BED3" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/6192BED3" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/6192BED3" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/6192BED3" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/6192BED3" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/6192BED3" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 8850 4100 50  0001 C CNN
F 1 "GND" H 8855 4177 50  0000 C CNN
F 2 "" H 8850 4350 50  0001 C CNN
F 3 "" H 8850 4350 50  0001 C CNN
	1    8850 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1500 5550 1300
$Comp
L power:+5V #PWR0146
U 1 1 61E5C073
P 6850 4050
F 0 "#PWR0146" H 6850 3900 50  0001 C CNN
F 1 "+5V" H 6865 4223 50  0000 C CNN
F 2 "" H 6850 4050 50  0001 C CNN
F 3 "" H 6850 4050 50  0001 C CNN
	1    6850 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0147
U 1 1 61E5C94A
P 7350 4050
F 0 "#PWR0147" H 7350 3900 50  0001 C CNN
F 1 "+5V" H 7365 4223 50  0000 C CNN
F 2 "" H 7350 4050 50  0001 C CNN
F 3 "" H 7350 4050 50  0001 C CNN
	1    7350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0148
U 1 1 61E5E29C
P 7850 4050
F 0 "#PWR0148" H 7850 3900 50  0001 C CNN
F 1 "+5V" H 7865 4223 50  0000 C CNN
F 2 "" H 7850 4050 50  0001 C CNN
F 3 "" H 7850 4050 50  0001 C CNN
	1    7850 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0149
U 1 1 61E5FC58
P 8350 4050
F 0 "#PWR0149" H 8350 3900 50  0001 C CNN
F 1 "+5V" H 8365 4223 50  0000 C CNN
F 2 "" H 8350 4050 50  0001 C CNN
F 3 "" H 8350 4050 50  0001 C CNN
	1    8350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0150
U 1 1 61E61411
P 8850 4050
F 0 "#PWR0150" H 8850 3900 50  0001 C CNN
F 1 "+5V" H 8865 4223 50  0000 C CNN
F 2 "" H 8850 4050 50  0001 C CNN
F 3 "" H 8850 4050 50  0001 C CNN
	1    8850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1700 5700 1700
Text Label 4000 1500 0    50   ~ 0
PC0
Text Label 4000 1600 0    50   ~ 0
PC1
Wire Wire Line
	3950 1500 4250 1500
Wire Wire Line
	3950 1600 4250 1600
Entry Wire Line
	3850 1400 3950 1500
Entry Wire Line
	3850 1500 3950 1600
Wire Wire Line
	5550 1300 5650 1300
Text HLabel 5650 1300 2    50   Output ~ 0
V_SYNC
Connection ~ 5550 1500
Wire Wire Line
	5550 1500 6950 1500
Text Label 5700 1600 2    50   ~ 0
H_VIS
Text Label 5700 1700 2    50   ~ 0
H_RST
Wire Wire Line
	5250 1600 5700 1600
Text Label 10400 1800 2    50   ~ 0
H_VIS
Text Label 10200 1900 0    50   ~ 0
V_RST
Text Label 1700 1800 0    50   ~ 0
H_RST
Wire Wire Line
	1650 1200 1650 1500
Wire Wire Line
	1650 1500 2100 1500
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 619D14D4
P 1650 900
AR Path="/619D14D4" Ref="X?"  Part="1" 
AR Path="/619B58B4/619D14D4" Ref="X600"  Part="1" 
AR Path="/61E50944/61E514A1/619D14D4" Ref="X4200"  Part="1" 
F 0 "X4200" V 1307 946 50  0000 L CNN
F 1 "ACO-20.000MHz" V 1307 855 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 2100 550 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 1550 900 50  0001 C CNN
	1    1650 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 1800 2100 1800
Text Label 6750 1800 0    50   ~ 0
V_RST
$Comp
L power:+5V #PWR?
U 1 1 6203FB41
P 2600 1200
AR Path="/6203FB41" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/6203FB41" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/6203FB41" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 2600 1050 50  0001 C CNN
F 1 "+5V" H 2615 1373 50  0000 C CNN
F 2 "" H 2600 1200 50  0001 C CNN
F 3 "" H 2600 1200 50  0001 C CNN
	1    2600 1200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62041750
P 4750 1300
AR Path="/62041750" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/62041750" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/62041750" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 4750 1150 50  0001 C CNN
F 1 "+5V" H 4765 1473 50  0000 C CNN
F 2 "" H 4750 1300 50  0001 C CNN
F 3 "" H 4750 1300 50  0001 C CNN
	1    4750 1300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6204320C
P 7450 1200
AR Path="/6204320C" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/6204320C" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/6204320C" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 7450 1050 50  0001 C CNN
F 1 "+5V" H 7465 1373 50  0000 C CNN
F 2 "" H 7450 1200 50  0001 C CNN
F 3 "" H 7450 1200 50  0001 C CNN
	1    7450 1200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62044C3E
P 9600 1300
AR Path="/62044C3E" Ref="#PWR?"  Part="1" 
AR Path="/619B58B4/62044C3E" Ref="#PWR?"  Part="1" 
AR Path="/61E50944/61E514A1/62044C3E" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 9600 1150 50  0001 C CNN
F 1 "+5V" H 9615 1473 50  0000 C CNN
F 2 "" H 9600 1300 50  0001 C CNN
F 3 "" H 9600 1300 50  0001 C CNN
	1    9600 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 1800 10400 1800
Wire Bus Line
	3850 1150 3850 2300
Wire Bus Line
	8700 1150 8700 2300
Wire Bus Line
	8350 1150 8350 2300
Wire Bus Line
	3500 1150 3500 2300
$EndSCHEMATC