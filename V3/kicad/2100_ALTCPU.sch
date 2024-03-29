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
P 2000 900
F 0 "U2100" H 2200 950 50  0000 R TNN
F 1 "Z8-L180-S180-180-PQFP-80" V 1710 50  50  0001 C CNN
F 2 "UL_Z180:Z8018008FSG" H 2250 1750 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z180/z8s180ps.pdf" V 2100 950 50  0001 L CNN
F 4 "Microprocessors - MPU 20MHz STATIC Z180 XT" H 2250 1950 50  0001 L CNN "Description"
F 5 "3.1" H 2250 1850 50  0001 L CNN "Height"
F 6 "Zilog" H 2200 2150 50  0001 L CNN "Manufacturer_Name"
F 7 "Z8S18020FEG" H 2200 2250 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z8S18020FEG" H 2250 2350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z8S18020FEG" H 2250 2450 50  0001 L CNN "Mouser Price/Stock"
	1    2000 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 61EE270A
P 4150 1100
F 0 "#PWR0164" H 4150 850 50  0001 C CNN
F 1 "GND" H 4155 927 50  0000 C CNN
F 2 "" H 4150 1100 50  0001 C CNN
F 3 "" H 4150 1100 50  0001 C CNN
	1    4150 1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 1100 4150 1200
Connection ~ 4150 1200
Connection ~ 4150 1300
Wire Wire Line
	4150 1300 4150 1400
$Comp
L power:+5V #PWR0165
U 1 1 61EE3DC3
P 4150 1500
F 0 "#PWR0165" H 4150 1350 50  0001 C CNN
F 1 "+5V" V 4165 1628 50  0000 L CNN
F 2 "" H 4150 1500 50  0001 C CNN
F 3 "" H 4150 1500 50  0001 C CNN
	1    4150 1500
	0    1    1    0   
$EndComp
Entry Wire Line
	1700 3150 1800 3250
Entry Wire Line
	1700 3250 1800 3350
Entry Wire Line
	1700 3350 1800 3450
Entry Wire Line
	1700 3450 1800 3550
Entry Wire Line
	1700 3550 1800 3650
Entry Wire Line
	1700 3650 1800 3750
Entry Wire Line
	1700 3750 1800 3850
Entry Wire Line
	1700 3850 1800 3950
Wire Wire Line
	1800 3650 2000 3650
Wire Wire Line
	1800 3550 2000 3550
Wire Wire Line
	1800 3450 2000 3450
Wire Wire Line
	1800 3350 2000 3350
Wire Wire Line
	1800 3250 2000 3250
Wire Wire Line
	1800 3750 2000 3750
Wire Wire Line
	1800 3850 2000 3850
Wire Wire Line
	1800 3950 2000 3950
Text Label 1800 3250 0    50   ~ 0
D0
Text Label 1800 3350 0    50   ~ 0
D1
Text Label 1800 3450 0    50   ~ 0
D2
Text Label 1800 3550 0    50   ~ 0
D3
Text Label 1800 3650 0    50   ~ 0
D4
Text Label 1800 3750 0    50   ~ 0
D5
Text Label 1800 3850 0    50   ~ 0
D6
Text Label 1800 3950 0    50   ~ 0
D7
Wire Bus Line
	1700 1000 1600 1000
Entry Wire Line
	1700 1000 1800 1100
Entry Wire Line
	1700 1100 1800 1200
Entry Wire Line
	1700 1200 1800 1300
Entry Wire Line
	1700 1300 1800 1400
Entry Wire Line
	1700 1400 1800 1500
Entry Wire Line
	1700 1500 1800 1600
Entry Wire Line
	1700 1600 1800 1700
Entry Wire Line
	1700 1700 1800 1800
Entry Wire Line
	1700 1800 1800 1900
Entry Wire Line
	1700 1900 1800 2000
Entry Wire Line
	1700 2000 1800 2100
Entry Wire Line
	1700 2100 1800 2200
Entry Wire Line
	1700 2200 1800 2300
Entry Wire Line
	1700 2300 1800 2400
Entry Wire Line
	1700 2400 1800 2500
Entry Wire Line
	1700 2500 1800 2600
Entry Wire Line
	1700 2600 1800 2700
Entry Wire Line
	1700 2700 1800 2800
Entry Wire Line
	1700 2800 1800 2900
Entry Wire Line
	1700 2900 1800 3000
Wire Wire Line
	1800 1100 2000 1100
