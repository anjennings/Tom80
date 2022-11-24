EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
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
AR Path="/6191B6A2/61EBDADB/636B5B34/6259F3CE" Ref="J2230"  Part="1" 
AR Path="/63A83936/636B5B34/6259F3CE" Ref="J2230"  Part="1" 
F 0 "J2230" H 7000 3867 50  0000 C CNN
F 1 "Micro_SD_Card_Det" H 7000 3776 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Molex_104031-0811" H 9100 3750 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 7050 3150 50  0001 C CNN
	1    7050 3050
	1    0    0    -1  
$EndComp
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
AR Path="/6191B6A2/61EBDADB/636B5B34/6259F3E5" Ref="#PWR0118"  Part="1" 
AR Path="/63A83936/636B5B34/6259F3E5" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 5800 2900 50  0001 C CNN
F 1 "GND" V 5805 3022 50  0000 R CNN
F 2 "" H 5800 3150 50  0001 C CNN
F 3 "" H 5800 3150 50  0001 C CNN
	1    5800 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 2800 4650 2800
$Comp
L power:+3.3V #PWR?
U 1 1 6259F3ED
P 5800 2950
AR Path="/6191B6A2/61F28B7D/6259F3ED" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F3ED" Ref="#PWR0116"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6259F3ED" Ref="#PWR0119"  Part="1" 
AR Path="/63A83936/636B5B34/6259F3ED" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 5800 2800 50  0001 C CNN
F 1 "+3.3V" V 5815 3078 50  0000 L CNN
F 2 "" H 5800 2950 50  0001 C CNN
F 3 "" H 5800 2950 50  0001 C CNN
	1    5800 2950
	0    -1   -1   0   
$EndComp
Text Label 7350 4700 0    50   ~ 0
SD_SCK
Text Label 7350 4600 0    50   ~ 0
SD_MOSI
Wire Wire Line
	7350 4700 7700 4700
Wire Wire Line
	7350 4600 7700 4600
Wire Wire Line
	7700 4800 7350 4800
Text Label 7350 4800 0    50   ~ 0
SD_CS
Text Label 7350 4500 0    50   ~ 0
SD_MISO
Wire Wire Line
	7350 4500 7700 4500
$Comp
L power:+3.3V #PWR?
U 1 1 6259F3FB
P 8100 4500
AR Path="/6191B6A2/61F28B7D/6259F3FB" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F3FB" Ref="#PWR0117"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6259F3FB" Ref="#PWR0120"  Part="1" 
AR Path="/63A83936/636B5B34/6259F3FB" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 8100 4350 50  0001 C CNN
F 1 "+3.3V" V 8115 4628 50  0000 L CNN
F 2 "" H 8100 4500 50  0001 C CNN
F 3 "" H 8100 4500 50  0001 C CNN
	1    8100 4500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6259F401
P 7850 3550
AR Path="/6191B6A2/61F28B7D/6259F401" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6259F401" Ref="#PWR0118"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6259F401" Ref="#PWR0124"  Part="1" 
AR Path="/63A83936/636B5B34/6259F401" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 7850 3300 50  0001 C CNN
F 1 "GND" V 7855 3422 50  0000 R CNN
F 2 "" H 7850 3550 50  0001 C CNN
F 3 "" H 7850 3550 50  0001 C CNN
	1    7850 3550
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS07 U?
U 1 1 625A5E8B
P 4350 2800
AR Path="/6191B6A2/61F28B7D/625A5E8B" Ref="U?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E8B" Ref="U2210"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/625A5E8B" Ref="U2230"  Part="1" 
AR Path="/63A83936/636B5B34/625A5E8B" Ref="U2230"  Part="1" 
F 0 "U2230" H 5200 2700 50  0000 C CNN
F 1 "74LS07" H 5200 2800 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 2800 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 2800 50  0001 C CNN
	1    4350 2800
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS07 U?
U 2 1 625A5E91
P 4350 3300
AR Path="/6191B6A2/61F28B7D/625A5E91" Ref="U?"  Part="2" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E91" Ref="U2210"  Part="2" 
AR Path="/6191B6A2/61EBDADB/636B5B34/625A5E91" Ref="U2230"  Part="2" 
AR Path="/63A83936/636B5B34/625A5E91" Ref="U2230"  Part="2" 
F 0 "U2230" H 3500 3400 50  0000 C CNN
F 1 "74LS07" H 3500 3300 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 3300 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 3300 50  0001 C CNN
	2    4350 3300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U?
