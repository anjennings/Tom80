EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 16
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
L Zilog_Z80_Peripherals:CTC-PLCC-44 IC?
U 1 1 61EF4B65
P 5500 2900
AR Path="/6191B6A2/61EF4B65" Ref="IC?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61EF4B65" Ref="IC2"  Part="1" 
F 0 "IC2" H 5900 3281 50  0000 R CNN
F 1 "CTC-PLCC-44" H 5900 3190 50  0000 R CNN
F 2 "Package_LCC:PLCC-44_16.6x16.6mm_P1.27mm" H 6950 3900 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0181.pdf" H 6950 3800 50  0001 L CNN
F 4 "Z8430 Zilog CTC" H 6950 3700 50  0001 L CNN "Description"
F 5 "5.21" H 6950 3600 50  0001 L CNN "Height"
F 6 "Zilog" H 6950 3500 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C3010PEG" H 6950 3400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C3010PEG" H 6950 3300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C3010PEG" H 6950 3200 50  0001 L CNN "Mouser Price/Stock"
	1    5500 2900
	1    0    0    -1  
$EndComp
Text HLabel 4900 2850 0    50   BiDi ~ 0
D[0..7]
Wire Wire Line
	5150 3650 5300 3650
Wire Wire Line
	5150 3550 5300 3550
Wire Wire Line
	5150 3450 5300 3450
Wire Wire Line
	5150 3350 5300 3350
Wire Wire Line
	5150 3250 5300 3250
Wire Wire Line
	5150 3150 5300 3150
Wire Wire Line
	5150 3050 5300 3050
Wire Wire Line
	5150 2950 5300 2950
Entry Wire Line
	5050 3550 5150 3650
Entry Wire Line
	5050 3450 5150 3550
Entry Wire Line
	5050 3350 5150 3450
Entry Wire Line
	5050 3250 5150 3350
Entry Wire Line
	5050 3150 5150 3250
Entry Wire Line
	5050 3050 5150 3150
Entry Wire Line
	5050 2950 5150 3050
Entry Wire Line
	5050 2850 5150 2950
Wire Bus Line
	4900 2850 5050 2850
Text HLabel 6500 4250 2    50   Input ~ 0
CLK
Text HLabel 6500 4050 2    50   Input ~ 0
RESET
Text HLabel 5300 4100 0    50   Input ~ 0
M1
Text HLabel 5300 4200 0    50   Input ~ 0
IORQ
Text HLabel 5300 4300 0    50   Input ~ 0
RD
Text HLabel 5300 4450 0    50   Input ~ 0
IEI
Text HLabel 5300 4550 0    50   Output ~ 0
IEO
Text HLabel 5300 4650 0    50   3State ~ 0
INT
$Comp
L power:+5V #PWR0110
U 1 1 61EF7CBC
P 5900 2700
F 0 "#PWR0110" H 5900 2550 50  0001 C CNN
F 1 "+5V" V 5915 2828 50  0000 L CNN
F 2 "" H 5900 2700 50  0001 C CNN
F 3 "" H 5900 2700 50  0001 C CNN
	1    5900 2700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61EF7EB1
P 5900 4900
F 0 "#PWR0111" H 5900 4650 50  0001 C CNN
F 1 "GND" H 5905 4727 50  0000 C CNN
F 2 "" H 5900 4900 50  0001 C CNN
F 3 "" H 5900 4900 50  0001 C CNN
	1    5900 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61EF954A
P 7450 3550
AR Path="/61A26BC0/61EF954A" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EF954A" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61EF954A" Ref="C1"  Part="1" 
F 0 "C1" H 7565 3596 50  0000 L CNN
F 1 "C" H 7565 3505 50  0000 L CNN
F 2 "" H 7488 3400 50  0001 C CNN
F 3 "~" H 7450 3550 50  0001 C CNN
	1    7450 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61EF9550
P 7450 3700
AR Path="/61EF9550" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61EF9550" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61EF9550" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61EF9550" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EF9550" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61EF9550" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 7450 3450 50  0001 C CNN
F 1 "GND" H 7455 3527 50  0000 C CNN
F 2 "" H 7450 3700 50  0001 C CNN
F 3 "" H 7450 3700 50  0001 C CNN
	1    7450 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61EF9556
P 7450 3400
AR Path="/6191B6A2/61EF9556" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61EF9556" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 7450 3250 50  0001 C CNN
F 1 "+5V" H 7465 3573 50  0000 C CNN
F 2 "" H 7450 3400 50  0001 C CNN
F 3 "" H 7450 3400 50  0001 C CNN
	1    7450 3400
	1    0    0    -1  
$EndComp
Text HLabel 4900 3800 0    50   BiDi ~ 0
A[0..15]
Wire Wire Line
	5150 4000 5300 4000
Wire Wire Line
	5150 3900 5300 3900
Entry Wire Line
	5050 3900 5150 4000
Entry Wire Line
	5050 3800 5150 3900
Wire Bus Line
	4900 3800 5050 3800
Wire Bus Line
	5050 3800 5050 3900
Text Label 5150 3900 0    50   ~ 0
A0
Text Label 5150 4000 0    50   ~ 0
A1
Text HLabel 5300 3800 0    50   Input ~ 0
CE
Wire Bus Line
	5050 2850 5050 3550
$EndSCHEMATC
