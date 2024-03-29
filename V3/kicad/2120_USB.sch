EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
L Interface_USB:MCP2221AxP U?
U 1 1 6254C2C1
P 5050 3900
AR Path="/6191B6A2/61EBDADB/6254C2C1" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2C1" Ref="U2120"  Part="1" 
AR Path="/63A83936/62542978/6254C2C1" Ref="U2120"  Part="1" 
F 0 "U2120" H 5050 3119 50  0000 R CNN
F 1 "MCP2221AxP" H 5050 3210 50  0000 R CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5050 4900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf" H 5050 4600 50  0001 C CNN
	1    5050 3900
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6254C2C7
P 5050 4600
AR Path="/6191B6A2/61EBDADB/6254C2C7" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2C7" Ref="#PWR0130"  Part="1" 
AR Path="/63A83936/62542978/6254C2C7" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 5050 4450 50  0001 C CNN
F 1 "+5V" V 5065 4728 50  0000 L CNN
F 2 "" H 5050 4600 50  0001 C CNN
F 3 "" H 5050 4600 50  0001 C CNN
	1    5050 4600
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6254C2CD
P 5450 4400
AR Path="/6191B6A2/61EBDADB/6254C2CD" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2CD" Ref="#PWR0131"  Part="1" 
AR Path="/63A83936/62542978/6254C2CD" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 5450 4250 50  0001 C CNN
F 1 "+5V" V 5465 4528 50  0000 L CNN
F 2 "" H 5450 4400 50  0001 C CNN
F 3 "" H 5450 4400 50  0001 C CNN
	1    5450 4400
	0    1    1    0   
$EndComp
$Comp
L Connector:USB_B J?
U 1 1 6254C2D3
P 6650 4000
AR Path="/6191B6A2/61EBDADB/6254C2D3" Ref="J?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2D3" Ref="J2120"  Part="1" 
AR Path="/63A83936/62542978/6254C2D3" Ref="J2120"  Part="1" 
F 0 "J2120" H 6420 3897 50  0000 R CNN
F 1 "USB_B" H 6420 3988 50  0000 R CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 6800 3950 50  0001 C CNN
F 3 " ~" H 6800 3950 50  0001 C CNN
	1    6650 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6254C2D9
P 6700 3500
AR Path="/6191B6A2/61EBDADB/6254C2D9" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2D9" Ref="#PWR0132"  Part="1" 
AR Path="/63A83936/62542978/6254C2D9" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 6700 3250 50  0001 C CNN
F 1 "GND" H 6705 3327 50  0000 C CNN
F 2 "" H 6700 3500 50  0001 C CNN
F 3 "" H 6700 3500 50  0001 C CNN
	1    6700 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6650 3600 6650 3500
Wire Wire Line
	6650 3500 6700 3500
Wire Wire Line
	6750 3500 6750 3600
Connection ~ 6700 3500
Wire Wire Line
	6700 3500 6750 3500
Wire Wire Line
	5450 3900 6350 3900
Wire Wire Line
	5450 4000 6350 4000
$Comp
L power:+5V #PWR?
U 1 1 6254C2ED
P 6350 4200
AR Path="/6191B6A2/61EBDADB/6254C2ED" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2ED" Ref="#PWR0133"  Part="1" 
AR Path="/63A83936/62542978/6254C2ED" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 6350 4050 50  0001 C CNN
F 1 "+5V" V 6365 4328 50  0000 L CNN
F 2 "" H 6350 4200 50  0001 C CNN
F 3 "" H 6350 4200 50  0001 C CNN
	1    6350 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6254C2F3
P 5050 3300
AR Path="/6191B6A2/61EBDADB/6254C2F3" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6254C2F3" Ref="#PWR0134"  Part="1" 
AR Path="/63A83936/62542978/6254C2F3" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 5050 3050 50  0001 C CNN
F 1 "GND" H 5055 3127 50  0001 C TNN
F 2 "" H 5050 3300 50  0001 C CNN
F 3 "" H 5050 3300 50  0001 C CNN
	1    5050 3300
	-1   0    0    1   
$EndComp
NoConn ~ 4650 4300
NoConn ~ 4650 4400
Text Notes 1250 6500 0    197  ~ 39
This page has been checked!
$Comp
L Device:C C?
U 1 1 6262DF87
P 2950 4050
AR Path="/61D852D7/6262DF87" Ref="C?"  Part="1" 
AR Path="/6191B6A2/624CF3AF/6262DF87" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/6262DF87" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6262DF87" Ref="C2120"  Part="1" 
AR Path="/63A83936/62542978/6262DF87" Ref="C2120"  Part="1" 
F 0 "C2120" H 3065 4096 50  0000 L CNN
F 1 "22pF" H 3065 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2988 3900 50  0001 C CNN
F 3 "~" H 2950 4050 50  0001 C CNN
	1    2950 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6262DF8D