Wire Wire Line
	1800 1200 2000 1200
Wire Wire Line
	1800 1300 2000 1300
Wire Wire Line
	1800 1400 2000 1400
Wire Wire Line
	1800 1500 2000 1500
Wire Wire Line
	1800 1600 2000 1600
Wire Wire Line
	1800 1700 2000 1700
Wire Wire Line
	1800 1800 2000 1800
Wire Wire Line
	1800 1900 2000 1900
Wire Wire Line
	1800 2000 2000 2000
Wire Wire Line
	1800 2100 2000 2100
Wire Wire Line
	1800 2200 2000 2200
Wire Wire Line
	1800 2300 2000 2300
Wire Wire Line
	1800 2400 2000 2400
Wire Wire Line
	1800 2500 2000 2500
Wire Wire Line
	1800 2600 2000 2600
Wire Wire Line
	1800 2700 2000 2700
Wire Wire Line
	1800 2800 2000 2800
Wire Wire Line
	1800 2900 2000 2900
Wire Wire Line
	1800 3000 2000 3000
Text HLabel 1600 1000 0    50   Output ~ 0
A[0..19]
NoConn ~ 4150 2900
Text HLabel 4450 2200 2    50   Output ~ 0
IORQ
Text HLabel 4450 2700 2    50   Output ~ 0
RD
NoConn ~ 4150 3600
NoConn ~ 2000 4350
NoConn ~ 2000 4750
Connection ~ 4150 1100
Wire Wire Line
	4150 1200 4150 1300
Text Label 1800 1100 0    50   ~ 0
A0
Text Label 1800 1200 0    50   ~ 0
A1
Text Label 1800 1300 0    50   ~ 0
A2
Text Label 1800 1400 0    50   ~ 0
A3
Text Label 1800 1500 0    50   ~ 0
A4
Text Label 1800 1600 0    50   ~ 0
A5
Text Label 1800 1700 0    50   ~ 0
A6
Text Label 1800 1800 0    50   ~ 0
A7
Text Label 1800 1900 0    50   ~ 0
A8
Text Label 1800 2000 0    50   ~ 0
A9
Text Label 1800 2100 0    50   ~ 0
A10
Text Label 1800 2200 0    50   ~ 0
A11
Text Label 1800 2300 0    50   ~ 0
A12
Text Label 1800 2400 0    50   ~ 0
A13
Text Label 1800 2500 0    50   ~ 0
A14
Text Label 1800 2600 0    50   ~ 0
A15
Text Label 1800 2700 0    50   ~ 0
A16
Text Label 1800 2800 0    50   ~ 0
A17
Text Label 1800 2900 0    50   ~ 0
A18
Text Label 1800 3000 0    50   ~ 0
A19
$Comp
L power:GND #PWR?
U 1 1 624D98DF
P 2150 7450
AR Path="/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/624D98DF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/624D98DF" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 2150 7200 50  0001 C CNN
F 1 "GND" H 2155 7277 50  0000 C CNN
F 2 "" H 2150 7450 50  0001 C CNN
F 3 "" H 2150 7450 50  0001 C CNN
	1    2150 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624D98F5
P 2150 6050
AR Path="/6195D2C9/624D98F5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/624D98F5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/624D98F5" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2150 5900 50  0001 C CNN
F 1 "+5V" H 2165 6223 50  0000 C CNN
F 2 "" H 2150 6050 50  0001 C CNN
F 3 "" H 2150 6050 50  0001 C CNN
	1    2150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6450 1400 6450
Wire Wire Line
	1650 6350 1400 6350
Text Label 1400 6350 0    50   ~ 0
MREQ
Text Label 1400 6450 0    50   ~ 0
IORQ
Text HLabel 2650 6550 2    50   Output ~ 0
ROM_CS
Text Label 1400 6650 0    50   ~ 0
A19
Text HLabel 2650 6350 2    50   Output ~ 0
RAM_CS
$Sheet
S 700  6950 550  200 
U 62512FB8
F0 "2110_Reset" 50
F1 "2110_Reset.sch" 50
F2 "Reset" I R 1250 7050 50 
$EndSheet
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 6255C3DA
P 6050 7150
AR Path="/6191B6A2/6255C3DA" Ref="X?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6255C3DA" Ref="U2102"  Part="1" 
F 0 "U2102" H 5707 7196 50  0000 R CNN
F 1 "14.7456 MHz" H 5707 7105 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 6500 6800 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 5950 7150 50  0001 C CNN
	1    6050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6255C3E0
