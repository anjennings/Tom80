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
$Comp
L Zilog_Z180:Z8-L180-S180-180-PQFP-80 U2100
U 1 1 61EBDD59
P 4600 1300
F 0 "U2100" H 4800 1350 50  0000 R TNN
F 1 "Z8-L180-S180-180-PQFP-80" V 4310 450 50  0001 C CNN
F 2 "Package_QFP:PQFP-80_14x20mm_P0.8mm" H 4850 2150 50  0001 L CNN
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
Wire Bus Line
	4300 3550 4200 3550
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
Text HLabel 4200 3550 0    50   BiDi ~ 0
D[0..7]
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
Text HLabel 4200 1400 0    50   3State ~ 0
A[0..19]
NoConn ~ 6750 3300
Text HLabel 6750 2600 2    50   Output ~ 0
IORQ
Text HLabel 6750 3100 2    50   Output ~ 0
RD
Text HLabel 6750 3200 2    50   Output ~ 0
WR
Text HLabel 6750 3500 2    50   Output ~ 0
ST
Text HLabel 9500 4150 0    50   Output ~ 0
M1
Text HLabel 10350 5300 0    50   Input ~ 0
INT
NoConn ~ 6750 4000
NoConn ~ 4600 4750
NoConn ~ 4600 5150
$Comp
L power:+5V #PWR0169
U 1 1 61FA8246
P 4600 4950
F 0 "#PWR0169" H 4600 4800 50  0001 C CNN
F 1 "+5V" V 4615 5078 50  0000 L CNN
F 2 "" H 4600 4950 50  0001 C CNN
F 3 "" H 4600 4950 50  0001 C CNN
	1    4600 4950
	0    -1   -1   0   
$EndComp
Connection ~ 6750 1500
Wire Wire Line
	6750 1600 6750 1700
Text HLabel 4600 4550 0    50   Output ~ 0
PHI
NoConn ~ 6750 2900
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
L Device:LED D2101
U 1 1 6215EDE4
P 9900 4400
F 0 "D2101" H 10100 4450 50  0000 C CNN
F 1 "LED" H 9650 4450 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9900 4400 50  0001 C CNN
F 3 "~" H 9900 4400 50  0001 C CNN
	1    9900 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2100
U 1 1 6215FBC4
P 9900 4150
F 0 "D2100" H 10100 4250 50  0000 C TNN
F 1 "LED" H 9650 4200 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9900 4150 50  0001 C CNN
F 3 "~" H 9900 4150 50  0001 C CNN
	1    9900 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 4300 10350 4300
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
Entry Wire Line
	1600 6750 1700 6650
Wire Wire Line
	1700 6450 2000 6450
Wire Wire Line
	1700 6550 2000 6550
Text Label 1750 6450 0    50   ~ 0
A7
Text Label 1750 6550 0    50   ~ 0
A18
Wire Bus Line
	1600 6750 1450 6750
Text HLabel 1450 6750 0    50   Input ~ 0
A[0..19]
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
	2000 6050 1750 6050
Wire Wire Line
	2000 5950 1750 5950
Wire Wire Line
	2000 6150 1750 6150
Text Label 1750 6150 0    50   ~ 0
RD
Text Label 1750 5950 0    50   ~ 0
MREQ
Text Label 1750 6050 0    50   ~ 0
IORQ
Text HLabel 3000 5950 2    50   Output ~ 0
ROM_CS
Entry Wire Line
	1600 6650 1700 6550
Entry Wire Line
	1600 6550 1700 6450
Wire Wire Line
	1700 6650 2000 6650
Text Label 1750 6650 0    50   ~ 0
A19
Text HLabel 3000 6050 2    50   Output ~ 0
H_RAM_CS
Text HLabel 3000 6150 2    50   Output ~ 0
AUX_CS
Text HLabel 3000 6250 2    50   Output ~ 0
PIO_EN
Wire Wire Line
	2000 6250 1750 6250
Text Label 1750 6250 0    50   ~ 0
WR
Text HLabel 3000 6350 2    50   Output ~ 0
MREAD
Text HLabel 3000 6450 2    50   Output ~ 0
MWRITE
Wire Bus Line
	1300 1750 1200 1750
