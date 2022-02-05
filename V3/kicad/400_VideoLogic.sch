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
$Sheet
S 5500 2950 1150 700 
U 61E514A1
F0 "sheet61E51497" 50
F1 "600_CounterLogic.sch" 50
F2 "PC[0..9]" O L 5500 3100 50 
F3 "V_SYNC" O R 6650 3100 50 
F4 "H_SYNC" O R 6650 3200 50 
F5 "CPU_EN" O R 6650 3300 50 
F6 "VIDEO_EN" O R 6650 3400 50 
F7 "LC[0..9]" O L 5500 3400 50 
F8 "RESET" I R 6650 3500 50 
$EndSheet
Text GLabel 4700 3700 2    50   Input ~ 0
VIDEO_EN
Text GLabel 4700 3600 2    50   Input ~ 0
BUSACK
Text GLabel 4700 3500 2    50   Input ~ 0
PU6
Text GLabel 6650 3500 2    50   Input ~ 0
H_RESET
Text GLabel 6650 3200 2    50   Input ~ 0
H_SYNC
Text GLabel 6650 3100 2    50   Input ~ 0
V_SYNC
Text GLabel 6650 3400 2    50   Input ~ 0
VIDEO_EN
$Sheet
S 3550 2950 1150 950 
U 61E514B0
F0 "100_Buffers" 50
F1 "100_Buffers.sch" 50
F2 "A[0..15]" O R 4700 3800 50 
F3 "E1" I R 4700 3600 50 
F4 "E2" I R 4700 3700 50 
F5 "PU0" I R 4700 3500 50 
F6 "LC[0..9]" I R 4700 3200 50 
F7 "PC[0..9]" I R 4700 3100 50 
$EndSheet
Wire Bus Line
	4700 3200 5100 3200
Wire Bus Line
	5100 3200 5100 3400
Wire Bus Line
	5100 3400 5500 3400
Wire Bus Line
	4700 3100 5100 3100
Wire Bus Line
	5100 3100 5100 2700
Wire Bus Line
	5100 2700 7300 2700
Connection ~ 5100 3100
Wire Bus Line
	5100 3100 5500 3100
Wire Bus Line
	4700 3800 5000 3800
Wire Bus Line
	5000 3800 5000 4700
Text GLabel 8950 3100 2    50   Input ~ 0
H_SYNC
Text GLabel 8950 3200 2    50   Input ~ 0
V_SYNC
Text GLabel 8050 3400 0    50   Input ~ 0
BUSACK
$Sheet
S 8050 2950 900  600 
U 61E5229A
F0 "sheet61E52290" 50
F1 "700_Video_Out.sch" 50
F2 "EN" I L 8050 3400 50 
F3 "H_SYNC" I R 8950 3100 50 
F4 "V_SYNC" I R 8950 3200 50 
F5 "D[0..7]" I L 8050 3100 50 
F6 "PC[0..9]" I L 8050 3200 50 
$EndSheet
Wire Bus Line
	8050 3100 7650 3100
Wire Bus Line
	7650 3100 7650 2700
Wire Bus Line
	7450 2700 7450 3200
Wire Bus Line
	7450 3200 8050 3200
$EndSCHEMATC
