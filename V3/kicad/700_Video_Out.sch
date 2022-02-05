EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Wire Line
	2900 3400 3000 3500
Entry Wire Line
	2900 3900 3000 4000
Entry Wire Line
	2900 4100 3000 4200
Entry Wire Line
	2900 4000 3000 4100
Entry Wire Line
	2900 3800 3000 3900
Entry Wire Line
	2900 3700 3000 3800
Entry Wire Line
	2900 3600 3000 3700
Entry Wire Line
	2900 3500 3000 3600
$Comp
L 74xx:74LS151 U?
U 1 1 61A0D795
P 3900 4100
AR Path="/61A0D795" Ref="U?"  Part="1" 
AR Path="/61A0CB1F/61A0D795" Ref="U?"  Part="1" 
F 0 "U?" H 3900 5181 50  0000 R CNN
F 1 "74LS151" H 3900 5090 50  0000 R CNN
F 2 "" H 3900 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS151" H 3900 4100 50  0001 C CNN
	1    3900 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A0D79B
P 3900 5100
AR Path="/61A0D79B" Ref="#PWR?"  Part="1" 
AR Path="/61A0CB1F/61A0D79B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3900 4850 50  0001 C CNN
F 1 "GND" H 3905 4927 50  0000 C CNN
F 2 "" H 3900 5100 50  0001 C CNN
F 3 "" H 3900 5100 50  0001 C CNN
	1    3900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3500 3400 3500
Wire Wire Line
	3000 3600 3400 3600
Wire Wire Line
	3000 3700 3400 3700
Wire Wire Line
	3000 3800 3400 3800
Wire Wire Line
	3000 3900 3400 3900
Wire Wire Line
	3000 4000 3400 4000
Wire Wire Line
	3000 4100 3400 4100
Wire Wire Line
	3000 4200 3400 4200
Text Label 3300 3500 0    50   ~ 0
D0
Text Label 3300 3600 0    50   ~ 0
D1
Text Label 3300 3700 0    50   ~ 0
D2
Text Label 3300 3800 0    50   ~ 0
D3
Text Label 3300 3900 0    50   ~ 0
D4
Text Label 3300 4000 0    50   ~ 0
D5
Text Label 3300 4100 0    50   ~ 0
D6
Text Label 3300 4200 0    50   ~ 0
D7
$Comp
L power:+5V #PWR?
U 1 1 61A0D9BA
P 3900 3200
F 0 "#PWR?" H 3900 3050 50  0001 C CNN
F 1 "+5V" V 3915 3328 50  0000 L CNN
F 2 "" H 3900 3200 50  0001 C CNN
F 3 "" H 3900 3200 50  0001 C CNN
	1    3900 3200
	0    1    1    0   
$EndComp
Wire Bus Line
	2900 3250 2700 3250
Text HLabel 2700 3250 0    50   Input ~ 0
D[0..7]
Entry Wire Line
	2900 4300 3000 4400
Entry Wire Line
	2900 4400 3000 4500
Entry Wire Line
	2900 4500 3000 4600
Wire Bus Line
	2900 4250 2700 4250
Wire Wire Line
	3000 4400 3400 4400
Wire Wire Line
	3000 4500 3400 4500
Wire Wire Line
	3000 4600 3400 4600
Text Label 3250 4400 0    50   ~ 0
PC0
Text Label 3250 4500 0    50   ~ 0
PC1
Text Label 3250 4600 0    50   ~ 0
PC2
Text HLabel 2700 4250 0    50   Input ~ 0
PC[0..9]
Text HLabel 3400 4800 0    50   Input ~ 0
EN
Text Notes 4350 3750 0    50   ~ 0
Does this need a pullup?
Text Notes 1200 7250 0    197  ~ 39
This page has NOT been checked!
$Comp
L Connector:DB15_Female_HighDensity_MountingHoles J?
U 1 1 61938062
P 9100 3850
AR Path="/62544DDF/61938062" Ref="J?"  Part="1" 
AR Path="/61A0CB1F/61938062" Ref="J?"  Part="1" 
F 0 "J?" H 9100 4717 50  0000 C CNN
F 1 "DB15_Female_HighDensity_MountingHoles" H 9100 4626 50  0000 C CNN
F 2 "" H 8150 4250 50  0001 C CNN
F 3 " ~" H 8150 4250 50  0001 C CNN
	1    9100 3850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x06 SW?
