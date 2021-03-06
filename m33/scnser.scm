File 1)	DSK:SCNSER.MAC	created: 1641 26-MAR-91
File 2)	DSK:SCNSER.E00	created: 1520 15-MAR-89

1)33		CAILE	T1,37777	;Check if KMC-11 left garbage in IRING
1)		 STOPCD (SCNIN2,INFO,DATE14,PRTT1##,<Bogus date, 14 bits = 8-Nov-2008>)
1)		EXCH	T1,T2		;Time in T1, Date in T2
****
2)33		EXCH	T1,T2		;Time in T1, Date in T2
**************
1)145		SKIPN	T2,LDBLOG(T2)	;IF IT'S NOT LOGGED-IN
1)		 JRST	CPOPJ1		;SUCCESS!
1)		AOS	GETPP2		;Count times even half free but odd half in use
1)		TLNN	T2,LLLZAP!LLLNLN;Check if slave side is marked as 'zap pending'
1)		 JRST	GETPP1		;NO TRY THE NEXT PAIR
1)		MOVSI	T2,1		;Increment LH
1)		AD DM	T2,GETPP2	;Count number of times we saw a zapped PTY
1)		JRST	CPOPJ1		;Use it anyway
1)	GETPP2:	0			;Count in both halves
1)	;PTYBUD - GET PTY BUDDY
****
2)145		SKIPE	LDBLOG(T2)	;IF IT'S LOGGED-IN,
2)		 JRST	GETPP1		;  TRY THE NEXT PAIR
2)		JRST	CPOPJ1		;SUCCESS!
2)	;PTYBUD - GET PTY BUDDY
**************
1)172		 JRST	AUXGAN		;YES, NOW CHECK LIST
1)		DMOVE	T2,AUXUNM
1)		CAMN	T2,JBTUNM(J)	;CHECK USER NAME MATCH
****
2)172		 JRST	AUXLIC		;YES
2)		MOVE	T2,AUXUNM
2)		MOVE	T3,AUXUNM+1
2)		CAMN	T2,JBTUNM(J)	;CHECK USER NAME MATCH
**************
1)173	AUXGAN:	HLRZ	T4,JBTAUN##(J)	; Check gan
1)		CAIN	T4,3		;  for lower class
1)		 JRST	AUXLIC		; Yes, it works here
1)		DMOVE	T2,AUXUNM
1)		CAMN	T2,JBTUNM(J)	;CHECK USER NAME MATCH
1)		CAME	T3,JBTUN1(J)
1)		  CAIA			; No match - skip
1)		 JRST	AUXLIC		; Yes, same user is always allowed
1)		DMOVE	T2,AUXUNM	; Otherwize check list
1)		HRLZI	T4,-AUXNTL	; * Length is 2x # of entries
1)	AUXGA1:	CAMN	T2,AUXNTB(T4)	; Check user name match
1)		CAME	T3,AUXNTB+1(T4)
1)		 SKIPA			; One half or the other does not match
1)		  JRST	[MOVSI T2,CXLOG%; Found match on reserved username
1)			JRST AXERGV]	; Give error as if no AC to say
1)		AOBJN	T4,.+1		;  that AC doesn't work on this
1)		AOBJN	T4,AUXGA1	; Check ALL names
1)					; No match, allow AC license
1)	AUXLIC:
****
2)173	AUXLIC:
**************
1)255	SUBTTL	DATA
File 1)	DSK:SCNSER.MAC	created: 1641 26-MAR-91
File 2)	DSK:SCNSER.E00	created: 1520 15-MAR-89

1)			;123456789012; Each entry must be exactly 12 characters long
1)	AUXNTB:	SIXBIT	/M33         /
1)		SIXBIT	/MPL         /
1)		SIXBIT	/SPL         /
1)		SIXBIT	/OSU         /
1)		SIXBIT	/WRS         /
1)		SIXBIT	/CARL        /
1)		SIXBIT	/JMS         /
1)		SIXBIT	/OSMAN       /
1)		SIXBIT	/KRUMVP      /
1)		SIXBIT	/RVIVIER     /
1)		SIXBIT	/MOORING     /
1)		SIXBIT	/LINK10      /
1)		SIXBIT	/TXSSUP      /
1)		SIXBIT	/TIIDEV      /
1)		BLOCK	40
1)	AUXNTL==.-AUXNTB
1)256	SUBTTL	 VARIABLES
****
2)255	SUBTTL	 VARIABLES
**************
    