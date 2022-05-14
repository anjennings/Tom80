EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 9
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
L Connector:Micro_SD_Card_Det J?
U 1 1 6259F3CE
P 7050 3050
AR Path="/6191B6A2/61F28B7D/6259F3CE" Ref="J?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F3CE" Ref="J2210"  Part="1" 
F 0 "J2210" H 7000 3867 50  0000 C CNN
F 1 "Micro_SD_Card_Det" H 7000 3776 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Molex_104031-0811" H 9100 3750 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 7050 3150 50  0001 C CNN
	1    7050 3050
	1    0    0    -1  
$EndComp
Text Notes 6600 3850 0    50   ~ 0
probably HC or HCT, not LS for 3.3
NoConn ~ 6150 2650
NoConn ~ 6150 3350
Wire Wire Line
	6150 3150 5800 3150
Wire Wire Line
	6150 2950 5800 2950
$Comp
L power:GND #PWR?
U 1 1 6259F3E5
P 5800 3150
AR Path="/6191B6A2/61F28B7D/6259F3E5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F3E5" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 5800 2900 50  0001 C CNN
F 1 "GND" V 5805 3022 50  0000 R CNN
F 2 "" H 5800 3150 50  0001 C CNN
F 3 "" H 5800 3150 50  0001 C CNN
	1    5800 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 3250 6150 3250
$Comp
L power:+3.3V #PWR?
U 1 1 6259F3ED
P 5800 2950
AR Path="/6191B6A2/61F28B7D/6259F3ED" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F3ED" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 5800 2800 50  0001 C CNN
F 1 "+3.3V" V 5815 3078 50  0000 L CNN
F 2 "" H 5800 2950 50  0001 C CNN
F 3 "" H 5800 2950 50  0001 C CNN
	1    5800 2950
	0    -1   -1   0   
$EndComp
Text Label 8100 4500 0    50   ~ 0
SD_SCK
Text Label 8100 4600 0    50   ~ 0
SD_MOSI
Wire Wire Line
	8100 4500 8450 4500
Wire Wire Line
	8100 4600 8450 4600
Wire Wire Line
	8450 4300 8100 4300
Text Label 8100 4300 0    50   ~ 0
SD_CS
Text Label 8100 4400 0    50   ~ 0
SD_MISO
Wire Wire Line
	8100 4400 8450 4400
$Comp
L power:+3.3V #PWR?
U 1 1 6259F3FB
P 8850 4300
AR Path="/6191B6A2/61F28B7D/6259F3FB" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F3FB" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 8850 4150 50  0001 C CNN
F 1 "+3.3V" V 8865 4428 50  0000 L CNN
F 2 "" H 8850 4300 50  0001 C CNN
F 3 "" H 8850 4300 50  0001 C CNN
	1    8850 4300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6259F401
P 7850 3550
AR Path="/6191B6A2/61F28B7D/6259F401" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F401" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 7850 3300 50  0001 C CNN
F 1 "GND" V 7855 3422 50  0000 R CNN
F 2 "" H 7850 3550 50  0001 C CNN
F 3 "" H 7850 3550 50  0001 C CNN
	1    7850 3550
	0    -1   -1   0   
$EndComp
$Comp
L Regulator_Linear:LD39150DT33 U?
U 1 1 6259F407
P 6800 4550
AR Path="/6191B6A2/61F28B7D/6259F407" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F407" Ref="U2213"  Part="1" 
F 0 "U2213" H 6800 4792 50  0000 C CNN
F 1 "TL760M33" H 6800 4701 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-3_TabPin2" H 6800 4750 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/ld39150.pdf" H 6900 4300 50  0001 C CNN
	1    6800 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 6259F413
P 7200 4550
AR Path="/6191B6A2/61F28B7D/6259F413" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F413" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 7200 4400 50  0001 C CNN
F 1 "+3.3V" V 7215 4678 50  0000 L CNN
F 2 "" H 7200 4550 50  0001 C CNN
F 3 "" H 7200 4550 50  0001 C CNN
	1    7200 4550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6259F419