U 3 1 625A5E97
P 4350 3750
AR Path="/6191B6A2/61F28B7D/625A5E97" Ref="U?"  Part="3" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E97" Ref="U2210"  Part="3" 
AR Path="/6191B6A2/61EBDADB/636B5B34/625A5E97" Ref="U2230"  Part="3" 
AR Path="/63A83936/636B5B34/625A5E97" Ref="U2230"  Part="3" 
F 0 "U2230" H 3500 3850 50  0000 C CNN
F 1 "74LS07" H 3500 3750 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4350 3750 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4350 3750 50  0001 C CNN
	3    4350 3750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U?
U 4 1 625A5E9D
P 4350 2300
AR Path="/6191B6A2/61F28B7D/625A5E9D" Ref="U?"  Part="4" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625A5E9D" Ref="U2210"  Part="4" 
AR Path="/6191B6A2/61EBDADB/636B5B34/625A5E9D" Ref="U2230"  Part="4" 
AR Path="/63A83936/636B5B34/625A5E9D" Ref="U2230"  Part="4" 
F 0 "U2230" H 3500 2400 50  0000 C CNN
F 1 "74LS07" H 3500 2300 50  0000 C CNN
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
AR Path="/6191B6A2/61EBDADB/636B5B34/625A5EA3" Ref="U2230"  Part="5" 
AR Path="/63A83936/636B5B34/625A5EA3" Ref="U2230"  Part="5" 
F 0 "U2230" H 4500 5517 50  0000 C CNN
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
AR Path="/6191B6A2/61EBDADB/636B5B34/625A5EA9" Ref="U2230"  Part="7" 
AR Path="/63A83936/636B5B34/625A5EA9" Ref="U2230"  Part="7" 
F 0 "U2230" V 4900 4550 50  0000 L CNN
F 1 "74LS07" V 4800 4550 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4500 4650 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 4500 4650 50  0001 C CNN
	7    4500 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 3300 5000 3300
Wire Wire Line
	4650 3750 5000 3750
$Comp
L power:+5V #PWR?
U 1 1 625BC2E4
P 4000 4650
AR Path="/6191B6A2/61F28B7D/625BC2E4" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/625BC2E4" Ref="#PWR0125"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/625BC2E4" Ref="#PWR0125"  Part="1" 
AR Path="/63A83936/636B5B34/625BC2E4" Ref="#PWR0125"  Part="1" 
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
AR Path="/6191B6A2/61EBDADB/636B5B34/625BCDFC" Ref="#PWR0126"  Part="1" 
AR Path="/63A83936/636B5B34/625BCDFC" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5000 4400 50  0001 C CNN
F 1 "GND" H 5005 4477 50  0000 C CNN
F 2 "" H 5000 4650 50  0001 C CNN
F 3 "" H 5000 4650 50  0001 C CNN
	1    5000 4650
	0    -1   -1   0   
