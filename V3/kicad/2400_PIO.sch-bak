EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 16
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
L Zilog_Z80_Peripherals:PIO-PLCC-44 U2400
U 1 1 61F7442E
P 2200 2300
F 0 "U2400" H 2600 2581 50  0000 R CNN
F 1 "PIO-PLCC-44" H 2600 2490 50  0000 R CNN
F 2 "Package_LCC:PLCC-44_16.6x16.6mm_P1.27mm" H 2600 -300 50  0001 C CNN
F 3 "https://www.zilog.com/appnotes_download.php?FromPage=DirectLink&dn=PS0180&ft=Product%20Specification%20(Data%20Sheet)%20%20&f=YUhSMGNEb3ZMM2QzZHk1NmFXeHZaeTVqYjIwdlpHOWpjeTk2T0RBdmNITXdNVGd3TG5Ca1pnPT0=" H 2550 -500 50  0001 C CNN
	1    2200 2300
	1    0    0    -1  
$EndComp
Text HLabel 1700 2300 0    50   BiDi ~ 0
D[0..7]
Wire Wire Line
	1950 3100 2100 3100
Wire Wire Line
	1950 3000 2100 3000
Wire Wire Line
	1950 2900 2100 2900
Wire Wire Line
	1950 2800 2100 2800
Wire Wire Line
	1950 2700 2100 2700
Wire Wire Line
	1950 2600 2100 2600
Wire Wire Line
	1950 2500 2100 2500
Wire Wire Line
	1950 2400 2100 2400
Entry Wire Line
	1850 3000 1950 3100
Entry Wire Line
	1850 2900 1950 3000
Entry Wire Line
	1850 2800 1950 2900
Entry Wire Line
	1850 2700 1950 2800
Entry Wire Line
	1850 2600 1950 2700
Entry Wire Line
	1850 2500 1950 2600
Entry Wire Line
	1850 2400 1950 2500
Entry Wire Line
	1850 2300 1950 2400
Wire Bus Line
	1700 2300 1850 2300
Text HLabel 2100 3700 0    50   Input ~ 0
M1
Text HLabel 2100 3800 0    50   Input ~ 0
IORQ
Text HLabel 2100 3900 0    50   Input ~ 0
RD
Text HLabel 2100 4500 0    50   Input ~ 0
IEI
Text HLabel 2100 4600 0    50   Output ~ 0
IEO
Text HLabel 2100 4300 0    50   3State ~ 0
INT
Text HLabel 1700 3200 0    50   BiDi ~ 0
A[0..15]
Wire Wire Line
	1950 3400 2100 3400
Wire Wire Line
	1950 3300 2100 3300
Entry Wire Line
	1850 3300 1950 3400
Entry Wire Line
	1850 3200 1950 3300
Wire Bus Line
	1700 3200 1850 3200
Wire Bus Line
	1850 3200 1850 3300
Text Label 1950 3300 0    50   ~ 0
A0
Text Label 1950 3400 0    50   ~ 0
A1
Text HLabel 2100 3600 0    50   Input ~ 0
CE
Text HLabel 2100 4100 0    50   Input ~ 0
CLK
$Comp
L Device:C C?
U 1 1 61F78BE4
P 5700 3100
AR Path="/61A26BC0/61F78BE4" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F78BE4" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61F78BE4" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61F78BE4" Ref="C2400"  Part="1" 
F 0 "C2400" H 5815 3146 50  0000 L CNN
F 1 "C" H 5815 3055 50  0000 L CNN
F 2 "" H 5738 2950 50  0001 C CNN
F 3 "~" H 5700 3100 50  0001 C CNN
	1    5700 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F78BEA
P 5700 3250
AR Path="/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61F78BEA" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 5700 3000 50  0001 C CNN
F 1 "GND" H 5705 3077 50  0000 C CNN
F 2 "" H 5700 3250 50  0001 C CNN
F 3 "" H 5700 3250 50  0001 C CNN
	1    5700 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61F78BF0