P 6800 4850
AR Path="/6191B6A2/61F28B7D/6259F419" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F419" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 6800 4600 50  0001 C CNN
F 1 "GND" H 6805 4677 50  0000 C CNN
F 2 "" H 6800 4850 50  0001 C CNN
F 3 "" H 6800 4850 50  0001 C CNN
	1    6800 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4850 6800 4850
Wire Wire Line
	6800 4850 7150 4850
Connection ~ 6800 4850
$Comp
L 74xx:74LS07 U?
U 1 1 625A5E8B
P 4350 2800
AR Path="/6191B6A2/61F28B7D/625A5E8B" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E8B" Ref="U2210"  Part="1" 
F 0 "U2210" H 4350 3117 50  0000 C CNN
F 1 "74LS07" H 4350 3026 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 2800 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 2800 50  0001 C CNN
	1    4350 2800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U?
U 2 1 625A5E91
P 4350 3300
AR Path="/6191B6A2/61F28B7D/625A5E91" Ref="U?"  Part="2" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E91" Ref="U2210"  Part="2" 
F 0 "U2210" H 4350 3617 50  0000 C CNN
F 1 "74LS07" H 4350 3526 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 3300 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 3300 50  0001 C CNN
	2    4350 3300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U?
U 3 1 625A5E97
P 4350 3600
AR Path="/6191B6A2/61F28B7D/625A5E97" Ref="U?"  Part="3" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E97" Ref="U2210"  Part="3" 
F 0 "U2210" H 4350 3917 50  0000 C CNN
F 1 "74LS07" H 4350 3826 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 3600 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 3600 50  0001 C CNN
	3    4350 3600
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS07 U?
U 4 1 625A5E9D
P 4350 2300
AR Path="/6191B6A2/61F28B7D/625A5E9D" Ref="U?"  Part="4" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E9D" Ref="U2210"  Part="4" 
F 0 "U2210" H 4350 2617 50  0000 C CNN
F 1 "74LS07" H 4350 2526 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 2300 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 2300 50  0001 C CNN
	4    4350 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U?
U 5 1 625A5EA3
P 4500 5200
AR Path="/6191B6A2/61F28B7D/625A5EA3" Ref="U?"  Part="5" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5EA3" Ref="U2210"  Part="5" 
F 0 "U2210" H 4500 5517 50  0000 C CNN
F 1 "74LS07" H 4500 5426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4500 5200 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4500 5200 50  0001 C CNN
	5    4500 5200
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS07 U?
U 7 1 625A5EA9
P 4500 4650
AR Path="/6191B6A2/61F28B7D/625A5EA9" Ref="U?"  Part="7" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5EA9" Ref="U2210"  Part="7" 
F 0 "U2210" H 4730 4696 50  0000 L CNN
F 1 "74LS07" H 4730 4605 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4500 4650 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4500 4650 50  0001 C CNN
	7    4500 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 3300 4650 3300
Wire Wire Line
	5000 2800 4650 2800
Wire Wire Line
	5000 2850 5000 2800
Wire Wire Line
	5000 2850 6150 2850
Wire Wire Line
	5000 3300 5000 3050
Wire Wire Line
	5000 3050 6150 3050
Wire Wire Line
	5800 3600 5800 3250
Wire Wire Line
	4650 3600 5800 3600
$Comp
L power:+5V #PWR?
U 1 1 625BC2E4
P 4000 4650
AR Path="/6191B6A2/61F28B7D/625BC2E4" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625BC2E4" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 4000 4500 50  0001 C CNN
F 1 "+5V" V 4015 4778 50  0000 L CNN
F 2 "" H 4000 4650 50  0001 C CNN
F 3 "" H 4000 4650 50  0001 C CNN
	1    4000 4650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 625BCDFC
P 5000 4650
AR Path="/6191B6A2/61F28B7D/625BCDFC" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625BCDFC" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5000 4400 50  0001 C CNN
F 1 "GND" H 5005 4477 50  0000 C CNN
F 2 "" H 5000 4650 50  0001 C CNN
F 3 "" H 5000 4650 50  0001 C CNN
	1    5000 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 2750 5400 2300
