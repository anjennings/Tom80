EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
L Zilog_Z180:Z8-L180-S180-180-PQFP-80 U2100
U 1 1 61EBDD59
P 4600 1300
F 0 "U2100" H 4800 1350 50  0000 R TNN
F 1 "Z8-L180-S180-180-PQFP-80" V 4310 450 50  0001 C CNN
F 2 "UL_Z180:Z8018008FSG" H 4850 2150 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z180/z8s180ps.pdf" V 4700 1350 50  0001 L CNN
F 4 "Microprocessors - MPU 20MHz STATIC Z180 XT" H 4850 2350 50  0001 L CNN "Description"
F 5 "3.1" H 4850 2250 50  0001 L CNN "Height"
F 6 "Zilog" H 4800 2550 50  0001 L CNN "Manufacturer_Name"
F 7 "Z8S18020FEG" H 4800 2650 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z8S18020FEG" H 4850 2750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z8S18020FEG" H 4850 2850 50  0001 L CNN "Mouser Price/Stock"
	1    4600 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 61EE270A
P 6750 1500
F 0 "#PWR0164" H 6750 1250 50  0001 C CNN
F 1 "GND" H 6755 1327 50  0000 C CNN
F 2 "" H 6750 1500 50  0001 C CNN
F 3 "" H 6750 1500 50  0001 C CNN
	1    6750 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6750 1500 6750 1600
Connection ~ 6750 1600
Connection ~ 6750 1700
Wire Wire Line
	6750 1700 6750 1800
$Comp
L power:+5V #PWR0165
U 1 1 61EE3DC3
P 6750 1900
F 0 "#PWR0165" H 6750 1750 50  0001 C CNN
F 1 "+5V" V 6765 2028 50  0000 L CNN
F 2 "" H 6750 1900 50  0001 C CNN
F 3 "" H 6750 1900 50  0001 C CNN
	1    6750 1900
	0    1    1    0   
$EndComp
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
	4300 4150 4400 4250
Entry Wire Line
	4300 4250 4400 4350
Wire Wire Line
	4400 4050 4600 4050
Wire Wire Line
	4400 3950 4600 3950
Wire Wire Line
	4400 3850 4600 3850
Wire Wire Line
	4400 3750 4600 3750
Wire Wire Line
	4400 3650 4600 3650
Wire Wire Line
	4400 4150 4600 4150
Wire Wire Line
	4400 4250 4600 4250
Wire Wire Line
	4400 4350 4600 4350
Text Label 4400 3650 0    50   ~ 0
D0
Text Label 4400 3750 0    50   ~ 0
D1
Text Label 4400 3850 0    50   ~ 0
D2
Text Label 4400 3950 0    50   ~ 0
D3
Text Label 4400 4050 0    50   ~ 0
D4
Text Label 4400 4150 0    50   ~ 0
D5
Text Label 4400 4250 0    50   ~ 0
D6
Text Label 4400 4350 0    50   ~ 0
D7
Wire Bus Line
	4300 1400 4200 1400
Entry Wire Line
	4300 1400 4400 1500
Entry Wire Line
	4300 1500 4400 1600
Entry Wire Line
	4300 1600 4400 1700
Entry Wire Line
	4300 1700 4400 1800
Entry Wire Line
	4300 1800 4400 1900
Entry Wire Line
	4300 1900 4400 2000
Entry Wire Line
	4300 2000 4400 2100
Entry Wire Line
	4300 2100 4400 2200
Entry Wire Line
	4300 2200 4400 2300
Entry Wire Line
	4300 2300 4400 2400
Entry Wire Line
	4300 2400 4400 2500
Entry Wire Line
	4300 2500 4400 2600
Entry Wire Line
	4300 2600 4400 2700
Entry Wire Line
	4300 2700 4400 2800
Entry Wire Line
	4300 2800 4400 2900
Entry Wire Line
	4300 2900 4400 3000
Entry Wire Line
	4300 3000 4400 3100
Entry Wire Line
	4300 3100 4400 3200