$EndComp
Text HLabel 4050 2300 0    50   Input ~ 0
CS
Text HLabel 4050 3750 0    50   Input ~ 0
MOSI
Text HLabel 4050 3300 0    50   Input ~ 0
SCK
Text HLabel 4050 2800 0    50   Output ~ 0
MISO
Text Label 5000 2300 2    50   ~ 0
SD_CS
Text Label 5000 3750 2    50   ~ 0
SD_MOSI
Text Label 5000 3300 2    50   ~ 0
SD_SCK
Text Label 5000 2800 2    50   ~ 0
SD_MISO
Text Notes 7800 6900 0    118  ~ 24
This page has been checked!
$Comp
L Device:C C?
U 1 1 62613B08
P 2150 4400
AR Path="/6195D2C9/62613B08" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62613B08" Ref="C2210"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/62613B08" Ref="C2230"  Part="1" 
AR Path="/63A83936/636B5B34/62613B08" Ref="C2230"  Part="1" 
F 0 "C2230" H 2265 4446 50  0000 L CNN
F 1 "22pf" H 2265 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2188 4250 50  0001 C CNN
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
AR Path="/6191B6A2/61EBDADB/636B5B34/62613B0E" Ref="#PWR0127"  Part="1" 
AR Path="/63A83936/636B5B34/62613B0E" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 2150 4300 50  0001 C CNN
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
AR Path="/6191B6A2/61EBDADB/636B5B34/62613B14" Ref="#PWR0128"  Part="1" 
AR Path="/63A83936/636B5B34/62613B14" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 2150 4100 50  0001 C CNN
F 1 "+5V" H 2165 4423 50  0000 C CNN
F 2 "" H 2150 4250 50  0001 C CNN
F 3 "" H 2150 4250 50  0001 C CNN
	1    2150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3250 6150 3250
Text Label 5800 3250 0    50   ~ 0
SD_MISO
Wire Wire Line
	6150 3050 5800 3050
Text Label 5800 3050 0    50   ~ 0
SD_SCK
Wire Wire Line
	6150 2850 5800 2850
Text Label 5800 2850 0    50   ~ 0
SD_MOSI
Text Label 5800 2750 0    50   ~ 0
SD_CS
Wire Wire Line
	5800 2750 6150 2750
Wire Wire Line
	4650 2300 5000 2300
$Comp
L 74xx:74LS07 U2230
U 6 1 6293BD1C
P 3450 5200
F 0 "U2230" H 3450 5500 50  0000 C CNN
F 1 "74LS07" H 3450 5400 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3450 5200 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 3450 5200 50  0001 C CNN
	6    3450 5200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6293E9E7
P 3750 5200
AR Path="/6191B6A2/61F28B7D/6293E9E7" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6293E9E7" Ref="#PWR0146"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6293E9E7" Ref="#PWR0129"  Part="1" 
AR Path="/63A83936/636B5B34/6293E9E7" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 3750 5050 50  0001 C CNN
F 1 "+5V" V 3765 5328 50  0000 L CNN
F 2 "" H 3750 5200 50  0001 C CNN
F 3 "" H 3750 5200 50  0001 C CNN
	1    3750 5200
	0    1    1    0   
$EndComp
NoConn ~ 4200 5200
NoConn ~ 3150 5200
$Comp
L power:GND #PWR?
U 1 1 6281E96A
P 4800 5200
AR Path="/6191B6A2/61F28B7D/6281E96A" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/6281E96A" Ref="#PWR0166"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6281E96A" Ref="#PWR0146"  Part="1" 
AR Path="/63A83936/636B5B34/6281E96A" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 4800 4950 50  0001 C CNN
F 1 "GND" H 4805 5027 50  0000 C CNN
F 2 "" H 4800 5200 50  0001 C CNN
F 3 "" H 4800 5200 50  0001 C CNN
	1    4800 5200
	0    -1   -1   0   
$EndComp
NoConn ~ 6150 3450
NoConn ~ 6150 3550
$Comp
L Regulator_Linear:LP2985-3.3 U2231
U 1 1 62E8B900
P 4100 6400
F 0 "U2231" H 4100 6742 50  0000 C CNN
F 1 "LP2985-3.3" H 4100 6651 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4100 6725 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp2985.pdf" H 4100 6400 50  0001 C CNN
	1    4100 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62E8CAC5