Wire Wire Line
	5400 2750 6150 2750
Wire Wire Line
	4650 2300 5400 2300
Text HLabel 4050 2300 0    50   Input ~ 0
CS
Text HLabel 4050 2800 0    50   Input ~ 0
MOSI
Text HLabel 4050 3300 0    50   Input ~ 0
SCK
Text HLabel 4050 3600 0    50   Output ~ 0
MISO
Text Label 5800 2750 0    50   ~ 0
SD_CS
Text Label 5800 2850 0    50   ~ 0
SD_MOSI
Text Label 5800 3050 0    50   ~ 0
SD_SCK
Text Label 5800 3250 0    50   ~ 0
SD_MISO
Text Notes 7800 6900 0    118  ~ 24
This page has been checked!
$Comp
L power:VCC #PWR0143
U 1 1 62567B69
P 6400 4550
F 0 "#PWR0143" H 6400 4400 50  0001 C CNN
F 1 "VCC" V 6415 4677 50  0000 L CNN
F 2 "" H 6400 4550 50  0001 C CNN
F 3 "" H 6400 4550 50  0001 C CNN
	1    6400 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 62613B08
P 2150 4400
AR Path="/6195D2C9/62613B08" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62613B08" Ref="C2210"  Part="1" 
F 0 "C2210" H 2265 4446 50  0000 L CNN
F 1 "22pf" H 2265 4355 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2188 4250 50  0001 C CNN
F 3 "~" H 2150 4400 50  0001 C CNN
	1    2150 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62613B0E
P 2150 4550
AR Path="/62613B0E" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/62613B0E" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/62613B0E" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/62613B0E" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62613B0E" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 2150 4300 50  0001 C CNN
F 1 "GND" H 2155 4377 50  0000 C CNN
F 2 "" H 2150 4550 50  0001 C CNN
F 3 "" H 2150 4550 50  0001 C CNN
	1    2150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62613B14
P 2150 4250
AR Path="/6195D2C9/62613B14" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62613B14" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 2150 4100 50  0001 C CNN
F 1 "+5V" H 2165 4423 50  0000 C CNN
F 2 "" H 2150 4250 50  0001 C CNN
F 3 "" H 2150 4250 50  0001 C CNN
	1    2150 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C?
U 1 1 6261578C
P 7150 4700
AR Path="/6261578C" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6261578C" Ref="C22213B1"  Part="1" 
F 0 "C22213B1" H 7265 4746 50  0000 L CNN
F 1 "22uF" H 7265 4655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7150 4700 50  0001 C CNN
F 3 "~" H 7150 4700 50  0001 C CNN
	1    7150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4550 7150 4550
Wire Wire Line
	6400 4550 6450 4550
$Comp
L Device:CP1 C?
U 1 1 626150D9
P 6450 4700
AR Path="/626150D9" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/626150D9" Ref="C2213A1"  Part="1" 
F 0 "C2213A1" H 6565 4746 50  0000 L CNN
F 1 ".1uF" H 6565 4655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6450 4700 50  0001 C CNN
F 3 "~" H 6450 4700 50  0001 C CNN
	1    6450 4700
	-1   0    0    -1  
$EndComp
Connection ~ 6450 4550
Wire Wire Line
	6450 4550 6500 4550
Connection ~ 7150 4550
Wire Wire Line
	7150 4550 7200 4550
$Comp
L Device:R_Network05 RN2210
U 1 1 62618FEB
P 8650 4500
F 0 "RN2210" V 8233 4500 50  0000 C CNN
F 1 "10k" V 8324 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP6" V 9025 4500 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8650 4500 50  0001 C CNN
	1    8650 4500
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 626AA2AE
P 4800 5200
AR Path="/6191B6A2/61F28B7D/626AA2AE" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/626AA2AE" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 4800 5050 50  0001 C CNN
F 1 "+3.3V" V 4815 5328 50  0000 L CNN
F 2 "" H 4800 5200 50  0001 C CNN
F 3 "" H 4800 5200 50  0001 C CNN
	1    4800 5200
	0    1    1    0   
$EndComp
$EndSCHEMATC