Entry Wire Line
	4300 3200 4400 3300
Entry Wire Line
	4300 3300 4400 3400
Wire Wire Line
	4400 1500 4600 1500
Wire Wire Line
	4400 1600 4600 1600
Wire Wire Line
	4400 1700 4600 1700
Wire Wire Line
	4400 1800 4600 1800
Wire Wire Line
	4400 1900 4600 1900
Wire Wire Line
	4400 2000 4600 2000
Wire Wire Line
	4400 2100 4600 2100
Wire Wire Line
	4400 2200 4600 2200
Wire Wire Line
	4400 2300 4600 2300
Wire Wire Line
	4400 2400 4600 2400
Wire Wire Line
	4400 2500 4600 2500
Wire Wire Line
	4400 2600 4600 2600
Wire Wire Line
	4400 2700 4600 2700
Wire Wire Line
	4400 2800 4600 2800
Wire Wire Line
	4400 2900 4600 2900
Wire Wire Line
	4400 3000 4600 3000
Wire Wire Line
	4400 3100 4600 3100
Wire Wire Line
	4400 3200 4600 3200
Wire Wire Line
	4400 3300 4600 3300
Wire Wire Line
	4400 3400 4600 3400
Text HLabel 4200 1400 0    50   Output ~ 0
A[0..19]
NoConn ~ 6750 3300
Text HLabel 7050 2600 2    50   Output ~ 0
IORQ
Text HLabel 7050 3100 2    50   Output ~ 0
RD
NoConn ~ 6750 4000
NoConn ~ 4600 4750
NoConn ~ 4600 5150
Connection ~ 6750 1500
Wire Wire Line
	6750 1600 6750 1700
Text Label 4400 1500 0    50   ~ 0
A0
Text Label 4400 1600 0    50   ~ 0
A1
Text Label 4400 1700 0    50   ~ 0
A2
Text Label 4400 1800 0    50   ~ 0
A3
Text Label 4400 1900 0    50   ~ 0
A4
Text Label 4400 2000 0    50   ~ 0
A5
Text Label 4400 2100 0    50   ~ 0
A6
Text Label 4400 2200 0    50   ~ 0
A7
Text Label 4400 2300 0    50   ~ 0
A8
Text Label 4400 2400 0    50   ~ 0
A9
Text Label 4400 2500 0    50   ~ 0
A10
Text Label 4400 2600 0    50   ~ 0
A11
Text Label 4400 2700 0    50   ~ 0
A12
Text Label 4400 2800 0    50   ~ 0
A13
Text Label 4400 2900 0    50   ~ 0
A14
Text Label 4400 3000 0    50   ~ 0
A15
Text Label 4400 3100 0    50   ~ 0
A16
Text Label 4400 3200 0    50   ~ 0
A17
Text Label 4400 3300 0    50   ~ 0
A18
Text Label 4400 3400 0    50   ~ 0
A19
$Comp
L power:GND #PWR?
U 1 1 624D98DF
P 2500 7150
AR Path="/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/624D98DF" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 2500 6900 50  0001 C CNN
F 1 "GND" H 2505 6977 50  0000 C CNN
F 2 "" H 2500 7150 50  0001 C CNN
F 3 "" H 2500 7150 50  0001 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624D98F5
P 2500 5750
AR Path="/6195D2C9/624D98F5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624D98F5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/624D98F5" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2500 5600 50  0001 C CNN
F 1 "+5V" H 2515 5923 50  0000 C CNN
F 2 "" H 2500 5750 50  0001 C CNN
F 3 "" H 2500 5750 50  0001 C CNN
	1    2500 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 6150 1750 6150
Wire Wire Line
	2000 6050 1750 6050
