File 1)	DSK:SCNMAC.300	created: 0305 07-Sep-83
File 2)	DSK:SCNMAC.MAC	created: 1956 04-Sep-85

1)1		IFDEF	%.C,<IFE %.C,<XLIST>>
1)		IFNDEF	%.C,<XLIST>
1)	CUSTVR==0		;CUSTOMER VERSION
1)	DECVER==7		;DEC VERSION
1)	DECMVR==4		;DEC MINOR VERSION
1)	DECEVR==300		;DEC EDIT VERSION
1)	;COPYRIGHT (C) 1971,1974,1981,1984 BY
1)	;DIGITAL EQUIPMENT CORPORATION, MAYNARD, MASS.
1)	;
1)	;
1)	;THIS SOFTWARE IS FURNISHED UNDER A LICENSE AND MAY BE USED AND COPIED
1)	;ONLY  IN  ACCORDANCE  WITH  THE  TERMS  OF  SUCH LICENSE AND WITH THE
1)	;INCLUSION OF THE ABOVE COPYRIGHT NOTICE.  THIS SOFTWARE OR ANY  OTHER
1)	;COPIES THEREOF MAY  NOT BE PROVIDED OR OTHERWISE MADE AVAILABLE TO ANY
1)	;OTHER PERSON.  NO TITLE TO AND OWNERSHIP OF THE  SOFTWARE  IS  HEREBY
1)	;TRANSFERRED.
1)	;
1)	;THE INFORMATION IN THIS SOFTWARE IS SUBJECT TO CHANGE WITHOUT  NOTICE
1)	;AND  SHOULD  NOT  BE  CONSTRUED  AS A COMMITMENT BY DIGITAL EQUIPMENT
1)	;CORPORATION.
1)	;
1)	;DIGITAL ASSUMES NO RESPONSIBILITY FOR THE USE OR RELIABILITY  OF  ITS
1)	;SOFTWARE ON EQUIPMENT WHICH IS NOT SUPPLIED BY DIGITAL.
1)	;DEFINE %.C NON-ZERO TO LIST FILE
1)	;DEFINE %.C==-1 TO ASSEMBLE SCNMAC IN BOTH PASSES
1)	;DEFINE %.C==-2 TO ALSO INCLUDE END STATEMENT, I.E., NORMAL LISTING
1)	;DEFINE %.C==-3 TO MAKE SCNMAC A UNIVERSAL FILE
1)	;DETERMINE IF SPECIAL ASSEMBLY NEEDED
1)	IF1,<%..C==1	;ALWAYS ASSEMBLE PASS1
1)	    IFDEF %.C,< IFE %.C+2,<TITLE SCNMAC -- LISTING OF SCNMAC.MAC (SCAN PARAMETER FILE)>
1)			IFE %.C+3,<UNIVERSAL SCNMAC -- SCAN PARAMETER UNIVERSAL SYMBOL TABLE
1)				   %..C==-77>>
1)	>;END OF IF1
1)	IF2,<IFNDEF %.C,<%.C==0
1)			IFDEF %%SCAN,<%.C==-1>>	;SUPPLY VALUE IF USER DIDN'T
1)	     %..C==%.C	;USE USER'S VALUE FOR PASS2
1)	>;END OF IF2
1)		LIST
1)	IFE %..C,<TAPE>	;SKIP REST IF NO ASSEMBLY NEEDED    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
1)	IFN %..C+77,<	;DON'T ASSEMBLE UNIVERSAL PASS1
1)	%%SCNM==<BYTE (3)CUSTVR(9)DECVER(6)DECMVR(18)DECEVR>
****
2)1	;[CSM] Replace the gobbledy-gook about %.C with the following:
2)		UNIVERSAL SCNMAC -- SCAN PARAMETER UNIVERSAL SYMBOL TABLE
2)		SEARCH	MACTEN,UUOSYM	;Instead of assembling C.MAC+SCNMAC.MAC
2)		SALL
2)		%%MACT==%%MACT		;Show version number of MACTEN
2)		%%UUOS==%%UUOS		;Show version number of UUOSYM
2)	CUSTVR==2		;CUSTOMER VERSION (edited by [JMS] 12-Aug-85)
2)	DECVER==7		;DEC VERSION
2)	DECMVR=="D"-"@"		;DEC MINOR VERSION
2)	DECEVR==300		;DEC EDIT VERSION (actually, 106+200+201+203)
2)		.DIRECTIVE .NOBIN	;No .REL if UNV  [203]
2)	%%SCNM==<BYTE (3)CUSTVR(9)DECVER(6)DECMVR(18)DECEVR>
**************
1)3	;106	ADD FS.IFI TO SIGNIFY INDIRECT FILE ILLEGAL IN FILE SPEC
File 1)	DSK:SCNMAC.300	created: 0305 07-Sep-83
File 2)	DSK:SCNMAC.MAC	created: 1956 04-Sep-85