P 5700 2950
AR Path="/6191B6A2/61F78BF0" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61F78BF0" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61F78BF0" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 5700 2800 50  0001 C CNN
F 1 "+5V" H 5715 3123 50  0000 C CNN
F 2 "" H 5700 2950 50  0001 C CNN
F 3 "" H 5700 2950 50  0001 C CNN
	1    5700 2950
	1    0    0    -1  
$EndComp
Text Notes 3750 4100 0    50   ~ 0
A/B are hi-z at reset\nA is set to Output (Mode 0) to control RAM banks and LEDs\nB is set to Control (Mode 3) for SPI bus, MISO is input, all others out
$Comp
L Device:R_Network08 RN?
U 1 1 61E8A3DC
P 3750 2050
F 0 "RN?" H 4138 2096 50  0000 L CNN
F 1 "R_Network08" H 4138 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4225 2050 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3750 2050 50  0001 C CNN
	1    3750 2050
	1    0    0    -1  
$EndComp
Wire Bus Line
	4450 3200 4300 3200
Entry Wire Line
	4300 3200 4200 3100
Entry Wire Line
	4300 3100 4200 3000
Entry Wire Line
	4300 3000 4200 2900
Entry Wire Line
	4300 2900 4200 2800
Entry Wire Line
	4300 2800 4200 2700
Entry Wire Line
	4300 2700 4200 2600
Entry Wire Line
	4300 2600 4200 2500
Entry Wire Line
	4300 2500 4200 2400
Text HLabel 4450 3200 2    50   BiDi ~ 0
PA[0..7]
Wire Wire Line
	3100 2400 3350 2400
Wire Wire Line
	3100 2500 3450 2500
Wire Wire Line
	3100 2600 3550 2600
Wire Wire Line
	3100 2700 3650 2700
Wire Wire Line
	3100 2800 3750 2800
Wire Wire Line
	3100 2900 3850 2900
Wire Wire Line
	3100 3000 3950 3000
Wire Wire Line
	3100 3100 4050 3100
Wire Wire Line
	3350 2250 3350 2400
Connection ~ 3350 2400
Wire Wire Line
	3350 2400 4200 2400
Wire Wire Line
	3450 2250 3450 2500
Connection ~ 3450 2500
Wire Wire Line
	3450 2500 4200 2500
Wire Wire Line
	3550 2250 3550 2600
Connection ~ 3550 2600
Wire Wire Line
	3550 2600 4200 2600
Wire Wire Line
	3650 2250 3650 2700
Connection ~ 3650 2700
Wire Wire Line
	3650 2700 4200 2700
Wire Wire Line
	3750 2250 3750 2800
Connection ~ 3750 2800
Wire Wire Line
	3750 2800 4200 2800
Wire Wire Line
	3850 2250 3850 2900
Connection ~ 3850 2900
Wire Wire Line
	3850 2900 4200 2900
Wire Wire Line
	3950 2250 3950 3000
Connection ~ 3950 3000
Wire Wire Line
	3950 3000 4200 3000
Wire Wire Line
	4050 2250 4050 3100
Connection ~ 4050 3100
Wire Wire Line
	4050 3100 4200 3100
$Comp
L power:GND #PWR0159
U 1 1 61EAB149
P 2600 4800
F 0 "#PWR0159" H 2600 4550 50  0001 C CNN
F 1 "GND" H 2605 4627 50  0000 C CNN
F 2 "" H 2600 4800 50  0001 C CNN
F 3 "" H 2600 4800 50  0001 C CNN
	1    2600 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61EAB7DE
P 2600 2200
AR Path="/6191B6A2/61EAB7DE" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61EAB7DE" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61EAB7DE" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 2600 2050 50  0001 C CNN
F 1 "+5V" H 2615 2373 50  0000 C CNN
F 2 "" H 2600 2200 50  0001 C CNN
F 3 "" H 2600 2200 50  0001 C CNN
	1    2600 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 3600 3250 3600
Wire Wire Line
	3100 3700 3250 3700
