
;	PDP-11 DOS SYSTEM MACROS   V005A
;COPYRIGHT 1972 DIGITAL EQUIPMENT CORPORATION
;
;		AUGUST  1972.

	.MACRO	.PARAM
R0=%^O0
R1=%^O1
R2=%^O2
R3=%^O3
R4=%^O4
R5=%^O5
R6=%^O6
R7=%^O7
SP=%^O6
PC=%^O7
PSW=^O177776
SWR=^O177570
	.ENDM
	.MACRO	.INIT	.LBLCK
	.MCALL	.AMODE
	.AMODE	.LBLCK
	EMT <^O6>
	.ENDM

	.MACRO	.RLSE	.LBLCK
	.MCALL	.AMODE
	.AMODE	.LBLCK
	EMT <^O7>
	.ENDM

	.MACRO	.CLOSE	.LBLCK
	.MCALL	.AMODE
	.AMODE	.LBLCK
	EMT <^O17>
	.ENDM

	.MACRO	.READ	.LBLCK,.LBUFF
	.MCALL	.AMODE
	.AMODE	.LBUFF
	.AMODE	.LBLCK
	EMT <^O4>
	.ENDM

	.MACRO	.WRITE	.LBLCK,.LBUFF
	.MCALL	.AMODE
	.AMODE	.LBUFF
	.AMODE	.LBLCK
	EMT <^O2>
	.ENDM

	.MACRO	.OPENO	.LBLCK,.FBLCK
	.MCALL	.CODE,.OPEN
	.CODE	.FBLCK,<^O2>
	.OPEN	.LBLCK,.FBLCK
	.ENDM

	.MACRO	.OPENI	.LBLCK,.FBLCK
	.MCALL	.CODE,.OPEN
	.CODE	.FBLCK,<^O4>
	.OPEN	.LBLCK,.FBLCK
	.ENDM

	.MACRO	.OPENU	.LBLCK,.FBLCK
	.MCALL	.CODE,.OPEN
	.CODE	.FBLCK,<^O1>
	.OPEN	.LBLCK,.FBLCK
	.ENDM

	.MACRO	.OPENC	.LBLCK,.FBLCK
	.MCALL	.CODE,.OPEN
	.CODE	.FBLCK,<^O13>
	.OPEN	.LBLCK,.FBLCK
	.ENDM

	.MACRO	.OPENE	.LBLCK,.FBLCK
	.MCALL	.CODE,.OPEN
	.CODE	.FBLCK,<^O3>
	.OPEN	.LBLCK,.FBLCK
	.ENDM

	.MACRO	.OPEN	.LBLCK,.FBLCK
	.MCALL	.AMODE
	.AMODE	.FBLCK
	.AMODE	.LBLCK
	EMT <^O16>
	.ENDM



	.MACRO	.WAIT	.LBLCK
	.MCALL	.AMODE
	.AMODE	.LBLCK
	EMT <^O1>
	.ENDM

	.MACRO	.WAITR	.LBLCK,.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	.AMODE	.LBLCK
	EMT <^O0>
	.ENDM

	.MACRO	.BLOCK	.LBLCK,.BBLCK
	.MCALL	.AMODE
	.AMODE	.BBLCK
	.AMODE	.LBLCK
	EMT <^O11>
	.ENDM

	.MACRO	.TRAN	.LBLCK,.TBLCK
	.MCALL	.AMODE
	.AMODE	.TBLCK
	.AMODE	.LBLCK
	EMT <^O10>
	.ENDM

	.MACRO	.SPEC	.LBLCK,.SARG
	.MCALL	.AMODE
	.AMODE	.SARG
	.AMODE	.LBLCK
	EMT <^O12>
	.ENDM

	.MACRO	.STAT	.LBLCK
	.MCALL	.AMODE
	.AMODE	.LBLCK
	EMT <^O13>
	.ENDM

	.MACRO	.ALLOC	.LBLCK,.FBLCK,.N
	.MCALL	.AMODE
	.AMODE	.N
	.AMODE	.FBLCK
	.AMODE	.LBLCK
	EMT <^O15>
	.ENDM

	.MACRO	.DELET	.LBLCK,.FBLCK
	.MCALL	.AMODE
	.AMODE	.FBLCK
	.AMODE	.LBLCK
	EMT <^O21>
	.ENDM

	.MACRO	.RENAM	.LBLCK,.OFB,.NFB
	.MCALL	.AMODE
	.AMODE	.NFB
	.AMODE	.OFB
	.AMODE	.LBLCK
	EMT <^O20>
	.ENDM
	.MACRO	.APPND	.LBLCK,.1FB,.2FB
	.MCALL	.AMODE
	.AMODE	.2FB
	.AMODE	.1FB
	.AMODE	.LBLCK
	EMT <^O22>
	.ENDM

	.MACRO	.LOOK	.LBLCK,.FBLCK,.OP
	.MCALL	.AMODE
	.AMODE	.FBLCK
	.IIF NB,.OP,CLR -(SP)
	.AMODE	.LBLCK
	EMT <^O14>
	.ENDM

	.MACRO	.KEEP	.LBLCK,.FBLCK
	.MCALL	.AMODE
	.AMODE	.FBLCK
	.AMODE	.LBLCK
	EMT <^O24>
	.ENDM

	.MACRO	.EXIT
	EMT <^O60>
	.ENDM

	.MACRO	.TRAP	.STUS,.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	.AMODE	.STUS
	MOV	#^O1,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.STFPU	.STUS,.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	.AMODE	.STUS
	MOV	#^O3,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.RECRD	.LBLCK,.RBLCK
	.MCALL	.AMODE
	.AMODE	.RBLCK
	.AMODE	.LBLCK
	EMT <^O25>
	.ENDM

	.MACRO	.DUMP	.LOW,.HIGH,.CDE
	.MCALL	.AMODE
	.AMODE	.LOW
	.AMODE	.HIGH
	.AMODE	.CDE
	EMT <^O64>
	.ENDM

	.MACRO	.RSTRT	.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	MOV	#^O2,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.CORE
	MOV	#^O100,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.MONR
	MOV	#^O101,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.MONF
	MOV	#^O102,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.DATE
	MOV	#^O103,-(SP)
	EMT <^O41>
	.ENDM
	.MACRO	.TIME
	MOV	#^O104,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.GTUIC
	MOV	#^O105,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.SYSDV
	MOV	#^O106,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.RADPK	.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	CLR	-(SP)
	EMT <^O42>
	.ENDM

	.MACRO	.RADUP	.ADDR,.WRD
	.MCALL	.AMODE
	.AMODE	.WRD
	.AMODE	.ADDR
	MOV	#^O1,-(SP)
	EMT <^O42>
	.ENDM

	.MACRO	.D2BIN	.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	MOV	#^O2,-(SP)
	EMT <^O42>
	.ENDM

	.MACRO	.BIN2D	.ADDR,.WRD
	.MCALL	.AMODE
	.AMODE	.WRD
	.AMODE	.ADDR
	MOV	#^O3,-(SP)
	EMT <^O42>
	.ENDM

	.MACRO	.O2BIN	.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	MOV	#^O4,-(SP)
	EMT <^O42>
	.ENDM

	.MACRO	.BIN2O	.ADDR,.WRD
	.MCALL	.AMODE
	.AMODE	.WRD
	.AMODE	.ADDR
	MOV	#^O5,-(SP)
	EMT <^O42>
	.ENDM
	.MACRO	.CSI1	.CMDBF
	.MCALL	.AMODE
	.AMODE	.CMDBF
	EMT <^O56>
	.ENDM

	.MACRO	.CSI2	.CSBLK
	.MCALL	.AMODE
	.AMODE	.CSBLK
	EMT <^O57>
	.ENDM

	.MACRO	.DTCVT	.ADDR
	.MCALL	.CVTDT
	.CVTDT	#^O0,.ADDR
	.ENDM

	.MACRO	.TMCVT	.ADDR
	.MCALL	.CVTDT
	.CVTDT	#^O1,.ADDR
	.ENDM

	.MACRO	.CVTDT	.CDE,.ADDR,.VAL1,.VAL2
	.MCALL	.AMODE
	.IF	NB,.VAL2
	.AMODE	.VAL2
	.ENDC
	.IF	NB,.VAL1
	.AMODE	.VAL1
	.ENDC
	.AMODE	.ADDR
	.AMODE	.CDE
	EMT <^O66>
	.ENDM

	.MACRO	.GTPLA
	CLR	-(SP)
	MOV	#^O5,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.STPLA	.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	MOV	#^O5,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.GTCIL
	MOV	#^O111,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.GTSTK
	CLR	-(SP)
	MOV	#^O4,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.STSTK	.ADDR
	.MCALL	.AMODE
	.AMODE	.ADDR
	MOV	#^O4,-(SP)
	EMT <^O41>
	.ENDM

	.MACRO	.RUN	.RNBLK
	.MCALL	.AMODE
	.AMODE	.RNBLK
	EMT <^O65>
	.ENDM

	.MACRO	.FLUSH	.CDE
	.MCALL	.AMODE
	.AMODE	.CDE
	EMT <^O67>
	.ENDM

