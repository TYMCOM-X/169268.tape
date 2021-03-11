-R (WRS)RTYFIX
LDBLOG(U) patched to %UPT+UPTLOG
EXIT

-MAGNUM NTRACK
31-JAN-1986  18:44:35

:RUN KS.DMI
LOADING KS.DMI
EXECUTION


EXECUTION COMPLETED

:QUIT
31-JAN-1986  18:55:16

EXIT

-REN KS.DMI,KS.DMT


-R 1022
1/31/86
TYMSHARE System 1022A (114B)

SYSTEM 1022 expires in 28 days.
* OPEN XRAYKS
* APPEND KS.DMT
System 1022 APPEND Program
1743 records added
processing keyed attributes:
NTRACKDATE (2 values)
TIME (463 values)
NOD1 (33 values)
NOD2 (135 values)
INNOD (1 value)
OUTNOD (1 value)
* QUIT

EXIT

-SEND MSMA
TYPE LETTER:
; PCOM v1.52 command processed: PCOM.KS = PCOM.KS2
; Options: DETACH  LOG NOAPPEND SUPERSEDE TIME:60 TRULIMIT:0 
; Job status: completed.
; Output recorded in file PCOM.KS.

mail waiting
-LOGOUT
7054.13 tru
terminal time: 0:12:05