Entry Wire Line
	1300 1750 1400 1850
Entry Wire Line
	1300 1850 1400 1950
Entry Wire Line
	1300 1950 1400 2050
Entry Wire Line
	1300 2050 1400 2150
Entry Wire Line
	1300 2150 1400 2250
Entry Wire Line
	1300 2250 1400 2350
Entry Wire Line
	1300 2350 1400 2450
Entry Wire Line
	1300 2450 1400 2550
Entry Wire Line
	1300 2550 1400 2650
Entry Wire Line
	1300 2650 1400 2750
Entry Wire Line
	1300 2750 1400 2850
Entry Wire Line
	1300 2850 1400 2950
Entry Wire Line
	1300 2950 1400 3050
Entry Wire Line
	1300 3050 1400 3150
Entry Wire Line
	1300 3150 1400 3250
Entry Wire Line
	1300 3250 1400 3350
Entry Wire Line
	1300 3350 1400 3450
Entry Wire Line
	1300 3450 1400 3550
Entry Wire Line
	1300 3550 1400 3650
Entry Wire Line
	1300 3650 1400 3750
Wire Wire Line
	1400 1850 1600 1850
Wire Wire Line
	1400 1950 1600 1950
Wire Wire Line
	1400 2050 1600 2050
Wire Wire Line
	1400 2150 1600 2150
Wire Wire Line
	1400 2250 1600 2250
Wire Wire Line
	1400 2350 1600 2350
Wire Wire Line
	1400 2450 1600 2450
Wire Wire Line
	1400 2550 1600 2550
Wire Wire Line
	1400 2650 1600 2650
Wire Wire Line
	1400 2750 1600 2750
Wire Wire Line
	1400 2850 1600 2850
Wire Wire Line
	1400 2950 1600 2950
Wire Wire Line
	1400 3050 1600 3050
Wire Wire Line
	1400 3150 1600 3150
Wire Wire Line
	1400 3250 1600 3250
Wire Wire Line
	1400 3350 1600 3350
Wire Wire Line
	1400 3450 1600 3450
Wire Wire Line
	1400 3550 1600 3550
Wire Wire Line
	1400 3650 1600 3650
Wire Wire Line
	1400 3750 1600 3750
Text HLabel 1200 1750 0    50   3State ~ 0
A[0..19]
Text Label 1400 1850 0    50   ~ 0
A0
Text Label 1400 1950 0    50   ~ 0
A1
Text Label 1400 2050 0    50   ~ 0
A2
Text Label 1400 2150 0    50   ~ 0
A3
Text Label 1400 2250 0    50   ~ 0
A4
Text Label 1400 2350 0    50   ~ 0
A5
Text Label 1400 2450 0    50   ~ 0
A6
Text Label 1400 2550 0    50   ~ 0
A7
Text Label 1400 2650 0    50   ~ 0
A8
Text Label 1400 2750 0    50   ~ 0
A9
Text Label 1400 2850 0    50   ~ 0
A10
Text Label 1400 2950 0    50   ~ 0
A11
Text Label 1400 3050 0    50   ~ 0
A12
Text Label 1400 3150 0    50   ~ 0
A13
Text Label 1400 3250 0    50   ~ 0
A14
Text Label 1400 3350 0    50   ~ 0
A15
Text Label 1400 3450 0    50   ~ 0
A16
Text Label 1400 3550 0    50   ~ 0
A17
Text Label 1400 3650 0    50   ~ 0
A18
Text Label 1400 3750 0    50   ~ 0
A19
Wire Bus Line
	2400 2950 2500 2950
Entry Wire Line
	2400 2950 2300 2850
Entry Wire Line
	2400 2850 2300 2750
Entry Wire Line
	2400 2750 2300 2650
Entry Wire Line
	2400 2650 2300 2550
Entry Wire Line
	2400 2550 2300 2450
Entry Wire Line
	2400 2450 2300 2350
Entry Wire Line
	2400 2350 2300 2250
Entry Wire Line
	2400 2250 2300 2150
Wire Wire Line
	2300 2450 2100 2450
Wire Wire Line
	2300 2550 2100 2550
Wire Wire Line
	2300 2650 2100 2650