1)	;300			PY	18-Aug-81
****
2)3	;%7(105) OCT, 1974 with SCAN 7
2)	  ;
2)	;106	Add FS.IFI to signify indirect file illegal in file spec for FILDAE.
2)	  ;
2)	;(Missing edits)
2)	;201	Simplify DOSCAN analysis (no change in call)
2)	;202	Add .FLASK, .FLTEL, .FLQUI
2)	;203	Eliminate SCNMAC.REL for UNIVERSAL
2)	;(Missing edits)
2)	  ;
2)	;CSM/STC changes to SCNMAC
2)	;CSM1	Add support for the /SCAN switch.
2)	;CSM2	Move the .LKWLD and .SCWLD flags into SCNMAC.
2)	;CSM3	Add a flag which forces a switch name to be exact.
2)	;CSM4	FT$RSX defines 9 character file names.  This edit extracted from
2)	;	ACCSCM.MAC on the TOOLS tape, and is applicable to the CLINK program.
2)	  ;
2)	;300			PY	18-Aug-81
**************
1)3	;7D(300) JAN, 82 WITH SCAN 7D(630)
1)4	;WORDS IN FILE SPEC AREA
****
2)3	;[JMS]	Copy .FXUSN and .FXHOS into 7D(300)-2.   12-Aug-85
2)	;7D(300) JAN, 82 WITH SCAN 7D(630)
2)4		ND FT$RSX,0		;[CSM4] Non-zero for 9-character file names
2)	;WORDS IN FILE SPEC AREA
**************
1)4	.FXBFR==22	;/BEFORE
****
2)4	;   17=4th SFD mask, 20=5th SFD, 21=5th SFD mask.  [JMS]
2)	.FXUSN==17	;USERNAME (2 WORDS) [A.BLAM 15-10-80][Carl 10-Feb-84]
2)	.FXHOS==21	;HOST COMPUTER      [A.BLAM 15-10-80][Carl 10-Feb-84]
2)	;****** end of directory mask field ******
2)	.FXBFR==22	;/BEFORE
**************
1)4	;LENGTHS OF FILE SPEC AREA
1)	.FXLEN==32	;LENGTH OF ONE SPECIFICATION
1)	.FXLND==6	;LENGTH OF DIRECTORY (UFD+SFD'S)
****
2)4	IFN FT$RSX,<	;[CSM4] 9 character file names when CLINK talks to PDP-11s
2)	.FXNA1==32	;[CSM4] File name part 2
2)	.FXNM1==33	;[CSM4] File name mask part 2
2)	.FXNOD==34	;[CSM4] Node name
2)	.FXLEN==35	;[CSM4] Length of one specification
2)	>  ;End of IFN FT$RSX
2)	IFE FT$RSX,<	;[CSM4] Normal TOPS-10 SCAN
2)	;LENGTHS OF FILE SPEC AREA
2)	.FXLEN==32	;LENGTH OF ONE SPECIFICATION
2)	>  ;End of IFE FT$RSX
2)	.FXLND==6	;LENGTH OF DIRECTORY (UFD+SFD'S)
**************
1)4	FX.DEN==7B23	;/DENSITY					[105]
****
2)4	FX.SCN==3B13	;/SCAN							[CSM1]
File 1)	DSK:SCNMAC.300	created: 0305 07-Sep-83
File 2)	DSK:SCNMAC.MAC	created: 1956 04-Sep-85

