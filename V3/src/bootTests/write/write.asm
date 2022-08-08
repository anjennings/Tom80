; Scream into the UART void and hope somebody hears you
ORG 0

	DI
	LD A, 0x00	
	LD (0x1F), A	;CPU Control Reg

	LD A, 0x24	;0010 0100
	OUT (0), A 	;ASCI Control A

	LD A, 0x03	;0000 0011
	OUT (2), A	;ASCI Control B	(CNTLB)

	LD A, 0x00	; No interrupts
	OUT (4), A	;ASCI Status Reg

	LD A, 0x00	; Not used
	OUT (0x0A), A	;CSIO Contro Reg

	LD A, 0x00	; Not used
	OUT (0x10), A	;Timer Control Reg

	LD A, 0x60	;X110 0000
	OUT (0x12), A	;ASCI Extension Control

	LD A, 0x00	
	OUT (0x1E), A	; Clock Multiplier Reg
