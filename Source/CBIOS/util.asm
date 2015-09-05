;
;==================================================================================================
; UTILITY FUNCTIONS
;==================================================================================================
;
;
CHR_CR		.EQU	0DH
CHR_LF		.EQU	0AH
CHR_BS		.EQU	08H
CHR_ESC		.EQU	1BH
;
;__________________________________________________________________________________________________
;
; UTILITY PROCS TO PRINT SINGLE CHARACTERS WITHOUT TRASHING ANY REGISTERS
;
PC_SPACE:
	PUSH	AF
	LD	A,' '
	JR	PC_PRTCHR

PC_PERIOD:
	PUSH	AF
	LD	A,'.'
	JR	PC_PRTCHR

PC_COLON:
	PUSH	AF
	LD	A,':'
	JR	PC_PRTCHR

PC_COMMA:
	PUSH	AF
	LD	A,','
	JR	PC_PRTCHR

PC_LBKT:
	PUSH	AF
	LD	A,'['
	JR	PC_PRTCHR

PC_RBKT:
	PUSH	AF
	LD	A,']'
	JR	PC_PRTCHR

PC_LT:
	PUSH	AF
	LD	A,'<'
	JR	PC_PRTCHR

PC_GT:
	PUSH	AF
	LD	A,'>'
	JR	PC_PRTCHR

PC_LPAREN:
	PUSH	AF
	LD	A,'('
	JR	PC_PRTCHR

PC_RPAREN:
	PUSH	AF
	LD	A,')'
	JR	PC_PRTCHR

PC_ASTERISK:
	PUSH	AF
	LD	A,'*'
	JR	PC_PRTCHR

PC_CR:
	PUSH	AF
	LD	A,CHR_CR
	JR	PC_PRTCHR

PC_LF:
	PUSH	AF
	LD	A,CHR_LF
	JR	PC_PRTCHR

PC_PRTCHR:
	CALL	COUT
	POP	AF
	RET

NEWLINE2:
	CALL	NEWLINE
NEWLINE:
	CALL	PC_CR
	CALL	PC_LF
	RET
;
; OUTPUT A '$' TERMINATED STRING
;
WRITESTR:
	PUSH	AF
WRITESTR1:
	LD	A,(DE)
	CP	'$'			; TEST FOR STRING TERMINATOR
	JP	Z,WRITESTR2
	CALL	COUT
	INC	DE
	JP	WRITESTR1
WRITESTR2:
	POP	AF
	RET
;
; PANIC: TRY TO DUMP MACHINE STATE AND HALT
;
PANIC:
	PUSH	HL
	PUSH	DE
	PUSH	BC
	PUSH	AF
	LD	DE,STR_PANIC
	CALL	WRITESTR
	LD	DE,STR_AF
	CALL	WRITESTR
	POP	BC		; AF
	CALL	PRTHEXWORD
	LD	DE,STR_BC
	CALL	WRITESTR
	POP	BC		; BC
	CALL	PRTHEXWORD
	LD	DE,STR_DE
	CALL	WRITESTR
	POP	BC		; DE
	CALL	PRTHEXWORD
	LD	DE,STR_HL
	CALL	WRITESTR
	POP	BC		; HL
	CALL	PRTHEXWORD
	LD	DE,STR_PC
	CALL	WRITESTR
	POP	BC		; PC
	CALL	PRTHEXWORD
	LD	DE,STR_SP
	CALL	WRITESTR
	LD	HL,0
	ADD	HL,SP		; SP
	LD	B,H
	LD	C,L
	CALL	PRTHEXWORD
	
	RST	38
	
	HALT
	
	JP	0
;
;==================================================================================================
; CONSOLE CHARACTER I/O HELPER ROUTINES (REGISTERS PRESERVED)
;==================================================================================================
;
; OUTPUT CHARACTER FROM A
COUT:
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	C,A
	CALL	CONOUT
	POP	HL
	POP	DE
	POP	BC
	POP	AF
	RET