Wire Wire Line
	2300 2750 2100 2750
Wire Wire Line
	2300 2850 2100 2850
Wire Wire Line
	2300 2350 2100 2350
Wire Wire Line
	2300 2250 2100 2250
Wire Wire Line
	2300 2150 2100 2150
Text Label 2300 2850 2    50   ~ 0
D0
Text Label 2300 2750 2    50   ~ 0
D1
Text Label 2300 2650 2    50   ~ 0
D2
Text Label 2300 2550 2    50   ~ 0
D3
Text Label 2300 2450 2    50   ~ 0
D4
Text Label 2300 2350 2    50   ~ 0
D5
Text Label 2300 2250 2    50   ~ 0
D6
Text Label 2300 2150 2    50   ~ 0
D7
Text HLabel 2500 2950 2    50   BiDi ~ 0
D[0..7]
$Sheet
S 3600 6550 550  200 
U 62512FB8
F0 "2110_Reset" 50
F1 "2110_Reset.sch" 50
F2 "Reset" I L 3600 6650 50 
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
AR Path="/6191B6A2/61EBDADB/6255C3DA" Ref="X2100"  Part="1" 
F 0 "X2100" H 3057 4696 50  0000 R CNN
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
Wire Wire Line
	2100 2050 2350 2050
Text Label 2350 2050 2    50   ~ 0
CLK
Text Notes 5750 6250 0    197  ~ 39
This page has NOT been checked!
Wire Wire Line
	6750 2500 7400 2500
Text Label 7400 2500 2    50   ~ 0
MREQ
Wire Wire Line
	4600 5050 4150 5050
Text Label 4150 5050 0    50   ~ 0
RTS0
Text Label 1750 6350 0    50   ~ 0
RTS0
Wire Wire Line
	2000 6350 1750 6350
Text Notes 1450 7600 0    50   ~ 0
RTS0 defaults to 1 and can be controlled via internal registers\nSetting it low disables part of the ROM window
Wire Wire Line
	3600 6650 3000 6650
Wire Wire Line
	3000 6550 3450 6550
Wire Wire Line
	3450 6550 3450 6350
Wire Wire Line
	3450 6350 4050 6350
Text Label 4050 6350 2    50   ~ 0
CPU_RESET
Text Label 7400 2700 2    50   ~ 0
CPU_RESET
Wire Wire Line
	6750 2700 7400 2700
Wire Wire Line
	3700 4650 4600 4650
Wire Wire Line
	6750 4500 7200 4500
NoConn ~ 2000 6750
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
NoConn ~ 2000 6850
Text HLabel 2100 3150 2    50   Input ~ 0
AUX_CS
Text HLabel 2100 2950 2    50   Input ~ 0
RD
Text HLabel 2100 3050 2    50   Input ~ 0
WR
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J2100
U 1 1 626C4BC6
P 1800 2750
F 0 "J2100" H 1850 3867 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 1850 3776 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 1800 2750 50  0001 C CNN
F 3 "~" H 1800 2750 50  0001 C CNN
	1    1800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4150 9750 4150
Wire Wire Line
	10050 4150 10200 4150
Wire Wire Line
	10200 4150 10200 4300
Wire Wire Line
	10050 4400 10350 4400
$Comp
L power:+5V #PWR0122
U 1 1 626CAFF6
P 10750 4300
F 0 "#PWR0122" H 10750 4150 50  0001 C CNN
F 1 "+5V" V 10765 4428 50  0000 L CNN
F 2 "" H 10750 4300 50  0001 C CNN
F 3 "" H 10750 4300 50  0001 C CNN
	1    10750 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 2100 7050 2100
Wire Wire Line
	6750 2200 7050 2200
Text HLabel 6750 2300 2    50   Input ~ 0
INT
Text Label 7050 2100 2    50   ~ 0
INT2
Text Label 7050 2200 2    50   ~ 0
INT1
Wire Wire Line
	10350 4600 10050 4600
Wire Wire Line
	10350 4500 10050 4500
Text Label 10050 4600 0    50   ~ 0
INT2
Text Label 10050 4500 0    50   ~ 0
INT1
Wire Wire Line
	6750 2400 7050 2400
