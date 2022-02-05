EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 12
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
L Zilog_Z80_Peripherals:SIO4-QFP-44 IC?
U 1 1 61F00871
P 5100 2950
AR Path="/6191B6A2/61F00871" Ref="IC?"  Part="1" 
AR Path="/6191B6A2/61EFA1CE/61F00871" Ref="IC?"  Part="1" 
F 0 "IC?" H 5400 3331 50  0000 C CNN
F 1 "SIO4-QFP-44" H 5400 3240 50  0000 C CNN
F 2 "Package_QFP:LQFP-44_10x10mm_P0.8mm" H 5500 4800 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0183.pdf" H 4300 1800 50  0001 L CNN
F 4 "Z80 CMOS SIO/4 Z84C44 Zilog" H 5500 4600 50  0001 L CNN "Description"
F 5 "4.06" H 5500 4500 50  0001 L CNN "Height"
F 6 "Zilog" H 5500 4400 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 5500 4300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 5500 4200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 5500 4100 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 5500 4000 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 5500 3900 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 5500 3800 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 5500 3700 50  0001 L CNN "Allied Price/Stock"
	1    5100 2950
	1    0    0    -1  
$EndComp
Text HLabel 4500 2900 0    50   BiDi ~ 0
D[0..7]
Wire Wire Line
	4750 3700 4900 3700
Wire Wire Line
	4750 3600 4900 3600
Wire Wire Line
	4750 3500 4900 3500
Wire Wire Line
	4750 3400 4900 3400
Wire Wire Line
	4750 3300 4900 3300
Wire Wire Line
	4750 3200 4900 3200
Wire Wire Line
	4750 3100 4900 3100
Wire Wire Line
	4750 3000 4900 3000
Entry Wire Line
	4650 3600 4750 3700
Entry Wire Line
	4650 3500 4750 3600
Entry Wire Line
	4650 3400 4750 3500
Entry Wire Line
	4650 3300 4750 3400
Entry Wire Line
	4650 3200 4750 3300
Entry Wire Line
	4650 3100 4750 3200
Entry Wire Line
	4650 3000 4750 3100
Entry Wire Line
	4650 2900 4750 3000
Wire Bus Line
	4500 2900 4650 2900
Text HLabel 4900 3950 0    50   Input ~ 0
RESET
Text HLabel 4900 4050 0    50   Input ~ 0
M1
Text HLabel 4900 4150 0    50   Input ~ 0
IORQ
Text HLabel 4900 4250 0    50   Input ~ 0
RD
Text HLabel 4900 4450 0    50   Input ~ 0
CLK
Text HLabel 4900 4600 0    50   3State ~ 0
INT
Text HLabel 4900 4700 0    50   Input ~ 0
IEI
Text HLabel 4900 4800 0    50   Output ~ 0
IEO
Text HLabel 4500 4850 0    50   BiDi ~ 0
A[0..15]
Wire Wire Line
	4750 5050 4900 5050
Wire Wire Line
	4750 4950 4900 4950
Entry Wire Line
	4650 4950 4750 5050
Entry Wire Line
	4650 4850 4750 4950
Wire Bus Line
	4500 4850 4650 4850
Wire Bus Line
	4650 4950 4650 4850
Wire Bus Line
	4650 2900 4650 3600
Text Label 4750 4950 0    50   ~ 0
A0
Text Label 4750 5050 0    50   ~ 0
A1
Text HLabel 4900 3850 0    50   Input ~ 0
CE
$EndSCHEMATC