P 6050 6850
AR Path="/6191B6A2/6255C3E0" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6255C3E0" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 6050 6700 50  0001 C CNN
F 1 "+5V" H 6065 7023 50  0000 C CNN
F 2 "" H 6050 6850 50  0001 C CNN
F 3 "" H 6050 6850 50  0001 C CNN
	1    6050 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6255C3E6
P 6050 7450
AR Path="/6191B6A2/6255C3E6" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6255C3E6" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 6050 7200 50  0001 C CNN
F 1 "GND" H 6055 7277 50  0000 C CNN
F 2 "" H 6050 7450 50  0001 C CNN
F 3 "" H 6050 7450 50  0001 C CNN
	1    6050 7450
	1    0    0    -1  
$EndComp
Text Label 6550 7150 2    50   ~ 0
CLK
Text Notes 7700 6950 0    118  ~ 24
This page has NOT been checked!
Text Label 4450 2100 2    50   ~ 0
MREQ
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 624D98D9
P 2150 6750
AR Path="/624D98D9" Ref="U?"  Part="1" 
AR Path="/6191B6A2/624D98D9" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/624D98D9" Ref="U?"  Part="1" 
AR Path="/6195D2C9/624D98D9" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/624D98D9" Ref="U2101"  Part="1" 
F 0 "U2101" H 2600 7600 50  0000 C CNN
F 1 "GAL16V8" H 2600 7500 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 2150 6750 50  0001 C CNN
F 3 "" H 2150 6750 50  0001 C CNN
	1    2150 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1700 4450 1700
Wire Wire Line
	4150 1800 4450 1800
Text HLabel 4450 1900 2    50   Input ~ 0
INT
Text Label 4450 1700 2    50   ~ 0
INT2
Text Label 4450 1800 2    50   ~ 0
INT1
Wire Wire Line
	7250 2250 6950 2250
Wire Wire Line
	7250 2350 6950 2350
Text Label 6950 2250 0    50   ~ 0
INT2
Text Label 6950 2350 0    50   ~ 0
INT1
Wire Wire Line
	4150 2000 4450 2000
Text Label 4450 2000 2    50   ~ 0
NMI
Wire Wire Line
	4150 2400 4450 2400
Text Label 4450 2400 2    50   ~ 0
BUSREQ
Wire Wire Line
	4150 2600 4450 2600
Text Label 4450 2600 2    50   ~ 0
WAIT
Wire Wire Line
	9750 4150 9450 4150
Text Label 9450 4150 0    50   ~ 0
BUSREQ
Wire Wire Line
	9750 3800 9450 3800
Text Label 9450 3800 0    50   ~ 0
WAIT
Text HLabel 4450 3000 2    50   Output ~ 0
M1
Wire Wire Line
	4150 3200 4450 3200
Text Label 4450 3200 2    50   ~ 0
HALT
Wire Wire Line
	4150 3700 4450 3700
Text Label 4450 3700 2    50   ~ 0
DREQ1
Wire Wire Line
	4150 4200 4450 4200
Text Label 4450 4200 2    50   ~ 0
CTS0
Wire Wire Line
	9750 4500 9450 4500
Text Label 9450 4500 0    50   ~ 0
CTS0
Wire Wire Line
	7250 2950 6950 2950
Text Label 6950 2950 0    50   ~ 0
DREQ1
Wire Wire Line
	8500 6150 8150 6150
Text Label 8150 6150 0    50   ~ 0
TX
Wire Wire Line
	4150 1900 4450 1900
Text Label 4450 1900 2    50   ~ 0
INT0
Wire Wire Line
	4150 2100 4450 2100
Wire Wire Line
	4150 2200 4450 2200
Text Label 4450 2200 2    50   ~ 0
IORQ
Wire Wire Line
	4150 2700 4450 2700
Wire Wire Line
	4150 2800 4450 2800
Wire Wire Line
	4150 3000 4450 3000
Text Label 4450 2700 2    50   ~ 0
RD
Text Label 4450 2800 2    50   ~ 0
WR
Text Label 4450 3000 2    50   ~ 0
M1
Wire Wire Line
	7250 2450 6950 2450
Text Label 6950 2450 0    50   ~ 0
INT0
Wire Wire Line
	2000 4550 1700 4550
Text Label 1700 4550 0    50   ~ 0
DCD0
NoConn ~ 3700 5350
Text Label 4450 2300 2    50   ~ 0
C_RST
Wire Wire Line
	4150 2300 4450 2300