P 4100 6700
AR Path="/62E8CAC5" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/62E8CAC5" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/62E8CAC5" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/62E8CAC5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62E8CAC5" Ref="#PWR0119"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/62E8CAC5" Ref="#PWR0147"  Part="1" 
AR Path="/63A83936/636B5B34/62E8CAC5" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 4100 6450 50  0001 C CNN
F 1 "GND" H 4105 6527 50  0000 C CNN
F 2 "" H 4100 6700 50  0001 C CNN
F 3 "" H 4100 6700 50  0001 C CNN
	1    4100 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62E8D6CF
P 2500 6300
AR Path="/6195D2C9/62E8D6CF" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62E8D6CF" Ref="#PWR0120"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/62E8D6CF" Ref="#PWR0148"  Part="1" 
AR Path="/63A83936/636B5B34/62E8D6CF" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 2500 6150 50  0001 C CNN
F 1 "+5V" H 2515 6473 50  0000 C CNN
F 2 "" H 2500 6300 50  0001 C CNN
F 3 "" H 2500 6300 50  0001 C CNN
	1    2500 6300
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 62E8E7FD
P 5400 6300
AR Path="/6191B6A2/61F28B7D/62E8E7FD" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/62E8E7FD" Ref="#PWR0124"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/62E8E7FD" Ref="#PWR0149"  Part="1" 
AR Path="/63A83936/636B5B34/62E8E7FD" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 5400 6150 50  0001 C CNN
F 1 "+3.3V" V 5415 6428 50  0000 L CNN
F 2 "" H 5400 6300 50  0001 C CNN
F 3 "" H 5400 6300 50  0001 C CNN
	1    5400 6300
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 63922F79
P 2800 6450
AR Path="/6195D2C9/63922F79" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63922F79" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63922F79" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63922F79" Ref="C2232"  Part="1" 
AR Path="/63A83936/636B5B34/63922F79" Ref="C2232"  Part="1" 
F 0 "C2232" H 2915 6496 50  0000 L CNN
F 1 "1 uF" H 2915 6405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2838 6300 50  0001 C CNN
F 3 "~" H 2800 6450 50  0001 C CNN
	1    2800 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63922F7F
P 2800 6600
AR Path="/63922F7F" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/63922F7F" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/63922F7F" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/63922F7F" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63922F7F" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63922F7F" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63922F7F" Ref="#PWR0159"  Part="1" 
AR Path="/63A83936/636B5B34/63922F7F" Ref="#PWR0159"  Part="1" 
F 0 "#PWR0159" H 2800 6350 50  0001 C CNN
F 1 "GND" H 2805 6427 50  0000 C CNN
F 2 "" H 2800 6600 50  0001 C CNN
F 3 "" H 2800 6600 50  0001 C CNN
	1    2800 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6392682E
P 4900 6450
AR Path="/6195D2C9/6392682E" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/6392682E" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6392682E" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6392682E" Ref="C2233"  Part="1" 
AR Path="/63A83936/636B5B34/6392682E" Ref="C2233"  Part="1" 
F 0 "C2233" H 5015 6496 50  0000 L CNN
F 1 "2.2 uF" H 5015 6405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4938 6300 50  0001 C CNN
F 3 "~" H 4900 6450 50  0001 C CNN
	1    4900 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63926834
P 4900 6600
AR Path="/63926834" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/63926834" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/63926834" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/63926834" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/63926834" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/63926834" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63926834" Ref="#PWR0163"  Part="1" 
AR Path="/63A83936/636B5B34/63926834" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 4900 6350 50  0001 C CNN
F 1 "GND" H 4905 6427 50  0000 C CNN
F 2 "" H 4900 6600 50  0001 C CNN
F 3 "" H 4900 6600 50  0001 C CNN
	1    4900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6300 2800 6300
Connection ~ 2800 6300
Wire Wire Line
	4500 6300 4900 6300
Connection ~ 4900 6300
Wire Wire Line
	4900 6300 5400 6300
$Comp
L power:+5V #PWR?
U 1 1 63929039
P 3700 6400
AR Path="/6195D2C9/63929039" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/63929039" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63929039" Ref="#PWR0166"  Part="1" 
AR Path="/63A83936/636B5B34/63929039" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 3700 6250 50  0001 C CNN
F 1 "+5V" H 3715 6573 50  0000 C CNN
F 2 "" H 3700 6400 50  0001 C CNN
F 3 "" H 3700 6400 50  0001 C CNN
	1    3700 6400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 6392A4CF