Text Label 1750 6050 0    50   ~ 0
MREQ
Text Label 1750 6150 0    50   ~ 0
IORQ
Text HLabel 3000 6250 2    50   Output ~ 0
ROM_CS
Text Label 1750 6350 0    50   ~ 0
A19
Text HLabel 3000 6050 2    50   Output ~ 0
RAM_CS
Text HLabel 3000 6150 2    50   Output ~ 0
PIO_EN
$Sheet
S 850  6650 550  200 
U 62512FB8
F0 "2110_Reset" 50
F1 "2110_Reset.sch" 50
F2 "Reset" I R 1400 6750 50 
$EndSheet
$Sheet
S 7450 4300 550  300 
U 62542978
F0 "2120_USB" 50
F1 "2120_USB.sch" 50
F2 "TX" O L 7450 4400 50 
F3 "RX" I L 7450 4500 50 
$EndSheet
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 6255C3DA
P 3400 4650
AR Path="/6191B6A2/6255C3DA" Ref="X?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6255C3DA" Ref="U2102"  Part="1" 
F 0 "U2102" H 3057 4696 50  0000 R CNN
F 1 "14.7456 MHz" H 3057 4605 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 3850 4300 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 3300 4650 50  0001 C CNN
	1    3400 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6255C3E0
P 3400 4350
AR Path="/6191B6A2/6255C3E0" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6255C3E0" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 3400 4200 50  0001 C CNN
F 1 "+5V" H 3415 4523 50  0000 C CNN
F 2 "" H 3400 4350 50  0001 C CNN
F 3 "" H 3400 4350 50  0001 C CNN
	1    3400 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6255C3E6
P 3400 4950
AR Path="/6191B6A2/6255C3E6" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6255C3E6" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 3400 4700 50  0001 C CNN
F 1 "GND" H 3405 4777 50  0000 C CNN
F 2 "" H 3400 4950 50  0001 C CNN
F 3 "" H 3400 4950 50  0001 C CNN
	1    3400 4950
	1    0    0    -1  
$EndComp
Text Label 3700 4650 0    50   ~ 0
CLK
Text Notes 7700 6950 0    118  ~ 24
This page has been checked!
Text Label 7050 2500 2    50   ~ 0
MREQ
Wire Wire Line
	1400 6750 2000 6750
Wire Wire Line
	3700 4650 4600 4650
Wire Wire Line
	6750 4500 7200 4500
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 624D98D9
P 2500 6450
AR Path="/624D98D9" Ref="U?"  Part="1" 
AR Path="/6191B6A2/624D98D9" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/624D98D9" Ref="U?"  Part="1" 
AR Path="/6195D2C9/624D98D9" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/624D98D9" Ref="U2101"  Part="1" 
F 0 "U2101" H 2500 7331 50  0000 C CNN
F 1 "GAL16V8" H 2500 7240 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 2500 6450 50  0001 C CNN
F 3 "" H 2500 6450 50  0001 C CNN
	1    2500 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2100 7050 2100
Wire Wire Line
	6750 2200 7050 2200
Text HLabel 7050 2300 2    50   Input ~ 0
INT
Text Label 7050 2100 2    50   ~ 0
INT2
Text Label 7050 2200 2    50   ~ 0
INT1
Wire Wire Line
	9750 6250 9450 6250
Wire Wire Line
	9750 1850 9450 1850
Text Label 9450 6250 0    50   ~ 0
INT2
Text Label 9450 1850 0    50   ~ 0
INT1
Wire Wire Line
	6750 2400 7050 2400
Text Label 7050 2400 2    50   ~ 0
NMI
Wire Wire Line
	9750 4850 9450 4850
Text Label 9450 4850 0    50   ~ 0
NMI
Wire Wire Line
	6750 2800 7050 2800
Text Label 7050 2800 2    50   ~ 0
BUSREQ
Wire Wire Line
	6750 3000 7050 3000
Text Label 7050 3000 2    50   ~ 0
WAIT
Wire Wire Line
	9750 5200 9450 5200
Text Label 9450 5200 0    50   ~ 0
BUSREQ
Wire Wire Line
	9750 4500 9450 4500
Text Label 9450 4500 0    50   ~ 0
WAIT
Wire Wire Line
	6750 4400 7200 4400
Text HLabel 7050 3400 2    50   Output ~ 0
M1
Wire Wire Line
	6750 3600 7050 3600