NoConn ~ 4150 3800
NoConn ~ 4150 4300
Wire Wire Line
	7250 3050 6950 3050
Text Label 6950 3050 0    50   ~ 0
CKS
Wire Wire Line
	4150 4600 4450 4600
Text Label 4450 4600 2    50   ~ 0
CKS
Text Label 2950 6250 2    50   ~ 0
C_RST
Wire Wire Line
	2650 6250 2950 6250
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
	1400 6550 1650 6550
Wire Wire Line
	1400 6650 1650 6650
Text Label 1400 6550 0    50   ~ 0
A7
Text HLabel 1600 3150 0    50   BiDi ~ 0
D[0..7]
Wire Bus Line
	1700 3150 1600 3150
NoConn ~ 4150 3400
NoConn ~ 4150 3500
Wire Wire Line
	4150 4500 4450 4500
Text Label 4450 4500 2    50   ~ 0
RXS
NoConn ~ 4150 2500
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
L Device:R R8
U 1 1 62EF9277
P 9900 3800
F 0 "R8" V 9693 3800 50  0000 C CNN
F 1 "R" V 9784 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 3800 50  0001 C CNN
F 3 "~" H 9900 3800 50  0001 C CNN
	1    9900 3800
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0136
U 1 1 62EF927D
P 10050 3800
F 0 "#PWR0136" H 10050 3650 50  0001 C CNN
F 1 "+5V" V 10065 3928 50  0000 L CNN
F 2 "" H 10050 3800 50  0001 C CNN
F 3 "" H 10050 3800 50  0001 C CNN
	1    10050 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 62F00BDB
P 9900 4150
F 0 "R10" V 9693 4150 50  0000 C CNN
F 1 "R" V 9784 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 4150 50  0001 C CNN
F 3 "~" H 9900 4150 50  0001 C CNN
	1    9900 4150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0138
U 1 1 62F00BE1
P 10050 4150
F 0 "#PWR0138" H 10050 4000 50  0001 C CNN
F 1 "+5V" V 10065 4278 50  0000 L CNN
F 2 "" H 10050 4150 50  0001 C CNN
F 3 "" H 10050 4150 50  0001 C CNN
	1    10050 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 62F0767B
P 9900 4500
F 0 "R12" V 9693 4500 50  0000 C CNN
F 1 "R" V 9784 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9830 4500 50  0001 C CNN
F 3 "~" H 9900 4500 50  0001 C CNN
	1    9900 4500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0140
U 1 1 62F07681
P 10050 4500
F 0 "#PWR0140" H 10050 4350 50  0001 C CNN
F 1 "+5V" V 10065 4628 50  0000 L CNN
F 2 "" H 10050 4500 50  0001 C CNN
F 3 "" H 10050 4500 50  0001 C CNN
	1    10050 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 3100 4450 3100
Text Label 4450 3100 2    50   ~ 0
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
Text HLabel 4450 2800 2    50   Output ~ 0
WR
NoConn ~ 1650 6750
NoConn ~ 1650 6850
NoConn ~ 1650 6950
Wire Wire Line
	1650 7150 1650 7450
Wire Wire Line
	1650 7450 2150 7450
Connection ~ 2150 7450
Text Label 1700 4650 0    50   ~ 0
RTS0
Wire Wire Line
	1700 4650 2000 4650
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
NoConn ~ 1650 6250
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
Text Label 8200 5150 0    50   ~ 0
CS0
Wire Wire Line
	4150 4700 4450 4700
Text Label 4450 4700 2    50   ~ 0
TXS
Wire Wire Line
	8500 5350 8200 5350
Text Label 8200 5350 0    50   ~ 0
CKS
Wire Wire Line
	8500 5450 8200 5450
Text Label 8200 5450 0    50   ~ 0
RXS
Wire Wire Line
	8500 5250 8200 5250
Text Label 8200 5250 0    50   ~ 0
TXS
$Comp
L 74xx:74HCT273 U2103
U 1 1 63802B80
P 4450 6750
F 0 "U2103" H 4750 7600 50  0000 C CNN
F 1 "74HCT273" H 4750 7500 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 4450 6750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT273.pdf" H 4450 6750 50  0001 C CNN
	1    4450 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 638069B9