2)		.FXSFD==1	;Scan SFDs before UFD (to DELETE *.*[,,*,*,*]).	[CSM1]
2)		.FXUFD==2	;Scan UFD before starting SFDs (like DIRECT).	[CSM1]
2)		.FXUP== 3	;Set SCAN bit in PATH. block so monitor will	[CSM1]
2)				; search higher SFDs if file not found		[CSM1]
2)				;If set on call to WILD, scan down each SFD	[CSM1]
2)				; as it is encountered (like BACKUP).		[CSM1]
2)	;;    ==177B20	;Unused bits
2)	FX.DEN==7B23	;/DENSITY					[105]
**************
1)5	;VALUES FROM .VERBO
****
2)5	;Flags for .LKWLD call						[CSM2]
2)	FW.DAD==1B0	;Do all devices					[CSM2]
2)	FW.UFD==1B1	;Scan UFD before SFD				[CSM2]
2)	FW.XXX==1B2	;Reserved for version 10			[CSM2]
2)	FW.SSN==1B3	;Search on [1,4] after [1,5] for SYS/NEW	[CSM2]
2)	FW.SFD==1B4	;Scan SFD before UFD				[CSM2]
2)	FW.SCN==1B5	;Scan up the path				[CSM2]
2)	;Flags for .SCWLD call						[CSM2]
2)	FW.TWR==1B0	;Use traditional type wildcard replacement	[CSM2]
2)	FW.SDP==1B1	;Supply default path				[CSM2]
2)	;Values in .FLAQT						[202]
2)	.FLASK==1	;/ASK						[202]
2)	.FLTEL==2	;/TELL						[202]
2)	.FLQUI==3	;/QUIET						[202]
2)	;VALUES FROM .VERBO
**************
1)7			;DON'T USE FS.R??, WHICH ARE DEFINED IN C.MAC
****
2)7	FS.XCT==1B7	;The switch name must be exact			[CSM3]
2)			;DON'T USE FS.R??, WHICH ARE DEFINED IN C.MAC
**************
1)8	DEFINE	X($NAME,$PROC,$POINT,$DEFLT,$MAX,$FLAGS),<
1)		EXP  SIXBIT  /$NAME/
1)	>
1)	PFX'N:	SWTCHS
****
2)8	DEFINE	X($NAME,$PROC,$POINT,$DEFLT,$MAX,$FLAGS),< <SIXBIT /$NAME/> >
2)	PFX'N:	SWTCHS
**************
1)8	IF2,<
1)	DEFINE	X($NAME,$PROC,$POINT,$DEFLT,$MAX,$FLAGS),<
****
2)8	IF2,<	;201	Simplify DOSCAN analysis (no change in call)
2)	DEFINE	X($NAME,$PROC,$POINT,$DEFLT,$MAX,$FLAGS),<
**************
1)8	..TEMP==1>
1)	IFE ..TEMP,<
1)	IFN <$POINT>_-^D24,<
1)	..TEMP==$POINT
1)		..TEMP			;$NAME
1)	>
1)	IFE ..TEMP,<
1)		POINT 36,$POINT,35	;$NAME
1)		>
1)	>>>
File 1)	DSK:SCNMAC.300	created: 0305 07-Sep-83
File 2)	DSK:SCNMAC.MAC	created: 1956 04-Sep-85

1)	PFX'P:	SWTCHS
****
2)8	>
2)	IFNB <$POINT>,<IFE ..TEMP,<					[201]
2)		$POINT			;$NAME
2)	> ;End IFE > ;End IFNB						[201]
2)	> ;End DEFINE > ;End IF2					[201]
2)	PFX'P:	SWTCHS
**************
   