Text Label 7050 3600 2    50   ~ 0
HALT
Wire Wire Line
	7200 4400 7200 4150
Wire Wire Line
	7200 4150 7550 4150
Connection ~ 7200 4400
Wire Wire Line
	7200 4400 7450 4400
Text Label 7550 4150 2    50   ~ 0
RX
Wire Wire Line
	6750 4100 7050 4100
Text Label 7050 4100 2    50   ~ 0
DREQ1
Wire Wire Line
	6750 4600 7050 4600
Text Label 7050 4600 2    50   ~ 0
CTS0
Wire Wire Line
	9750 5900 9450 5900
Text Label 9450 5900 0    50   ~ 0
CTS0
Wire Wire Line
	9750 3850 9450 3850
Text Label 9450 3850 0    50   ~ 0
DREQ1
Wire Wire Line
	7200 4800 7550 4800
Text Label 7550 4800 2    50   ~ 0
TX
Connection ~ 7200 4500
Wire Wire Line
	7200 4500 7450 4500
Wire Wire Line
	7200 4500 7200 4800
Wire Wire Line
	6750 2300 7050 2300
Text Label 7050 2300 2    50   ~ 0
INT0
Wire Wire Line
	6750 2500 7050 2500
Wire Wire Line
	6750 2600 7050 2600
Text Label 7050 2600 2    50   ~ 0
IORQ
Wire Wire Line
	6750 3100 7050 3100
Wire Wire Line
	6750 3200 7050 3200
Wire Wire Line
	6750 3400 7050 3400
Text Label 7050 3100 2    50   ~ 0
RD
Text Label 7050 3200 2    50   ~ 0
WR
Text Label 7050 3400 2    50   ~ 0
M1
Wire Wire Line
	9750 1150 9450 1150
Text Label 9450 1150 0    50   ~ 0
INT0
Wire Wire Line
	4600 4950 4300 4950
Text Label 4300 4950 0    50   ~ 0
DCD0
Wire Wire Line
	9750 1500 9450 1500
Text Label 9450 1500 0    50   ~ 0
DCD0
NoConn ~ 6300 5750
Text Label 7050 2700 2    50   ~ 0
C_RST
Wire Wire Line
	6750 2700 7050 2700
NoConn ~ 6750 4200
NoConn ~ 6750 4700
Wire Wire Line
	9750 5550 9450 5550
Text Label 9450 5550 0    50   ~ 0
RXS
Wire Wire Line
	9750 4150 9450 4150
Text Label 9450 4150 0    50   ~ 0
CKS
Wire Wire Line
	6750 5000 7050 5000
Text Label 7050 5000 2    50   ~ 0
CKS
Text HLabel 4300 4550 0    50   Output ~ 0
PHI
Wire Wire Line
	4300 4550 4600 4550
Text Label 4300 4550 0    50   ~ 0
PHI
Text Label 3300 5950 2    50   ~ 0
C_RST
Wire Wire Line
	3000 5950 3300 5950
$Comp
L Device:C C?
U 1 1 62809F42
P 7600 1250
AR Path="/6195D2C9/62809F42" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62809F42" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62809F42" Ref="C2100"  Part="1" 
F 0 "C2100" H 7715 1296 50  0000 L CNN
F 1 "22pf" H 7715 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7638 1100 50  0001 C CNN
F 3 "~" H 7600 1250 50  0001 C CNN
	1    7600 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62809F48
P 7600 1400
AR Path="/62809F48" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/62809F48" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/62809F48" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/62809F48" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62809F48" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62809F48" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 7600 1150 50  0001 C CNN
F 1 "GND" H 7605 1227 50  0000 C CNN
F 2 "" H 7600 1400 50  0001 C CNN
F 3 "" H 7600 1400 50  0001 C CNN
	1    7600 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62809F4E