Wire Wire Line
	3100 3800 3250 3800
Wire Wire Line
	3100 3900 3250 3900
Wire Wire Line
	3100 4000 3250 4000
Wire Wire Line
	3100 4100 3250 4100
Wire Wire Line
	3100 4200 3250 4200
Wire Wire Line
	3100 4300 3250 4300
Text Label 3250 3600 0    50   ~ 0
MOSI
Text Label 3250 3700 0    50   ~ 0
SCLK
Text Label 3250 3800 0    50   ~ 0
MISO
Text Label 3250 3900 0    50   ~ 0
CS0
Text Label 3250 4000 0    50   ~ 0
CS1
Text Label 3250 4100 0    50   ~ 0
CS2
Text Label 3250 4200 0    50   ~ 0
CS3
Text Label 3250 4300 0    50   ~ 0
CS4
Wire Wire Line
	4250 4900 4250 5050
Wire Wire Line
	4150 4900 4150 5050
Wire Wire Line
	4050 4900 4050 5050
Wire Wire Line
	3950 4900 3950 5050
Wire Wire Line
	3850 4900 3850 5050
Wire Wire Line
	3750 4900 3750 5050
Wire Wire Line
	3650 4900 3650 5050
Wire Wire Line
	3550 4900 3550 5050
Text Label 4250 5050 3    50   ~ 0
MOSI
Text Label 4150 5050 3    50   ~ 0
SCLK
Text Label 4050 5050 3    50   ~ 0
MISO
Text Label 3950 5050 3    50   ~ 0
CS0
Text Label 3850 5050 3    50   ~ 0
CS1
Text Label 3750 5050 3    50   ~ 0
CS2
Text Label 3650 5050 3    50   ~ 0
CS3
Text Label 3550 5050 3    50   ~ 0
CS4
$Comp
L Device:R_Network08 RN?
U 1 1 61EB8DE4
P 3950 4700
F 0 "RN?" H 4338 4746 50  0000 L CNN
F 1 "R_Network08" H 4338 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4425 4700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3950 4700 50  0001 C CNN
	1    3950 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0161
U 1 1 61EBF3F5
P 3550 4500
F 0 "#PWR0161" H 3550 4350 50  0001 C CNN
F 1 "+5V" H 3565 4673 50  0000 C CNN
F 2 "" H 3550 4500 50  0001 C CNN
F 3 "" H 3550 4500 50  0001 C CNN
	1    3550 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0162
U 1 1 61EBF6B2
P 3350 1850
F 0 "#PWR0162" H 3350 1700 50  0001 C CNN
F 1 "+5V" H 3365 2023 50  0000 C CNN
F 2 "" H 3350 1850 50  0001 C CNN
F 3 "" H 3350 1850 50  0001 C CNN
	1    3350 1850
	1    0    0    -1  
$EndComp
$Sheet
S 7250 2200 500  150 
U 61EC7B51
F0 "2410_SDCARD" 50
F1 "2410_SDCARD.sch" 50
$EndSheet
$Sheet
S 7350 3700 550  500 
U 61EC7EC7
F0 "2420_ISP" 50
F1 "2420_ISP.sch" 50
F2 "SCLK" I L 7350 3800 50 
F3 "MOSI" I L 7350 3900 50 
F4 "MISO" I L 7350 4000 50 
F5 "CS" I L 7350 4100 50 
$EndSheet
Wire Wire Line
	7350 3900 7200 3900
Wire Wire Line
	7350 3800 7200 3800
Wire Wire Line
	7350 4000 7200 4000
Wire Wire Line
	7350 4100 7200 4100
Text Label 7200 3900 2    50   ~ 0
MOSI
Text Label 7200 3800 2    50   ~ 0
SCLK
Text Label 7200 4000 2    50   ~ 0
MISO
Text Label 7200 4100 2    50   ~ 0
CS0
Wire Bus Line
	1850 2300 1850 3000
Wire Bus Line
	4300 2500 4300 3200
$EndSCHEMATC
