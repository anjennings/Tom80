EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
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
L Timer:LM555xM U?
U 1 1 624C743E
P 5800 4050
AR Path="/624C743E" Ref="U?"  Part="1" 
AR Path="/62497D60/624C743E" Ref="U?"  Part="1" 
AR Path="/61D852D7/624C743E" Ref="U?"  Part="1" 
F 0 "U?" H 5800 4631 50  0000 L TNN
F 1 "LM555xM" H 5800 4540 50  0000 L TNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6650 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 6650 3650 50  0001 C CNN
	1    5800 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 624C7444
P 5800 4700
AR Path="/624C7444" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/624C7444" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/624C7444" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 4450 50  0001 C CNN
F 1 "GND" H 5805 4527 50  0000 C CNN
F 2 "" H 5800 4700 50  0001 C CNN
F 3 "" H 5800 4700 50  0001 C CNN
	1    5800 4700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 624C744A
P 4350 3850
AR Path="/624C744A" Ref="SW?"  Part="1" 
AR Path="/62497D60/624C744A" Ref="SW?"  Part="1" 
AR Path="/61D852D7/624C744A" Ref="SW?"  Part="1" 
F 0 "SW?" H 4350 4135 50  0000 C CNN
F 1 "SW_Push" H 4350 4044 50  0000 C CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "~" H 4350 4050 50  0001 C CNN
	1    4350 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 624C7450
P 5800 3350
AR Path="/624C7450" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/624C7450" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/624C7450" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 3200 50  0001 C CNN
F 1 "VCC" H 5815 3523 50  0000 C CNN
F 2 "" H 5800 3350 50  0001 C CNN
F 3 "" H 5800 3350 50  0001 C CNN
	1    5800 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 624C7456
P 5200 4550
AR Path="/624C7456" Ref="C?"  Part="1" 
AR Path="/62497D60/624C7456" Ref="C?"  Part="1" 
AR Path="/61D852D7/624C7456" Ref="C?"  Part="1" 
F 0 "C?" H 5315 4596 50  0000 L CNN
F 1 "C" H 5315 4505 50  0000 L CNN
F 2 "" H 5238 4400 50  0001 C CNN
F 3 "~" H 5200 4550 50  0001 C CNN
	1    5200 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4450 5800 4700
Wire Wire Line
	4150 4700 4150 3850
Connection ~ 5800 4700
Wire Wire Line
	6300 3850 6700 3850
Wire Wire Line
	6700 3850 6700 3550
Wire Wire Line
	6300 4050 6700 4050
Wire Wire Line
	6700 4050 6700 3850
Connection ~ 6700 3850
Wire Wire Line
	6300 4250 6700 4250
Wire Wire Line
	6700 4250 6700 4050
Connection ~ 6700 4050
$Comp
L Device:C C?
U 1 1 624C7467
P 6700 4550
AR Path="/624C7467" Ref="C?"  Part="1" 
AR Path="/62497D60/624C7467" Ref="C?"  Part="1" 
AR Path="/61D852D7/624C7467" Ref="C?"  Part="1" 
F 0 "C?" H 6815 4596 50  0000 L CNN
F 1 "C" H 6815 4505 50  0000 L CNN
F 2 "" H 6738 4400 50  0001 C CNN
F 3 "~" H 6700 4550 50  0001 C CNN
	1    6700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4700 6700 4700
Connection ~ 6700 4250
Wire Wire Line
	6700 4250 6700 4400
Wire Wire Line
	5300 4050 5200 4050
Wire Wire Line
	5200 4050 5200 4400
Wire Wire Line
	5300 4250 5000 4250
Wire Wire Line
	5200 4700 5800 4700
Wire Wire Line
	5000 3350 5800 3350
Wire Wire Line
	4550 3850 4750 3850
Wire Wire Line
	5250 3850 5250 3700
Wire Wire Line
	5250 3850 5300 3850
Wire Wire Line
	5800 3350 5800 3650
Connection ~ 5800 3350
Text HLabel 6700 3550 1    50   Input ~ 0
PU1
Text HLabel 5250 3700 1    50   Input ~ 0
PU2
$Comp
L Device:C C?
U 1 1 625B99BC
P 7900 3900
F 0 "C?" H 8015 3946 50  0000 L CNN
F 1 "C" H 8015 3855 50  0000 L CNN
F 2 "" H 7938 3750 50  0001 C CNN
F 3 "~" H 7900 3900 50  0001 C CNN
	1    7900 3900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 625BAA73
P 7900 3750
AR Path="/625BAA73" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/625BAA73" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/625BAA73" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7900 3600 50  0001 C CNN
F 1 "VCC" H 7915 3923 50  0000 C CNN
F 2 "" H 7900 3750 50  0001 C CNN
F 3 "" H 7900 3750 50  0001 C CNN
	1    7900 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 625BC077
P 7900 4050
AR Path="/625BC077" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/625BC077" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/625BC077" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7900 3800 50  0001 C CNN
F 1 "GND" H 7905 3877 50  0000 C CNN
F 2 "" H 7900 4050 50  0001 C CNN
F 3 "" H 7900 4050 50  0001 C CNN
	1    7900 4050
	1    0    0    -1  
$EndComp
Text HLabel 6950 3850 2    50   Input ~ 0
Reset
Wire Wire Line
	6700 3850 6950 3850
Wire Wire Line
	5000 4250 5000 3350
Text Notes 5100 5400 0    50   ~ 0
Power on Reset\nReset signal is active high\n
$Comp
L Device:C C?
U 1 1 62633FFA
P 4750 4550
AR Path="/62633FFA" Ref="C?"  Part="1" 
AR Path="/62497D60/62633FFA" Ref="C?"  Part="1" 
AR Path="/61D852D7/62633FFA" Ref="C?"  Part="1" 
F 0 "C?" H 4865 4596 50  0000 L CNN
F 1 "C" H 4865 4505 50  0000 L CNN
F 2 "" H 4788 4400 50  0001 C CNN
F 3 "~" H 4750 4550 50  0001 C CNN
	1    4750 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4400 4750 3850
Connection ~ 4750 3850
Wire Wire Line
	4750 3850 5250 3850
Connection ~ 5250 3850
Wire Wire Line
	4150 4700 5200 4700
Connection ~ 5200 4700
Text HLabel 4750 3700 1    50   Input ~ 0
PU3
Wire Wire Line
	4750 3700 4750 3850
Text Notes 1200 7100 0    197  ~ 39
This page has NOT been checked!
$EndSCHEMATC