P 7600 1100
AR Path="/6195D2C9/62809F4E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62809F4E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62809F4E" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 7600 950 50  0001 C CNN
F 1 "+5V" H 7615 1273 50  0000 C CNN
F 2 "" H 7600 1100 50  0001 C CNN
F 3 "" H 7600 1100 50  0001 C CNN
	1    7600 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6281227F
P 8200 1250
AR Path="/6195D2C9/6281227F" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/6281227F" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6281227F" Ref="C2101"  Part="1" 
F 0 "C2101" H 8315 1296 50  0000 L CNN
F 1 "22pf" H 8315 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8238 1100 50  0001 C CNN
F 3 "~" H 8200 1250 50  0001 C CNN
	1    8200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62812285
P 8200 1400
AR Path="/62812285" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/62812285" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/62812285" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/62812285" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62812285" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62812285" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 8200 1150 50  0001 C CNN
F 1 "GND" H 8205 1227 50  0000 C CNN
F 2 "" H 8200 1400 50  0001 C CNN
F 3 "" H 8200 1400 50  0001 C CNN
	1    8200 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6281228B
P 8200 1100
AR Path="/6195D2C9/6281228B" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/6281228B" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6281228B" Ref="#PWR0172"  Part="1" 
F 0 "#PWR0172" H 8200 950 50  0001 C CNN
F 1 "+5V" H 8215 1273 50  0000 C CNN
F 2 "" H 8200 1100 50  0001 C CNN
F 3 "" H 8200 1100 50  0001 C CNN
	1    8200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 6250 2000 6250
Wire Wire Line
	1750 6350 2000 6350
Text Label 1750 6250 0    50   ~ 0
A7
Text HLabel 4200 3550 0    50   BiDi ~ 0
D[0..7]
Wire Bus Line
	4300 3550 4200 3550
NoConn ~ 6750 3800
NoConn ~ 6750 3900
Wire Wire Line
	6750 4900 7050 4900
Text Label 7050 4900 2    50   ~ 0
RXS
NoConn ~ 6750 2900
$Comp
L Device:R R1
U 1 1 62EBC794
P 9900 2650
F 0 "R1" V 9693 2650 50  0000 C CNN
F 1 "R" V 9784 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 2650 50  0001 C CNN
F 3 "~" H 9900 2650 50  0001 C CNN
	1    9900 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 62ECA524
P 9900 3050
F 0 "R2" V 9693 3050 50  0000 C CNN
F 1 "R" V 9784 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 3050 50  0001 C CNN
F 3 "~" H 9900 3050 50  0001 C CNN
	1    9900 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 62EE459D
P 9900 3850
F 0 "R6" V 9693 3850 50  0000 C CNN
F 1 "R" V 9784 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 3850 50  0001 C CNN
F 3 "~" H 9900 3850 50  0001 C CNN
	1    9900 3850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 62EE45A3
P 10050 3850
F 0 "#PWR0122" H 10050 3700 50  0001 C CNN
F 1 "+5V" V 10065 3978 50  0000 L CNN
F 2 "" H 10050 3850 50  0001 C CNN
F 3 "" H 10050 3850 50  0001 C CNN
	1    10050 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 62EEEA1B
P 9900 4150
F 0 "R7" V 9693 4150 50  0000 C CNN
F 1 "R" V 9784 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 4150 50  0001 C CNN
F 3 "~" H 9900 4150 50  0001 C CNN
	1    9900 4150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0135
U 1 1 62EEEA21
P 10050 4150
F 0 "#PWR0135" H 10050 4000 50  0001 C CNN
F 1 "+5V" V 10065 4278 50  0000 L CNN
F 2 "" H 10050 4150 50  0001 C CNN
F 3 "" H 10050 4150 50  0001 C CNN
	1    10050 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 62EF9277
P 9900 4500
F 0 "R8" V 9693 4500 50  0000 C CNN
F 1 "R" V 9784 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 4500 50  0001 C CNN
F 3 "~" H 9900 4500 50  0001 C CNN
	1    9900 4500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0136
