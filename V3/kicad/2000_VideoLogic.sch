EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 12
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 7150 4700 2    50   Input ~ 0
VIDEO_EN
Text GLabel 7150 4600 2    50   Input ~ 0
BUSACK
Text GLabel 7150 5350 2    50   Input ~ 0
PU6
Text GLabel 5050 5050 2    50   Input ~ 0
H_RESET
Text GLabel 5050 4750 2    50   Input ~ 0
H_SYNC
Text GLabel 5050 4650 2    50   Input ~ 0
V_SYNC
Text GLabel 5050 4950 2    50   Input ~ 0
VIDEO_EN
Wire Bus Line
	7150 4800 7450 4800
Text GLabel 9250 5000 2    50   Input ~ 0
H_SYNC
Text GLabel 9250 5100 2    50   Input ~ 0
V_SYNC
Text GLabel 8350 5300 0    50   Input ~ 0
BUSACK
$Sheet
S 3900 4500 1150 950 
U 61E514A1
F0 "2200_CounterLogic" 50
F1 "2200_CounterLogic.sch" 50
F2 "V_SYNC" O R 5050 4650 50 
F3 "H_SYNC" O R 5050 4750 50 
F4 "CPU_EN" O R 5050 4850 50 
F5 "VIDEO_EN" O R 5050 4950 50 
F6 "RESET" I R 5050 5050 50 
F7 "PC[0..9]" O R 5050 5250 50 
F8 "LC[0..9]" O R 5050 5350 50 
$EndSheet
$Sheet
S 8350 4850 900  600 
U 61E5229A
F0 "2300_VideoOut" 50
F1 "2300_VideoOut.sch" 50
F2 "EN" I L 8350 5300 50 
F3 "H_SYNC" I R 9250 5000 50 
F4 "V_SYNC" I R 9250 5100 50 
F5 "D[0..7]" I L 8350 5000 50 
F6 "PC[0..9]" I L 8350 5100 50 
$EndSheet
Wire Bus Line
	5050 5250 6000 5250
Wire Bus Line
	5050 5350 6000 5350
$Sheet
S 6000 4500 1150 950 
U 61E514B0
F0 "2100_AddressBuffers" 50
F1 "2100_AddressBuffers.sch" 50
F2 "LC[0..9]" I L 6000 5350 50 
F3 "PC[0..9]" I L 6000 5250 50 
F4 "E1" I R 7150 4600 50 
F5 "E2" I R 7150 4700 50 
F6 "A[0..15]" O R 7150 4800 50 
F7 "PU0" I R 7150 5350 50 
$EndSheet
$EndSCHEMATC