P 4450 7550
AR Path="/638069B9" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/638069B9" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F0BDAE/638069B9" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/638069B9" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/638069B9" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 4450 7300 50  0001 C CNN
F 1 "GND" H 4455 7377 50  0000 C CNN
F 2 "" H 4450 7550 50  0001 C CNN
F 3 "" H 4450 7550 50  0001 C CNN
	1    4450 7550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6380B8FC
P 4450 5950
AR Path="/6191B6A2/6380B8FC" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6380B8FC" Ref="#PWR0157"  Part="1" 
F 0 "#PWR0157" H 4450 5800 50  0001 C CNN
F 1 "+5V" H 4465 6123 50  0000 C CNN
F 2 "" H 4450 5950 50  0001 C CNN
F 3 "" H 4450 5950 50  0001 C CNN
	1    4450 5950
	1    0    0    -1  
$EndComp
$Sheet
S 8500 5950 550  300 
U 62542978
F0 "2120_USB" 50
F1 "2120_USB.sch" 50
F2 "TX" O L 8500 6050 50 
F3 "RX" I L 8500 6150 50 
$EndSheet
Wire Wire Line
	4150 4000 4500 4000
Text Label 4500 4000 2    50   ~ 0
RX
Wire Wire Line
	8500 6050 8150 6050
Text Label 8150 6050 0    50   ~ 0
RX
Wire Wire Line
	4150 4100 4500 4100
Text Label 4500 4100 2    50   ~ 0
TX
Entry Wire Line
	3650 6150 3750 6250
Entry Wire Line
	3650 6250 3750 6350
Entry Wire Line
	3650 6350 3750 6450
Entry Wire Line
	3650 6450 3750 6550
Entry Wire Line
	3650 6550 3750 6650
Entry Wire Line
	3650 6650 3750 6750
Entry Wire Line
	3650 6750 3750 6850
Entry Wire Line
	3650 6850 3750 6950
Wire Wire Line
	3750 6650 3950 6650
Wire Wire Line
	3750 6550 3950 6550
Wire Wire Line
	3750 6450 3950 6450
Wire Wire Line
	3750 6350 3950 6350
Wire Wire Line
	3750 6250 3950 6250
Wire Wire Line
	3750 6750 3950 6750
Wire Wire Line
	3750 6850 3950 6850
Wire Wire Line
	3750 6950 3950 6950
Text Label 3750 6250 0    50   ~ 0
D0
Text Label 3750 6350 0    50   ~ 0
D1
Text Label 3750 6450 0    50   ~ 0
D2
Text Label 3750 6550 0    50   ~ 0
D3
Text Label 3750 6650 0    50   ~ 0
D4
Text Label 3750 6750 0    50   ~ 0
D5
Text Label 3750 6850 0    50   ~ 0
D6
Text Label 3750 6950 0    50   ~ 0
D7
Text HLabel 3550 6150 0    50   BiDi ~ 0
D[0..7]
Wire Bus Line
	3650 6150 3550 6150
Text Label 3650 7250 0    50   ~ 0
C_RST
Wire Wire Line
	3950 7250 3650 7250
Text Label 5200 6650 2    50   ~ 0
CS4
Wire Wire Line
	5200 6650 4950 6650
Text Label 5200 6750 2    50   ~ 0
CS5
Wire Wire Line
	5200 6750 4950 6750
Text Label 5200 6850 2    50   ~ 0
CS6
Wire Wire Line
	5200 6850 4950 6850
Text Label 5200 6950 2    50   ~ 0
CS7
Wire Wire Line
	5200 6950 4950 6950
Text Label 5200 6250 2    50   ~ 0
CS0
Wire Wire Line
	5200 6250 4950 6250
Text Label 5200 6350 2    50   ~ 0
CS1
Wire Wire Line
	5200 6350 4950 6350
Text Label 5200 6450 2    50   ~ 0
CS2
Wire Wire Line
	5200 6450 4950 6450
Text Label 5200 6550 2    50   ~ 0
CS3
Wire Wire Line
	5200 6550 4950 6550
Wire Wire Line
	2650 6450 3100 6450
Wire Wire Line
	3100 6450 3100 7150
Wire Wire Line
	3100 7150 3950 7150
Wire Wire Line
	6350 7150 6550 7150
Wire Wire Line
	1250 7050 1650 7050