P 2950 4200
AR Path="/6262DF8D" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/6262DF8D" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/6262DF8D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624CF3AF/6262DF8D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/6262DF8D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6262DF8D" Ref="#PWR0160"  Part="1" 
AR Path="/63A83936/62542978/6262DF8D" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 2950 3950 50  0001 C CNN
F 1 "GND" H 2955 4027 50  0000 C CNN
F 2 "" H 2950 4200 50  0001 C CNN
F 3 "" H 2950 4200 50  0001 C CNN
	1    2950 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6262DF93
P 2950 3900
AR Path="/61D852D7/6262DF93" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624CF3AF/6262DF93" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/6262DF93" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6262DF93" Ref="#PWR0161"  Part="1" 
AR Path="/63A83936/62542978/6262DF93" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 2950 3750 50  0001 C CNN
F 1 "+5V" V 2965 4028 50  0000 L CNN
F 2 "" H 2950 3900 50  0001 C CNN
F 3 "" H 2950 3900 50  0001 C CNN
	1    2950 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6262E8F5
P 4950 5100
AR Path="/61D852D7/6262E8F5" Ref="C?"  Part="1" 
AR Path="/6191B6A2/624CF3AF/6262E8F5" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/6262E8F5" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6262E8F5" Ref="C2121"  Part="1" 
AR Path="/63A83936/62542978/6262E8F5" Ref="C2121"  Part="1" 
F 0 "C2121" H 5065 5146 50  0000 L CNN
F 1 "22pF" H 5065 5055 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4988 4950 50  0001 C CNN
F 3 "~" H 4950 5100 50  0001 C CNN
	1    4950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4950 4950 4600
$Comp
L power:GND #PWR?
U 1 1 6262F07C
P 4950 5250
AR Path="/6262F07C" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/6262F07C" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/6262F07C" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624CF3AF/6262F07C" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62512FB8/6262F07C" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6262F07C" Ref="#PWR0162"  Part="1" 
AR Path="/63A83936/62542978/6262F07C" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 4950 5000 50  0001 C CNN
F 1 "GND" H 4955 5077 50  0000 C CNN
F 2 "" H 4950 5250 50  0001 C CNN
F 3 "" H 4950 5250 50  0001 C CNN
	1    4950 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2122
U 1 1 627627D6
P 3800 4000
F 0 "J2122" H 3900 3800 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3900 3700 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3800 4000 50  0001 C CNN
F 3 "~" H 3800 4000 50  0001 C CNN
	1    3800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3600 4150 3600
Wire Wire Line
	3850 3700 4350 3700
$Comp
L power:+5V #PWR?
U 1 1 6278A36E
P 4150 3300
AR Path="/6191B6A2/61EBDADB/6278A36E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62542978/6278A36E" Ref="#PWR0145"  Part="1" 
AR Path="/63A83936/62542978/6278A36E" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 4150 3150 50  0001 C CNN
F 1 "+5V" V 4165 3428 50  0000 L CNN
F 2 "" H 4150 3300 50  0001 C CNN
F 3 "" H 4150 3300 50  0001 C CNN
	1    4150 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2120
U 1 1 6278730B
P 4150 3450
F 0 "R2120" H 3850 3500 50  0000 L CNN
F 1 "100k" H 3850 3400 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4080 3450 50  0001 C CNN
F 3 "~" H 4150 3450 50  0001 C CNN
	1    4150 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 3600 4450 4000
Wire Wire Line
	4450 4000 4650 4000
Connection ~ 4450 4000
Wire Wire Line
	4450 4000 4000 4000
Wire Wire Line
	4650 4100 4350 4100
Wire Wire Line
	4000 4100 4350 4100
Connection ~ 4350 4100
Wire Wire Line
	4350 3700 4350 4100
Text HLabel 3850 3600 0    50   Output ~ 0
TX
Text HLabel 3850 3700 0    50   Input ~ 0
RX
Connection ~ 4150 3600
Wire Wire Line
	4150 3600 4450 3600
NoConn ~ 4650 3500
NoConn ~ 4650 3600
NoConn ~ 4650 3700
NoConn ~ 4650 3800
$EndSCHEMATC