U 1 1 62EF927D
P 10050 4500
F 0 "#PWR0136" H 10050 4350 50  0001 C CNN
F 1 "+5V" V 10065 4628 50  0000 L CNN
F 2 "" H 10050 4500 50  0001 C CNN
F 3 "" H 10050 4500 50  0001 C CNN
	1    10050 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 62EFCD2B
P 9900 4850
F 0 "R9" V 9693 4850 50  0000 C CNN
F 1 "R" V 9784 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 4850 50  0001 C CNN
F 3 "~" H 9900 4850 50  0001 C CNN
	1    9900 4850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0137
U 1 1 62EFCD31
P 10050 4850
F 0 "#PWR0137" H 10050 4700 50  0001 C CNN
F 1 "+5V" V 10065 4978 50  0000 L CNN
F 2 "" H 10050 4850 50  0001 C CNN
F 3 "" H 10050 4850 50  0001 C CNN
	1    10050 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 62F00BDB
P 9900 5200
F 0 "R10" V 9693 5200 50  0000 C CNN
F 1 "R" V 9784 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 5200 50  0001 C CNN
F 3 "~" H 9900 5200 50  0001 C CNN
	1    9900 5200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0138
U 1 1 62F00BE1
P 10050 5200
F 0 "#PWR0138" H 10050 5050 50  0001 C CNN
F 1 "+5V" V 10065 5328 50  0000 L CNN
F 2 "" H 10050 5200 50  0001 C CNN
F 3 "" H 10050 5200 50  0001 C CNN
	1    10050 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 62F03FB9
P 9900 5550
F 0 "R11" V 9693 5550 50  0000 C CNN
F 1 "R" V 9784 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 5550 50  0001 C CNN
F 3 "~" H 9900 5550 50  0001 C CNN
	1    9900 5550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0139
U 1 1 62F03FBF
P 10050 5550
F 0 "#PWR0139" H 10050 5400 50  0001 C CNN
F 1 "+5V" V 10065 5678 50  0000 L CNN
F 2 "" H 10050 5550 50  0001 C CNN
F 3 "" H 10050 5550 50  0001 C CNN
	1    10050 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 62F0767B
P 9900 5900
F 0 "R12" V 9693 5900 50  0000 C CNN
F 1 "R" V 9784 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 5900 50  0001 C CNN
F 3 "~" H 9900 5900 50  0001 C CNN
	1    9900 5900
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0140
U 1 1 62F07681
P 10050 5900
F 0 "#PWR0140" H 10050 5750 50  0001 C CNN
F 1 "+5V" V 10065 6028 50  0000 L CNN
F 2 "" H 10050 5900 50  0001 C CNN
F 3 "" H 10050 5900 50  0001 C CNN
	1    10050 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 62F0AE91
P 9900 6250
F 0 "R13" V 9693 6250 50  0000 C CNN
F 1 "R" V 9784 6250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 6250 50  0001 C CNN
F 3 "~" H 9900 6250 50  0001 C CNN
	1    9900 6250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0141
U 1 1 62F0AE97
P 10050 6250
F 0 "#PWR0141" H 10050 6100 50  0001 C CNN
F 1 "+5V" V 10065 6378 50  0000 L CNN
F 2 "" H 10050 6250 50  0001 C CNN
F 3 "" H 10050 6250 50  0001 C CNN
	1    10050 6250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 62F3049F
P 9900 1850
F 0 "R5" V 9693 1850 50  0000 C CNN
F 1 "R" V 9784 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 1850 50  0001 C CNN
F 3 "~" H 9900 1850 50  0001 C CNN
	1    9900 1850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0142
U 1 1 62F304A5
P 10050 1850
F 0 "#PWR0142" H 10050 1700 50  0001 C CNN
F 1 "+5V" V 10065 1978 50  0000 L CNN
F 2 "" H 10050 1850 50  0001 C CNN
F 3 "" H 10050 1850 50  0001 C CNN
	1    10050 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 62F33CBD
P 9900 1500
F 0 "R4" V 9693 1500 50  0000 C CNN
F 1 "R" V 9784 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 1500 50  0001 C CNN
F 3 "~" H 9900 1500 50  0001 C CNN
	1    9900 1500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0143