;
STR_PANIC	.DB	"\r\n\r\n>>> FATAL ERROR:$"
STR_AF		.DB	" AF=$"
STR_BC		.DB	" BC=$"
STR_DE		.DB	" DE=$"
STR_HL		.DB	" HL=$"
STR_PC		.DB	" PC=$"
STR_SP		.DB	" SP=$"
;
; INDIRECT JUMP TO ADDRESS IN HL
;
;   MOSTLY USEFUL TO PERFORM AN INDIRECT CALL LIKE:
;     LD	HL,xxxx
;     CALL	JPHL
;
JPHL:	JP	(HL)
;
; ADD HL,A
; ADC HL,A
;
;   A REGISTER IS DESTROYED!
;
ADCHLA:
	ADC	A,L
	JR	ADDHLA1
ADDHLA:
	ADD	A,L
ADDHLA1:
	LD	L,A
	RET	NC
	INC	H
	RET
;
; MULTIPLY 8-BIT VALUES
; IN:  MULTIPLY H BY E
; OUT: HL = RESULT, E = 0, B = 0
;
MULT8:
	LD D,0
	LD L,D
	LD B,8
MULT8_LOOP:
	ADD HL,HL
	JR NC,MULT8_NOADD
	ADD HL,DE
MULT8_NOADD:
	DJNZ MULT8_LOOP
	RET
;
; FILL MEMORY AT HL WITH VALUE A, LENGTH IN BC, ALL REGS USED
; LENGTH *MUST* BE GREATER THAN 1 FOR PROPER OPERATION!!!
;
FILL:
	LD	D,H		; SET DE TO HL
	LD	E,L		; SO DESTINATION EQUALS SOURCE
	LD	(HL),A		; FILL THE FIRST BYTE WITH DESIRED VALUE
	INC	DE		; INCREMENT DESTINATION
	DEC	BC		; DECREMENT THE COUNT
	LDIR			; DO THE REST
	RET			; RETURN
;
; PRINT VALUE OF A IN DECIMAL WITH LEADING ZERO SUPPRESSION
;
PRTDECB:
	PUSH	HL
	PUSH	AF
	LD	L,A
	LD	H,0
	CALL	PRTDEC
	POP	AF
	POP	HL
	RET
;
; PRINT VALUE OF HL IN DECIMAL WITH LEADING ZERO SUPPRESSION
;
PRTDEC:
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	E,'0'
	LD	BC,-10000
	CALL	PRTDEC1
	LD	BC,-1000
	CALL	PRTDEC1
	LD	BC,-100
	CALL	PRTDEC1
	LD	C,-10
	CALL	PRTDEC1
	LD	E,0
	LD	C,-1
	CALL	PRTDEC1
	POP	HL
	POP	DE
	POP	BC
	RET
PRTDEC1:
	LD	A,'0' - 1
PRTDEC2:
	INC	A
	ADD	HL,BC
	JR	C,PRTDEC2
	SBC	HL,BC
	CP	E
	JR	Z,PRTDEC3
	LD	E,0
	CALL	COUT
PRTDEC3:
	RET
;
; PRINT THE HEX BYTE VALUE IN A
;
PRTHEXBYTE:
	PUSH	AF
	PUSH	DE
	CALL	HEXASCII
	LD	A,D
	CALL	COUT
	LD	A,E
	CALL	COUT
	POP	DE
	POP	AF
	RET
;
; PRINT THE HEX WORD VALUE IN BC
;
PRTHEXWORD:
	PUSH	AF
	LD	A,B
	CALL	PRTHEXBYTE
	LD	A,C
	CALL	PRTHEXBYTE
	POP	AF
	RET
;
; CONVERT BINARY VALUE IN A TO ASCII HEX CHARACTERS IN DE
;
HEXASCII:
	LD	D,A
	CALL	HEXCONV
	LD	E,A
	LD	A,D
	RLCA
	RLCA
	RLCA
	RLCA
	CALL	HEXCONV
	LD	D,A
	RET
;
; CONVERT LOW NIBBLE OF A TO ASCII HEX
;
HEXCONV:
	AND	0FH	     ;LOW NIBBLE ONLY
	ADD	A,90H
	DAA	
	ADC	A,40H
	DAA	
	RET	