P 4650 7050
AR Path="/6195D2C9/6392A4CF" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/6392A4CF" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6392A4CF" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6392A4CF" Ref="C2234"  Part="1" 
AR Path="/63A83936/636B5B34/6392A4CF" Ref="C2234"  Part="1" 
F 0 "C2234" H 4765 7096 50  0000 L CNN
F 1 "10 nF" H 4765 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4688 6900 50  0001 C CNN
F 3 "~" H 4650 7050 50  0001 C CNN
	1    4650 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6392A4D5
P 4650 7200
AR Path="/6392A4D5" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/6392A4D5" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/6392A4D5" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/6392A4D5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/6392A4D5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/6392A4D5" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/6392A4D5" Ref="#PWR0167"  Part="1" 
AR Path="/63A83936/636B5B34/6392A4D5" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 4650 6950 50  0001 C CNN
F 1 "GND" H 4655 7027 50  0000 C CNN
F 2 "" H 4650 7200 50  0001 C CNN
F 3 "" H 4650 7200 50  0001 C CNN
	1    4650 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6400 4650 6400
Wire Wire Line
	4650 6400 4650 6900
$Comp
L Device:C C?
U 1 1 63932C37
P 8300 2900
AR Path="/6195D2C9/63932C37" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/63932C37" Ref="C?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63932C37" Ref="C2231"  Part="1" 
AR Path="/63A83936/636B5B34/63932C37" Ref="C2231"  Part="1" 
F 0 "C2231" H 8415 2946 50  0000 L CNN
F 1 "22pf" H 8415 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8338 2750 50  0001 C CNN
F 3 "~" H 8300 2900 50  0001 C CNN
	1    8300 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63932C3D
P 8300 3050
AR Path="/63932C3D" Ref="#PWR?"  Part="1" 
AR Path="/62497D60/63932C3D" Ref="#PWR?"  Part="1" 
AR Path="/61D852D7/63932C3D" Ref="#PWR?"  Part="1" 
AR Path="/6195D2C9/63932C3D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/63932C3D" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63932C3D" Ref="#PWR0170"  Part="1" 
AR Path="/63A83936/636B5B34/63932C3D" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 8300 2800 50  0001 C CNN
F 1 "GND" H 8305 2877 50  0000 C CNN
F 2 "" H 8300 3050 50  0001 C CNN
F 3 "" H 8300 3050 50  0001 C CNN
	1    8300 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 63933B58
P 8300 2750
AR Path="/6191B6A2/61F28B7D/63933B58" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61F28B7D/62590ED9/63933B58" Ref="#PWR?"  Part="1" 
AR Path="/6191B6A2/61EBDADB/636B5B34/63933B58" Ref="#PWR0173"  Part="1" 
AR Path="/63A83936/636B5B34/63933B58" Ref="#PWR0173"  Part="1" 
F 0 "#PWR0173" H 8300 2600 50  0001 C CNN
F 1 "+3.3V" H 8300 2900 50  0000 L CNN
F 2 "" H 8300 2750 50  0001 C CNN
F 3 "" H 8300 2750 50  0001 C CNN
	1    8300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 6300 3700 6300
$Comp
L Device:R_Pack04 RN2230
U 1 1 6395EBF3
P 7900 4600
F 0 "RN2230" V 8225 4600 50  0000 C CNN
F 1 "4 x 10K" V 8134 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 8175 4600 50  0001 C CNN
F 3 "~" H 7900 4600 50  0001 C CNN
	1    7900 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8100 4800 8100 4700
Connection ~ 8100 4500
Connection ~ 8100 4600
Wire Wire Line
	8100 4600 8100 4500
Connection ~ 8100 4700
Wire Wire Line
	8100 4700 8100 4600
$EndSCHEMATC