U 1 1 62F33CC3
P 10050 1500
F 0 "#PWR0143" H 10050 1350 50  0001 C CNN
F 1 "+5V" V 10065 1628 50  0000 L CNN
F 2 "" H 10050 1500 50  0001 C CNN
F 3 "" H 10050 1500 50  0001 C CNN
	1    10050 1500
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 62F3762F
P 9900 1150
F 0 "R3" V 9693 1150 50  0000 C CNN
F 1 "R" V 9784 1150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 1150 50  0001 C CNN
F 3 "~" H 9900 1150 50  0001 C CNN
	1    9900 1150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0153
U 1 1 62F37635
P 10050 1150
F 0 "#PWR0153" H 10050 1000 50  0001 C CNN
F 1 "+5V" V 10065 1278 50  0000 L CNN
F 2 "" H 10050 1150 50  0001 C CNN
F 3 "" H 10050 1150 50  0001 C CNN
	1    10050 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 3500 7050 3500
Text Label 7050 3500 2    50   ~ 0
ST
$Comp
L Device:R R16
U 1 1 62ECE434
P 9900 3450
F 0 "R16" V 9693 3450 50  0000 C CNN
F 1 "R" V 9784 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 3450 50  0001 C CNN
F 3 "~" H 9900 3450 50  0001 C CNN
	1    9900 3450
	0    1    1    0   
$EndComp
Text HLabel 7050 3200 2    50   Output ~ 0
WR
NoConn ~ 2000 6450
NoConn ~ 2000 6550
NoConn ~ 2000 6650
Wire Wire Line
	2000 6850 2000 7150
Wire Wire Line
	2000 7150 2500 7150
Connection ~ 2500 7150
Text Label 4300 5050 0    50   ~ 0
RTS0
Wire Wire Line
	4300 5050 4600 5050
Text Label 9200 2250 0    50   ~ 0
RTS0
Wire Wire Line
	9450 2250 9200 2250
$Comp
L Device:LED D2103/RTS1
U 1 1 62EF4C51
P 9600 2250
F 0 "D2103/RTS1" H 9450 2400 50  0000 C TNN
F 1 "LED" H 9600 2150 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9600 2250 50  0001 C CNN
F 3 "~" H 9600 2250 50  0001 C CNN
	1    9600 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 62EF4C59
P 9900 2250
F 0 "R17" V 9693 2250 50  0000 C CNN
F 1 "R" V 9784 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 2250 50  0001 C CNN
F 3 "~" H 9900 2250 50  0001 C CNN
	1    9900 2250
	0    1    1    0   
$EndComp
NoConn ~ 2000 5950
$Comp
L Device:LED D2102/ST1
U 1 1 62ECE42D
P 9600 3450
F 0 "D2102/ST1" H 9400 3600 50  0000 C TNN
F 1 "LED" H 9600 3350 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9600 3450 50  0001 C CNN
F 3 "~" H 9600 3450 50  0001 C CNN
	1    9600 3450
	1    0    0    -1  
$EndComp
Text Label 9150 3450 0    50   ~ 0
ST
Wire Wire Line
	9450 3450 9150 3450
Text Label 9150 3050 0    50   ~ 0
HALT
$Comp
L Device:LED D2101/H1
U 1 1 62ECA51D
P 9600 3050
F 0 "D2101/H1" H 9400 3200 50  0000 C TNN
F 1 "LED" H 9600 2950 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9600 3050 50  0001 C CNN
F 3 "~" H 9600 3050 50  0001 C CNN
	1    9600 3050
	1    0    0    -1  
$EndComp
Text Label 9150 2650 0    50   ~ 0
M1
$Comp
L Device:LED D2100/M1
U 1 1 6215FBC4
P 9600 2650
F 0 "D2100/M1" H 9400 2800 50  0000 C TNN
F 1 "LED" H 9600 2550 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9600 2650 50  0001 C CNN
F 3 "~" H 9600 2650 50  0001 C CNN
	1    9600 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 62F15912
