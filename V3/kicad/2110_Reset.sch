EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
AR Path="/61D852D7/624C743E" Ref="U1000"  Part="1" 
AR Path="/6191B6A2/624CF3AF/624C743E" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/624C743E" Ref="U2110"  Part="1" 
AR Path="/63A83936/62512FB8/624C743E" Ref="U2110"  Part="1" 
F 0 "U2110" H 5950 4550 50  0000 L TNN
F 1 "LM555xM" H 5950 4450 50  0000 L TNN
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
AR Path="/61D852D7/624C7444" Ref="#PWR0101"  Part="1" 
AR Path="/6191B6A2/624CF3AF/624C7444" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/624C7444" Ref="#PWR0105"  Part="1" 
AR Path="/63A83936/62512FB8/624C7444" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 5800 4450 50  0001 C CNN
F 1 "GND" H 5805 4527 50  0000 C CNN
F 2 "" H 5800 4700 50  0001 C CNN
F 3 "" H 5800 4700 50  0001 C CNN
	1    5800 4700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 624C744A
P 4150 3850
AR Path="/624C744A" Ref="SW?"  Part="1" 
AR Path="/62497D60/624C744A" Ref="SW?"  Part="1" 
AR Path="/61D852D7/624C744A" Ref="SW1000"  Part="1" 
AR Path="/6191B6A2/624CF3AF/624C744A" Ref="SW?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/624C744A" Ref="SW2110"  Part="1" 
AR Path="/63A83936/62512FB8/624C744A" Ref="SW2110"  Part="1" 
F 0 "SW2110" H 4150 4135 50  0000 C CNN
F 1 "SW_Push" H 4150 4044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 4150 4050 50  0001 C CNN
F 3 "~" H 4150 4050 50  0001 C CNN
	1    4150 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 624C7456
P 5000 4550
AR Path="/624C7456" Ref="C?"  Part="1" 
AR Path="/62497D60/624C7456" Ref="C?"  Part="1" 
AR Path="/61D852D7/624C7456" Ref="C1001"  Part="1" 
AR Path="/6191B6A2/624CF3AF/624C7456" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/624C7456" Ref="C2112"  Part="1" 
AR Path="/63A83936/62512FB8/624C7456" Ref="C2112"  Part="1" 
F 0 "C2112" H 5115 4596 50  0000 L CNN
F 1 "10nF" H 5115 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5038 4400 50  0001 C CNN
F 3 "~" H 5000 4550 50  0001 C CNN
	1    5000 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4450 5800 4700
Wire Wire Line
	3950 4700 3950 3850
Connection ~ 5800 4700
Wire Wire Line
	6300 4050 6700 4050
Wire Wire Line
	6300 4250 6700 4250
Wire Wire Line
	6700 4250 6700 4050
$Comp
L Device:C C?
U 1 1 624C7467
P 6700 4550
AR Path="/624C7467" Ref="C?"  Part="1" 
AR Path="/62497D60/624C7467" Ref="C?"  Part="1" 
AR Path="/61D852D7/624C7467" Ref="C1002"  Part="1" 
AR Path="/6191B6A2/624CF3AF/624C7467" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/624C7467" Ref="C2111"  Part="1" 
AR Path="/63A83936/62512FB8/624C7467" Ref="C2111"  Part="1" 
F 0 "C2111" H 6815 4596 50  0000 L CNN
F 1 "10uF" H 6815 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6738 4400 50  0001 C CNN
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
	5000 4050 5000 4400
$Comp
L Device:C C1000
U 1 1 625B99BC
P 7900 3900
AR Path="/61D852D7/625B99BC" Ref="C1000"  Part="1" 
AR Path="/6191B6A2/624CF3AF/625B99BC" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/625B99BC" Ref="C2110"  Part="1" 
AR Path="/63A83936/62512FB8/625B99BC" Ref="C2110"  Part="1" 
F 0 "C2110" H 8015 3946 50  0000 L CNN
F 1 "22pF" H 8015 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7938 3750 50  0001 C CNN
F 3 "~" H 7900 3900 50  0001 C CNN
	1    7900 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 625BC077
P 7900 4050
AR Path="/625BC077" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/625BC077" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/625BC077" Ref="#PWR0102"  Part="1" 
AR Path="/6191B6A2/624CF3AF/625BC077" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/625BC077" Ref="#PWR0106"  Part="1" 
AR Path="/63A83936/62512FB8/625BC077" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 7900 3800 50  0001 C CNN
F 1 "GND" H 7905 3877 50  0000 C CNN
F 2 "" H 7900 4050 50  0001 C CNN
F 3 "" H 7900 4050 50  0001 C CNN
	1    7900 4050
	1    0    0    -1  