U 1 1 61938068
P 7700 3850
AR Path="/62544DDF/61938068" Ref="SW?"  Part="1" 
AR Path="/61A0CB1F/61938068" Ref="SW?"  Part="1" 
F 0 "SW?" H 7700 4417 50  0000 C CNN
F 1 "SW_DIP_x06" H 7700 4326 50  0000 C CNN
F 2 "" H 7700 3850 50  0001 C CNN
F 3 "~" H 7700 3850 50  0001 C CNN
	1    7700 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Dual JP?
U 1 1 6193806E
P 6100 3100
AR Path="/62544DDF/6193806E" Ref="JP?"  Part="1" 
AR Path="/61A0CB1F/6193806E" Ref="JP?"  Part="1" 
F 0 "JP?" H 6100 3339 50  0000 C CNN
F 1 "Jumper_NC_Dual" H 6100 3248 50  0000 C CNN
F 2 "" H 6100 3100 50  0001 C CNN
F 3 "~" H 6100 3100 50  0001 C CNN
	1    6100 3100
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper_NC_Dual JP?
U 1 1 61938074
P 6100 4000
AR Path="/62544DDF/61938074" Ref="JP?"  Part="1" 
AR Path="/61A0CB1F/61938074" Ref="JP?"  Part="1" 
F 0 "JP?" H 6100 4239 50  0000 C CNN
F 1 "Jumper_NC_Dual" H 6100 4148 50  0000 C CNN
F 2 "" H 6100 4000 50  0001 C CNN
F 3 "~" H 6100 4000 50  0001 C CNN
	1    6100 4000
	0    1    1    0   
$EndComp
NoConn ~ 6100 3450
Wire Wire Line
	6100 3350 7400 3350
Wire Wire Line
	7400 3350 7400 3550
Connection ~ 7400 3550
Wire Wire Line
	7400 3550 7400 3650
Connection ~ 7400 3650
Wire Wire Line
	7400 3650 7400 3750
Connection ~ 7400 3750
Wire Wire Line
	7400 3750 7400 3850
Connection ~ 7400 3850
Wire Wire Line
	7400 3850 7400 3950
Connection ~ 7400 3950
Wire Wire Line
	7400 3950 7400 4050
Connection ~ 7400 4050
$Comp
L Device:R R?
U 1 1 61938088
P 8150 3550
AR Path="/62544DDF/61938088" Ref="R?"  Part="1" 
AR Path="/61A0CB1F/61938088" Ref="R?"  Part="1" 
F 0 "R?" V 7943 3550 50  0001 C CNN
F 1 "R" V 8034 3550 50  0000 C TNN
F 2 "" V 8080 3550 50  0001 C CNN
F 3 "~" H 8150 3550 50  0001 C CNN
	1    8150 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6193808E
P 8150 3650
AR Path="/62544DDF/6193808E" Ref="R?"  Part="1" 
AR Path="/61A0CB1F/6193808E" Ref="R?"  Part="1" 
F 0 "R?" V 7943 3650 50  0001 C CNN
F 1 "R" V 8034 3650 50  0000 C TNN
F 2 "" V 8080 3650 50  0001 C CNN
F 3 "~" H 8150 3650 50  0001 C CNN
	1    8150 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61938094
P 8150 3750
AR Path="/62544DDF/61938094" Ref="R?"  Part="1" 
AR Path="/61A0CB1F/61938094" Ref="R?"  Part="1" 
F 0 "R?" V 7943 3750 50  0001 C CNN
F 1 "R" V 8034 3750 50  0000 C TNN
F 2 "" V 8080 3750 50  0001 C CNN
F 3 "~" H 8150 3750 50  0001 C CNN
	1    8150 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6193809A
P 8150 3850
AR Path="/62544DDF/6193809A" Ref="R?"  Part="1" 
AR Path="/61A0CB1F/6193809A" Ref="R?"  Part="1" 
F 0 "R?" V 7943 3850 50  0001 C CNN
F 1 "R" V 8034 3850 50  0000 C TNN
F 2 "" V 8080 3850 50  0001 C CNN
F 3 "~" H 8150 3850 50  0001 C CNN
	1    8150 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 619380A0
