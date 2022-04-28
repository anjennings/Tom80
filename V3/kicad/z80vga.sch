EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
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
Wire Wire Line
	5100 3900 5650 3900
Wire Wire Line
	5100 4000 5650 4000
$Sheet
S 5650 3700 850  1000
U 6195D2C9
F0 "3000_Memory" 50
F1 "3000_Memory.sch" 50
F2 "A[0..19]" I L 5650 3800 50 
F3 "D[0..7]" B L 5650 4600 50 
F4 "ROM_CS" I L 5650 4300 50 
F5 "READ" I L 5650 3900 50 
F6 "RAM_CS" I L 5650 4200 50 
F7 "WRITE" I L 5650 4000 50 
$EndSheet
$Sheet
S 4350 3700 750  1000
U 6191B6A2
F0 "2000_Z80" 50
F1 "2000_Z80.sch" 50
F2 "A[0..19]" T R 5100 3800 50 
F3 "D[0..7]" T R 5100 4600 50 
F4 "WRITE" O R 5100 4000 50 
F5 "READ" O R 5100 3900 50 
F6 "ROM_CS" O R 5100 4300 50 
F7 "RAM_CS" O R 5100 4200 50 
$EndSheet
Text Notes 7800 6950 0    118  ~ 24
This page has been checked!
Wire Wire Line
	5100 4200 5650 4200
Wire Wire Line
	5100 4300 5650 4300
$Comp
L Regulator_Linear:L7805 U1000
U 1 1 6255C02F
P 5350 5450
F 0 "U1000" H 5350 5692 50  0000 C CNN
F 1 "L7805" H 5350 5601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 5375 5300 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5350 5400 50  0001 C CNN
	1    5350 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1000
U 1 1 6255CCA4
P 4750 5600
F 0 "C1000" H 4865 5646 50  0000 L CNN
F 1 ".33uF" H 4865 5555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4750 5600 50  0001 C CNN
F 3 "~" H 4750 5600 50  0001 C CNN
	1    4750 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1001
U 1 1 6255DB35
P 5950 5600
F 0 "C1001" H 6065 5646 50  0000 L CNN
F 1 ">.1uF" H 6065 5555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5950 5600 50  0001 C CNN
F 3 "~" H 5950 5600 50  0001 C CNN
	1    5950 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5450 5050 5450
Wire Wire Line
	5650 5450 5950 5450
Wire Wire Line
	4750 5750 5350 5750
Connection ~ 5350 5750
Wire Wire Line
	5350 5750 5950 5750
$Comp
L power:GND #PWR0119
U 1 1 6255E2E4
P 5350 5750
F 0 "#PWR0119" H 5350 5500 50  0001 C CNN
F 1 "GND" H 5355 5577 50  0000 C CNN
F 2 "" H 5350 5750 50  0001 C CNN
F 3 "" H 5350 5750 50  0001 C CNN
	1    5350 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0141
U 1 1 6255EB09
P 5950 5450
F 0 "#PWR0141" H 5950 5300 50  0001 C CNN
F 1 "+5V" V 5965 5578 50  0000 L CNN
F 2 "" H 5950 5450 50  0001 C CNN
F 3 "" H 5950 5450 50  0001 C CNN
	1    5950 5450
	0    1    1    0   
$EndComp
Connection ~ 5950 5450
$Comp
L Connector:Barrel_Jack_Switch J1000
U 1 1 62560114
P 3550 5550
F 0 "J1000" H 3607 5867 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 3607 5776 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 3600 5510 50  0001 C CNN
F 3 "~" H 3600 5510 50  0001 C CNN
	1    3550 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5450 4150 5450
Connection ~ 4750 5450
Wire Wire Line
	3850 5550 3950 5550
Wire Wire Line
	3950 5550 3950 5650
Wire Wire Line
	3950 5650 3850 5650
Wire Wire Line
	3950 5650 3950 5750
Wire Wire Line
	3950 5750 4750 5750
Connection ~ 3950 5650
Connection ~ 4750 5750
$Comp
L Diode:1N4001 D1000
U 1 1 62563A78
P 4300 5450
F 0 "D1000" H 4300 5233 50  0000 C CNN
F 1 "1N4001" H 4300 5324 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4300 5275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4300 5450 50  0001 C CNN
	1    4300 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 5450 4750 5450
$Comp
L Mechanical:MountingHole H0
U 1 1 6269D181
P 4150 6500
F 0 "H0" H 4250 6546 50  0000 L CNN
F 1 "MountingHole" H 4250 6455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 4150 6500 50  0001 C CNN
F 3 "~" H 4150 6500 50  0001 C CNN
	1    4150 6500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6269D7FE
P 4150 6900
F 0 "H2" H 4250 6946 50  0000 L CNN
F 1 "MountingHole" H 4250 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 4150 6900 50  0001 C CNN
F 3 "~" H 4150 6900 50  0001 C CNN
	1    4150 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6269DB56
P 5050 6500
F 0 "H1" H 5150 6546 50  0000 L CNN
F 1 "MountingHole" H 5150 6455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 5050 6500 50  0001 C CNN
F 3 "~" H 5050 6500 50  0001 C CNN
	1    5050 6500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6269E018
P 5050 6900
F 0 "H3" H 5150 6946 50  0000 L CNN
F 1 "MountingHole" H 5150 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 5050 6900 50  0001 C CNN
F 3 "~" H 5050 6900 50  0001 C CNN
	1    5050 6900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