$Sheet
S 8500 5000 600  600 
U 636B5B34
F0 "2230_SD_Card" 50
F1 "2230_SD_Card.sch" 50
F2 "CS" I L 8500 5150 50 
F3 "MOSI" I L 8500 5250 50 
F4 "SCK" I L 8500 5350 50 
F5 "MISO" O L 8500 5450 50 
$EndSheet
Text Label 1800 4250 0    50   ~ 0
CLK
Wire Wire Line
	2000 4250 1800 4250
NoConn ~ 2000 4150
$Comp
L Device:R_Pack04 RN?
U 1 1 63966909
P 7450 2350
AR Path="/6191B6A2/61EBDADB/636B5B34/63966909" Ref="RN?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63966909" Ref="RN2100"  Part="1" 
F 0 "RN2100" V 7775 2350 50  0000 C CNN
F 1 "4 x 10K" V 7684 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 7725 2350 50  0001 C CNN
F 3 "~" H 7450 2350 50  0001 C CNN
	1    7450 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63978B22
P 7650 2250
AR Path="/6195D2C9/63978B22" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63978B22" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63978B22" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 7650 2100 50  0001 C CNN
F 1 "+5V" H 7665 2423 50  0000 C CNN
F 2 "" H 7650 2250 50  0001 C CNN
F 3 "" H 7650 2250 50  0001 C CNN
	1    7650 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2550 7650 2450
Connection ~ 7650 2250
Connection ~ 7650 2350
Wire Wire Line
	7650 2350 7650 2250
Connection ~ 7650 2450
Wire Wire Line
	7650 2450 7650 2350
Wire Wire Line
	7250 2550 6950 2550
Text Label 6950 2550 0    50   ~ 0
NMI
$Comp
L Device:R_Pack04 RN?
U 1 1 639E8FD4
P 7450 3050
AR Path="/6191B6A2/61EBDADB/636B5B34/639E8FD4" Ref="RN?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/639E8FD4" Ref="RN2101"  Part="1" 
F 0 "RN2101" V 7775 3050 50  0000 C CNN
F 1 "4 x 10K" V 7684 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 7725 3050 50  0001 C CNN
F 3 "~" H 7450 3050 50  0001 C CNN
	1    7450 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 3150 6950 3150
Text Label 6950 3150 0    50   ~ 0
RXS
Wire Wire Line
	7250 3250 6950 3250
Text Label 6950 3250 0    50   ~ 0
DCD0
$Comp
L power:+5V #PWR?
U 1 1 63A14D5D
P 7650 2950
AR Path="/6195D2C9/63A14D5D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63A14D5D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63A14D5D" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 7650 2800 50  0001 C CNN
F 1 "+5V" H 7665 3123 50  0000 C CNN
F 2 "" H 7650 2950 50  0001 C CNN
F 3 "" H 7650 2950 50  0001 C CNN
	1    7650 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2950 7650 3050
Connection ~ 7650 2950
Connection ~ 7650 3050
Wire Wire Line
	7650 3050 7650 3150
Connection ~ 7650 3150
Wire Wire Line
	7650 3150 7650 3250
Wire Wire Line
	8200 5150 8500 5150
$Comp
L Device:C C?
U 1 1 63A7CF83
P 9300 1250
AR Path="/6195D2C9/63A7CF83" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63A7CF83" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63A7CF83" Ref="C2103"  Part="1" 
F 0 "C2103" H 9415 1296 50  0000 L CNN
F 1 "22pf" H 9415 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9338 1100 50  0001 C CNN
F 3 "~" H 9300 1250 50  0001 C CNN
	1    9300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63A7CF89
P 9300 1400
AR Path="/63A7CF89" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/63A7CF89" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/63A7CF89" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/63A7CF89" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63A7CF89" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63A7CF89" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9300 1150 50  0001 C CNN
F 1 "GND" H 9305 1227 50  0000 C CNN
F 2 "" H 9300 1400 50  0001 C CNN
F 3 "" H 9300 1400 50  0001 C CNN
	1    9300 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63A7CF8F
P 9300 1100
AR Path="/6195D2C9/63A7CF8F" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63A7CF8F" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63A7CF8F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9300 950 50  0001 C CNN
F 1 "+5V" H 9315 1273 50  0000 C CNN
F 2 "" H 9300 1100 50  0001 C CNN
F 3 "" H 9300 1100 50  0001 C CNN
	1    9300 1100
	1    0    0    -1  
$EndComp
Wire Bus Line
	1700 3150 1700 3850
Wire Bus Line
	3650 6150 3650 6850
Wire Bus Line
	1700 1000 1700 3000
$EndSCHEMATC