Text Label 7050 2400 2    50   ~ 0
NMI
Wire Wire Line
	10350 4700 10050 4700
Text Label 10050 4700 0    50   ~ 0
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
	10350 4900 10050 4900
Text Label 10050 4900 0    50   ~ 0
BUSREQ
Wire Wire Line
	10350 4800 10050 4800
Text Label 10050 4800 0    50   ~ 0
WAIT
$Comp
L Device:R_Network12 RN2100
U 1 1 62710ADC
P 10550 4900
F 0 "RN2100" V 9733 4900 50  0000 C CNN
F 1 "10k" V 9824 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP13" V 11225 4900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10550 4900 50  0001 C CNN
	1    10550 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 4400 7200 4400
Text HLabel 6750 3400 2    50   Output ~ 0
M1
Wire Wire Line
	6750 3600 7050 3600
Text Label 7050 3600 2    50   ~ 0
HALT
Text Label 9250 4400 0    50   ~ 0
HALT
Wire Wire Line
	9250 4400 9750 4400
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
	6750 4700 7050 4700
Text Label 7050 4700 2    50   ~ 0
DREQ0
Wire Wire Line
	6750 4600 7050 4600
Text Label 7050 4600 2    50   ~ 0
CTS0
Wire Wire Line
	10350 5100 10050 5100
Text Label 10050 5100 0    50   ~ 0
DREQ0
Wire Wire Line
	10350 5000 10050 5000
Text Label 10050 5000 0    50   ~ 0
CTS0
Wire Wire Line
	10350 5200 10050 5200
Text Label 10050 5200 0    50   ~ 0
DREQ1
Text HLabel 2100 3250 2    50   Output ~ 0
M1
Wire Wire Line
	2100 3350 2400 3350
Text Label 2400 3350 2    50   ~ 0
INT1
Wire Wire Line
	2100 3550 2400 3550
Text Label 2400 3550 2    50   ~ 0
BUSREQ
Wire Wire Line
	2100 3650 2400 3650
Text Label 2400 3650 2    50   ~ 0
WAIT
Wire Wire Line
	2100 3450 2400 3450
Text Label 2400 3450 2    50   ~ 0
DREQ0
$Comp
L power:GND #PWR0140
U 1 1 6275CB20
P 2100 3750
F 0 "#PWR0140" H 2100 3500 50  0001 C CNN
F 1 "GND" H 2105 3577 50  0000 C CNN
F 2 "" H 2100 3750 50  0001 C CNN
F 3 "" H 2100 3750 50  0001 C CNN
	1    2100 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0142
U 1 1 6275CB26
P 2100 1850
F 0 "#PWR0142" H 2100 1700 50  0001 C CNN
F 1 "+5V" V 2115 1978 50  0000 L CNN
F 2 "" H 2100 1850 50  0001 C CNN
F 3 "" H 2100 1850 50  0001 C CNN
	1    2100 1850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0144
U 1 1 627A29E2
P 2100 1950
F 0 "#PWR0144" H 2100 1800 50  0001 C CNN
F 1 "+5V" V 2115 2078 50  0000 L CNN
F 2 "" H 2100 1950 50  0001 C CNN
F 3 "" H 2100 1950 50  0001 C CNN
	1    2100 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 4800 7550 4800
Text Label 7550 4800 2    50   ~ 0
TX
Connection ~ 7200 4500
Wire Wire Line
	7200 4500 7450 4500
Wire Wire Line
	7200 4500 7200 4800
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 62765282
P 6950 3900
AR Path="/6191B6A2/61EBDADB/62542978/62765282" Ref="J?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/62765282" Ref="J2101"  Part="1" 
F 0 "J2101" H 6750 3850 50  0000 C CNN
F 1 "Conn_01x02_Male" H 6550 3750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6950 3900 50  0001 C CNN
F 3 "~" H 6950 3900 50  0001 C CNN
	1    6950 3900
	-1   0    0    1   
$EndComp
Wire Bus Line
	1600 6550 1600 6750
Wire Bus Line
	4300 3550 4300 4250
Wire Bus Line
	2400 2250 2400 2950
Wire Bus Line
	1300 1750 1300 3750
Wire Bus Line
	4300 1400 4300 3400
$EndSCHEMATC