; THE MACRO .AMODE ACCEPTS ONE ARGUMENT AND
; AS A FUNCTION OF THE ADDRESSING MODE OF
; THE ARGUMENT GENERATES THE APPROPRIATE
; MOV TO -(SP).
; ADDRESS MODES THAT ARE TROUBLESOME (E.G.
; X(SP)) OR UNLIKELY (E.G. SP) WILL RESULT
; IN A .ERROR TO CMO INCLUDING THE
; VALUE OF THE ADDRESS MODE (E.G. X(SP)
; IS REPRESENTED AS 000066), THE ARGUMENT ITSELF
; AND THE TEXT "ADDRESSING MODE ILLEGAL AS SYSTEM
; MACRO ARGUMENT".
;
	.MACRO	.AMODE	.ARG
SP=%^O6
	.NTYPE	.SYM,.ARG	;.SYM=ADDRESS MODE.

	.IF LE,.SYM-^O5
	MOV	.ARG,-(SP)	;R0 TO R5
	.MEXIT
	.ENDC

	.IF EQ,.SYM&^O70-^O10
	.IF LE,.SYM&^O7-^O6
	MOV	.ARG,-(SP)	;@R0 TO @R6
	.MEXIT
	.ENDC
	.ENDC

	.IF EQ,.SYM&^O60-^O20
	MOV	.ARG,-(SP)	;[@](R0)+ TO [@](R7)+
	.MEXIT			; #N,@#ADDR
	.ENDC

	.IF EQ,.SYM&^O40-^O40
	.IF LE,.SYM&^O7-^O5
	MOV	.ARG,-(SP)	;[@]-(R0) TO [@]-(R5)
	.MEXIT			;[@]X(R0) TO [@]X(R5)
	.ENDC
	.ENDC

	.IF EQ,.SYM&^O67-^O67
	MOV	.ARG,-(SP)	;ADDR AND @ADDR
	.MEXIT
	.ENDC

	.ERROR .SYM		;.ARG ADDRESSING MODE ILLEGAL
	.PRINT			;AS SYSTEM MACRO ARGUMENT.
	.ENDM

; THE MACRO .CODE SETS UP THE FILEBLOCK
; WITH THE HOW OPEN CODE.
; THE ADDRESS OF THE FILEBLOCK MUST
; BE IN A REGISTER (R0 TO R5)

	.MACRO	.CODE	.FBLK,.N
	.NTYPE	.SYM,.FBLK

	.IF LE,.SYM-^O5
	MOVB	#.N,-^O2(.FBLK)	;R0 TO R5
	.MEXIT
	.ENDC

	.ERROR .SYM		;.FBLK ADDRESSING MODE ILLEGAL
	.PRINT			;FOR .OPEN FILE BLOCK
	.ENDM

B$$BB$$BB$$BL  