P 10050 2250
F 0 "#PWR0107" H 10050 2100 50  0001 C CNN
F 1 "+5V" V 10065 2378 50  0000 L CNN
F 2 "" H 10050 2250 50  0001 C CNN
F 3 "" H 10050 2250 50  0001 C CNN
	1    10050 2250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 62F23F5D
P 10050 2650
F 0 "#PWR0110" H 10050 2500 50  0001 C CNN
F 1 "+5V" V 10065 2778 50  0000 L CNN
F 2 "" H 10050 2650 50  0001 C CNN
F 3 "" H 10050 2650 50  0001 C CNN
	1    10050 2650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 62F23F63
P 10050 3050
F 0 "#PWR0111" H 10050 2900 50  0001 C CNN
F 1 "+5V" V 10065 3178 50  0000 L CNN
F 2 "" H 10050 3050 50  0001 C CNN
F 3 "" H 10050 3050 50  0001 C CNN
	1    10050 3050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 62F330B6
P 10050 3450
F 0 "#PWR0112" H 10050 3300 50  0001 C CNN
F 1 "+5V" V 10065 3578 50  0000 L CNN
F 2 "" H 10050 3450 50  0001 C CNN
F 3 "" H 10050 3450 50  0001 C CNN
	1    10050 3450
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 62F37858
P 8750 1250
AR Path="/6195D2C9/62F37858" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62F37858" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62F37858" Ref="C2102"  Part="1" 
F 0 "C2102" H 8865 1296 50  0000 L CNN
F 1 "22pf" H 8865 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8788 1100 50  0001 C CNN
F 3 "~" H 8750 1250 50  0001 C CNN
	1    8750 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62F3785E
P 8750 1400
AR Path="/62F3785E" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/62F3785E" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/62F3785E" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/62F3785E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62F3785E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62F3785E" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 8750 1150 50  0001 C CNN
F 1 "GND" H 8755 1227 50  0000 C CNN
F 2 "" H 8750 1400 50  0001 C CNN
F 3 "" H 8750 1400 50  0001 C CNN
	1    8750 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62F37864
P 8750 1100
AR Path="/6195D2C9/62F37864" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62F37864" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62F37864" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 8750 950 50  0001 C CNN
F 1 "+5V" H 8765 1273 50  0000 C CNN
F 2 "" H 8750 1100 50  0001 C CNN
F 3 "" H 8750 1100 50  0001 C CNN
	1    8750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3050 9450 3050
Wire Wire Line
	9150 2650 9450 2650
$Sheet
S 1550 1800 600  600 
U 636B5B34
F0 "sheet636B5B2E" 50
F1 "2210_SD_Card.sch" 50
F2 "CS" I L 1550 1950 50 
F3 "MOSI" I L 1550 2050 50 
F4 "SCK" I L 1550 2150 50 
F5 "MISO" O L 1550 2250 50 
$EndSheet
Wire Wire Line
	1550 2050 1300 2050
Wire Wire Line
	1550 2150 1300 2150
Text Label 1300 2050 0    50   ~ 0
MOSI
Text Label 1300 2150 0    50   ~ 0
SCK
Text Label 1300 2250 0    50   ~ 0
MISO
Wire Wire Line
	1550 2250 1300 2250
Text Label 1300 1950 0    50   ~ 0
CS0
Wire Wire Line
	1300 1950 1550 1950
Wire Wire Line
	6750 5100 7050 5100
Text Label 7050 5100 2    50   ~ 0
TXS
Wire Wire Line
	1650 2850 1350 2850
Text Label 1350 2850 0    50   ~ 0
CKS
Wire Wire Line
	1650 2950 1350 2950
Text Label 1350 2950 0    50   ~ 0
RXS
Wire Wire Line
	1650 2750 1350 2750
Text Label 1350 2750 0    50   ~ 0
TXS
Wire Bus Line
	4300 3550 4300 4250
Wire Bus Line
	4300 1400 4300 3400
$EndSCHEMATC