P 8150 3950
AR Path="/62544DDF/619380A0" Ref="R?"  Part="1" 
AR Path="/61A0CB1F/619380A0" Ref="R?"  Part="1" 
F 0 "R?" V 7943 3950 50  0001 C CNN
F 1 "R" V 8034 3950 50  0000 C TNN
F 2 "" V 8080 3950 50  0001 C CNN
F 3 "~" H 8150 3950 50  0001 C CNN
	1    8150 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 619380A6
P 8150 4050
AR Path="/62544DDF/619380A6" Ref="R?"  Part="1" 
AR Path="/61A0CB1F/619380A6" Ref="R?"  Part="1" 
F 0 "R?" V 7943 4050 50  0001 C CNN
F 1 "R" V 8034 4050 50  0000 C TNN
F 2 "" V 8080 4050 50  0001 C CNN
F 3 "~" H 8150 4050 50  0001 C CNN
	1    8150 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 3550 8300 3650
Wire Wire Line
	8300 3750 8300 3850
Wire Wire Line
	8300 3950 8300 4050
Wire Wire Line
	8300 3750 8550 3750
Wire Wire Line
	8550 3750 8550 3650
Wire Wire Line
	8550 3650 8800 3650
Connection ~ 8300 3750
Wire Wire Line
	8300 3950 8550 3950
Wire Wire Line
	8550 3950 8550 3850
Wire Wire Line
	8550 3850 8800 3850
Connection ~ 8300 3950
Wire Wire Line
	8300 3550 8550 3550
Wire Wire Line
	8550 3550 8550 3450
Wire Wire Line
	8550 3450 8800 3450
Connection ~ 8300 3550
NoConn ~ 8800 4050
NoConn ~ 9400 3450
NoConn ~ 9400 3650
NoConn ~ 9400 4250
Wire Wire Line
	8800 3350 8700 3350
Wire Wire Line
	8700 3350 8700 3550
Wire Wire Line
	8800 3550 8700 3550
Connection ~ 8700 3550
Wire Wire Line
	8700 3550 8700 3750
Wire Wire Line
	8800 3750 8700 3750
Connection ~ 8700 3750
Wire Wire Line
	8800 3950 8700 3950
Wire Wire Line
	8700 3750 8700 3950
Connection ~ 8700 3950
Wire Wire Line
	8700 3950 8700 4150
Wire Wire Line
	8800 4150 8700 4150
Connection ~ 8700 4150
Wire Wire Line
	8700 4150 8700 4250
Wire Wire Line
	8800 4250 8700 4250
Connection ~ 8700 4250
Wire Wire Line
	8700 4250 8700 4550
Wire Wire Line
	8700 4550 9100 4550
$Comp
L power:GND #PWR?
U 1 1 619380D1
P 8700 4550
AR Path="/62544DDF/619380D1" Ref="#PWR?"  Part="1" 
AR Path="/61A0CB1F/619380D1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8700 4300 50  0001 C CNN
F 1 "GND" H 8705 4377 50  0000 C CNN
F 2 "" H 8700 4550 50  0001 C CNN
F 3 "" H 8700 4550 50  0001 C CNN
	1    8700 4550
	1    0    0    -1  
$EndComp
Connection ~ 8700 4550
Wire Wire Line
	6100 4250 7400 4250
Wire Wire Line
	7400 4050 7400 4250
Text HLabel 9400 3850 2    50   Input ~ 0
H_SYNC
Text HLabel 9400 4050 2    50   Input ~ 0
V_SYNC
Wire Wire Line
	4950 4000 6000 4000
Wire Wire Line
	4950 3100 6000 3100
Wire Wire Line
	4400 3500 4950 3500
Wire Wire Line
	4400 3600 4950 3600
Wire Wire Line
	4950 3600 4950 4000
Wire Wire Line
	4950 3500 4950 3100
Wire Bus Line
	2900 4250 2900 4500
Wire Bus Line
	2900 3250 2900 4100
$EndSCHEMATC
