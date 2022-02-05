EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 12
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
L Zilog_Z80_Peripherals:PIO-PLCC-44 U?
U 1 1 61F7442E
P 5350 2400
F 0 "U?" H 5750 2681 50  0000 C CNN
F 1 "PIO-PLCC-44" H 5750 2590 50  0000 C CNN
F 2 "Package_LCC:PLCC-44_16.6x16.6mm_P1.27mm" H 5750 -200 50  0001 C CNN
F 3 "https://www.zilog.com/appnotes_download.php?FromPage=DirectLink&dn=PS0180&ft=Product%20Specification%20(Data%20Sheet)%20%20&f=YUhSMGNEb3ZMM2QzZHk1NmFXeHZaeTVqYjIwdlpHOWpjeTk2T0RBdmNITXdNVGd3TG5Ca1pnPT0=" H 5700 -400 50  0001 C CNN
	1    5350 2400
	1    0    0    -1  
$EndComp
Text HLabel 4850 2400 0    50   BiDi ~ 0
D[0..7]
Wire Wire Line
	5100 3200 5250 3200
Wire Wire Line
	5100 3100 5250 3100
Wire Wire Line
	5100 3000 5250 3000
Wire Wire Line
	5100 2900 5250 2900
Wire Wire Line
	5100 2800 5250 2800
Wire Wire Line
	5100 2700 5250 2700
Wire Wire Line
	5100 2600 5250 2600
Wire Wire Line
	5100 2500 5250 2500
Entry Wire Line
	5000 3100 5100 3200
Entry Wire Line
	5000 3000 5100 3100
Entry Wire Line
	5000 2900 5100 3000
Entry Wire Line
	5000 2800 5100 2900
Entry Wire Line
	5000 2700 5100 2800
Entry Wire Line
	5000 2600 5100 2700
Entry Wire Line
	5000 2500 5100 2600
Entry Wire Line
	5000 2400 5100 2500
Wire Bus Line
	4850 2400 5000 2400
Text HLabel 5250 3800 0    50   Input ~ 0
M1
Text HLabel 5250 3900 0    50   Input ~ 0
IORQ
Text HLabel 5250 4000 0    50   Input ~ 0
RD
Text HLabel 5250 4600 0    50   Input ~ 0
IEI
Text HLabel 5250 4700 0    50   Output ~ 0
IEO
Text HLabel 5250 4400 0    50   3State ~ 0
INT
Text HLabel 4850 3300 0    50   BiDi ~ 0
A[0..15]
Wire Wire Line
	5100 3500 5250 3500
Wire Wire Line
	5100 3400 5250 3400
Entry Wire Line
	5000 3400 5100 3500
Entry Wire Line
	5000 3300 5100 3400
Wire Bus Line
	4850 3300 5000 3300
Wire Bus Line
	5000 3300 5000 3400
Text Label 5100 3400 0    50   ~ 0
A0
Text Label 5100 3500 0    50   ~ 0
A1
Text HLabel 5250 3700 0    50   Input ~ 0
CE
Text HLabel 5250 4200 0    50   Input ~ 0
CLK
$Comp
L Device:C C?
U 1 1 61F78BE4
P 8850 3200
AR Path="/61A26BC0/61F78BE4" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F78BE4" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61F78BE4" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61F78BE4" Ref="C?"  Part="1" 
F 0 "C?" H 8965 3246 50  0000 L CNN
F 1 "C" H 8965 3155 50  0000 L CNN
F 2 "" H 8888 3050 50  0001 C CNN
F 3 "~" H 8850 3200 50  0001 C CNN
	1    8850 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F78BEA
P 8850 3350
AR Path="/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/61A26BC0/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61F78BEA" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61F78BEA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 3100 50  0001 C CNN
F 1 "GND" H 8855 3177 50  0000 C CNN
F 2 "" H 8850 3350 50  0001 C CNN
F 3 "" H 8850 3350 50  0001 C CNN
	1    8850 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61F78BF0
P 8850 3050
AR Path="/6191B6A2/61F78BF0" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EEEF32/61F78BF0" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F73F94/61F78BF0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 2900 50  0001 C CNN
F 1 "+5V" H 8865 3223 50  0000 C CNN
F 2 "" H 8850 3050 50  0001 C CNN
F 3 "" H 8850 3050 50  0001 C CNN
	1    8850 3050
	1    0    0    -1  
$EndComp
Text HLabel 6650 3300 2    50   BiDi ~ 0
PA[0..7]
Wire Wire Line
	6400 2500 6250 2500
Wire Wire Line
	6400 2600 6250 2600
Wire Wire Line
	6400 2700 6250 2700
Wire Wire Line
	6400 2800 6250 2800
Wire Wire Line
	6400 2900 6250 2900
Wire Wire Line
	6400 3000 6250 3000
Wire Wire Line
	6400 3100 6250 3100
Wire Wire Line
	6400 3200 6250 3200
Entry Wire Line
	6500 2600 6400 2500
Entry Wire Line
	6500 2700 6400 2600
Entry Wire Line
	6500 2800 6400 2700
Entry Wire Line
	6500 2900 6400 2800
Entry Wire Line
	6500 3000 6400 2900
Entry Wire Line
	6500 3100 6400 3000
Entry Wire Line
	6500 3200 6400 3100
Entry Wire Line
	6500 3300 6400 3200
Wire Bus Line
	6650 3300 6500 3300
Text HLabel 6650 4500 2    50   BiDi ~ 0
PB[0..7]
Wire Wire Line
	6400 3700 6250 3700
Wire Wire Line
	6400 3800 6250 3800
Wire Wire Line
	6400 3900 6250 3900
Wire Wire Line
	6400 4000 6250 4000
Wire Wire Line
	6400 4100 6250 4100
Wire Wire Line
	6400 4200 6250 4200
Wire Wire Line
	6400 4300 6250 4300
Wire Wire Line
	6400 4400 6250 4400
Entry Wire Line
	6500 3800 6400 3700
Entry Wire Line
	6500 3900 6400 3800
Entry Wire Line
	6500 4000 6400 3900
Entry Wire Line
	6500 4100 6400 4000
Entry Wire Line
	6500 4200 6400 4100
Entry Wire Line
	6500 4300 6400 4200
Entry Wire Line
	6500 4400 6400 4300
Entry Wire Line
	6500 4500 6400 4400
Wire Bus Line
	6650 4500 6500 4500
Wire Bus Line
	5000 2400 5000 3100
Wire Bus Line
	6500 2600 6500 3300
Wire Bus Line
	6500 3800 6500 4500
$EndSCHEMATC
