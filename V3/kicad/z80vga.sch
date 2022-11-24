EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1050 10550 0    197  ~ 39
This page has NOT been checked!
Wire Bus Line
	5100 4600 5650 4600
Wire Bus Line
	5100 3800 5650 3800
$Sheet
S 5650 3700 850  1000
U 6195D2C9
F0 "3000_Memory" 50
F1 "3000_Memory.sch" 50
F2 "A[0..19]" I L 5650 3800 50 
F3 "D[0..7]" B L 5650 4600 50 
F4 "ROM_CS" I L 5650 4300 50 
F5 "RAM_CS" I L 5650 4200 50 
F6 "RD" I L 5650 3900 50 
F7 "WR" I L 5650 4000 50 
$EndSheet
$Sheet
S 4350 3700 750  1000
U 6191B6A2
F0 "2000_Z80" 50
F1 "2000_Z80.sch" 50
F2 "D[0..7]" T R 5100 4600 50 
F3 "ROM_CS" O R 5100 4300 50 
F4 "RAM_CS" O R 5100 4200 50 
F5 "A[0..19]" O R 5100 3800 50 
F6 "WR" O R 5100 4000 50 
F7 "RD" O R 5100 3900 50 
$EndSheet
Text Notes 7800 6950 0    118  ~ 24
This page has been checked!
Wire Wire Line
	5100 4200 5650 4200
Wire Wire Line
	5100 4300 5650 4300
$Comp
L Mechanical:MountingHole H0
U 1 1 6269D181
P 1250 5350
F 0 "H0" H 1350 5396 50  0000 L CNN
F 1 "MountingHole" H 1350 5305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 1250 5350 50  0001 C CNN
F 3 "~" H 1250 5350 50  0001 C CNN
	1    1250 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6269D7FE
P 1250 5750
F 0 "H2" H 1350 5796 50  0000 L CNN
F 1 "MountingHole" H 1350 5705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 1250 5750 50  0001 C CNN
F 3 "~" H 1250 5750 50  0001 C CNN
	1    1250 5750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6269DB56
P 2150 5350
F 0 "H1" H 2250 5396 50  0000 L CNN
F 1 "MountingHole" H 2250 5305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 2150 5350 50  0001 C CNN
F 3 "~" H 2150 5350 50  0001 C CNN
	1    2150 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6269E018
P 2150 5750
F 0 "H3" H 2250 5796 50  0000 L CNN
F 1 "MountingHole" H 2250 5705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 2150 5750 50  0001 C CNN
F 3 "~" H 2150 5750 50  0001 C CNN
	1    2150 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 62A5A6D1
P 4150 7050
AR Path="/6191B6A2/61EBDADB/62A5A6D1" Ref="D?"  Part="1" 
AR Path="/62A5A6D1" Ref="D1001"  Part="1" 
F 0 "D1001" H 4150 7200 50  0000 C TNN
F 1 "LED" H 4150 6950 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 4150 7050 50  0001 C CNN
F 3 "~" H 4150 7050 50  0001 C CNN
	1    4150 7050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62A5A6D8
P 4300 7050
AR Path="/6191B6A2/61EBDADB/62A5A6D8" Ref="#PWR?"  Part="1" 
AR Path="/62A5A6D8" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 4300 6800 50  0001 C CNN
F 1 "GND" V 4305 6922 50  0000 R CNN
F 2 "" H 4300 7050 50  0001 C CNN
F 3 "" H 4300 7050 50  0001 C CNN
	1    4300 7050
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0144
U 1 1 62A5BC7A
P 3700 7050
F 0 "#PWR0144" H 3700 6900 50  0001 C CNN
F 1 "+5V" V 3715 7178 50  0000 L CNN
F 2 "" H 3700 7050 50  0001 C CNN
F 3 "" H 3700 7050 50  0001 C CNN
	1    3700 7050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 62A654EB
P 3850 7050
AR Path="/6191B6A2/61EBDADB/62542978/62A654EB" Ref="R?"  Part="1" 
AR Path="/62A654EB" Ref="R1000"  Part="1" 
F 0 "R1000" V 3950 6900 50  0000 L CNN
F 1 "2.2K" V 3750 6950 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3780 7050 50  0001 C CNN
F 3 "~" H 3850 7050 50  0001 C CNN
	1    3850 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3900 5650 3900
Wire Wire Line
	5100 4000 5650 4000
$EndSCHEMATC