$EndComp
Text HLabel 6300 3850 2    50   Input ~ 0
Reset
Text Notes 5100 5400 0    50   ~ 0
Power on Reset\nReset signal is active high\nNeeds to be inverted for CPU\n
$Comp
L Device:C C?
U 1 1 62633FFA
P 4450 4550
AR Path="/62633FFA" Ref="C?"  Part="1" 
AR Path="/62497D60/62633FFA" Ref="C?"  Part="1" 
AR Path="/61D852D7/62633FFA" Ref="C1003"  Part="1" 
AR Path="/6191B6A2/624CF3AF/62633FFA" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/62633FFA" Ref="C2113"  Part="1" 
AR Path="/63A83936/62512FB8/62633FFA" Ref="C2113"  Part="1" 
F 0 "C2113" H 4565 4596 50  0000 L CNN
F 1 "100nF" H 4565 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4488 4400 50  0001 C CNN
F 3 "~" H 4450 4550 50  0001 C CNN
	1    4450 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4400 4450 3850
Text Notes 7850 6900 0    118  ~ 24
This page has been checked!
$Comp
L power:+5V #PWR0104
U 1 1 61E87BC4
P 5800 3650
AR Path="/61D852D7/61E87BC4" Ref="#PWR0104"  Part="1" 
AR Path="/6191B6A2/624CF3AF/61E87BC4" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/61E87BC4" Ref="#PWR0109"  Part="1" 
AR Path="/63A83936/62512FB8/61E87BC4" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 5800 3500 50  0001 C CNN
F 1 "+5V" V 5815 3778 50  0000 L CNN
F 2 "" H 5800 3650 50  0001 C CNN
F 3 "" H 5800 3650 50  0001 C CNN
	1    5800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 61E8CD41
P 7900 3750
AR Path="/61D852D7/61E8CD41" Ref="#PWR0105"  Part="1" 
AR Path="/6191B6A2/624CF3AF/61E8CD41" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/61E8CD41" Ref="#PWR0115"  Part="1" 
AR Path="/63A83936/62512FB8/61E8CD41" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 7900 3600 50  0001 C CNN
F 1 "+5V" V 7915 3878 50  0000 L CNN
F 2 "" H 7900 3750 50  0001 C CNN
F 3 "" H 7900 3750 50  0001 C CNN
	1    7900 3750
	1    0    0    -1  
$EndComp
Connection ~ 5000 4700
Wire Wire Line
	5000 4700 5800 4700
Wire Wire Line
	5000 4050 5300 4050
$Comp
L power:+5V #PWR0106
U 1 1 620357A9
P 5300 4250
AR Path="/61D852D7/620357A9" Ref="#PWR0106"  Part="1" 
AR Path="/6191B6A2/624CF3AF/620357A9" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/620357A9" Ref="#PWR0121"  Part="1" 
AR Path="/63A83936/62512FB8/620357A9" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 5300 4100 50  0001 C CNN
F 1 "+5V" V 5315 4378 50  0000 L CNN
F 2 "" H 5300 4250 50  0001 C CNN
F 3 "" H 5300 4250 50  0001 C CNN
	1    5300 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 3850 4450 3850
Wire Wire Line
	3950 4700 4450 4700
Connection ~ 4450 3850
Connection ~ 4450 4700
Wire Wire Line
	4450 4700 5000 4700
$Comp
L power:+5V #PWR?
U 1 1 62F79AB5
P 7000 4050
AR Path="/6191B6A2/61EBDADB/62F79AB5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/62F79AB5" Ref="#PWR0108"  Part="1" 
AR Path="/63A83936/62512FB8/62F79AB5" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 7000 3900 50  0001 C CNN
F 1 "+5V" V 7015 4178 50  0000 L CNN
F 2 "" H 7000 4050 50  0001 C CNN
F 3 "" H 7000 4050 50  0001 C CNN
	1    7000 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62F79ABB
P 5050 3700
AR Path="/6191B6A2/61EBDADB/62F79ABB" Ref="R?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/62F79ABB" Ref="R14"  Part="1" 
AR Path="/63A83936/62512FB8/62F79ABB" Ref="R2110"  Part="1" 
F 0 "R2110" V 4843 3700 50  0000 C CNN
F 1 "1M" V 4934 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4980 3700 50  0001 C CNN
F 3 "~" H 5050 3700 50  0001 C CNN
	1    5050 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62F79AC1
P 5050 3550
AR Path="/6191B6A2/61EBDADB/62F79AC1" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/62F79AC1" Ref="#PWR0155"  Part="1" 
AR Path="/63A83936/62512FB8/62F79AC1" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 5050 3400 50  0001 C CNN
F 1 "+5V" V 5065 3678 50  0000 L CNN
F 2 "" H 5050 3550 50  0001 C CNN
F 3 "" H 5050 3550 50  0001 C CNN
	1    5050 3550
	1    0    0    -1  
$EndComp
Connection ~ 5050 3850
Wire Wire Line
	5050 3850 5300 3850
Wire Wire Line
	4450 3850 5050 3850
$Comp
L Device:R R?
U 1 1 62F79AAF
P 6850 4050
AR Path="/6191B6A2/61EBDADB/62F79AAF" Ref="R?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/62F79AAF" Ref="R15"  Part="1" 
AR Path="/63A83936/62512FB8/62F79AAF" Ref="R15"  Part="1" 
F 0 "R15" V 6643 4050 50  0000 C CNN
F 1 "2111" V 6734 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 4050 50  0001 C CNN
F 3 "~" H 6850 4050 50  0001 C CNN
	1    6850 4050
	0    -1   -1   0   
$EndComp
Connection ~ 6700 4050
$EndSCHEMATC
