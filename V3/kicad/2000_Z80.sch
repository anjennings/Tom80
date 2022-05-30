EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Bus Line
	5400 3150 5150 3150
Wire Bus Line
	5500 3050 5150 3050
Text HLabel 5150 3150 0    50   3State ~ 0
D[0..7]
Wire Wire Line
	5300 3600 6450 3600
$Sheet
S 6450 3300 850  1150
U 61F28B7D
F0 "2200_PERP_ALT" 50
F1 "2200_PERP_ALT.sch" 50
F2 "A[0..19]" I L 6450 3400 50 
F3 "D[0..7]" B L 6450 3500 50 
F4 "CLK" I L 6450 3600 50 
F5 "CS" I L 6450 3900 50 
F6 "IORQ" I L 6450 4000 50 
F7 "RD" I L 6450 4100 50 
F8 "M1" I L 6450 4300 50 
F9 "INT" O L 6450 3800 50 
$EndSheet
Wire Wire Line
	5300 4000 6450 4000
Wire Wire Line
	5300 4300 6450 4300
$Sheet
S 4400 3300 900  1100
U 61EBDADB
F0 "2100_ALTCPU" 50
F1 "2100_ALTCPU.sch" 50
F2 "D[0..7]" B R 5300 3500 50 
F3 "M1" O R 5300 4300 50 
F4 "IORQ" O R 5300 4000 50 
F5 "RD" O R 5300 4100 50 
F6 "PHI" O R 5300 3600 50 
F7 "ROM_CS" O L 4400 4000 50 
F8 "PIO_EN" O R 5300 3900 50 
F9 "MREAD" O L 4400 3900 50 
F10 "MWRITE" O L 4400 3800 50 
F11 "INT" I R 5300 3800 50 
F12 "H_RAM_CS" O L 4400 4100 50 
F13 "A[0..19]" O R 5300 3400 50 
$EndSheet
Wire Wire Line
	5300 4100 6450 4100
Wire Wire Line
	5300 3900 6450 3900
Text HLabel 4400 3800 0    50   Output ~ 0
WRITE
Text HLabel 4400 3900 0    50   Output ~ 0
READ
Text HLabel 4400 4000 0    50   Output ~ 0
ROM_CS
Text HLabel 4400 4100 0    50   Output ~ 0
RAM_CS
Wire Wire Line
	6450 3800 5300 3800
Text HLabel 5150 3050 0    50   Output ~ 0
A[0..19]
Wire Bus Line
	5300 3400 5500 3400
Wire Bus Line
	5300 3500 5400 3500
Wire Bus Line
	5400 3150 5400 3500
Connection ~ 5400 3500
Wire Bus Line
	5400 3500 6450 3500
Wire Bus Line
	5500 3050 5500 3400
Connection ~ 5500 3400
Wire Bus Line
	5500 3400 6450 3400
$EndSCHEMATC
